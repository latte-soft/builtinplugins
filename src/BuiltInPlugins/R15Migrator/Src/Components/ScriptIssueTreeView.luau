local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetReplaceProgress);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetScriptSelection);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetScriptExpansion);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetProgressBarMessageKey);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.OnScriptsReverted);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceWithRules);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceWithSuggestion);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.RevertScripts);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UndoRevert);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.ScriptIssueRow);
local v16 = require(l_Components_0.ScriptConversionRightClickMenu);
local v17 = require(l_Components_0.SelectAllRow);
local v18 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local v19 = require(l_script_FirstAncestor_0.Src.Util.ScriptTreeManager);
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeView_0 = l_UI_0.TreeView;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local v25 = v1.PureComponent:extend("ScriptIssueTreeView");
v25.init = function(v26)
    v26.ref = v1.createRef();
    v26.canvasPosition = Vector2.zero;
    v26.areAllSelected = function()
        return v26.treeManager:areAllSelected(true);
    end;
    v26.onAllSelectedChecked = function()
        if not v26:areAllSelected() then
            v26.treeManager:selectAll(true);
            return ;
        else
            v26.treeManager:resetSelected();
            return ;
        end;
    end;
    v26.onToggle = function(v27)
        v26.treeManager:toggleExpanded(v27.item);
    end;
    v26.onClick = function(v28)
        v26.treeManager:onItemClicked(v28.item);
    end;
    v26.onDoubleClick = function(v29)
        v26.treeManager:onItemDoubleClicked(v29.item, v26.props.ScriptConversionContext);
    end;
    v26.resetSelection = function()
        v26.treeManager:resetSelected();
    end;
    v26.onKeyPressed = function(v30)
        v26.treeManager:onKeyPressed(v30);
    end;
    v26.onKeyReleased = function(v31)
        v26.treeManager:onKeyReleased(v31);
    end;
    v26.onRightClick = function(v32)
        v26.treeManager:onItemClicked(v32.item, true);
        v16:show(v26.treeManager:getRightClickContextInfo(v26.props, v32.item));
    end;
    v26.getRowProps = function(v33, v34, v35, v36)
        local l_item_0 = v33.item;
        return {
            Expanded = v26.props.expansion[l_item_0], 
            Selected = v26.treeManager:itemIsSelected(l_item_0), 
            OnToggle = v26.onToggle, 
            OnClick = v26.onClick, 
            OnRightClick = v26.onRightClick, 
            OnDoubleClick = v26.onDoubleClick, 
            Key = v34, 
            Position = v35, 
            Row = v33, 
            Size = v36
        };
    end;
    v26.comparator = function(v38, v39)
        if not v38.range or not v39.range then
            return v39.key < v38.key;
        else
            return v38.range < v39.range;
        end;
    end;
    v26.treeManager = v19.new();
    v26.treeManager:connectToExpandedChanged(function()
        v26.props.SetScriptExpansion(v26.treeManager:getExpansionTable());
    end);
    v26.treeManager:connectToSelectedChanged(function()
        v26.props.SetScriptSelection(v26.treeManager:getSelectionList());
    end);
end;
v25.getScroller = function(v40)
    return v40.ref:getValue().TreeView.List;
end;
v25.didMount = function(v41)
    local l_props_0 = v41.props;
    local l_filter_0 = l_props_0.filter;
    local l_diagnostics_0 = l_props_0.diagnostics;
    local l_revertedScripts_0 = l_props_0.revertedScripts;
    local l_initialIssueCounts_0 = l_props_0.initialIssueCounts;
    local l_completedScripts_0 = l_props_0.completedScripts;
    local l_Localization_0 = l_props_0.Localization;
    local l_ScriptConversionContext_0 = l_props_0.ScriptConversionContext;
    local v50 = v41:getScroller();
    v41.onCanvasPositionChanged = v50:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        if not v41.preserveCanvasPosition then
            v41.canvasPosition = v50.CanvasPosition;
        end;
    end);
    v41.onCanvasSizeChanged = v50:GetPropertyChangedSignal("CanvasSize"):Connect(function()
        if v50 then
            if v41.previousCanvasSize and v50.CanvasSize.Y.Offset < v41.previousCanvasSize.Y.Offset then
                v41.preserveCanvasPosition = true;
            end;
            if not (not v41.preserveCanvasPosition or not v41.canvasPosition) and v41.canvasPosition.Y <= v50.CanvasSize.Y.Offset then
                v50.CanvasPosition = v41.canvasPosition;
                v41.preserveCanvasPosition = false;
            end;
            v41.previousCanvasSize = v50.CanvasSize;
            return ;
        else
            return ;
        end;
    end);
    v41.treeManager:buildTreeItems({
        diagnostics = l_diagnostics_0, 
        completedScripts = l_completedScripts_0, 
        initialIssueCounts = l_initialIssueCounts_0, 
        revertedScripts = l_revertedScripts_0, 
        filter = if l_filter_0 ~= l_Localization_0:getText("ScriptConversion", "FilterNone") then l_filter_0 else nil, 
        Localization = l_Localization_0, 
        ScriptConversionContext = l_ScriptConversionContext_0
    });
    v41.props.SetScriptExpansion(v41.treeManager:getExpansionTable());
    v41.props.SetScriptSelection(v41.treeManager:getSelectionList());
end;
v25.render = function(v51)
    local l_props_1 = v51.props;
    local l_selection_0 = l_props_1.selection;
    local l_expansion_0 = l_props_1.expansion;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_SelectAllRow_0 = l_Stylizer_0.SelectAllRow;
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        ForwardRef = v51.ref, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical
    }, {
        SelectAllRow = v1.createElement(v17, {
            IsChecked = v51:areAllSelected(), 
            OnCheckboxClick = v51.onAllSelectedChecked, 
            RowHeight = l_SelectAllRow_0.RowHeight, 
            Padding = l_SelectAllRow_0.Padding, 
            OnResetPlugin = l_props_1.OnResetPlugin
        }), 
        TreeView = v1.createElement(l_TreeView_0, {
            Size = UDim2.new(1, 0, 1, -l_SelectAllRow_0.RowHeight), 
            Expansion = l_expansion_0, 
            Selection = l_selection_0, 
            RootItems = v51.treeManager:getItems() or {}, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            RowComponent = v15, 
            RowHeight = l_Stylizer_0.RowHeight, 
            GetRowProps = v51.getRowProps, 
            SortChildren = v51.comparator
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v51.onKeyPressed, 
            OnKeyReleased = v51.onKeyReleased
        })
    });
end;
v25.willUpdate = function(v59, v60, _)
    local l_props_2 = v59.props;
    local l_Localization_1 = l_props_2.Localization;
    if l_Localization_1 and (not (l_props_2.diagnostics == v60.diagnostics) or l_props_2.filter ~= v60.filter) then
        v59.treeManager:buildTreeItems({
            diagnostics = v60.diagnostics, 
            completedScripts = v60.completedScripts, 
            initialIssueCounts = v60.initialIssueCounts, 
            revertedScripts = v60.revertedScripts, 
            filter = if v60.filter ~= l_Localization_1:getText("ScriptConversion", "FilterNone") then v60.filter else nil, 
            Localization = l_Localization_1, 
            ScriptConversionContext = l_props_2.ScriptConversionContext
        });
    end;
end;
v25.didUpdate = function(v64, v65, _)
    if not (v64.props.diagnostics == v65.diagnostics) or v64.props.filter ~= v65.filter then
        v64.props.SetScriptExpansion(v64.treeManager:getExpansionTable());
        v64.props.SetScriptSelection(v64.treeManager:getSelectionList());
    end;
end;
v25.willUnmount = function(v67)
    v67.treeManager:terminate();
    if v67.onCanvasSizeChanged then
        v67.onCanvasSizeChanged:Disconnect();
    end;
    if v67.onCanvasPositionChanged then
        v67.onCanvasPositionChanged:Disconnect();
    end;
    v67.preserveCanvasPosition = false;
end;
return v2.connect(function(v68, _)
    return {
        expansion = v68.ScriptConversion.expansion, 
        selection = v68.ScriptConversion.selection, 
        diagnostics = v68.ScriptConversion.diagnostics, 
        completedScripts = v68.ScriptConversion.completedScripts, 
        initialIssueCounts = v68.ScriptConversion.initialIssueCounts, 
        revertedScripts = v68.ScriptConversion.revertedScripts, 
        filter = v68.ScriptConversion.filter, 
        replaceRules = v68.ScriptConversion.replaceRules
    };
end, function(v70)
    return {
        OnScriptsReverted = function(v71)
            v70(v9(v71));
        end, 
        SetReplaceProgress = function(v72)
            v70(v5(v72));
        end, 
        SetProgressBarMessageKey = function(v73)
            v70(v8(v73));
        end, 
        SetScriptExpansion = function(v74)
            v70(v7(v74));
        end, 
        SetScriptSelection = function(v75)
            v70(v6(v75));
        end, 
        ReplaceWithRules = function(v76, v77, v78)
            v70(v10(v76, v77, false, v78));
        end, 
        ReplaceWithSuggestion = function(v79, v80, v81, v82, v83, v84, v85)
            v70(v11(v79, v80, v81, v82, v83, v84, true, v85));
        end, 
        RevertScripts = function(v86, v87, v88)
            v70(v12(v86, v87, v88));
        end, 
        UndoRevert = function(v89, v90, v91)
            v70(v13(v89, v90, v91));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    ScriptConversionContext = v18
})(v25)));
