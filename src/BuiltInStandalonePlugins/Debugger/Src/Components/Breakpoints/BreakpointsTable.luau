local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_UI_0 = v3.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local v19 = require(l_Parent_0.Src.Models.BreakpointRow);
local v20 = require(l_Parent_0.Src.Util.Constants);
local v21 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsTreeTableCell);
local v22 = v1.PureComponent:extend("BreakpointsTable");
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.BreakpointHelperFunctions);
local v25 = require(l_Util_0.WatchHelperFunctions);
local v26 = require(l_Util_0.ColumnResizeHelperFunctions);
local v27 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local v28 = require(l_Parent_0.Src.Thunks.Breakpoints.ToggleAllBreakpoints);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v30 = require(l_Actions_0.BreakpointsWindow.SetBreakpointSortState);
local v31 = require(l_Actions_0.BreakpointsWindow.BreakpointColumnFilter);
local v32 = require(script.Parent.BreakpointsDropdownField);
local v33 = require(script.Parent.DeleteAllBreakpointsDialog);
local v34 = require(l_Util_0.MakePluginActions);
local v35 = {
    [1] = "isEnabled", 
    [2] = "scriptName", 
    [3] = "lineNumber"
};
local v36 = {
    SourceLineColumn = "scriptLine", 
    ConditionColumn = "condition", 
    LogMessageColumn = "logMessage", 
    ContinueExecutionColumn = "continueExecution", 
    RemoveOnHitColumn = "removeOnHit"
};
local function _(v37)
    if v37 == v20.GameStateTypes.Client then
        return v20.DebugpointIconTable.client;
    elseif v37 == v20.GameStateTypes.Server then
        return v20.DebugpointIconTable.server;
    else
        return nil;
    end;
end;
v22.init = function(v39)
    local v40 = {};
    local v41 = #v35 + #v39.props.ColumnFilter;
    for v42 = 1, v41 do
        if v42 == 2 then
            table.insert(v40, UDim.new(2 / (v41 + 0.5), 0));
        elseif v42 == 3 then
            table.insert(v40, UDim.new(0.5 / (v41 + 0.5), 0));
        else
            table.insert(v40, UDim.new(1 / (v41 + 0.5), 0));
        end;
    end;
    v39.state = {
        selectedBreakpoints = {}, 
        breakpointIdToExpansionState = {}, 
        sizes = v40, 
        deleteAllPopup = false
    };
    v39.OnDoubleClick = function(_)
        v39.goToScript();
    end;
    v39.OnColumnSizesChange = function(v44)
        v39:setState(function(_)
            return {
                sizes = v44
            };
        end);
    end;
    v39.onSelectionChange = function(v46)
        local v47 = {};
        for v48 in pairs(v46) do
            table.insert(v47, v48);
        end;
        v39:setState(function(_)
            return {
                selectedBreakpoints = v47
            };
        end);
    end;
    v39.onMenuActionSelected = function(v50)
        local l_Id_0 = v50.Id;
        local l_Data_0 = v50.Data;
        if not (l_Id_0 ~= v20.BreakpointActions.DeleteBreakpoint) or l_Id_0 == v20.LogpointActions.DeleteLogpoint then
            game:GetService("MetaBreakpointManager"):RemoveBreakpointById(l_Data_0.item.id);
            v39.props.Analytics:report(v27.RemoveMetaBreakpoint, "LuaBreakpointsTable.ContextMenu");
            return ;
        elseif not (l_Id_0 ~= v20.BreakpointActions.EditBreakpoint) or l_Id_0 == v20.LogpointActions.EditLogpoint then
            game:GetService("DebuggerUIService"):EditBreakpoint(l_Data_0.item.id);
            return ;
        elseif not ((l_Id_0 ~= v20.BreakpointActions.EnableBreakpoint and l_Id_0 ~= v20.LogpointActions.EnableLogpoint) and l_Id_0 ~= v20.BreakpointActions.DisableBreakpoint) or l_Id_0 == v20.LogpointActions.DisableLogpoint then
            v24.setBreakpointRowEnabled(game:GetService("MetaBreakpointManager"):GetBreakpointById(l_Data_0.item.id), l_Data_0, v39.props.Analytics, "LuaBreakpointsTable.ContextMenu", v39.props.CurrentDebuggerConnectionId);
            return ;
        else
            if l_Id_0 == v20.CommonActions.GoToScript then
                v39.goToScript();
            end;
            return ;
        end;
    end;
    v39.OnSortChange = function(v53, v54)
        local l_props_0 = v39.props;
        l_props_0.onSetBreakpointSortState(l_props_0.SortIndex == v53 and v54 or (l_props_0.SortOrder or v54), v53);
    end;
    v39.onRightClick = function(v56)
        v39:setState(function(_)
            return {
                selectedBreakpoints = {
                    v56.item
                }
            };
        end);
        local l_props_1 = v39.props;
        local l_Localization_1 = l_props_1.Localization;
        local v60 = l_props_1.Plugin:get();
        local v61 = v56.item.debugpointType == v20.DebugpointType.Logpoint;
        l_showContextMenu_0(v60, v34.getBreakpointActions(l_Localization_1, v56.item.isEnabled, v61, v56, v39.onMenuActionSelected), (v34.getBreakpointActionsOrder(v56.item.isEnabled, v61)));
    end;
    v39.displayDeleteAllBreakpointsPopup = function()
        v39:setState(function(_)
            return {
                deleteAllPopup = true
            };
        end);
    end;
    v39.closeDeleteAllBreakpointsPopup = function()
        v39:setState(function(_)
            return {
                deleteAllPopup = false
            };
        end);
    end;
    v39.deleteAllBreakpoints = function()
        local l_MetaBreakpointManager_0 = game:GetService("MetaBreakpointManager");
        for _, v66 in ipairs(v39.props.Breakpoints) do
            l_MetaBreakpointManager_0:RemoveBreakpointById(v66.id);
        end;
        v39.props.Analytics:report(v27.RemoveAllMetaBreakpoints, "LuaBreakpointsTable");
    end;
    v39.toggleEnabledAll = function()
        local l_MetaBreakpointManager_1 = game:GetService("MetaBreakpointManager");
        local l_hasDisabledBreakpoints_0 = v39.props.hasDisabledBreakpoints;
        v39.props.onToggleEnabledAll(l_MetaBreakpointManager_1, l_hasDisabledBreakpoints_0);
        if not l_hasDisabledBreakpoints_0 then
            v39.props.Analytics:report(v27.DisableAllMetaBreakpoints, "LuaBreakpointsTable");
            return ;
        else
            v39.props.Analytics:report(v27.EnableAllMetaBreakpoints, "LuaBreakpointsTable");
            return ;
        end;
    end;
    v39.goToScript = function()
        if #v39.state.selectedBreakpoints ~= 0 then
            local v69 = v39.state.selectedBreakpoints[1];
            game:GetService("DebuggerUIService"):OpenScriptAtLine(v69.scriptGUID, if not v69.hiddenConnectionId then v39.props.CurrentDebuggerConnectionId else v69.hiddenConnectionId, if not v69.hiddenLineNumber then v69.lineNumber else v69.hiddenLineNumber, true);
        end;
    end;
    v39.onExpansionChange = function(v70)
        v39:setState(function(v71)
            local v72 = {};
            for v73, v74 in pairs(v70) do
                v72[v73.id] = v74;
            end;
            return {
                breakpointIdToExpansionState = v4.Dictionary.join(v71.breakpointIdToExpansionState, v72)
            };
        end);
    end;
    v39.getTreeChildren = function(v75)
        return v75.children or {};
    end;
    v39.OnFocusLost = function(_, v77, v78, v79)
        local l_BreakpointById_0 = game:GetService("MetaBreakpointManager"):GetBreakpointById(v78.item.id);
        if l_BreakpointById_0 then
            if v39.props.CurrentKeys[v79] == "condition" then
                local l_Text_0 = v77.Text;
                if l_Text_0 ~= l_BreakpointById_0.Condition then
                    l_BreakpointById_0.Condition = l_Text_0;
                    v39.props.Analytics:report(v27.MetaBreakpointConditionChanged, "LuaBreakpointsTable");
                    return ;
                end;
            elseif v39.props.CurrentKeys[v79] == "logMessage" then
                local l_Text_1 = v77.Text;
                if l_Text_1 ~= l_BreakpointById_0.LogMessage then
                    l_BreakpointById_0.LogMessage = l_Text_1;
                    v39.props.Analytics:report(v27.MetaBreakpointLogMessageChanged, "LuaBreakpointsTable");
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v22.didMount = function(v83)
    local l_props_2 = v83.props;
    local l_Setting_0 = l_props_2.Plugin:get():GetSetting("breakpointsWindowConfigs");
    if not ((not l_Setting_0 or not l_Setting_0[v20.ColumnSize]) or not l_Setting_0[v20.ColumnFilter]) then
        l_props_2.onColumnFilterChange(l_Setting_0[v20.ColumnFilter]);
        v83:setState(function(_)
            return {
                sizes = v26.fetchSizesFromColumnScales(l_Setting_0[v20.ColumnSize])
            };
        end);
    end;
    if not (not v83.props.IsPaused or not v83.props.CurrentBreakpoint) then
        v83:setState(function(_)
            return {
                selectedBreakpoints = {
                    v83.props.CurrentBreakpoint
                }
            };
        end);
    end;
end;
v22.willUnmount = function(v88)
    local l_props_3 = v88.props;
    l_props_3.Plugin:get():SetSetting("breakpointsWindowConfigs", {
        [v20.ColumnFilter] = l_props_3.ColumnFilter, 
        [v20.ColumnSize] = v26.fetchScaleFromColumnSizes(v88.state.sizes)
    });
end;
v22.didUpdate = function(v90, v91)
    local l_props_4 = v90.props;
    local v93 = #l_props_4.ColumnFilter + #v35;
    if #l_props_4.ColumnFilter ~= #v91.ColumnFilter and #v90.state.sizes ~= v93 then
        local v94 = {};
        local v95 = #v91.ColumnFilter + #v35;
        local v96 = v4.List.toSet(l_props_4.ColumnFilter);
        local v97 = v26.fetchOldColumnSizes(v95, v91.ColumnFilter, v35, v90.state.sizes);
        v94 = if v93 < v95 then v26.updatedSizesAfterRemovingColumns(v93, v26.fetchDeletedColumnsSize(#v35, v95, v91.ColumnFilter, v97, v96), v97, v35, l_props_4.ColumnFilter) else v26.updatedSizesAfterAddingColumns(v93, v95, v97, l_props_4.ColumnFilter, v35);
        do
            local l_v94_0 = v94;
            v90:setState(function(_)
                return {
                    sizes = l_v94_0
                };
            end);
        end;
    end;
    if (not (v90.props.IsPaused ~= v91.IsPaused) or not v90.props.IsPaused) or not v90.props.CurrentBreakpoint then
        if v90.props.Breakpoints ~= v91.Breakpoints and #v90.state.selectedBreakpoints ~= 0 then
            local v100 = {};
            local v101 = {};
            local v102 = {};
            for _, v104 in ipairs(v90.state.selectedBreakpoints) do
                if not v104.context then
                    v101[v104.id] = true;
                else
                    v102[v104.id] = v104.context .. v104.scriptGUID;
                end;
            end;
            for _, v106 in ipairs(v90.props.Breakpoints) do
                if v101[v106.id] then
                    table.insert(v100, v106);
                end;
                if v102[v106.id] then
                    for _, v108 in ipairs(v106.children) do
                        if v102[v106.id] == v108.context .. v108.scriptGUID then
                            table.insert(v100, v108);
                        end;
                    end;
                end;
            end;
            v90:setState(function(_)
                return {
                    selectedBreakpoints = v100
                };
            end);
        end;
        return ;
    else
        v90:setState(function(_)
            return {
                selectedBreakpoints = {
                    v90.props.CurrentBreakpoint
                }
            };
        end);
        return ;
    end;
end;
v22.render = function(v111)
    local l_props_5 = v111.props;
    local l_Localization_2 = l_props_5.Localization;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local v115 = ((l_props_5.IsPaused and l_props_5.CurrentBreakpoint) and v111.state.selectedBreakpoints[1]) and l_props_5.CurrentBreakpoint.id == v111.state.selectedBreakpoints[1].id;
    local v116 = {
        {
            Name = "", 
            Key = v35[1]
        }, 
        {
            Name = l_Localization_2:getText("BreakpointsWindow", "ScriptColumn"), 
            Key = v35[2], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", "ScriptColumnTooltip") or nil
        }, 
        {
            Name = l_Localization_2:getText("BreakpointsWindow", "LineColumn"), 
            Key = v35[3], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", "LineColumnTooltip") or nil
        }
    };
    for _, v118 in ipairs(l_props_5.ColumnFilter) do
        table.insert(v116, {
            Name = l_Localization_2:getText("BreakpointsWindow", v118), 
            Key = v36[v118], 
            Tooltip = l_Localization_2:getText("BreakpointsWindow", v118 .. "Tooltip") or nil
        });
    end;
    local v121 = l_map_0(v116, function(v119, v120)
        return l_join_0(v119, {
            Width = v111.state.sizes[v120]
        });
    end);
    local v122 = {};
    for _, v124 in pairs(l_props_5.Breakpoints) do
        if v111.state.breakpointIdToExpansionState[v124.id] == nil then
            v111.state.breakpointIdToExpansionState[v124.id] = false;
        end;
        v122[v124] = v111.state.breakpointIdToExpansionState[v124.id];
    end;
    local v125 = nil;
    v125 = if not l_props_5.hasDisabledBreakpoints then l_Localization_2:getText("BreakpointsWindow", "DisableAll") else l_Localization_2:getText("BreakpointsWindow", "EnableAll");
    local v126 = v20.HEADER_HEIGHT + v20.BUTTON_PADDING * 2;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundColor3 = l_Stylizer_1.MainBackground
    }, {
        HeaderPane = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v126), 
            Spacing = v20.BUTTON_PADDING, 
            Padding = v20.BUTTON_PADDING, 
            Style = "Box", 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            ButtonsContainer = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0.5, 0, 0, v20.HEADER_HEIGHT), 
                LayoutOrder = 1, 
                Style = "Box", 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                DisableAllBreakpointButton = v1.createElement(l_IconButton_0, {
                    Size = UDim2.new(0, v20.BUTTON_SIZE, 0, v20.BUTTON_SIZE), 
                    LayoutOrder = 1, 
                    LeftIcon = "rbxasset://textures/Debugger/Breakpoints/disable_all@2x.png", 
                    TooltipText = v125, 
                    OnClick = v111.toggleEnabledAll, 
                    Disabled = #l_props_5.Breakpoints == 0
                }), 
                DeleteAllBreakpointButton = v1.createElement(l_IconButton_0, {
                    Size = UDim2.new(0, v20.BUTTON_SIZE, 0, v20.BUTTON_SIZE), 
                    LayoutOrder = 2, 
                    LeftIcon = "rbxasset://textures/Debugger/Breakpoints/delete_all@2x.png", 
                    TooltipText = l_Localization_2:getText("BreakpointsWindow", "DeleteAll"), 
                    OnClick = v111.displayDeleteAllBreakpointsPopup, 
                    Disabled = #l_props_5.Breakpoints == 0
                })
            }), 
            DropdownContainer = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0.5, 0, 0, v20.HEADER_HEIGHT), 
                LayoutOrder = 2, 
                Style = "Box", 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }, {
                ColumnDropdown = v1.createElement(v32, {
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }), 
        TablePane = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -v126), 
            Style = "Box", 
            LayoutOrder = 2
        }, {
            BreakpointsTable = v1.createElement(l_TreeTable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Columns = v121, 
                RootItems = l_props_5.Breakpoints or {}, 
                OnExpansionChange = v111.onExpansionChange, 
                RightClick = v111.onRightClick, 
                CellComponent = v21, 
                LayoutOrder = 2, 
                OnSelectionChange = v111.onSelectionChange, 
                HighlightedRows = v111.state.selectedBreakpoints, 
                Scroll = true, 
                ScrollFocusIndex = v115 and v111.props.CurrentBreakpointIndex, 
                Expansion = v122, 
                GetChildren = v111.getTreeChildren, 
                TextInputCols = l_props_5.TextInputCols, 
                OnFocusLost = v111.OnFocusLost, 
                OnDoubleClick = v111.OnDoubleClick, 
                SortIndex = l_props_5.SortIndex, 
                SortOrder = l_props_5.SortOrder, 
                OnSortChange = v111.OnSortChange, 
                OnColumnSizesChange = v111.OnColumnSizesChange, 
                UseDeficit = false, 
                UseScale = true, 
                ClampSize = true, 
                ColumnHeaderHeight = v20.COLUMN_HEADER_HEIGHT, 
                RowHeight = v20.ROW_HEIGHT, 
                ExpandOnDoubleClick = true
            })
        }), 
        DeleteAllDialog = v1.createElement(v33, {
            Enabled = v111.state.deleteAllPopup, 
            CloseDialog = v111.closeDeleteAllBreakpointsPopup, 
            DeleteAllBreakpoints = v111.deleteAllBreakpoints
        })
    });
end;
return (v2.connect(function(v127, _)
    local v129 = {};
    local v130 = nil;
    local v131 = nil;
    local v132 = false;
    for _, v134 in pairs(v127.Breakpoint.MetaBreakpoints) do
        local v135 = l_deepCopy_0(v134);
        v135.scriptGUID = v134.scriptName;
        v135.scriptName = v127.ScriptInfo.ScriptInfo[v135.scriptName];
        v135.scriptLine = v127.ScriptInfo.ScriptLineContents[v135.scriptGUID] and v127.ScriptInfo.ScriptLineContents[v135.scriptGUID][v135.lineNumber];
        table.insert(v129, v135);
        if v134.isEnabled == false then
            v132 = true;
        end;
    end;
    local v136 = 1;
    for _, v138 in ipairs(v129) do
        if v138.id == v127.Common.currentBreakpointId then
            v130 = v138;
            v131 = v136;
        end;
        v136 = v136 + 1;
        v138.children = {};
        for v139, v140 in pairs(v138.contextBreakpoints) do
            for _, v142 in ipairs(v140.breakpoints) do
                local v143 = v19.extractNonChildData(v138, v139, v142.Script);
                v143.hiddenConnectionId = v140.connectionId;
                v143.hiddenLineNumber = v143.lineNumber;
                v143.lineNumber = "";
                v143.isEnabled = v142.Enabled;
                v143.isValid = v142.Valid;
                v143.scriptName = {
                    Value = v127.ScriptInfo.ScriptInfo[v142.Script], 
                    LeftIcon = {
                        Image = if v139 == v20.GameStateTypes.Client then v20.DebugpointIconTable.client else if v139 == v20.GameStateTypes.Server then v20.DebugpointIconTable.server else nil, 
                        Size = UDim2.new(0, v20.ICON_SIZE, 0, v20.ICON_SIZE)
                    }
                };
                table.insert(v138.children, v143);
            end;
        end;
    end;
    local v144 = {};
    local v145 = {};
    for _, v147 in ipairs(v35) do
        table.insert(v144, v147);
    end;
    for v148, v149 in ipairs(v127.Breakpoint.listOfEnabledColumns) do
        table.insert(v144, v36[v149]);
        if not (v149 ~= "ConditionColumn") or v149 == "LogMessageColumn" then
            v145[v148 + #v35] = true;
        end;
    end;
    v25.sortTableByColumnAndOrder(v129, v127.Breakpoint.ColumnIndex, v127.Breakpoint.SortDirection, v144, false, {
        "scriptGUID", 
        "lineNumber"
    });
    return {
        Breakpoints = v129, 
        IsPaused = v127.Common.isPaused, 
        CurrentBreakpoint = v130, 
        CurrentBreakpointIndex = v131, 
        CurrentDebuggerConnectionId = v127.Common.currentDebuggerConnectionId, 
        SortIndex = v127.Breakpoint.ColumnIndex, 
        SortOrder = v127.Breakpoint.SortDirection, 
        hasDisabledBreakpoints = v132, 
        ColumnFilter = v127.Breakpoint.listOfEnabledColumns, 
        TextInputCols = v145, 
        CurrentKeys = v144
    };
end, function(v150)
    return {
        onToggleEnabledAll = function(v151, v152)
            return v150(v28(v151, v152));
        end, 
        onSetBreakpointSortState = function(v153, v154)
            return v150(v30(v153, v154));
        end, 
        onColumnFilterChange = function(v155)
            return v150(v31(v155));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v22))));
