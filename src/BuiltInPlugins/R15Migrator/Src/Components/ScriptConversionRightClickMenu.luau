local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Components.ConfirmRevertDialog);
local v3 = require(l_script_FirstAncestor_0.Src.Util.showDialog);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.selectionHasScriptBackups);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
local l_showContextMenu_0 = v1.UI.showContextMenu;
local v8 = {};
local function _(v9)
    return v9.selectedScriptItems and #v9.selectedScriptItems == 1;
end;
local function _(v11)
    return v11.selectedRangeItems and #v11.selectedRangeItems == 1;
end;
local function _(v13)
    return not v13.selectedRangeItems or #v13.selectedRangeItems == 0;
end;
local function _(v15)
    return not v15.selectedScriptItems or #v15.selectedScriptItems == 0;
end;
v8.promptRevertScripts = function(_, v18)
    v3(v18.Plugin, v18.Localization, v2, {
        OnConfirm = function()
            v18.RevertScripts(v18.ScriptConversionContext, v18.Localization, v18.Analytics);
            v18.onScriptsReverted();
        end
    });
end;
v8.addGoToScriptItem = function(_, v20, v21)
    table.insert(v21, {
        Text = v20.Localization:getText("ScriptConversion", "GoToScript"), 
        OnItemClicked = function()
            local l_v20_0 = v20;
            if l_v20_0.selectedRangeItems and #l_v20_0.selectedRangeItems == 1 then
                l_v20_0 = v20;
                if not l_v20_0.selectedScriptItems or #l_v20_0.selectedScriptItems == 0 then
                    local v23 = v20.selectedRangeItems[1];
                    v4.goToScript(v23.scriptId, v23.range, v20.ScriptConversionContext);
                    return ;
                end;
            end;
            v4.goToScript(v20.selectedScriptItems[1].scriptId, nil, v20.ScriptConversionContext);
        end
    });
end;
v8.addSeparator = function(_, v25)
    table.insert(v25, {
        ShowSeparator = true
    });
end;
v8.addSuggestionItems = function(_, v27, v28)
    local v29 = v27.selectedRangeItems[1];
    for _, v31 in v29.suggestions, nil, nil do
        table.insert(v28, {
            Text = v27.Localization:getText("ScriptConversion", "ReplaceWith", {
                part = v31
            }), 
            OnItemClicked = function()
                v27.ReplaceWithSuggestion(v29.scriptId, v29.range, v27.ScriptConversionContext, v31, v27.Localization, v29.instanceName, v27.Analytics);
                v27.onSuggestionApplied();
                v27.Analytics:getHandler("onScriptSuggestionApplied")();
            end
        });
    end;
end;
v8.addUndoRevertItem = function(_, v33, v34)
    table.insert(v34, {
        Text = v33.Localization:getText("ScriptConversion", "UndoRevert"), 
        OnItemClicked = function()
            v33.UndoRevert(v33.ScriptConversionContext, v33.Localization, v33.Analytics);
        end
    });
end;
v8.addRevertScriptItem = function(v35, v36, v37)
    local l_Localization_0 = v36.Localization;
    table.insert(v37, {
        Text = if not (v36.selectedScriptItems and #v36.selectedScriptItems == 1) then l_Localization_0:getText("ScriptConversion", "RevertScripts") else l_Localization_0:getText("ScriptConversion", "RevertScript"), 
        OnItemClicked = function()
            v35:promptRevertScripts(v36);
        end
    });
end;
v8.addReplaceSelectedItem = function(_, v40, v41)
    table.insert(v41, {
        Text = v40.Localization:getText("ScriptConversion", "ReplaceWithRules"), 
        OnItemClicked = function()
            v40.ReplaceWithRules(v40.ScriptConversionContext, v40.Localization, v40.Analytics);
        end
    });
end;
v8.addDiffScriptItem = function(_, v43, v44)
    table.insert(v44, {
        Text = v43.Localization:getText("ScriptConversion", "DiffScripts"), 
        OnItemClicked = function()
            v4.diffScripts(v43.selectedScriptItems, v43.ScriptConversionContext);
        end
    });
end;
local function _(v45)
    if not v45.selectedScriptItems or #v45.selectedScriptItems == 0 then
        if v45.selectedRangeItems and #v45.selectedRangeItems == 1 then
            local v46 = v45.selectedRangeItems[1];
            if not v46.suggestions or #v46.suggestions == 0 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function _(v48)
    return v5(v48.selectedScriptItems, v48.ScriptConversionContext);
end;
local _ = function(v50)
    for _, v52 in v50.selectedScriptItems, nil, nil do
        if not v50.revertedScripts[v52.scriptId] then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v54)
    for _, v56 in v54.selectedScriptItems, nil, nil do
        if v54.completedScripts[v56.scriptId] then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v58, _)
    if not ((not v58.selectedScriptItems or #v58.selectedScriptItems == 0) and (v58.selectedRangeItems and #v58.selectedRangeItems == 1)) and (not (v58.selectedScriptItems and #v58.selectedScriptItems == 1) or not (not v58.selectedRangeItems or #v58.selectedRangeItems == 0)) then
        return false;
    else
        return true;
    end;
end;
local function v66(v61)
    for _, v63 in v61.selectedScriptItems, nil, nil do
        local v64 = v61.ScriptConversionContext:getScriptInstanceFromGUID(v63.scriptId);
        local l_v6_ScriptBackupChunks_0 = v6:GetScriptBackupChunks(v64);
        if l_v6_ScriptBackupChunks_0 then
            if not v6:DidSourceChange(v64, l_v6_ScriptBackupChunks_0) then
                return false;
            end;
        else
            return false;
        end;
    end;
    return true;
end;
v8.show = function(v67, v68)
    local v69 = v68.Plugin:get();
    local _ = v68.Suggestions;
    local _ = v68.ScriptIds;
    local v72 = {};
    if (not not (not v68.selectedScriptItems or #v68.selectedScriptItems == 0) and (v68.selectedRangeItems and #v68.selectedRangeItems == 1) or (v68.selectedScriptItems and #v68.selectedScriptItems == 1) and (not v68.selectedRangeItems or #v68.selectedRangeItems == 0)) and true or false then
        v67:addGoToScriptItem(v68, v72);
    end;
    local v73;
    if not v68.selectedScriptItems or #v68.selectedScriptItems == 0 then
        if v68.selectedRangeItems and #v68.selectedRangeItems == 1 then
            local v74 = v68.selectedRangeItems[1];
            v73 = not not v74.suggestions and #v74.suggestions ~= 0;
        else
            v73 = false;
        end;
    else
        v73 = false;
    end;
    if not v73 then
        if not (not v68.selectedScriptItems or #v68.selectedScriptItems == 0) then
            for _, v76 in v68.selectedScriptItems, nil, nil do
                if not v68.revertedScripts[v76.scriptId] then
                    v73 = false;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v73 = true;
            ::label1::;
            if not v73 then
                if v5(v68.selectedScriptItems, v68.ScriptConversionContext) then
                    v67:addSeparator(v72);
                    v67:addRevertScriptItem(v68, v72);
                end;
            else
                v67:addSeparator(v72);
                v67:addUndoRevertItem(v68, v72);
            end;
        end;
    else
        v67:addSeparator(v72);
        v67:addSuggestionItems(v68, v72);
    end;
    for _, v78 in v68.selectedScriptItems, nil, nil do
        if v68.completedScripts[v78.scriptId] then
            v73 = false;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v73 = true;
    ::label0::;
    if v73 then
        v67:addSeparator(v72);
        v67:addReplaceSelectedItem(v68, v72);
    end;
    if v66(v68) then
        v67:addSeparator(v72);
        v67:addDiffScriptItem(v68, v72);
    end;
    l_showContextMenu_0(v69, v72);
end;
return v8;
