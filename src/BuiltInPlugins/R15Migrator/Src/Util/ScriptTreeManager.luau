local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v7 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local v8 = {};
v8.__index = v8;
v8.new = function()
    return (setmetatable({
        _ctrlDown = false, 
        _shiftDown = false, 
        _selected = {}, 
        _expanded = {}, 
        _onSelectedChanged = l_Signal_0.new(), 
        _onExpandedChanged = l_Signal_0.new()
    }, v8));
end;
v8.connectToExpandedChanged = function(v9, v10)
    v9._onExpandedChanged:Connect(v10);
end;
v8.connectToSelectedChanged = function(v11, v12)
    v11._onSelectedChanged:Connect(v12);
end;
v8.onKeyPressed = function(v13, v14)
    if not v4:isShift(v14.KeyCode) then
        if v4:isControl(v14.KeyCode) then
            v13._ctrlDown = true;
        end;
    else
        v13._shiftDown = true;
    end;
    if not ((not v13._ctrlDown or not v13._shiftDown) or not v4:isLetterA(v14.KeyCode)) then
        v13:selectAll(false);
    end;
end;
v8.onKeyReleased = function(v15, v16)
    if not v4:isShift(v16.KeyCode) then
        if v4:isControl(v16.KeyCode) then
            v15._ctrlDown = false;
        end;
        return ;
    else
        v15._shiftDown = false;
        return ;
    end;
end;
v8.getItems = function(v17)
    return v17._items;
end;
v8.terminate = function(v18)
    v18._items = nil;
    v18._expanded = {};
    v18._selected = {};
    v18._previousSelected = nil;
    v18._shiftDown = false;
    v18._ctrlDown = false;
end;
v8.buildDiagnosticListForScript = function(_, v20, v21, _, v23)
    local v24 = {};
    for v25, v26 in v21, nil, nil do
        if not v23 or v23 == v26.instanceName then
            table.insert(v24, {
                key = v20 .. "." .. v25, 
                codeText = v26.code, 
                text = v26.message, 
                instanceName = v26.instanceName, 
                range = v26.range, 
                url = not v26.codeDescription and "" or v26.codeDescription.href, 
                scriptId = v20, 
                suggestions = v26.suggestions, 
                statuses = if v26.severity == Enum.Severity.Warning then {
                    [v5.ScriptStatus.Warning] = 1
                } else {
                    [v5.ScriptStatus.Error] = 1
                }, 
                issueType = v26.issueType
            });
        end;
    end;
    return v24;
end;
v8.addScriptListItem = function(v27, v28, v29, v30, v31, v32, v33, v34, v35)
    local v36 = v7(v31:getScriptInstanceFromGUID(v30):GetFullName());
    local v37 = if not v29 then nil else v27:buildDiagnosticListForScript(v30, v29:Get(), v31, v35);
    local v38 = {};
    if not v32 then
        if v33 then
            v38[v5.ScriptStatus.Reverted] = 1;
        end;
        v38[v5.ScriptStatus.Error] = v29:ErrorCount(v35);
        v38[v5.ScriptStatus.Warning] = v29:WarningCount(v35);
    elseif not v29 or not v29:HasWarnings() then
        v38[v5.ScriptStatus.Complete] = 1;
    else
        v38[v5.ScriptStatus.Warning] = v29:WarningCount();
    end;
    if not v35 or v35 and #v37 > 0 then
        table.insert(v28, {
            key = v30, 
            text = v36, 
            scriptId = v30, 
            children = v37, 
            initialIssueCount = v34, 
            statuses = v38
        });
    end;
end;
v8.buildTreeItems = function(v39, v40)
    v39._items = {};
    local l_diagnostics_0 = v40.diagnostics;
    local l_revertedScripts_0 = v40.revertedScripts;
    local l_completedScripts_0 = v40.completedScripts;
    local l_initialIssueCounts_0 = v40.initialIssueCounts;
    local l_filter_0 = v40.filter;
    local l_ScriptConversionContext_0 = v40.ScriptConversionContext;
    for v47, v48 in l_diagnostics_0, nil, nil do
        v39:addScriptListItem(v39._items, v48, v47, l_ScriptConversionContext_0, l_completedScripts_0[v47], l_revertedScripts_0[v47], l_initialIssueCounts_0[v47], l_filter_0);
    end;
    table.sort(v39._items, function(v49, v50)
        if not v49.scriptId or not v50.scriptId then
            return false;
        else
            local v51 = l_ScriptConversionContext_0:getScriptInstanceFromGUID(v49.scriptId);
            local v52 = l_ScriptConversionContext_0:getScriptInstanceFromGUID(v50.scriptId);
            if v51:GetFullName() == v52:GetFullName() then
                return v49.scriptId < v50.scriptId;
            else
                return v51:GetFullName() < v52:GetFullName();
            end;
        end;
    end);
end;
v8.flattenItems = function(v53, v54)
    if v53._items then
        local v55 = {};
        for _, v57 in v53._items, nil, nil do
            table.insert(v55, v57);
            if not (not v54 and not v53._expanded[v57.key]) then
                for _, v59 in v57.children, nil, nil do
                    table.insert(v55, v59);
                    if not (not v54 and not v53._expanded[v59.key] or not v59.children) then
                        for _, v61 in v59.children, nil, nil do
                            table.insert(v55, v61);
                        end;
                    end;
                end;
            end;
        end;
        return v55;
    else
        return {};
    end;
end;
v8.getExpansionTable = function(v62)
    local v63 = {};
    for _, v65 in v62._items, nil, nil do
        if v62._expanded[v65.key] then
            v63[v65] = true;
        end;
    end;
    return v63;
end;
v8.getSelectionList = function(v66)
    local v67 = {};
    for _, v69 in v66._items, nil, nil do
        if v66._selected[v69.key] then
            table.insert(v67, v69);
        end;
        for _, v71 in v69.children, nil, nil do
            if v66._selected[v71.key] then
                table.insert(v67, v71);
            end;
        end;
    end;
    return v67;
end;
v8.toggleExpanded = function(v72, v73)
    v72._expanded[v73.key] = not v72._expanded[v73.key];
    v72._onExpandedChanged:Fire();
end;
v8.resetSelected = function(v74)
    v74._selected = {};
    v74._onSelectedChanged:Fire();
end;
v8.findCurrentAndPreviousSelectionIndex = function(v75, v76, v77)
    local v78 = nil;
    local v79 = nil;
    for v80, v81 in v76, nil, nil do
        if v81.key == v77.key then
            v78 = v80;
            if v79 then
                break;
            end;
        end;
        if v81.key == v75._previousSelected then
            v79 = v80;
            if v78 then
                break;
            end;
        end;
    end;
    return v78, v79;
end;
v8.areAllSelected = function(v82, v83)
    for _, v85 in (v82:flattenItems(v83)), nil, nil do
        if not v82._selected[v85.key] then
            return false;
        end;
    end;
    return true;
end;
v8.selectAll = function(v86, v87)
    for _, v89 in (v86:flattenItems(v87)), nil, nil do
        v86._selected[v89.key] = true;
    end;
    v86._previousSelected = nil;
    v86._onSelectedChanged:Fire();
end;
v8.shiftSelectItem = function(v90, v91)
    local v92 = v90:flattenItems(false);
    local v93, v94 = v90:findCurrentAndPreviousSelectionIndex(v92, v91);
    if v93 then
        if v94 then
            for v95 = math.min(v93, v94), math.max(v93, v94) do
                v90._selected[v92[v95].key] = true;
            end;
            return ;
        else
            v90._selected = {
                [v91.key] = true
            };
            return ;
        end;
    else
        return ;
    end;
end;
v8.toggleSelectItem = function(v96, v97)
    v96._selected[v97.key] = not v96._selected[v97.key];
    if v97.children then
        for _, v99 in v97.children, nil, nil do
            v96._selected[v99.key] = v96._selected[v97.key];
        end;
    end;
end;
v8.hasMultiSelection = function(v100)
    local v101 = 1;
    for _ in v100._selected, nil, nil do
        if v101 > 1 then
            return true;
        else
            v101 = v101 + 1;
        end;
    end;
    return false;
end;
v8.plainSelectItem = function(v103, v104, v105)
    if not v103._selected[v104.key] or not v105 then
        if not (v103._selected[v104.key] and not v103:hasMultiSelection()) then
            v103._selected = {
                [v104.key] = true
            };
        end;
        return ;
    else
        return ;
    end;
end;
v8.itemIsSelected = function(v106, v107)
    return v106._selected[v107.key] == true;
end;
v8.onItemDoubleClicked = function(_, v109, v110)
    v6.goToScript(v109.scriptId, v109.range, v110);
end;
v8.onItemClicked = function(v111, v112, v113)
    if not v111._shiftDown then
        if not v113 then
            v111:toggleSelectItem(v112);
        else
            v111:plainSelectItem(v112, v113);
        end;
    else
        v111:shiftSelectItem(v112);
    end;
    v111._previousSelected = v112.key;
    v111._onSelectedChanged:Fire();
end;
v8.getRightClickContextInfo = function(v114, v115, _)
    local v117 = {};
    local v118 = {};
    for _, v120 in (v114:getSelectionList()), nil, nil do
        if not v120.range then
            if v120.scriptId then
                table.insert(v117, v120);
            end;
        else
            table.insert(v118, v120);
        end;
    end;
    return v1.Dictionary.join(v115, {
        selectedScriptItems = v117, 
        selectedRangeItems = v118, 
        onScriptsReverted = function()
            v114:resetSelected();
        end, 
        onSuggestionApplied = function()
            v114:resetSelected();
        end
    });
end;
return v8;
