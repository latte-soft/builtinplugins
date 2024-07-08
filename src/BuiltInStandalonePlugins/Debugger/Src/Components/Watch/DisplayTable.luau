local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v10 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_UI_0 = v3.UI;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_Models_0 = l_Parent_0.Src.Models;
local v20 = require(l_Models_0.Watch.TableTab);
local v21 = require(l_Models_0.Watch.WatchRow);
local v22 = require(l_Models_0.StepStateBundle);
local v23 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v25 = require(l_Actions_0.Watch.SetVariableExpanded);
local v26 = require(l_Actions_0.Watch.SetExpressionExpanded);
local v27 = require(l_Actions_0.Watch.ChangeExpression);
local v28 = require(l_Actions_0.Watch.AddExpression);
local v29 = require(l_Actions_0.Watch.RemoveExpression);
local v30 = require(l_Actions_0.Watch.ClearAllExpressions);
local v31 = require(l_Actions_0.Watch.SetWatchSortState);
local v32 = require(l_Actions_0.Watch.SetTab);
local v33 = require(l_Actions_0.Watch.MyWatchesFilterChange);
local v34 = require(l_Actions_0.Watch.VariablesFilterChange);
local v35 = require(l_Parent_0.Src.Thunks.Common.AddChildRowsToVars);
local v36 = require(l_Parent_0.Src.Thunks.Watch.ExecuteExpressionForAllFrames);
local v37 = require(l_Parent_0.Src.Thunks.Watch.FilterScopeWatchThunk);
local l_Util_0 = l_Parent_0.Src.Util;
local v39 = require(l_Util_0.Constants);
local v40 = require(l_Util_0.ColumnResizeHelperFunctions);
local v41 = require(l_Util_0.MakePluginActions);
local v42 = v1.PureComponent:extend("DisplayTable");
local v43 = {
    [1] = "nameColumn"
};
local v44 = {
    [1] = "expressionColumn"
};
local v45 = {
    nameColumn = "NameColumn", 
    expressionColumn = "ExpressionColumn"
};
local v46 = {
    ScopeColumn = "scopeColumn", 
    ValueColumn = "valueColumn", 
    DataTypeColumn = "dataTypeColumn"
};
local v47 = {
    [1] = "nameColumn", 
    [2] = "scopeColumn", 
    [3] = "valueColumn", 
    [4] = "dataTypeColumn"
};
local v48 = {
    [1] = "expressionColumn", 
    [2] = "valueColumn", 
    [3] = "dataTypeColumn"
};
local function v49(v50, v51)
    if #v50 == 0 then
        return {};
    else
        local v52 = {};
        for _, v54 in ipairs(v50) do
            local v55 = nil;
            if not v51[v54] then
                v55 = v21.fromExpression(v54);
                v55.children = {};
            else
                v55 = l_deepCopy_0(v51[v54]);
                v55.children = v49(v55.childPaths, v51);
            end;
            table.insert(v52, v55);
        end;
        return v52;
    end;
end;
local function v56(v57, v58, v59)
    if #v57 == 0 then
        return ;
    else
        for _, v61 in ipairs(v57) do
            v58[v61] = v59[v61.pathColumn];
            v56(v61.children, v58, v59);
        end;
        return ;
    end;
end;
local function v69(v62, v63, v64)
    local v65 = {};
    for _, v67 in ipairs(v62) do
        local v68 = v63[v67.pathColumn];
        if not (v68 and (v68.textFilteredOut or v64 and v68.scopeFilteredOut)) then
            table.insert(v65, v67);
        end;
    end;
    return v65;
end;
local function v78(v70, v71, v72)
    local v73 = l_deepCopy_0(v70);
    for v74, v75 in ipairs(v70) do
        for _, v77 in ipairs(v71) do
            if v72[v77] == nil then
                warn("debug variable id not found in store when constructing DisplayTable");
                return ;
            elseif v75 == v72[v77].expressionColumn then
                v73[v74] = v77;
                break;
            end;
        end;
    end;
    return v73;
end;
v42.init = function(v79)
    v79.getTreeChildren = function(v80)
        return v80.children or {};
    end;
    v79.getTableColumns = function(v81, v82)
        local l_Localization_1 = v79.props.Localization;
        local v84 = {};
        for _, v86 in ipairs(v82) do
            table.insert(v84, {
                Name = l_Localization_1:getText("Watch", v45[v86]), 
                Key = v86, 
                Tooltip = l_Localization_1:getText("Watch", v45[v86] .. "Tooltip") or nil
            });
        end;
        for _, v88 in ipairs(v81) do
            table.insert(v84, {
                Name = l_Localization_1:getText("Watch", v88), 
                Key = v46[v88], 
                Tooltip = l_Localization_1:getText("Watch", v88 .. "Tooltip") or nil
            });
        end;
        return v84;
    end;
    v79.getVariableTableColumns = function()
        local l_Localization_2 = v79.props.Localization;
        return {
            {
                Name = l_Localization_2:getText("Watch", "NameColumn"), 
                Key = v47[1], 
                Tooltip = l_Localization_2:getText("Watch", "NameColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "ScopeColumn"), 
                Key = v47[2], 
                Tooltip = l_Localization_2:getText("Watch", "ScopeColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "ValueColumn"), 
                Key = v47[3], 
                Tooltip = l_Localization_2:getText("Watch", "ValueColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_2:getText("Watch", "DataTypeColumn"), 
                Key = v47[4], 
                Tooltip = l_Localization_2:getText("Watch", "DataTypeColumnTooltip") or nil
            }
        };
    end;
    v79.getWatchTableColumns = function()
        local l_Localization_3 = v79.props.Localization;
        return {
            {
                Name = l_Localization_3:getText("Watch", "ExpressionColumn"), 
                Key = v48[1]
            }, 
            {
                Name = l_Localization_3:getText("Watch", "ValueColumn"), 
                Key = v48[2], 
                Tooltip = l_Localization_3:getText("Watch", "ValueColumnTooltip") or nil
            }, 
            {
                Name = l_Localization_3:getText("Watch", "DataTypeColumn"), 
                Key = v48[3], 
                Tooltip = l_Localization_3:getText("Watch", "DataTypeColumnTooltip") or nil
            }
        };
    end;
    local v91 = {};
    for _ = 1, 4 do
        table.insert(v91, UDim.new(0.25, 0));
    end;
    local v93 = {};
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    table.insert(v93, UDim.new(0.3333333333333333, 0));
    v79.state = {
        VariableColumnSizes = v91, 
        MyWatchColumnSizes = v93
    };
    v79.OnColumnSizesChange = function(v94)
        if not (v79.props.SelectedTab == v20.Variables) then
            v79:setState(function(_)
                return {
                    MyWatchColumnSizes = v94
                };
            end);
            return ;
        else
            v79:setState(function(_)
                return {
                    VariableColumnSizes = v94
                };
            end);
            return ;
        end;
    end;
    v79.onExpansionChange = function(v97)
        local l_props_0 = v79.props;
        local l_CurrentStepStateBundle_0 = l_props_0.CurrentStepStateBundle;
        local l_DebuggerConnectionManager_0 = game:GetService("DebuggerConnectionManager");
        if l_CurrentStepStateBundle_0 then
            local l_l_DebuggerConnectionManager_0_ConnectionById_0 = l_DebuggerConnectionManager_0:GetConnectionById(l_CurrentStepStateBundle_0.debuggerStateToken.debuggerConnectionId);
            for v102, v103 in pairs(v97) do
                local v104 = l_props_0.SelectedTab == v20.Variables;
                if not v104 then
                    v79.props.OnExpressionExpansionDispatch(v102.pathColumn, v103);
                else
                    v79.props.OnVariableExpansionDispatch(v102.pathColumn, v103);
                end;
                if v103 then
                    v79.props.OnLazyLoadChildren(v102.pathColumn, v102.idColumn, l_CurrentStepStateBundle_0, v104, l_l_DebuggerConnectionManager_0_ConnectionById_0);
                end;
            end;
            return ;
        else
            assert(false);
            return ;
        end;
    end;
    v79.IsDuplicateWatchEntry = function(v105)
        for _, v107 in ipairs(v79.props.RootItems) do
            if v107.expressionColumn == v105 then
                return true;
            end;
        end;
        return false;
    end;
    v79.OnFocusLost = function(_, v109, v110, v111)
        local l_expressionColumn_0 = v110.item.expressionColumn;
        local l_Text_0 = v109.Text;
        local l_CurrentStepStateBundle_1 = v79.props.CurrentStepStateBundle;
        local l_DebuggerConnectionManager_1 = game:GetService("DebuggerConnectionManager");
        if v111 == 1 then
            local v116 = false;
            if not v79.IsDuplicateWatchEntry(l_Text_0) then
                if l_expressionColumn_0 == "" and l_Text_0 ~= "" then
                    v79.props.OnAddExpression(l_Text_0);
                    v116 = true;
                    if l_CurrentStepStateBundle_1 ~= nil then
                        local l_debuggerStateToken_0 = l_CurrentStepStateBundle_1.debuggerStateToken;
                        if l_debuggerStateToken_0 then
                            v79.props.OnExecuteExpressionForAllFrames(l_Text_0, l_DebuggerConnectionManager_1:GetConnectionById(l_debuggerStateToken_0.debuggerConnectionId), l_debuggerStateToken_0, l_CurrentStepStateBundle_1.threadId);
                        end;
                    end;
                elseif l_Text_0 == "" then
                    v79.props.OnRemoveExpression(l_expressionColumn_0);
                elseif l_expressionColumn_0 ~= l_Text_0 then
                    v79.props.OnChangeExpression(l_expressionColumn_0, l_Text_0);
                    v116 = true;
                    if l_CurrentStepStateBundle_1 ~= nil then
                        local l_debuggerStateToken_1 = l_CurrentStepStateBundle_1.debuggerStateToken;
                        if l_debuggerStateToken_1 then
                            v79.props.OnExecuteExpressionForAllFrames(l_Text_0, l_DebuggerConnectionManager_1:GetConnectionById(l_debuggerStateToken_1.debuggerConnectionId), l_debuggerStateToken_1, l_CurrentStepStateBundle_1.threadId);
                        end;
                    end;
                end;
                if v116 then
                    v79.props.Analytics:report(v10.WatchAdded, "WatchWindow");
                end;
            elseif l_expressionColumn_0 == "" then
                v109.Text = "";
                return ;
            else
                if l_expressionColumn_0 ~= l_Text_0 then
                    v79.props.OnRemoveExpression(l_expressionColumn_0);
                end;
                return ;
            end;
        end;
    end;
    v79.onMenuActionSelected = function(v119)
        local l_Id_0 = v119.Id;
        local l_Data_0 = v119.Data;
        local l_props_1 = v79.props;
        if l_Id_0 == v39.WatchActionIds.DeleteWatch then
            if l_Data_0.item.expressionColumn ~= "" then
                l_props_1.OnRemoveExpression(l_Data_0.item.expressionColumn);
                return ;
            end;
        elseif l_Id_0 == v39.WatchActionIds.DeleteAllWatches then
            l_props_1.OnClearAllExpressions();
        end;
    end;
    v79.onRightClick = function(v123)
        if v79.props.SelectedTab == v20.Watches then
            local l_props_2 = v79.props;
            l_showContextMenu_0(l_props_2.Plugin:get(), v41.getWatchActions(l_props_2.Localization, v123, v79.onMenuActionSelected), v39.WatchActionsOrder);
        end;
    end;
    v79.OnDoubleClick = function(v125)
        if v79.props.SelectedTab == v20.Watches then
            game:GetService("DebuggerUIService"):EditWatch(v125.item.expressionColumn);
        end;
    end;
    v79.OnSortChange = function(v126, v127)
        local l_props_3 = v79.props;
        l_props_3.OnSetWatchSortState(l_props_3.SortIndex == v126 and v127 or (l_props_3.SortOrder or v127), v126);
    end;
    v79.childSort = function(v129, v130)
        local v131 = {
            v129, 
            v130
        };
        local l_props_4 = v79.props;
        local v133 = l_props_4.SelectedTab == v20.Variables;
        if v129 == v130 then
            return false;
        else
            v23.sortTableByColumnAndOrder(v131, l_props_4.SortIndex, l_props_4.SortOrder, not not v133 and v47 or v48, false);
            return v131[1] == v129;
        end;
    end;
end;
v42.didMount = function(v134)
    local l_props_5 = v134.props;
    local l_Setting_0 = l_props_5.Plugin:get():GetSetting("watchWindowConfigs");
    if not ((((((not l_Setting_0 or not l_Setting_0[v39.ColumnSizeVariables]) or not l_Setting_0[v39.ColumnSizeMyWatches]) or not l_Setting_0[v39.Tab]) or not l_Setting_0[v39.ScopeFilter]) or not l_Setting_0[v39.VariablesColumnFilter]) or not l_Setting_0[v39.MyWatchesColumnFilter]) then
        l_props_5.onScopeFilterChange(l_Setting_0[v39.ScopeFilter]);
        l_props_5.onTabSelected(l_Setting_0[v39.Tab]);
        l_props_5.onVariablesFilterChange(l_Setting_0[v39.VariablesColumnFilter]);
        l_props_5.onMyWatchesFilterChange(l_Setting_0[v39.MyWatchesColumnFilter]);
        v134:setState(function(_)
            return {
                VariableColumnSizes = v40.fetchSizesFromColumnScales(l_Setting_0[v39.ColumnSizeVariables]), 
                MyWatchColumnSizes = v40.fetchSizesFromColumnScales(l_Setting_0[v39.ColumnSizeMyWatches])
            };
        end);
    end;
end;
v42.willUnmount = function(v138)
    local l_props_6 = v138.props;
    l_props_6.Plugin:get():SetSetting("watchWindowConfigs", {
        [v39.ScopeFilter] = l_props_6.EnabledScopes, 
        [v39.Tab] = l_props_6.SelectedTab, 
        [v39.ColumnSizeVariables] = v40.fetchScaleFromColumnSizes(v138.state.VariableColumnSizes), 
        [v39.ColumnSizeMyWatches] = v40.fetchScaleFromColumnSizes(v138.state.MyWatchColumnSizes), 
        [v39.VariablesColumnFilter] = l_props_6.VariablesColumnFilter, 
        [v39.MyWatchesColumnFilter] = l_props_6.MyWatchesColumnFilter
    });
end;
v42.didUpdate = function(v140, v141)
    local l_props_7 = v140.props;
    if l_props_7.Expressions ~= v141.Expressions then
        local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
        if l_DebuggerUIService_0 then
            l_DebuggerUIService_0:SetWatchExpressions(l_props_7.Expressions);
        end;
    end;
    local v144 = l_props_7.SelectedTab == v20.Variables;
    local v145 = if not v144 then v44 else v43;
    local v146 = if not v144 then l_props_7.MyWatchesColumnFilter else l_props_7.VariablesColumnFilter;
    local v147 = if not v144 then v141.MyWatchesColumnFilter else v141.VariablesColumnFilter;
    local v148 = #v146 + #v145;
    local v149 = if not v144 then v140.state.MyWatchColumnSizes else v140.state.VariableColumnSizes;
    if #v146 ~= #v147 and #v149 ~= v148 then
        local v150 = {};
        local v151 = #v147 + #v145;
        local v152 = v4.List.toSet(v146);
        local v153 = v40.fetchOldColumnSizes(v151, v147, v145, v149);
        v150 = if v148 < v151 then v40.updatedSizesAfterRemovingColumns(v148, v40.fetchDeletedColumnsSize(#v145, v151, v147, v153, v152), v153, v145, v146) else v40.updatedSizesAfterAddingColumns(v148, v151, v153, v146, v145);
        do
            local l_v150_0 = v150;
            if not v144 then
                v140:setState(function(_)
                    return {
                        MyWatchColumnSizes = l_v150_0
                    };
                end);
            else
                v140:setState(function(_)
                    return {
                        VariableColumnSizes = l_v150_0
                    };
                end);
            end;
        end;
    end;
end;
v42.render = function(v157)
    local l_props_8 = v157.props;
    local l_Stylizer_1 = l_props_8.Stylizer;
    local v160 = l_props_8.SelectedTab == v20.Variables;
    local _ = nil;
    return v1.createElement(l_TreeTable_0, {
        Scroll = true, 
        Size = UDim2.fromScale(1, 1), 
        Columns = l_map_0(v157.getTableColumns(if not v160 then v157.props.MyWatchesColumnFilter else v157.props.VariablesColumnFilter, if not v160 then v44 else v43), function(v162, v163)
            if not v160 then
                return l_join_0(v162, {
                    Width = v157.state.MyWatchColumnSizes[v163]
                });
            else
                return l_join_0(v162, {
                    Width = v157.state.VariableColumnSizes[v163]
                });
            end;
        end), 
        RootItems = l_props_8.RootItems, 
        Stylizer = l_Stylizer_1, 
        OnExpansionChange = v157.onExpansionChange, 
        GetChildren = v157.getTreeChildren, 
        Expansion = l_props_8.ExpansionTable, 
        OnFocusLost = v157.OnFocusLost, 
        TextInputCols = not v160 and {
            [1] = true
        } or nil, 
        RightClick = v157.onRightClick, 
        OnDoubleClick = v157.OnDoubleClick, 
        DisableTooltip = false, 
        SortIndex = l_props_8.SortIndex, 
        SortOrder = l_props_8.SortOrder, 
        OnSortChange = v157.OnSortChange, 
        SortChildren = v157.childSort, 
        OnColumnSizesChange = v157.OnColumnSizesChange, 
        UseDeficit = false, 
        UseScale = true, 
        ClampSize = true, 
        ColumnHeaderHeight = v39.COLUMN_HEADER_HEIGHT, 
        RowHeight = v39.ROW_HEIGHT, 
        ExpandOnDoubleClick = true
    });
end;
return (v2.connect(function(v164, _)
    local l_Common_0 = v164.Common;
    local l_Watch_0 = v164.Watch;
    local l_currentTab_0 = l_Watch_0.currentTab;
    local v169 = l_currentTab_0 == v20.Variables;
    local v170 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    local v171 = (not not v170 and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId]) and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v170] or 1;
    local v172 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
    local v173 = not not v172 and l_Watch_0.stateTokenToRoots[v172] or nil;
    local v174 = (v173 and v173[v170]) and v173[v170][v171];
    local v175 = not v169 and "Watches" or "Variables";
    local v176 = not not v174 and (v174[v175] and l_deepCopy_0(v174[v175]) or {}) or {};
    local v177 = l_Watch_0.stateTokenToFlattenedTree[v172];
    local v178 = (v177 and v177[v170]) and v177[v170][v171];
    local v179 = not not v178 and (v178[v175] and l_deepCopy_0(v178[v175]) or {}) or {};
    if not v169 then
        v176 = v78(l_Watch_0.listOfExpressions, v176, v179);
    end;
    local v180 = v69(v49(v176, v179), v179, v169);
    local v181 = {};
    v56(v180, v181, not not v169 and l_Watch_0.pathToExpansionState or l_Watch_0.expressionToExpansionState);
    if not v169 then
        table.insert(v180, v21.fromExpression(""));
    end;
    local v182 = not not v169 and v47 or v48;
    local v183 = nil;
    local v184 = nil;
    v183 = if not v169 then l_Watch_0.watchesColumnIndex else l_Watch_0.variablesColumnIndex;
    v184 = if not v169 then l_Watch_0.watchesSortDirection else l_Watch_0.variablesSortDirection;
    v23.sortTableByColumnAndOrder(v180 or {}, v183, v184, v182, not v169);
    return {
        SelectedTab = l_currentTab_0, 
        RootItems = v180 or {}, 
        ExpansionTable = v181, 
        CurrentStepStateBundle = v22.ctor(v172, v170, v171), 
        SortIndex = v183, 
        SortOrder = v184, 
        EnabledScopes = l_Watch_0.listOfEnabledScopes, 
        Expressions = l_Watch_0.listOfExpressions, 
        VariablesColumnFilter = l_Watch_0.listOfVariablesColumns, 
        MyWatchesColumnFilter = l_Watch_0.listOfMyWatchesColumns
    };
end, function(v185)
    return {
        OnVariableExpansionDispatch = function(v186, v187)
            return v185(v25(v186, v187));
        end, 
        OnExpressionExpansionDispatch = function(v188, v189)
            return v185(v26(v188, v189));
        end, 
        OnChangeExpression = function(v190, v191)
            return v185(v27(v190, v191));
        end, 
        OnAddExpression = function(v192)
            return v185(v28(v192));
        end, 
        OnLazyLoadChildren = function(v193, v194, v195, v196, v197)
            local l_v197_VariableById_0 = v197:GetVariableById(v194);
            if l_v197_VariableById_0 then
                return v185(v35(v193:sub(1, -1 * (string.len(l_v197_VariableById_0.Name) + 2)), {
                    l_v197_VariableById_0
                }, v195, v196, v197));
            else
                return ;
            end;
        end, 
        OnExecuteExpressionForAllFrames = function(v199, v200, v201, v202)
            return v185(v36(v199, v200, v201, v202));
        end, 
        OnRemoveExpression = function(v203)
            return v185(v29(v203));
        end, 
        OnClearAllExpressions = function()
            return v185(v30());
        end, 
        OnSetWatchSortState = function(v204, v205)
            return v185(v31(v204, v205));
        end, 
        onScopeFilterChange = function(v206)
            return v185(v37(v206));
        end, 
        onTabSelected = function(v207)
            return v185(v32(v207));
        end, 
        onVariablesFilterChange = function(v208)
            return v185(v34(v208));
        end, 
        onMyWatchesFilterChange = function(v209)
            return v185(v33(v209));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v42))));
