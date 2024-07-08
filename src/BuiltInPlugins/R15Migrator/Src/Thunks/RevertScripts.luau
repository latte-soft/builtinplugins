local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.OnScriptsReverted);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.revertScripts);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptIssueSorting);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptConversionProgressTracker);
return function(v7, _, v9)
    return function(v10)
        local v11 = v10:getState();
        local v12 = v1.Dictionary.keys(v5:sortSelectionForConversion(v11.ScriptConversion.selection, v11.ScriptConversion.diagnostics));
        local v13 = v6.new("Revert", #v12, v10);
        local v14 = v4(v12, v7, function()
            v13:updateProgress();
        end);
        v13:clearProgressBar();
        v10:dispatch(v2(v14));
        local v15 = {
            revertResult = #v1.Dictionary.keys(v14)
        };
        v10:dispatch(v3(v15));
        v9:getHandler("onScriptSelectionReverted")(v15);
    end;
end;
