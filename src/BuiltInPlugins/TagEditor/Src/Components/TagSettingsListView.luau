local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.Dash);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v18 = require(l_Parent_0.Src.Actions);
local v19 = require(l_Parent_0.Src.Util.GetUniqueGroupName);
local v20 = require(script.Parent.Icon);
local v21 = require(l_Parent_0.Src.TagManager);
local v22 = require(script.Parent.TagSettingRow);
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local v24 = v2.PureComponent:extend("TagSettingsListView");
v24.init = function(v25)
    if l_TagEditorShowTextSeparately_0 then
        v25.onShowTextRowClicked = function()
            local l_tag_0 = v25.props.tag;
            v21.Get():SetShowText(l_tag_0.Name, not l_tag_0.ShowText);
        end;
    end;
    v25.onAlwaysOntopRowClicked = function()
        local l_tag_1 = v25.props.tag;
        v21.Get():SetAlwaysOnTop(l_tag_1.Name, not l_tag_1.AlwaysOnTop);
    end;
    v25.onColorRowClicked = function()
        local l_props_0 = v25.props;
        l_props_0.openColorPicker(l_props_0.tag.Name);
    end;
    v25.onIconRowClicked = function()
        local l_props_1 = v25.props;
        l_props_1.openIconPicker(l_props_1.tag.Name);
    end;
    v25.onTaggedInstancesRowClicked = function()
        v21.Get():SelectAll(v25.props.tag.Name);
    end;
    v25.onVisualizeRowClicked = function()
        v25:setState({
            VisualizeAsDropdownHidden = false
        });
    end;
    v25.onGroupRowClicked = function()
        v25:setState({
            GroupDropdownHidden = false
        });
    end;
    v25.onVisualizeDropdownItemCloseMenu = function()
        v25:setState(function(_)
            return {
                VisualizeAsDropdownHidden = true
            };
        end);
    end;
    v25.onGroupDropdownItemCloseMenu = function()
        v25:setState(function(_)
            return {
                GroupDropdownHidden = true
            };
        end);
    end;
    v25:setState({
        VisualizeAsDropdownHidden = true, 
        GroupDropdownHidden = true
    });
end;
v24.render = function(v32)
    local l_props_2 = v32.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_TagSettingsListView_0 = l_props_2.Stylizer.TagSettingsListView;
    local v36 = l_LayoutOrderIterator_0.new();
    local l_tag_2 = l_props_2.tag;
    local v38 = l_tag_2 ~= nil;
    local v39 = l_Localization_1:getText("Groups", "None");
    local v40 = l_Localization_1:getText("Groups", "NewGroup");
    local function v41()
        return v2.createElement(l_IconButton_0, {
            RightIcon = l_TagSettingsListView_0.TaggedInstancesRow.Icon, 
            OnClick = v32.onTaggedInstancesRowClicked
        });
    end;
    local function v42()
        return v2.createElement(v20, {
            Name = l_tag_2.Icon, 
            OnClick = v32.onIconRowClicked
        });
    end;
    local function v45()
        return v2.createElement(l_Pane_0, {
            Size = l_TagSettingsListView_0.GroupRow.Size
        }, {
            Button = v2.createElement(l_IconButton_0, {
                RightIcon = l_TagSettingsListView_0.GroupRow.Icon, 
                OnClick = v32.onGroupRowClicked
            }), 
            DropdownMenu = v2.createElement(l_DropdownMenu_0, {
                Hide = v32.state.GroupDropdownHidden, 
                OnItemActivated = function(v43, v44)
                    if v44 == 1 then
                        if not l_tag_2.Group then
                            v21.Get():SetGroup(l_tag_2.Name, (v19(l_Localization_1:getText("Info", "NewGroup"))));
                        else
                            v21.Get():SetGroup(l_tag_2.Name, "");
                        end;
                    else
                        v21.Get():SetGroup(l_tag_2.Name, v43);
                    end;
                    v32.onGroupDropdownItemCloseMenu();
                end, 
                OnFocusLost = v32.onGroupDropdownItemCloseMenu, 
                PlaceholderText = l_tag_2.Group, 
                Width = l_TagSettingsListView_0.GroupRow.DropDownWidth, 
                ItemHeight = l_TagSettingsListView_0.GroupRow.ItemHeight, 
                MaxHeight = l_TagSettingsListView_0.GroupRow.MaxHeight, 
                Icons = {
                    if not l_tag_2.Group then l_TagSettingsListView_0.GroupRow.NewGroupIcon else l_TagSettingsListView_0.GroupRow.UnassignIcon
                }, 
                Items = v5.append({
                    if not l_tag_2.Group then v40 else v39
                }, l_props_2.groups), 
                Priority = 2
            })
        });
    end;
    local function v46()
        return v2.createElement(l_IconButton_0, {
            RightIcon = l_TagSettingsListView_0.ColorRow.Icon, 
            IconColor = l_tag_2.Color, 
            OnClick = v32.onColorRowClicked
        });
    end;
    local v47 = if not l_TagEditorShowTextSeparately_0 then nil else function()
        return v2.createElement(l_Checkbox_0, {
            Checked = l_tag_2.ShowText, 
            OnClick = v32.onShowTextRowClicked
        });
    end;
    local function v48()
        return v2.createElement(l_Checkbox_0, {
            Checked = l_tag_2.AlwaysOnTop, 
            OnClick = v32.onAlwaysOntopRowClicked
        });
    end;
    local function v56()
        local v49 = nil;
        v49 = if not l_TagEditorShowTextSeparately_0 then {
            "Box", 
            "Sphere", 
            "Outline", 
            "Text", 
            "Icon"
        } else {
            "Box", 
            "Sphere", 
            "Outline", 
            "Icon", 
            "None"
        };
        local v50 = nil;
        v50 = if not l_TagEditorShowTextSeparately_0 then {
            l_Localization_1:getText("VisualizeOptions", "Box"), 
            l_Localization_1:getText("VisualizeOptions", "Sphere"), 
            l_Localization_1:getText("VisualizeOptions", "Outline"), 
            l_Localization_1:getText("VisualizeOptions", "Text"), 
            l_Localization_1:getText("VisualizeOptions", "Icon")
        } else {
            l_Localization_1:getText("VisualizeOptions", "Box"), 
            l_Localization_1:getText("VisualizeOptions", "Sphere"), 
            l_Localization_1:getText("VisualizeOptions", "Outline"), 
            l_Localization_1:getText("VisualizeOptions", "Icon"), 
            l_Localization_1:getText("VisualizeOptions", "None")
        };
        local v52 = v5.findIndex(v49, function(v51)
            return v51 == l_tag_2.DrawType;
        end);
        local v53 = not v52 and "" or v50[v52];
        return v2.createElement(l_Pane_0, {
            Size = l_TagSettingsListView_0.VisualizeAsRow.Size, 
            Style = "BorderBox"
        }, {
            Button = v2.createElement(l_IconButton_0, {
                Text = v53, 
                RightIcon = l_TagSettingsListView_0.VisualizeAsRow.Icon, 
                OnClick = v32.onVisualizeRowClicked, 
                Size = l_TagSettingsListView_0.VisualizeAsRow.Size
            }), 
            DropdownMenu = v2.createElement(l_DropdownMenu_0, {
                Hide = v32.state.VisualizeAsDropdownHidden, 
                OnItemActivated = function(_, v55)
                    v21.Get():SetDrawType(l_tag_2.Name, v49[v55]);
                    v32.onVisualizeDropdownItemCloseMenu();
                end, 
                OnFocusLost = v32.onVisualizeDropdownItemCloseMenu, 
                PlaceholderText = v53, 
                Width = l_TagSettingsListView_0.VisualizeAsRow.DropDownWidth, 
                ItemHeight = l_TagSettingsListView_0.VisualizeAsRow.ItemHeight, 
                MaxHeight = l_TagSettingsListView_0.VisualizeAsRow.MaxHeight, 
                Priority = 2, 
                Items = v50
            })
        });
    end;
    if not v38 then
        return nil;
    else
        return (v2.createElement(l_ScrollingFrame_0, {
            CanvasSize = l_TagSettingsListView_0.CanvasSize, 
            Size = l_TagSettingsListView_0.Size, 
            LayoutOrder = l_props_2.LayoutOrder, 
            Layout = Enum.FillDirection.Vertical, 
            AutomaticCanvasSize = Enum.AutomaticSize.None, 
            Padding = l_TagSettingsListView_0.Padding, 
            Spacing = l_TagSettingsListView_0.Spacing
        }, {
            TaggedInstancesRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.TaggedInstancesRow.Size, 
                Text = l_Localization_1:getText("Info", "SelectInExplorer"), 
                TooltipText = l_Localization_1:getText("Tooltip", "SelectInExplorer"), 
                OnClick = v32.onTaggedInstancesRowClicked, 
                Control = v41
            }), 
            IconRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.IconRow.Size, 
                Text = l_Localization_1:getText("Info", "Icon"), 
                TooltipText = l_Localization_1:getText("Tooltip", "IconPicker"), 
                OnClick = v32.onIconRowClicked, 
                Control = v42
            }), 
            GroupRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.GroupRow.Size, 
                Text = l_Localization_1:getText("Info", "Group") .. ": " .. if not l_tag_2.Group then v39 else l_tag_2.Group, 
                TooltipText = l_Localization_1:getText("Tooltip", "GroupPicker"), 
                OnClick = v32.onGroupRowClicked, 
                Control = v45
            }), 
            ColorRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.ColorRow.Size, 
                Text = l_Localization_1:getText("Info", "Color"), 
                TooltipText = l_Localization_1:getText("Tooltip", "ColorPicker"), 
                OnClick = v32.onColorRowClicked, 
                Control = v46
            }), 
            AlwaysOnTopRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.AlwaysOnTopRow.Size, 
                Text = l_Localization_1:getText("Info", "AlwaysOnTop"), 
                TooltipText = l_Localization_1:getText("Tooltip", "AlwaysOnTop"), 
                OnClick = v32.onAlwaysOntopRowClicked, 
                Control = v48
            }), 
            ShowTextRow = if not l_TagEditorShowTextSeparately_0 then nil else v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.ShowTextRow.Size, 
                Text = l_Localization_1:getText("Info", "ShowText"), 
                TooltipText = l_Localization_1:getText("Tooltip", "ShowText"), 
                OnClick = v32.onShowTextRowClicked, 
                Control = v47
            }), 
            VisualizeAsRow = v2.createElement(v22, {
                LayoutOrder = v36:getNextOrder(), 
                ControlSize = l_TagSettingsListView_0.VisualizeAsRow.Size, 
                Text = l_Localization_1:getText("Info", "VisualizeAs"), 
                TooltipText = l_Localization_1:getText("Tooltip", "VisualizeAs"), 
                OnClick = v32.onVisualizeRowClicked, 
                Control = v56
            })
        }));
    end;
end;
return v3.connect(function(v57, _)
    local v59 = nil;
    for _, v61 in pairs(v57.TagData) do
        if v61.Name == v57.TagMenu then
            v59 = v61;
            break;
        end;
    end;
    for _, v63 in pairs(v57.UnknownTags) do
        if v63.Name == v57.TagMenu then
            v59 = v63;
            break;
        end;
    end;
    return {
        groups = v57.GroupData, 
        tag = v59
    };
end, function(v64)
    return {
        openColorPicker = function(v65)
            v64(v18.ToggleColorPicker(v65));
        end, 
        openIconPicker = function(v66)
            v64(v18.ToggleIconPicker(v66));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v24)));
