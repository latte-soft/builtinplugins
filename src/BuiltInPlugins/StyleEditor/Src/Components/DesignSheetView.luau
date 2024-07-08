local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.Window.SetDesignSheet);
local v12 = require(l_Actions_0.SessionStats.TrackButtonPress);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v15 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v15.copy;
local l_forEach_0 = v15.forEach;
local l_join_0 = v15.join;
local l_mapOne_0 = v15.mapOne;
local l_UI_0 = v6.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v25 = require(l_Parent_0.Src.Renderers.BreadcrumbRadioRenderer);
local v26 = require(l_Parent_0.Src.Components.DerivesTable);
local v27 = require(l_Parent_0.Src.Util.DesignHelpers);
local v28 = require(l_Parent_0.Src.Util.MenuHelpers);
local v29 = require(l_Parent_0.Src.Resources.ModernIcons);
local v30 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v31 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v32 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local l_joinTags_0 = v6.Styling.joinTags;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local v36 = v4.PureComponent:extend("DesignSheetView");
v36.init = function(v37)
    v37.state = {
        Designs = {}, 
        Disabled = false
    };
    local l_Localization_1 = v37.props.Localization;
    v37.updateStyleSheets = function()
        local l_l_ReplicatedStorage_0_0 = l_ReplicatedStorage_0;
        local v40 = {};
        l_forEach_0(l_l_ReplicatedStorage_0_0:GetDescendants(), function(v41)
            if v41:IsA("StyleSheet") then
                local l_v41_Attribute_0 = v41:GetAttribute("StyleCategory");
                if not l_v41_Attribute_0 or l_v41_Attribute_0 == "Designs" then
                    l_insert_0(v40, {
                        StyleSheet = v41
                    });
                end;
            end;
        end);
        l_sort_0(v40, function(v43, v44)
            return v43.StyleSheet.Name < v44.StyleSheet.Name;
        end);
        v37:setState({
            Designs = v40
        });
    end;
    v37.onCreateStyleLink = function()
        local l_props_0 = v37.props;
        local l_DesignSheet_0 = l_props_0.DesignSheet;
        local v47 = l_Selection_0:Get();
        l_props_0.dispatch(v12("StyleSheetView/AddStyleLink"));
        v32({
            Name = "StyleEditor.AddStyleLink", 
            DisplayName = "Style Editor - Add StyleLink(s)", 
            DoChange = function()
                for _, v49 in ipairs(v47) do
                    if v49 then
                        if not v49:FindFirstChildWhichIsA("StyleLink") then
                            local v50 = v30.addStyleLinkToRoot(v49, l_DesignSheet_0);
                            if #v47 == 1 then
                                l_Selection_0:Set({
                                    v50
                                });
                            end;
                        else
                            print("Error: There is already a StyleLink for this root");
                            return ;
                        end;
                    else
                        print("Error: No instance selected in Explorer--unable to create StyleLink");
                        return ;
                    end;
                end;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
    v37.AddActionHeader = function(v51)
        return v4.createElement(l_Pane_0, l_join_0({
            [v4.Tag] = l_joinTags_0("X-Right X-RowS", v51[v4.Tag])
        }, v51), {
            Button = v4.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                LeftIcon = v29.new(), 
                OnClick = v37.addDesign, 
                TooltipText = l_Localization_1:getText("Label", "AddDesignStyleSheet"), 
                [v4.Tag] = "IconOnly Icon16"
            })
        });
    end;
    v37.addDesign = function()
        local v52 = v27.createDesign(v37.props.DesignSheet);
        local l_props_1 = v37.props;
        l_props_1.dispatch(v12("StyleSheetView/AddDesignSheet"));
        if v52:GetAttribute("StyleCategory") == "Designs" then
            l_props_1.dispatch(v11(v52));
        end;
    end;
    v37.toggleDesign = function(v54)
        local l_props_2 = v37.props;
        local l_state_0 = v37.state;
        local l_DesignSheet_1 = l_props_2.DesignSheet;
        local v59 = l_mapOne_0(l_state_0.Designs, function(v58)
            if v54 == v58.StyleSheet then
                return v58.StyleSheet;
            else
                return nil;
            end;
        end);
        v32({
            Name = "StyleEditor.SetDesignSheet", 
            DisplayName = "Style Editor - Set Current Design", 
            DoChange = function()
                l_DesignSheet_1:SetAttribute("StyleCategory", nil);
                v59:SetAttribute("StyleCategory", "Designs");
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        l_props_2.dispatch(v11(v59));
    end;
    v37.onSelectionChanged = function()
        local v60 = l_Selection_0:Get();
        local v61 = false;
        for _, v63 in v60, nil, nil do
            if v30.getStyleLinkRoot(v63) then
                v61 = true;
                break;
            end;
        end;
        v37:setState({
            Disabled = not v61 or not v37.props.DesignSheet
        });
    end;
    v37.updateStyleSheets();
end;
v36.didMount = function(v64)
    v64.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v64.onSelectionChanged);
    v64.onSelectionChanged();
end;
v36.willUnmount = function(v65)
    if v65.selectionChangedConnection then
        v65.selectionChangedConnection:Disconnect();
        v65.selectionChangedConnection = nil;
    end;
end;
v36.didUpdate = function(v66, v67, _)
    local l_props_3 = v66.props;
    if v67.IsDirty and not l_props_3.IsDirty or v67.DesignSheet ~= l_props_3.DesignSheet then
        v66.updateStyleSheets();
    end;
end;
v36.render = function(v70)
    local l_props_4 = v70.props;
    local l_state_1 = v70.state;
    local l_Localization_2 = l_props_4.Localization;
    local v74 = {};
    for v75, v76 in ipairs(l_state_1.Designs) do
        v74["Design " .. v75] = v4.createElement(v25, {
            Value = v76.StyleSheet, 
            OnClick = v70.toggleDesign, 
            Selected = v76.StyleSheet == l_props_4.DesignSheet, 
            Editing = v76.Editing, 
            OnDoubleClick = function()
                v70:setState(function(v77)
                    local v78 = l_copy_0(v77.Designs);
                    v78[v75].Editing = true;
                    return {
                        Designs = v78
                    };
                end);
            end, 
            OnChanged = function(v79)
                v70:setState(function(v80)
                    local v81 = l_copy_0(v80.Designs);
                    v81[v75].Editing = false;
                    return {
                        Designs = v81
                    };
                end);
                v32({
                    Name = "StyleEditor.RenameStyleSheet", 
                    DisplayName = "Style Editor - Rename StyleSheet", 
                    DoChange = function()
                        v76.StyleSheet.Name = v79;
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
            end, 
            [v4.Tag] = "PropertyCellSize"
        });
    end;
    return v4.createElement(l_ScrollingFrame_0, {
        [v4.Tag] = "ScrollingAutomaticSize X-ColumnS"
    }, {
        Content = v4.createElement(l_Pane_0, {
            [v4.Tag] = "X-ColumnM X-FitY X-PadS X-Right"
        }, {
            StyleLinkButton = v4.createElement(l_IconButton_0, {
                LayoutOrder = 1, 
                LeftIcon = v28.getClassIcon("StyleLink"), 
                OnClick = v70.onCreateStyleLink, 
                Text = l_Localization_2:getText("Control", "InsertStyleLinkButton"), 
                TooltipText = l_Localization_2:getText("Control", "InsertStyleLinkButtonTooltip"), 
                [v4.Tag] = if not l_state_1.Disabled then nil else "Disabled"
            }), 
            Designs = v4.createElement(l_SimpleExpandablePane_0, {
                Expanded = true, 
                HeaderComponent = v70.AddActionHeader, 
                LayoutOrder = 2, 
                Text = l_Localization_2:getText("Label", "DesignStyleSheets"), 
                [v4.Tag] = "X-ColumnM X-FitY X-PadS"
            }, {
                Container = v4.createElement(l_Pane_0, {
                    [v4.Tag] = "X-ColumnM X-FitY X-PadM"
                }, v74)
            }), 
            Derives = v4.createElement(v26, {
                LayoutOrder = 3, 
                StyleSheet = l_props_4.DesignSheet
            })
        })
    });
end;
return v5.connect(function(v82)
    return {
        DesignSheet = v82.Window.DesignSheet, 
        IsDirty = v82.Window.IsDirty
    };
end, v31)((l_withContext_0({
    Localization = l_Localization_0
})(v36)));
