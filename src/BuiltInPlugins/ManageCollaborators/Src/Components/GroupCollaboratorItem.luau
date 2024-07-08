local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v9 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v10 = require(l_Parent_0.Src.Components.RolesetCollaboratorItem);
local l_Separator_0 = require(l_Parent_0.Packages.Framework).UI.Separator;
local v12 = require(l_Parent_0.Src.Components.Thumbnails.GroupIconThumbnail);
local v13 = require(l_Parent_0.Src.Selectors.IsGroupOwner);
local v14 = require(l_Parent_0.Src.Selectors.GetGroupRolesets);
local v15 = require(l_Parent_0.Src.Selectors.GetGroupPermission);
local v16 = require(l_Parent_0.Src.Selectors.GetGroupName);
local v17 = require(l_Parent_0.Src.Thunks.RemoveGroupCollaborator);
local v18 = require(l_Parent_0.Src.Thunks.SetGroupPermission);
local l_ExpandablePane_0 = v4.UI.ExpandablePane;
local l_Button_0 = v4.UI.Button;
local l_NoAccessKey_0 = v8.NoAccessKey;
local v22 = v2.PureComponent:extend("GroupCollaboratorItem");
v22.init = function(v23)
    v23.state = {
        expanded = false
    };
end;
v22.getCurrentPermission = function(v24)
    local l_props_0 = v24.props;
    local l_IsOwner_0 = l_props_0.IsOwner;
    local l_CurrentPermission_0 = l_props_0.CurrentPermission;
    if not l_IsOwner_0 then
        return l_CurrentPermission_0;
    else
        return v8.MultipleKey;
    end;
end;
v22.getAvailablePermissions = function(v28)
    local l_props_1 = v28.props;
    local l_IsOwner_1 = l_props_1.IsOwner;
    local l_Localization_0 = l_props_1.Localization;
    if not l_IsOwner_1 then
        return {
            {
                Key = v8.NoAccessKey, 
                Display = l_Localization_0:getText("PermissionLabels", "NoAccess"), 
                Description = l_Localization_0:getText("PermissionDescriptions", "NoAccess")
            }, 
            {
                Key = v8.PlayKey, 
                Display = l_Localization_0:getText("PermissionLabels", "Play"), 
                Description = l_Localization_0:getText("PermissionDescriptions", "Play")
            }
        };
    else
        return {};
    end;
end;
v22.render = function(v32)
    local l_props_2 = v32.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Writable_0 = l_props_2.Writable;
    local l_Id_0 = l_props_2.Id;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_IsOwner_2 = l_props_2.IsOwner;
    local l_GroupRolesets_0 = l_props_2.GroupRolesets;
    local l_GroupName_0 = l_props_2.GroupName;
    local v42 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.IsGroupGame;
    local l_SetGroupPermission_0 = l_props_2.SetGroupPermission;
    local l_RemoveGroupCollaborator_0 = l_props_2.RemoveGroupCollaborator;
    local l_GroupRolePermissions_0 = l_props_2.GroupRolePermissions;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local v47 = #l_GroupRolesets_0 == 0;
    local v48 = {};
    local v49 = {};
    for v50, v51 in ipairs(l_GroupRolesets_0) do
        local v52 = v2.createElement(v10, {
            LayoutOrder = v50, 
            Id = v51, 
            Writable = l_Writable_0, 
            CurrentPermission = l_NoAccessKey_0, 
            IsGroupOwner = l_IsOwner_2, 
            RolePermissions = if not l_IsOwner_2 then nil else l_GroupRolePermissions_0[v51], 
            IsGroupGame = v42
        });
        if v50 <= 3 then
            table.insert(v48, v52);
        else
            table.insert(v49, v52);
        end;
    end;
    if #v49 == 0 then
        v48[#v48].props.HideSeparator = true;
    end;
    return v2.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, l_Stylizer_1.collaboratorItem.groupCollaboratorItem.collaboratorItemOffset, 0, 0), 
        Size = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.size
    }, {
        UILayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        }), 
        GroupCollaborator = v2.createElement(v9, {
            Name = l_GroupName_0, 
            Icon = v2.createElement(v12, {
                Id = l_Id_0, 
                Size = UDim2.fromScale(1, 1)
            }), 
            Writable = l_Writable_0 and not l_IsOwner_2, 
            Loading = v47, 
            Removable = if not l_COLLAB2850_FixMcTooltips_0 then not l_IsOwner_2 else l_Writable_0 and not l_IsOwner_2, 
            OnRemoved = function()
                l_RemoveGroupCollaborator_0(l_Id_0);
            end, 
            CurrentPermission = v32:getCurrentPermission(), 
            AvailablePermissions = v32:getAvailablePermissions(), 
            OnPermissionChanged = function(v53)
                l_SetGroupPermission_0(l_Id_0, v53);
            end
        }), 
        Role1 = v48[1], 
        Role2 = v48[2], 
        Role3 = v48[3], 
        AdditionalRoles = if #v49 > 0 then v2.createElement(l_ExpandablePane_0, {
            Expanded = v32.state.expanded, 
            OnExpandedChanged = function()
            end, 
            HeaderComponent = function()
                local _ = nil;
                return v2.createElement(l_Button_0, {
                    Size = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.headerComponent.size, 
                    Text = "", 
                    LayoutOrder = 1000000, 
                    Style = "RoundSubtle", 
                    OnClick = function()
                        if not v47 then
                            v32:setState({
                                expanded = not v32.state.expanded
                            });
                            return ;
                        else
                            return ;
                        end;
                    end
                }, {
                    Arrow = v2.createElement("ImageLabel", {
                        Image = if not v32.state.expanded then l_Stylizer_1.arrows.right else l_Stylizer_1.arrows.down, 
                        Position = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.headerComponent.arrowLabel.position, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Size = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.headerComponent.arrowLabel.size
                    }), 
                    Text = v2.createElement("TextLabel", {
                        Text = if #v49 == 1 then if v32.state.expanded then l_Localization_1:getText("Buttons", "HideRole") else l_Localization_1:getText("Buttons", "SeeOneMoreRole") else if v32.state.expanded then l_Localization_1:getText("Buttons", "HideRoles", {
                            count = string.format("%u", #v49)
                        }) else l_Localization_1:getText("Buttons", "SeeMoreRoles", {
                            count = string.format("%u", #v49)
                        }), 
                        Position = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.headerComponent.textLabel.position, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        TextSize = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.ExpandTextSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Stylizer_1.fontStyle.Normal.TextColor3, 
                        Font = l_Stylizer_1.fontStyle.Normal.Font, 
                        BackgroundTransparency = 1
                    })
                });
            end, 
            LayoutOrder = 4, 
            ContentPadding = 0, 
            ContentSpacing = 0, 
            PutHeaderLast = v32.state.expanded, 
            Size = l_Stylizer_1.collaboratorItem.groupCollaboratorItem.expandablePaneSize, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Style = "Arrowless"
        }, v49) else nil, 
        Separator = not l_HideSeparator_0 and v2.createElement(l_Separator_0, {
            LayoutOrder = 5
        })
    });
end;
return (v3.connect(function(v55, v56)
    return {
        IsOwner = v13(v55, v56.Id), 
        GroupRolesets = v14(v55, v56.Id), 
        GroupName = v16(v55, v56.Id), 
        CurrentPermission = v15(v55, v56.Id), 
        GroupRolePermissions = v55.GroupRolePermissions.PermissionsByRole
    };
end, function(v57)
    return {
        SetGroupPermission = function(...)
            v57(v18(...));
        end, 
        RemoveGroupCollaborator = function(...)
            v57(v17(...));
        end
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_ContextServices_0.Localization
})(v22))));
