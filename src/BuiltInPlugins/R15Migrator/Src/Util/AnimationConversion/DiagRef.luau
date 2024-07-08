local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.normalizeAssetId);
local v3 = {};
v3.__index = v3;
v3.__eq = function(v4, v5)
    local v6 = false;
    if v4.scriptInstance == v5.scriptInstance then
        v6 = false;
        if v2(v4.str) == v2(v5.str) then
            v6 = v4.range == v5.range;
        end;
    end;
    return v6;
end;
v3.id = function(v7)
    return v2(v7.str);
end;
v3.new = function(v8, v9, v10)
    return (setmetatable({
        str = v8, 
        name = v8, 
        range = v9, 
        scriptInstance = v10
    }, v3));
end;
return v3;
