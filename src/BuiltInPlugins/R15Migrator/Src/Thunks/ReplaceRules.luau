local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetReplaceRules);
return function(v3)
    return function(v4)
        v1.addScriptConversionRules(v3);
        v4:dispatch(v2(v3));
    end;
end;
