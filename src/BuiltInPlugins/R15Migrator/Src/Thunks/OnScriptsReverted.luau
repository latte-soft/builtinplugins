local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetRevertedScripts);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetCompletedScripts);
local function v11(v4, v5)
    local v6 = v5:getState();
    local _ = v6.ScriptConversion.revertedScripts;
    local l_completedScripts_0 = v6.ScriptConversion.completedScripts;
    local v9 = v1.Dictionary.join(l_completedScripts_0);
    for v10 in l_completedScripts_0, nil, nil do
        if v4[v10] then
            v9[v10] = nil;
        end;
    end;
    v5:dispatch(v3(v9));
end;
return function(v12)
    return function(v13)
        local v14 = v13:getState();
        local l_revertedScripts_1 = v14.ScriptConversion.revertedScripts;
        local _ = v14.ScriptConversion.completedScripts;
        v13:dispatch(v2(v1.Dictionary.join(v12, l_revertedScripts_1)));
        v11(v12, v13);
    end;
end;
