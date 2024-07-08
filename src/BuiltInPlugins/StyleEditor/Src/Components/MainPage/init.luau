local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = v5.SharedFlags.getFFlagDevFrameworkBetterInit();
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v10 = require(l_Actions_0.Window.SelectItem);
local v11 = require(l_Actions_0.Window.SetItemsExpanded);
local v12 = require(l_Actions_0.Window.SetSearch);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v14 = require(l_Thunks_0.ContextMenu.ShowDesignSheetMenu);
local v15 = require(l_Thunks_0.ContextMenu.ShowNilDesignSheetMenu);
local v16 = require(l_Thunks_0.ContextMenu.ShowNewStyleRuleMenu);
local v17 = require(l_Thunks_0.ContextMenu.ShowStyleRuleMenu);
local v18 = require(l_Thunks_0.ContextMenu.ShowStyleSheetMenu);
local v19 = require(l_Thunks_0.ContextMenu.ShowThemeCategoryMenu);
local v20 = require(l_Thunks_0.ContextMenu.ShowThemeFolderMenu);
local v21 = require(l_Thunks_0.ContextMenu.ShowThemeOtherMenu);
local v22 = require(l_Thunks_0.ContextMenu.ShowTokenCategoryMenu);
local v23 = require(l_Thunks_0.ContextMenu.ShowUiElementsMenu);
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local v26 = if not v6 then v5.StudioUI.SearchBar else l_UI_0.SearchBar;
local l_SplitPane_0 = l_UI_0.SplitPane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local v29 = require(l_Parent_0.Src.Util.DesignHelpers);
local v30 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v31 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v32 = require(l_Parent_0.Src.Components.DesignSheetView);
local v33 = require(l_Parent_0.Src.Components.StyleRuleView);
local v34 = require(l_Parent_0.Src.Components.StyleSheetView);
local v35 = require(l_Parent_0.Src.Components.ThemesView);
local v36 = require(l_Parent_0.Src.Util.isEmptyTable);
local v37 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Util.StyleSchema);
local v41 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v41.copy;
local l_collectArray_0 = v41.collectArray;
local l_join_0 = v41.join;
local l_mapOne_0 = v41.mapOne;
local l_shallowEqual_0 = v41.shallowEqual;
local v47 = require(l_Parent_0.Src.Resources.PluginStyles);
local l_v47_Attribute_0 = v47:GetAttribute("BorderSize");
local l_v47_Attribute_1 = v47:GetAttribute("PaddingSm");
local l_v47_Attribute_2 = v47:GetAttribute("SearchBarHeight");
local v51 = require(script.buildTree);
local v52 = {
    {
        Name = "Name", 
        Key = "Name", 
        Width = UDim.new(1, 0)
    }
};
local v55 = l_TreeTable_0.EditTree.new({
    getChildren = function(v53)
        return v53.Children or {};
    end, 
    getId = function(v54)
        return v54.Id;
    end
});
local v56 = v3.PureComponent:extend("MainPage");
v56.init = function(v57)
    v57.state = {
        DesignSheet = nil, 
        PaneSizes = {
            UDim.new(0, 200), 
            UDim.new(1, -200)
        }, 
        SearchTerm = "", 
        table = {
            Columns = l_copy_0(v52), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    v57.onAction = function(v58, v59)
        local l_props_0 = v57.props;
        if v58 == "Menu" then
            local v61 = v55:getChild(v57.state.table.Items, v59);
            local l_Value_0 = v61.Name.Value;
            local function v63()
                v57.onDoubleClick(v59);
            end;
            if not v61.Instance then
                local v64 = v55:getParent(v57.state.table.Items, v61);
                if l_Value_0 == "UI Elements" then
                    l_props_0.dispatch(v23(v64.Instance));
                    return ;
                elseif l_Value_0 == "Design" then
                    l_props_0.dispatch(v15());
                    return ;
                elseif l_Value_0 == "Themes" then
                    l_props_0.dispatch(v19());
                    return ;
                elseif l_Value_0 == "Tokens" then
                    l_props_0.dispatch(v22());
                    return ;
                elseif not v64.Instance or not v64.Instance:IsA("StyleSheet") then
                    l_props_0.dispatch(v21());
                elseif v61.Name.Value == "Tags" then
                    l_props_0.dispatch(v16(v64.Instance, ".Tag"));
                    return ;
                else
                    l_props_0.dispatch(v16(v64.Instance, "#Name"));
                    return ;
                end;
            elseif not v61.Instance:IsA("StyleRule") then
                if v61.Instance == v57.props.DesignSheet then
                    l_props_0.dispatch(v14(v57.props.DesignSheet, v63));
                    return ;
                elseif not v61.Instance:IsA("StyleSheet") then
                    if v61.Instance:IsA("Folder") then
                        l_props_0.dispatch(v20(v61.Instance, v63));
                        return ;
                    end;
                else
                    l_props_0.dispatch(v18(v61.Instance, v63));
                    return ;
                end;
            else
                l_props_0.dispatch(v17(v61.Instance, v63, true));
                return ;
            end;
        end;
    end;
    v57.onRightClick = function()
    end;
    v57.onSearch = function(v65)
        v57.props.dispatch(v12(v65));
    end;
    v57.onPaneSizesChanged = function(v66)
        v57:setState({
            PaneSizes = v66
        });
    end;
    v57.adaptor = v55:getStateAdaptor(v57, "table");
    v57.tableCallbacks = v55:getCallbacks(v57.adaptor);
    v57.selectItem = function(v67)
        v57.props.dispatch(v10(v67));
    end;
    v57.onCellPressed = function(v68)
        v57.selectItem(v55:getChild(v57.state.table.Items, v68).Id);
    end;
    v57.onDoubleClick = function(v69)
        v57.adaptor(function(v70)
            local v71 = v55:getChild(v70.Items, v69);
            if v71 and v71.Instance then
                return (v55:updateCell(v70, {
                    Schema = l_join_0(v71.Name.Schema, {
                        Editing = true
                    }), 
                    Value = if not v71.Instance:IsA("StyleRule") then v71.Instance.Name else v71.Instance.Selector
                }, v69, 1));
            else
                return nil;
            end;
        end);
    end;
    v57.onEdited = function(v72, v73)
        v57.adaptor(function(v74)
            local v75 = v55:getChild(v74.Items, v73);
            local v76 = {
                Schema = l_join_0(v75.Name.Schema, {
                    Editing = false
                }), 
                Value = v72
            };
            local l_Instance_0 = v75.Instance;
            if l_Instance_0 then
                if l_Instance_0 then
                    if l_Instance_0.Name ~= v72 then
                        v37({
                            Name = "StyleEditor.EditInstanceName", 
                            DisplayName = "Style Editor - Edit Instance Name", 
                            DoChange = function()
                                l_Instance_0.Name = v72;
                                if l_Instance_0:IsA("StyleRule") then
                                    l_Instance_0.Selector = v72;
                                    v76.ErrorMessage = l_Instance_0.SelectorError;
                                end;
                                return Enum.FinishRecordingOperation.Commit;
                            end
                        });
                    elseif not (not (l_Instance_0:IsA("StyleSheet") and l_Instance_0:GetAttribute("StyleCategory") == "Designs") or l_Instance_0.Name:match("StyleSheet")) then
                        v76.Value = v72 .. " StyleSheet";
                    end;
                end;
            else
                warn("Edited row does not have a valid Instance associated");
            end;
            return v55:updateCell(v74, v76, v73, 1);
        end);
    end;
    v57.tableCallbacks.OnExpansionChange = function(v78)
        v57.props.dispatch(v11(v78));
    end;
    v57.tableCallbacks.OnSelectionChange = function(v79)
        local v82 = l_mapOne_0(v79, function(_, v81)
            return v81;
        end);
        if v82 then
            v57.selectItem(v82);
        end;
    end;
end;
v56.applySearch = function(v83, v84)
    return v55:updatePaths((l_collectArray_0(v83, function(_, v86)
        local v87 = l_copy_0(v86);
        v87.Children = v56.applySearch(v87.Children, v84);
        local l_status_0, l_result_0 = pcall(function()
            local v88 = true;
            if #v87.Children <= 0 then
                v88 = v87.Name.Value:lower():match(v84:lower());
            end;
            return v88;
        end);
        if not l_status_0 or not l_result_0 then
            return nil;
        else
            return v87;
        end;
    end)));
end;
v56.getDerivedStateFromProps = function(v91, v92)
    local l_Expansion_0 = v92.table.Expansion;
    local l_Items_0 = v92.table.Items;
    local l_Selection_0 = v92.table.Selection;
    local v96 = false;
    if v91.SearchTerm ~= v92.SearchTerm then
        v96 = v91.SearchTerm == "";
    end;
    if not ((not (v91.IsDirty or v96) and v91.DesignSheet == v92.DesignSheet) and not v36(v92.table.Items)) then
        l_Items_0 = v55:updatePaths((v51({
            l_ReplicatedStorage_0
        }, v91.DesignSheet)));
    end;
    return l_join_0(v92, {
        DesignSheet = v91.DesignSheet, 
        SearchTerm = v91.SearchTerm, 
        table = l_join_0(v92.table, {
            Items = l_Items_0, 
            Expansion = l_Expansion_0, 
            Selection = l_Selection_0
        })
    });
end;
v56.render = function(v97)
    local l_props_1 = v97.props;
    local l_state_0 = v97.state;
    local l_Items_1 = l_state_0.table.Items;
    local v101 = if not l_props_1.SelectedItemId then nil else v55:findItemById(l_Items_1, l_props_1.SelectedItemId);
    local l_ExpandedItems_0 = l_props_1.ExpandedItems;
    if v101 then
        l_ExpandedItems_0 = l_join_0(l_ExpandedItems_0, (v55:expandAncestors(l_Items_1, v101.Path)));
    end;
    if l_props_1.SearchTerm and #l_props_1.SearchTerm > 0 then
        l_Items_1 = v56.applySearch(l_Items_1, l_props_1.SearchTerm);
        v55:expandAll(l_Items_1, l_ExpandedItems_0);
    end;
    local v103 = v3.createElement(l_Pane_0, {
        [v3.Tag] = "X-ColumnS"
    }, {
        SearchInput = v3.createElement(v26, {
            LayoutOrder = 1, 
            OnTextChanged = v97.onSearch, 
            PlaceholderText = l_props_1.Localization:getText("Control", "SearchPlaceholder"), 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            Width = l_state_0.PaneSizes[1], 
            [v3.Tag] = "SearchInput"
        }), 
        LeftItems = v3.createElement(l_TreeTable_0, l_join_0({
            Columns = l_state_0.table.Columns, 
            ClampSize = true, 
            Expansion = l_ExpandedItems_0, 
            FullSpanEmphasis = true, 
            GetItemId = v30.getTableRowId, 
            GetChildren = v30.getRowChildren, 
            OnCellAction = v97.onAction, 
            OnCellEdited = v97.onEdited, 
            OnCellDoubleClick = v97.onDoubleClick, 
            OnCellPressed = v97.onCellPressed, 
            LayoutOrder = 2, 
            RightClick = v97.onRightClick, 
            RootItems = l_Items_1, 
            RowHeight = 32, 
            Scroll = true, 
            ScrollProps = {
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            }, 
            Selection = if not l_props_1.SelectedItemId then {} else {
                [l_props_1.SelectedItemId] = true
            }, 
            ShowHeader = false, 
            Size = UDim2.new(1, 0, 1, -((l_v47_Attribute_2 + l_v47_Attribute_1) + 2 * l_v47_Attribute_0)), 
            UseScale = true, 
            [v3.Tag] = "LeftItems"
        }, v97.tableCallbacks))
    });
    local v104 = nil;
    if v101 then
        local l_Instance_1 = v101.Instance;
        if not l_shallowEqual_0(v101.Path, v29.PATHS.DESIGN) then
            if not l_Instance_1 or not l_Instance_1:IsA("StyleRule") then
                if not l_Instance_1 or not l_Instance_1:IsA("StyleSheet") then
                    if not (not (v101.Name.Value ~= "Themes") or not v29.isUnderPath(v101.Path, v29.PATHS.THEMES)) then
                        v104 = v3.createElement(v35, {
                            RootItem = v101
                        });
                    end;
                else
                    v104 = v3.createElement(v34, {
                        StyleSheet = v101.Instance
                    });
                end;
            else
                v104 = v3.createElement(v33, {
                    StyleRule = v101.Instance
                });
            end;
        else
            v104 = v3.createElement(v32);
        end;
    end;
    return v3.createElement(l_Pane_0, {}, {
        Divider = v3.createElement(l_SplitPane_0, {
            ClampSize = true, 
            UseDeficit = true, 
            MinSizes = {
                UDim.new(0, 100), 
                UDim.new(0, 100)
            }, 
            OnSizesChange = v97.onPaneSizesChanged, 
            Sizes = l_state_0.PaneSizes
        }, {
            v103, 
            v104
        })
    });
end;
v56 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v56);
return v4.connect(function(v106)
    return {
        DesignSheet = v106.Window.DesignSheet, 
        IsDirty = v106.Window.IsDirty, 
        SearchTerm = v106.Window.SearchTerm, 
        SelectedItemId = v106.Window.SelectedItemId, 
        ExpandedItems = v106.Window.ExpandedItems
    };
end, v31)(v56);
