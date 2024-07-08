local l_script_FirstAncestor_0 = script:FindFirstAncestor("PathEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.getUDim2Inverse);
return function(v3)
    local v4 = {
        Mirrored = v3.LeftTangent == v2(v3.RightTangent)
    };
    local v5 = true;
    if v3.LeftTangent ~= UDim2.new() then
        v5 = v3.RightTangent == UDim2.new();
    end;
    v4.Sharp = v5;
    return v4;
end;
