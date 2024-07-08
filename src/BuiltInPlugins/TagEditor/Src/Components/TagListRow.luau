local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local v10 = require(l_Parent_0.Src.Actions);
local v11 = require(l_Parent_0.Src.TagManager);
local l_UI_0 = v4.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v20 = require(script.Parent.Icon);
local v21 = require(script.Parent.TagRenameTextInput);
local v22 = v2.PureComponent:extend("TagListRow");
v22.init = function(v23)
    v23.onPress = function()
        local l_props_0 = v23.props;
        local v25 = l_props_0.GroupName and l_props_0.GroupName ~= "";
        local v26 = not l_props_0.Disabled;
        if not v25 then
            if l_props_0.tagMenu ~= nil and l_props_0.tagMenu == l_props_0.TagName then
                l_props_0.setRenaming(l_props_0.TagName, l_props_0.renamingTag ~= l_props_0.TagName);
            end;
        elseif (v26 and l_props_0.groupMenu ~= nil) and l_props_0.groupMenu == l_props_0.GroupName then
            l_props_0.setRenamingGroup(l_props_0.GroupName, l_props_0.renamingGroup ~= l_props_0.GroupName);
            return ;
        end;
    end;
    v23.onClick = function()
        local l_props_1 = v23.props;
        local v28 = l_props_1.GroupName and l_props_1.GroupName ~= "";
        local v29 = not l_props_1.Disabled;
        if not v28 then
            if not (l_props_1.tagMenu ~= nil) or l_props_1.tagMenu ~= l_props_1.TagName then
                l_props_1.openTagMenu(l_props_1.TagName);
            end;
        elseif v29 and (not (l_props_1.groupMenu ~= nil) or l_props_1.groupMenu ~= l_props_1.GroupName) then
            l_props_1.openGroupMenu(l_props_1.GroupName);
            return ;
        end;
    end;
    v23.toggleGroupMembership = function()
        local l_props_2 = v23.props;
        v11.Get():SetGroup(l_props_2.TagName, if not (l_props_2.TagGroup == l_props_2.assigningGroup) then l_props_2.assigningGroup else "");
    end;
    v23.toggleAssignment = function()
        local l_props_3 = v23.props;
        v11.Get():SetTag(l_props_3.TagName, not l_props_3.IsTagAssignedToAll);
    end;
    v23.toggleVisible = function()
        local l_props_4 = v23.props;
        if l_props_4.GroupName and l_props_4.GroupName ~= "" then
            v11.Get():ToggleGroupVisibility(v23.props.GroupName);
            return ;
        else
            v11.Get():SetVisible(l_props_4.TagName, not l_props_4.IsVisibleToggled);
            return ;
        end;
    end;
    v23.toggleGroup = function()
        local l_props_5 = v23.props;
        l_props_5.ToggleGroup(l_props_5.GroupName);
    end;
    v23.editGroupMembership = function()
        local l_props_6 = v23.props;
        local v35 = l_props_6.GroupName == l_props_6.assigningGroup;
        if not v35 then
            l_props_6.openGroupMenu(l_props_6.GroupName);
        end;
        l_props_6.setAssigningGroup(if not v35 then l_props_6.GroupName else "");
    end;
end;
v22.render = function(v36)
    local l_props_7 = v36.props;
    local l_Localization_1 = l_props_7.Localization;
    local l_TagListRow_0 = l_props_7.Stylizer.TagListRow;
    local v40 = l_LayoutOrderIterator_0.new();
    local l_VisibleIcon_0 = l_props_7.Stylizer.VisibleIcon;
    local l_VisibleOffIcon_0 = l_props_7.Stylizer.VisibleOffIcon;
    local v43 = l_props_7.GroupName and l_props_7.GroupName ~= "";
    local v44 = not l_props_7.Disabled;
    local v45 = false;
    if l_props_7.assigningGroup ~= nil then
        v45 = l_props_7.assigningGroup ~= "";
    end;
    local v46 = l_props_7.TagGroup == l_props_7.assigningGroup;
    local v47 = l_props_7.GroupName == l_props_7.assigningGroup;
    local v48 = v45 and not v47;
    local v49 = not v43;
    local v50 = not v43;
    local v51 = v43 and not v48;
    local v52 = not v45;
    local v53 = false;
    if l_props_7.renamingGroup ~= nil and l_props_7.renamingGroup == l_props_7.GroupName then
        v53 = true;
    elseif l_props_7.renamingTag ~= nil and l_props_7.renamingTag == l_props_7.TagName then
        v53 = true;
    end;
    local v54 = if not v46 then l_Localization_1:getText("Tooltip", "AssignToGroup") else l_Localization_1:getText("Tooltip", "UnassignFromGroup");
    local v55 = if not l_props_7.IsTagAssignedToAll then l_Localization_1:getText("Tooltip", "ApplyTag") else l_Localization_1:getText("Tooltip", "RemoveTag");
    local v56 = nil;
    local _ = false;
    if not if not v43 then l_props_7.tagMenu == l_props_7.TagName else l_props_7.groupMenu == l_props_7.GroupName then
        if v36.state.hovered then
            v56 = "PaneHover";
        end;
    else
        v56 = "SelectedTag";
    end;
    local v58 = v56 or "None";
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_7.LayoutOrder, 
        Size = l_TagListRow_0.Size
    }, {
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            MouseEnter = function()
                v36:setState({
                    hovered = true
                });
            end, 
            MouseLeave = function()
                v36:setState({
                    hovered = false
                });
            end
        }), 
        RootPane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_TagListRow_0.Spacing, 
            Padding = if v43 or l_props_7.TagGroup == "" then l_TagListRow_0.PaddingUnindented else l_TagListRow_0.PaddingIndented, 
            Style = v56, 
            OnPress = v36.onPress, 
            OnClick = v36.onClick
        }, {
            ArrowImage = v43 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v58, 
                LeftIcon = if not l_props_7.IsGroupCollapsed then l_TagListRow_0.OpenArrowImage else l_TagListRow_0.ClosedArrowImage, 
                OnClick = v36.toggleGroup, 
                LayoutOrder = v40:getNextOrder()
            }), 
            CheckboxPane = v49 and v2.createElement(l_Pane_0, {
                LayoutOrder = v40:getNextOrder(), 
                Size = l_TagListRow_0.CheckboxSize, 
                Layout = Enum.FillDirection.Horizontal
            }, {
                ToggleGroupMembershipButton = v45 and v2.createElement(l_IconButton_0, {
                    BackgroundStyle = v58, 
                    LeftIcon = if not v46 then l_TagListRow_0.AssignIcon else l_TagListRow_0.UnassignIcon, 
                    OnClick = v36.toggleGroupMembership, 
                    IconColor = if not v46 then l_TagListRow_0.AssignIconColor else l_TagListRow_0.UnassignIconColor, 
                    TooltipText = v54
                }), 
                Checkbox = not v45 and v2.createElement(l_Checkbox_0, {
                    Checked = if not l_props_7.IsTagAssignedToSome then l_props_7.IsTagAssignedToAll else l_Checkbox_0.Indeterminate, 
                    OnClick = v36.toggleAssignment
                }, {
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = v55
                    })
                })
            }), 
            TagImage = v50 and v2.createElement(v20, {
                Name = l_props_7.TagIcon, 
                OnClick = v36.OnButtonClicked, 
                LayoutOrder = v40:getNextOrder()
            }), 
            NameText = not v53 and v2.createElement(l_TextLabel_0, {
                LayoutOrder = v40:getNextOrder(), 
                Text = if not v43 then l_props_7.TagName else l_props_7.GroupName, 
                Size = if not v43 then l_TagListRow_0.TextSize else l_TagListRow_0.GroupTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            RenameTextInput = v53 and v2.createElement(v21, {
                LayoutOrder = v40:getNextOrder(), 
                Size = if not v43 then l_TagListRow_0.TextSize else l_TagListRow_0.GroupTextSize
            }), 
            EditGroupMembership = v51 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v58, 
                LeftIcon = if not v44 or v48 then nil else if v47 then l_TagListRow_0.StopAssigningIcon else l_TagListRow_0.EditAssignmentsIcon, 
                OnClick = v36.editGroupMembership, 
                LayoutOrder = v40:getNextOrder(), 
                TooltipText = if not v47 then l_Localization_1:getText("Tooltip", "StartGroupAssignment") else l_Localization_1:getText("Tooltip", "EndGroupAssignment")
            }), 
            VisibleToggleButton = v52 and v2.createElement(l_IconButton_0, {
                BackgroundStyle = v58, 
                LeftIcon = if not l_props_7.IsVisibleToggled then l_VisibleOffIcon_0 else l_VisibleIcon_0, 
                OnClick = v36.toggleVisible, 
                LayoutOrder = v40:getNextOrder(), 
                TooltipText = l_Localization_1:getText("Tooltip", "ToggleVisibility")
            })
        })
    });
end;
return v3.connect(function(v59, _)
    return {
        assigningGroup = v59.AssigningGroup, 
        groupMenu = v59.GroupMenu, 
        renamingGroup = v59.RenamingGroup, 
        tagMenu = v59.TagMenu, 
        renamingTag = v59.RenamingTag
    };
end, function(v61)
    return {
        openTagMenu = function(v62)
            v61(v10.OpenTagMenu(v62));
        end, 
        setRenaming = function(v63, v64)
            v61(v10.SetRenaming(v63, v64));
        end, 
        setAssigningGroup = function(v65)
            v61(v10.SetAssigningGroup(v65));
        end, 
        setRenamingGroup = function(v66, v67)
            v61(v10.SetRenamingGroup(v66, v67));
        end, 
        openGroupMenu = function(v68)
            v61(v10.OpenGroupMenu(v68));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v22)));
