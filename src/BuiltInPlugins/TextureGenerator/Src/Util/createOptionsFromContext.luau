local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.OptionsContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5)
    local v6 = {
        promptMasking = v5.promptMasking, 
        smartUVUnwrap = v5.smartUVUnwrap
    };
    if not v5.randomizeSeed then
        v6.seed = v5.seed;
    end;
    if not v5.rotation:FuzzyEq(CFrame.new()) then
        local v7, v8, v9 = v5.rotation:ToEulerAnglesYXZ();
        v6.rotation = Vector3.new(math.deg(v7), math.deg(v8), (math.deg(v9)));
    end;
    return v6;
end;
