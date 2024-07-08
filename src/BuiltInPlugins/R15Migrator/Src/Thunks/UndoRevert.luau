local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.undoRevert);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptConversionProgressTracker);
return function(v4, _, v6)
    return function(v7)
        local v8 = v7:getState();
        local l_selection_0 = v8.ScriptConversion.selection;
        local l_revertedScripts_0 = v8.ScriptConversion.revertedScripts;
        local v11 = {};
        for _, v13 in l_selection_0, nil, nil do
            if not ((not v13.scriptId or v13.range) or not l_revertedScripts_0[v13.scriptId]) then
                table.insert(v11, v13.scriptId);
            end;
        end;
        local v14 = v3.new("UndoRevert", #v11, v7);
        v2(v11, v4, function()
            v14:updateProgress();
        end);
        v14:clearProgressBar();
        local v15 = {
            undoRevertResult = #v11
        };
        v7:dispatch(v1(v15));
        v6:getHandler("onScriptSelectionRevertUndo")(v15);
    end;
end;
