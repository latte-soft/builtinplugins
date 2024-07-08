local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Util_0 = v4.Util;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LoadingIndicator_0 = v4.UI.LoadingIndicator;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v18 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v19 = v2.PureComponent:extend("DeleteButton");
v19.init = function(v20)
    v20.state = {
        isHovered = false
    };
end;
v19.render = function(v21)
    local l_props_0 = v21.props;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_OnClicked_0 = l_props_0.OnClicked;
    local l_Stylizer_1 = l_props_0.Stylizer;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(0, l_Stylizer_1.collaboratorItem.deleteButton.size, 0, l_Stylizer_1.collaboratorItem.deleteButton.size), 
        Position = UDim2.new(1, l_Stylizer_1.collaboratorItem.xOffset, 0.5, 0), 
        AnchorPoint = Vector2.new(1, 0.5), 
        Image = l_Stylizer_1.deleteIcon, 
        BackgroundTransparency = not v21.state.isHovered and 1 or 0, 
        BackgroundColor3 = l_Stylizer_1.collaboratorItem.deleteButton.hovered, 
        [v2.Event.Activated] = function()
            if not (not l_Enabled_0 or not l_OnClicked_0) then
                l_OnClicked_0();
            end;
        end, 
        [v2.Event.MouseEnter] = function()
            v21:setState({
                isHovered = true
            });
        end, 
        [v2.Event.MouseLeave] = function()
            v21:setState({
                isHovered = false
            });
        end
    });
end;
v19 = l_withContext_0({
    Stylizer = l_Stylizer_0
})(v19);
local v26 = v2.PureComponent:extend("CollaboratorItem");
v26.defaultProps = {
    Writable = true, 
    Loading = false
};
v26.getCurrentPermissionLabel = function(v27)
    local l_props_1 = v27.props;
    local l_CurrentPermission_0 = l_props_1.CurrentPermission;
    local l_AvailablePermissions_0 = l_props_1.AvailablePermissions;
    local l_Localization_1 = l_props_1.Localization;
    if l_CurrentPermission_0 == v18.MultipleKey then
        return l_Localization_1:getText("PermissionLabels", "Multiple");
    else
        for _, v33 in ipairs(l_AvailablePermissions_0) do
            if v33.Key == l_CurrentPermission_0 then
                return v33.Display;
            end;
        end;
        assert(false);
        return ;
    end;
end;
createTextLabel = function(v34, v35, v36, v37, v38)
    return v2.createElement(l_TextLabel_0, {
        LayoutOrder = v38, 
        Size = UDim2.new(1, 0, 0, v36), 
        Style = v35, 
        Text = v34, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v37), 
            PaddingLeft = UDim.new(0, v37)
        })
    });
end;
v26.init = function(v39)
    v39.onItemActivated = function(v40)
        if v39.props.Writable and v40.Key ~= v39.props.CurrentPermission then
            v39.props.OnPermissionChanged(v40.Key);
        end;
    end;
    v39.onRenderItem = function(v41, v42, v43)
        local l_Stylizer_2 = v39.props.Stylizer;
        return v2.createElement(l_Button_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_2.selectInput.button.height), 
            LayoutOrder = v42, 
            OnClick = v43
        }, {
            UILayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 0), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            MainTextLabel = createTextLabel(v41.Display, "Normal", l_Stylizer_2.fontStyle.Normal.TextSize, l_Stylizer_2.selectInput.padding, 0), 
            DescriptionTextLabel = createTextLabel(v41.Description, "SubText", l_Stylizer_2.fontStyle.Subtext.TextSize, l_Stylizer_2.selectInput.padding, 1)
        });
    end;
end;
v26.render = function(v45)
    local l_props_2 = v45.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Name_0 = l_props_2.Name;
    local l_Icon_0 = l_props_2.Icon;
    local l_Writable_0 = l_props_2.Writable;
    local l_Loading_0 = l_props_2.Loading;
    local l_Removable_0 = l_props_2.Removable;
    local l_OnRemoved_0 = l_props_2.OnRemoved;
    local l_AvailablePermissions_1 = l_props_2.AvailablePermissions;
    local l_IsRolesetCollaborator_0 = l_props_2.IsRolesetCollaborator;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local v57 = if l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.hidePermissionsForNonGroupOwner;
    local v58 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.TooltipText;
    local v59 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.IsOwner;
    local l_Localization_2 = l_props_2.Localization;
    local l_Stylizer_3 = l_props_2.Stylizer;
    local v62 = if not l_COLLAB2850_FixMcTooltips_0 then l_Writable_0 and #l_AvailablePermissions_1 > 1 else l_Writable_0;
    local v63 = if not l_COLLAB2850_FixMcTooltips_0 then l_Writable_0 and l_Removable_0 else l_Removable_0;
    local v64 = if not l_IsRolesetCollaborator_0 then l_Stylizer_3.collaboratorItem.nonRolesetFrame else l_Stylizer_3.collaboratorItem.rolesetFrame;
    local v65 = (not l_IsRolesetCollaborator_0 and v63) and -40 or 0;
    local v66 = if not l_Icon_0 then l_Stylizer_3.collaboratorItem.collaboratorName.withoutIcon.xOffset else l_Stylizer_3.collaboratorItem.collaboratorName.withIcon.xOffset;
    local v67 = l_LayoutOrderIterator_0.new();
    local v68 = nil;
    local v69 = nil;
    if not l_COLLAB2850_FixMcTooltips_0 then
        v68 = v57 or not v62;
        v69 = if not v57 then l_Localization_2:getText("PermissionDescriptions", "FriendToEdit") else l_Localization_2:getText("PermissionDescriptions", "CannotViewGroupRoles");
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v64.width, 0, v64.height), 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Position = v64.position, 
        AnchorPoint = v64.anchorPoint, 
        BorderSizePixel = 0
    }, {
        IconContainer = l_Icon_0 and v2.createElement("Frame", {
            LayoutOrder = v67:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_3.collaboratorItem.iconContainerSize, 0, l_Stylizer_3.collaboratorItem.iconContainerSize), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1
        }, {
            Icon = l_Icon_0
        }), 
        CollaboratorName = v2.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_3.fontStyle.Normal, {
            LayoutOrder = v67:getNextOrder(), 
            Size = if not l_Icon_0 then l_Stylizer_3.collaboratorItem.collaboratorName.withoutIcon.size else l_Stylizer_3.collaboratorItem.collaboratorName.withIcon.size, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v66, 0.5, 0), 
            BackgroundTransparency = 1, 
            Text = l_Name_0, 
            TextXAlignment = Enum.TextXAlignment.Left
        })), 
        OwnerLabel = if not if not l_COLLAB2850_FixMcTooltips_0 then not l_Removable_0 and not l_IsRolesetCollaborator_0 else v59 then nil else v2.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_3.fontStyle.Normal, {
            LayoutOrder = v67:getNextOrder(), 
            Size = if not l_Icon_0 then l_Stylizer_3.collaboratorItem.ownerLabel.withoutIconSize else l_Stylizer_3.collaboratorItem.ownerLabel.withIconSize, 
            Position = l_Stylizer_3.collaboratorItem.ownerLabel.position, 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Text = l_Localization_2:getText("CollaboratorTypes", "Owner"), 
            TextXAlignment = Enum.TextXAlignment.Right
        })), 
        PermissionEditor = if not if not l_COLLAB2850_FixMcTooltips_0 then l_Removable_0 or l_IsRolesetCollaborator_0 else not v59 then nil else v2.createElement("Frame", {
            LayoutOrder = v67:getNextOrder(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_Stylizer_3.selectInput.width, 0, l_Stylizer_3.collaboratorItem.permissionEditor.heightOffset), 
            Position = UDim2.new(1, v65, 0.5, l_Stylizer_3.collaboratorItem.permissionEditor.yOffset), 
            AnchorPoint = Vector2.new(1, 0.5)
        }, {
            LoadingIndicator = l_Loading_0 and v2.createElement(l_LoadingIndicator_0, {
                Size = UDim2.fromScale(1, 1)
            }), 
            PermissionsDropdown = not l_Loading_0 and v2.createElement(l_SelectInput_0, {
                Enabled = if not l_COLLAB2850_FixMcTooltips_0 then not v57 and v62 else v62, 
                Items = l_AvailablePermissions_1, 
                OnItemActivated = v45.onItemActivated, 
                OnRenderItem = v45.onRenderItem, 
                PlaceholderText = if not l_COLLAB2850_FixMcTooltips_0 then v57 and "" or v45:getCurrentPermissionLabel() else v45:getCurrentPermissionLabel(), 
                Width = l_Stylizer_3.selectInput.width, 
                Style = not v62 and "NonEditable" or "Editable"
            }) or nil, 
            Tooltip = if not if not l_COLLAB2850_FixMcTooltips_0 then v68 else v58 then nil else v2.createElement(l_Tooltip_0, {
                Text = if not l_COLLAB2850_FixMcTooltips_0 then v69 else v58
            })
        }), 
        Delete = v63 and v2.createElement(v19, {
            LayoutOrder = v67:getNextOrder(), 
            Enabled = if not l_COLLAB2850_FixMcTooltips_0 then l_Writable_0 and not l_Loading_0 else not l_Loading_0, 
            OnClicked = l_OnRemoved_0
        }), 
        Separator = not l_HideSeparator_0 and v2.createElement(l_Separator_0, {
            Position = UDim2.new(0.5, 0, 1, 0), 
            LayoutOrder = v67:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v26));
