local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
return function(v3, v4, v5, v6, _, _, v9, v10)
    return function(v11)
        v2.replaceWithSuggestion(v3, v4, v5, v6, v11:getState().ScriptConversion.diagnostics[v3], v10);
        local v12 = v5:getScriptInstanceFromGUID(v3);
        if v9 then
            v11:dispatch(v1({
                scriptInstance = v12:GetFullName()
            }));
        end;
    end;
end;
