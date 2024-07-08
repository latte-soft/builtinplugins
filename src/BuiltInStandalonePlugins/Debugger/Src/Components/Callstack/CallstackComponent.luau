local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(script.Parent.CallstackDropdownField);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local v12 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Stylizer_0 = v3.Style.Stylizer;
local l_deepCopy_0 = v3.Util.deepCopy;
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_IconButton_0 = l_UI_0.IconButton;
local l_showContextMenu_0 = v3.UI.showContextMenu;
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.ColumnResizeHelperFunctions);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v26 = require(l_Actions_0.Callstack.SetCurrentFrameNumber);
local v27 = require(l_Actions_0.Callstack.ColumnFilterChange);
local v28 = require(l_Parent_0.Src.Thunks.Watch.LoadAllVariablesForThreadAndFrame);
local v29 = require(l_Parent_0.Src.Thunks.Callstack.PopulateCallstackThreadThunk);
local v30 = require(l_Util_0.MakePluginActions);
local v31 = require(l_Parent_0.Src.Models.Callstack.CallstackRow);
local v32 = v1.PureComponent:extend("CallstackComponent");
local v33 = require(l_Parent_0.Src.Util.Constants);
local v34 = require(l_Parent_0.Src.Thunks.Callstack.StepHandlers);
local l_StudioService_0 = game:GetService("StudioService");
local v36 = {
    [1] = "arrowColumn"
};
local v37 = {
    FrameColumn = "frameColumn", 
    SourceColumn = "sourceColumn", 
    FunctionColumn = "functionColumn", 
    LineColumn = "lineColumn"
};
local v38 = {
    ArrowColumn = 0.5, 
    FrameColumn = 0.5, 
    SourceColumn = 1.5, 
    FunctionColumn = 1, 
    LineColumn = 0.5
};
local function _(v39, v40, v41, v42)
    if v39 == 1 then
        v41[v39].arrowColumn = v31.ICON_FRAME_TOP;
        return ;
    elseif v40.frameColumn == v42 then
        v41[v39].arrowColumn = v31.ICON_CURRENT_FRAME;
        return ;
    else
        v41[v39].arrowColumn = "";
        return ;
    end;
end;
local function _(v44, v45)
    return v45.ScriptInfo[v44];
end;
local _ = function(v47, _, v49, v50)
    v49[v47].scriptGUID = v49[v47].sourceColumn;
    v49[v47].sourceColumn = v50.ScriptInfo[v49[v47].sourceColumn];
end;
local function v64(v52, v53, v54, v55)
    local l_displayString_0 = v52.displayString;
    local l_threadId_0 = v52.threadId;
    local v58 = v54.currentFrameMap[v54.currentDebuggerConnectionId][l_threadId_0];
    local v59 = v53.threadIdToFrameList and v53.threadIdToFrameList[l_threadId_0];
    local v60 = nil;
    v60 = if not v59 then {
        [1] = {
            frameColumn = 1, 
            functionColumn = "", 
            lineColumn = -1, 
            sourceColumn = l_displayString_0
        }
    } else l_deepCopy_0(v59);
    for v61, v62 in ipairs(v60) do
        local l_v60_0 = v60;
        if v61 == 1 then
            l_v60_0[v61].arrowColumn = v31.ICON_FRAME_TOP;
        elseif v62.frameColumn == v58 then
            l_v60_0[v61].arrowColumn = v31.ICON_CURRENT_FRAME;
        else
            l_v60_0[v61].arrowColumn = "";
        end;
        l_v60_0 = v60;
        l_v60_0[v61].scriptGUID = l_v60_0[v61].sourceColumn;
        l_v60_0[v61].sourceColumn = v55.ScriptInfo[l_v60_0[v61].sourceColumn];
    end;
    return {
        arrowColumn = l_displayString_0, 
        threadId = l_threadId_0, 
        children = v60
    };
end;
v32.addAction = function(v65, v66, v67)
    if v66 then
        v66.Enabled = true;
        table.insert(v65.shortcuts, v66);
        table.insert(v65.connections, v66.Triggered:Connect(v67));
    end;
end;
v32.didMount = function(v68)
    local l_props_0 = v68.props;
    local l_Setting_0 = l_props_0.Plugin:get():GetSetting("callstackWindowConfigs");
    if not ((not l_Setting_0 or not l_Setting_0[v33.ColumnSize]) or not l_Setting_0[v33.ColumnFilter]) then
        l_props_0.onColumnFilterChange(l_Setting_0[v33.ColumnFilter]);
        v68:setState(function(_)
            return {
                sizes = v24.fetchSizesFromColumnScales(l_Setting_0[v33.ColumnSize])
            };
        end);
    end;
    local l_PluginActions_1 = v68.props.PluginActions;
    v68.connections = {};
    v68.shortcuts = {};
    v68:addAction(l_PluginActions_1:get(v33.CallstackActionIds.CopySelected), v68.copySelectedRows);
    v68:addAction(l_PluginActions_1:get(v33.CallstackActionIds.SelectAll), v68.selectAllRows);
end;
v32.willUnmount = function(v73)
    local l_props_1 = v73.props;
    l_props_1.Plugin:get():SetSetting("callstackWindowConfigs", {
        [v33.ColumnFilter] = l_props_1.ColumnFilter, 
        [v33.ColumnSize] = v24.fetchScaleFromColumnSizes(v73.state.sizes)
    });
    if v73.connections then
        for _, v76 in ipairs(v73.connections) do
            v76:Disconnect();
        end;
        v73.connections = {};
    end;
    if v73.shortcuts then
        for _, v78 in ipairs(v73.shortcuts) do
            v78.Enabled = false;
        end;
        v73.shortcuts = {};
    end;
end;
v32.init = function(v79)
    local v80 = {};
    local l_ArrowColumn_0 = v38.ArrowColumn;
    for v82 = 1, #v79.props.ColumnFilter do
        l_ArrowColumn_0 = l_ArrowColumn_0 + v38[v79.props.ColumnFilter[v82]];
    end;
    table.insert(v80, UDim.new(v38.ArrowColumn / l_ArrowColumn_0, 0));
    for v83 = 1, #v79.props.ColumnFilter do
        table.insert(v80, UDim.new(v38[v79.props.ColumnFilter[v83]] / l_ArrowColumn_0, 0));
    end;
    v79.state = {
        selectedRows = {}, 
        selectAll = false, 
        sizes = v80
    };
    v79.OnColumnSizesChange = function(v84)
        v79:setState(function(_)
            return {
                sizes = v84
            };
        end);
    end;
    v79.getTreeChildren = function(v86)
        return v86.children or {};
    end;
    v79.onSelectionChange = function(v87)
        local l_props_2 = v79.props;
        for v89 in pairs(v87) do
            if v89.arrowColumn == "" then
                v89.arrowColumn = v31.ICON_CURRENT_FRAME;
            end;
            v79:setState(function(_)
                return {
                    selectedRows = {
                        v89
                    }, 
                    selectAll = false
                };
            end);
            local l_CurrentThreadId_0 = l_props_2.CurrentThreadId;
            local l_frameColumn_0 = v89.frameColumn;
            l_props_2.setCurrentFrameNumber(l_CurrentThreadId_0, l_frameColumn_0);
            local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
            v79.props.Analytics:report(v12.CallstackChangeFrame, "CallstackComponent");
            if not (not ((v89.scriptGUID ~= "" and v89.sourceColumn ~= "") and v89.lineColumn ~= "") or not l_frameColumn_0) then
                if l_frameColumn_0 > 1 then
                    l_DebuggerUIService_0:SetScriptLineMarker(v89.scriptGUID, l_props_2.CurrentDebuggerConnectionId, v89.lineColumn, false);
                else
                    l_DebuggerUIService_0:RemoveScriptLineMarkers(l_props_2.CurrentDebuggerConnectionId, false);
                end;
                l_DebuggerUIService_0:OpenScriptAtLine(v89.scriptGUID, l_props_2.CurrentDebuggerConnectionId, v89.lineColumn, false);
                l_props_2.onCurrentFrameChanged(l_props_2.CurrentDebuggerConnectionId, l_CurrentThreadId_0, l_frameColumn_0);
            end;
        end;
    end;
    v79.rowToString = function(v94)
        local v95 = "";
        for _, v97 in pairs(v79.props.ColumnFilter) do
            if typeof(v94[v37[v97]]) == "EnumItem" then
                v95 = v95 .. v94[v37[v97]].Name .. "\t";
            else
                v95 = v95 .. v94[v37[v97]] .. "\t";
            end;
        end;
        return v95;
    end;
    v79.copySelectedRows = function()
        local l_selectedRows_0 = v79.state.selectedRows;
        if #l_selectedRows_0 == 0 then
            return ;
        else
            local v99 = "";
            for _, v101 in ipairs(l_selectedRows_0) do
                if #v79.getTreeChildren(v101) == 0 then
                    v99 = v99 .. v79.rowToString(v101) .. "\n";
                else
                    v99 = v99 .. v101.arrowColumn .. "\n";
                    for _, v103 in ipairs(v101.children) do
                        v99 = v99 .. v79.rowToString(v103) .. "\n";
                    end;
                end;
            end;
            l_StudioService_0:CopyToClipboard(v99);
            return ;
        end;
    end;
    v79.selectAllRows = function()
        local l_props_3 = v79.props;
        local v105 = {};
        if #v79.state.selectedRows == 1 then
            local v106 = v79.state.selectedRows[1];
            if v106.threadId and v106.threadId ~= l_props_3.CurrentThreadId then
                return ;
            end;
        end;
        for _, v108 in ipairs(l_props_3.RootItems) do
            if l_props_3.CurrentThreadId == v108.threadId then
                for _, v110 in ipairs(v79.getTreeChildren(v108)) do
                    table.insert(v105, v110);
                end;
            end;
        end;
        v79:setState(function(_)
            return {
                selectedRows = v105, 
                selectAll = true
            };
        end);
    end;
    v79.onMenuActionSelected = function(v112)
        local l_Id_0 = v112.Id;
        if l_Id_0 == v33.CallstackActionIds.CopySelected then
            v79.copySelectedRows();
            return ;
        else
            if l_Id_0 == v33.CallstackActionIds.SelectAll then
                v79.selectAllRows();
            end;
            return ;
        end;
    end;
    v79.onRightClick = function(v114)
        if not v79.state.selectAll or v114.item.threadId and v114.item.threadId ~= v79.props.CurrentThreadId then
            v79:setState(function(_)
                return {
                    selectedRows = {
                        v114.item
                    }, 
                    selectAll = false
                };
            end);
        end;
        local l_props_4 = v79.props;
        l_showContextMenu_0(l_props_4.Plugin:get(), v30.getCallstackActions(l_props_4.Localization, v79.onMenuActionSelected), v33.CallstackActionsOrder);
    end;
    v79.onExpansionChange = function(v117)
        for v118, _ in pairs(v117) do
            local l_CurrentDebuggerConnectionId_0 = v79.props.CurrentDebuggerConnectionId;
            local l_CurrentDST_0 = v79.props.CurrentDST;
            local l_ConnectionById_0 = game:GetService("DebuggerConnectionManager"):GetConnectionById(l_CurrentDebuggerConnectionId_0);
            local v123 = v118.children[1];
            local v124 = v123.lineColumn ~= -1;
            local l_threadId_1 = v118.threadId;
            if not v124 then
                local l_CrossDMScriptChangeListener_0 = game:GetService("CrossDMScriptChangeListener");
                local l_l_ConnectionById_0_ThreadById_0 = l_ConnectionById_0:GetThreadById(l_threadId_1);
                v79.props.onPopulateCallstackThreadThunk(l_l_ConnectionById_0_ThreadById_0, l_ConnectionById_0, l_CurrentDST_0, l_CrossDMScriptChangeListener_0, function()
                    if l_CurrentDST_0 == v79.props.CurrentDST then
                        v79.loadThreadData(l_l_ConnectionById_0_ThreadById_0, l_CurrentDebuggerConnectionId_0, v79);
                    end;
                end);
            else
                local l_DebuggerUIService_1 = game:GetService("DebuggerUIService");
                l_DebuggerUIService_1:OpenScriptAtLine(v123.scriptGUID, l_CurrentDebuggerConnectionId_0, v123.lineColumn, false);
                l_DebuggerUIService_1:SetScriptLineMarker(v123.scriptGUID, l_CurrentDebuggerConnectionId_0, v123.lineColumn, true);
                v79.props.onLoadAllVariablesForThreadAndFrame(l_threadId_1, l_ConnectionById_0, 0, l_DebuggerUIService_1);
            end;
        end;
    end;
    v79.getTreeChildren = function(v129)
        return v129.children or {};
    end;
    v79.loadThreadData = function(v130, v131)
        local l_DebuggerUIService_2 = game:GetService("DebuggerUIService");
        v79.props.setCurrentFrameNumber(v130.ThreadId, 1);
        v79.props.onCurrentFrameChanged(v131, v130.ThreadId, 1);
        local l_v130_Frame_0 = v130:GetFrame(0);
        l_DebuggerUIService_2:SetScriptLineMarker(l_v130_Frame_0.Script, v131, l_v130_Frame_0.Line, true);
        l_DebuggerUIService_2:OpenScriptAtLine(l_v130_Frame_0.Script, v131, l_v130_Frame_0.Line, false);
    end;
    v79.onStepOver = function()
        v79.props.onStepAction(v33.StepActionIds.stepOverActionV2, v79.props.CurrentDebuggerConnectionId, v79.props.CurrentThreadId);
    end;
    v79.onStepInto = function()
        v79.props.onStepAction(v33.StepActionIds.stepIntoActionV2, v79.props.CurrentDebuggerConnectionId, v79.props.CurrentThreadId);
    end;
    v79.onStepOut = function()
        v79.props.onStepAction(v33.StepActionIds.stepOutActionV2, v79.props.CurrentDebuggerConnectionId, v79.props.CurrentThreadId);
    end;
end;
v32.didUpdate = function(v134, v135)
    local l_props_5 = v134.props;
    local v137 = #l_props_5.ColumnFilter + #v36;
    if #l_props_5.ColumnFilter ~= #v135.ColumnFilter and #v134.state.sizes ~= v137 then
        local v138 = {};
        local v139 = #v135.ColumnFilter + #v36;
        local v140 = v4.List.toSet(l_props_5.ColumnFilter);
        local v141 = v24.fetchOldColumnSizes(v139, v135.ColumnFilter, v36, v134.state.sizes);
        v138 = if v137 < v139 then v24.updatedSizesAfterRemovingColumns(v137, v24.fetchDeletedColumnsSize(#v36, v139, v135.ColumnFilter, v141, v140), v141, v36, l_props_5.ColumnFilter) else v24.updatedSizesAfterAddingColumns(v137, v139, v141, l_props_5.ColumnFilter, v36);
        do
            local l_v138_0 = v138;
            v134:setState(function(_)
                return {
                    sizes = l_v138_0
                };
            end);
        end;
    end;
end;
v32.render = function(v144)
    local l_props_6 = v144.props;
    local l_Localization_1 = l_props_6.Localization;
    local l_Stylizer_1 = v144.props.Stylizer;
    local v148 = l_props_6.ColumnFilter or {};
    local v149 = {
        {
            Name = "", 
            Key = v36[1]
        }
    };
    for _, v151 in ipairs(v148) do
        table.insert(v149, {
            Name = l_Localization_1:getText("Callstack", v151), 
            Key = v37[v151], 
            Tooltip = l_Localization_1:getText("Callstack", v151 .. "Tooltip") or nil
        });
    end;
    local l_sizes_0 = v144.state.sizes;
    local v155 = l_map_0(v149, function(v153, v154)
        return l_join_0(v153, {
            Width = l_sizes_0[v154]
        });
    end);
    local v156 = v33.HEADER_HEIGHT + v33.BUTTON_PADDING * 2;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v159 = {
        Size = UDim2.fromScale(1, 1), 
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical
    };
    local v160 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v163 = {
        Size = UDim2.new(1, 0, 0, v156), 
        Spacing = v33.BUTTON_PADDING, 
        Padding = v33.BUTTON_PADDING, 
        LayoutOrder = 1, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    };
    local v164 = {};
    local l_createElement_2 = v1.createElement;
    local l_l_Pane_0_2 = l_Pane_0;
    local v167 = {
        Size = UDim2.new(0.5, 0, 0, v33.HEADER_HEIGHT), 
        LayoutOrder = 1, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    };
    local v168 = {};
    local l_createElement_3 = v1.createElement;
    local l_l_IconButton_0_0 = l_IconButton_0;
    local v171 = {
        Size = UDim2.new(0, v33.BUTTON_SIZE, 0, v33.BUTTON_SIZE), 
        LayoutOrder = 1, 
        LeftIcon = "rbxasset://textures/Debugger/Step-In.png", 
        TooltipText = l_Localization_1:getText("Common", "stepIntoActionV2"), 
        OnClick = v144.onStepInto
    };
    local v172 = true;
    if v144.props.CurrentThreadId ~= nil then
        v172 = v144.props.HitException;
    end;
    v171.Disabled = v172;
    v168.StepIntoButton = l_createElement_3(l_l_IconButton_0_0, v171);
    l_createElement_3 = v1.createElement;
    l_l_IconButton_0_0 = l_IconButton_0;
    v171 = {
        Size = UDim2.new(0, v33.BUTTON_SIZE, 0, v33.BUTTON_SIZE), 
        LayoutOrder = 2, 
        LeftIcon = "rbxasset://textures/Debugger/Step-Over.png", 
        TooltipText = l_Localization_1:getText("Common", "stepOverActionV2"), 
        OnClick = v144.onStepOver
    };
    v172 = true;
    if v144.props.CurrentThreadId ~= nil then
        v172 = v144.props.HitException;
    end;
    v171.Disabled = v172;
    v168.StepOverButton = l_createElement_3(l_l_IconButton_0_0, v171);
    l_createElement_3 = v1.createElement;
    l_l_IconButton_0_0 = l_IconButton_0;
    v171 = {
        Size = UDim2.new(0, v33.BUTTON_SIZE, 0, v33.BUTTON_SIZE), 
        LayoutOrder = 3, 
        LeftIcon = "rbxasset://textures/Debugger/Step-Out.png", 
        TooltipText = l_Localization_1:getText("Common", "stepOutActionV2"), 
        OnClick = v144.onStepOut
    };
    v172 = true;
    if v144.props.CurrentThreadId ~= nil then
        v172 = v144.props.HitException;
    end;
    v171.Disabled = v172;
    v168.StepOutButton = l_createElement_3(l_l_IconButton_0_0, v171);
    v164.ButtonContainer = l_createElement_2(l_l_Pane_0_2, v167, v168);
    v164.ColContainer = v1.createElement(l_Pane_0, {
        Size = UDim2.new(0.5, 0, 0, v33.HEADER_HEIGHT), 
        LayoutOrder = 2, 
        Style = "Box", 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right
    }, {
        ColumnDropdown = v1.createElement(v5, {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        })
    });
    v160.HeaderView = l_createElement_1(l_l_Pane_0_1, v163, v164);
    v160.BodyView = v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, -v156), 
        LayoutOrder = 2, 
        Style = "Box"
    }, {
        TableView = v1.createElement(l_TreeTable_0, {
            Scroll = true, 
            Size = UDim2.fromScale(1, 1), 
            Columns = v155, 
            RootItems = l_props_6.RootItems, 
            Stylizer = l_Stylizer_1, 
            Expansion = l_props_6.ExpansionTable, 
            GetChildren = v144.getTreeChildren, 
            DisableTooltip = false, 
            OnSelectionChange = v144.onSelectionChange, 
            RightClick = v144.onRightClick, 
            OnExpansionChange = v144.onExpansionChange, 
            FullSpan = true, 
            HighlightedRows = v144.state.selectedRows, 
            OnColumnSizesChange = v144.OnColumnSizesChange, 
            UseDeficit = false, 
            UseScale = true, 
            ClampSize = true, 
            Padding = 1, 
            ColumnHeaderHeight = v33.COLUMN_HEADER_HEIGHT, 
            RowHeight = v33.ROW_HEIGHT, 
            ExpandOnDoubleClick = true
        })
    });
    return l_createElement_0(l_l_Pane_0_0, v159, v160);
end;
return (v2.connect(function(v173, _)
    local l_Common_0 = v173.Common;
    local v176 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    local l_Callstack_0 = v173.Callstack;
    if v176 == nil then
        return {
            RootItems = {}, 
            ExpansionTable = {}, 
            CurrentThreadId = nil, 
            ColumnFilter = l_Callstack_0.listOfEnabledColumns
        };
    else
        local v178 = l_Callstack_0.stateTokenToCallstackVars[l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId]];
        assert(v178);
        local l_threadList_0 = v178.threadList;
        local v180 = {};
        local v181 = {};
        for _, v183 in ipairs(l_threadList_0) do
            local v184 = v64(v183, v178, l_Common_0, v173.ScriptInfo);
            assert(v184 ~= nil);
            table.insert(v180, v184);
            if v183.threadId == v176 then
                v181[v184] = true;
            end;
        end;
        return {
            RootItems = v180, 
            CurrentThreadId = v176, 
            ExpansionTable = v181, 
            ColumnFilter = l_deepCopy_0(l_Callstack_0.listOfEnabledColumns), 
            CurrentDebuggerConnectionId = l_Common_0.currentDebuggerConnectionId, 
            CurrentDST = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId], 
            HitException = not not v176 and l_Common_0.hitException[v176]
        };
    end;
end, function(v185)
    return {
        setCurrentFrameNumber = function(v186, v187)
            return v185(v26(v186, v187));
        end, 
        onCurrentFrameChanged = function(v188, v189, v190)
            return v185(v28(v189, game:GetService("DebuggerConnectionManager"):GetConnectionById(v188), v190 - 1, (game:GetService("DebuggerUIService"))));
        end, 
        onPopulateCallstackThreadThunk = function(v191, v192, v193, v194, v195)
            return v185(v29(v191, v192, v193, v194, v195));
        end, 
        onLoadAllVariablesForThreadAndFrame = function(v196, v197, v198, v199)
            return v185(v28(v196, v197, v198, v199));
        end, 
        onColumnFilterChange = function(v200)
            return v185(v27(v200));
        end, 
        onStepAction = function(v201, v202, v203)
            return v185(v34(v201, "CallstackComponent", v202, v203));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PluginActions = l_PluginActions_0, 
    Plugin = l_Plugin_0
})(v32))));
