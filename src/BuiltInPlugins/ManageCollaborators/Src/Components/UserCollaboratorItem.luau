local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v7 = require(l_Parent_0.Src.Components.Thumbnails.UserHeadshotThumbnail);
local v8 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v9 = require(l_Parent_0.Src.Selectors.IsUserOwner);
local v10 = require(l_Parent_0.Src.Selectors.IsUserCreatorFriend);
local v11 = require(l_Parent_0.Src.Selectors.GetUserName);
local v12 = require(l_Parent_0.Src.Selectors.GetUserPermission);
local v13 = require(l_Parent_0.Src.Thunks.SetUserPermission);
local v14 = require(l_Parent_0.Src.Thunks.RemoveUserCollaborator);
local v15 = v2.PureComponent:extend("UserCollaboratorItem");
local v16 = {
    [v6.OwnerKey] = "Owner", 
    [v6.PlayKey] = "Play", 
    [v6.EditKey] = "Edit", 
    [v6.NoAccessKey] = "NoAccess", 
    [v6.AdminKey] = "Admin"
};
v15.DEPRECATED_getPermissionForKey = function(v17, v18)
    local l_Localization_0 = v17.props.Localization;
    if v16[v18] then
        return {
            Key = v18, 
            Display = l_Localization_0:getText("PermissionLabels", v16[v18]), 
            Description = l_Localization_0:getText("PermissionDescriptions", v16[v18])
        };
    else
        return {
            Key = v18, 
            Display = tostring(v18), 
            Description = "Error: This permission is not recognized."
        };
    end;
end;
v15.getAvailablePermissions = function(v20)
    local l_props_0 = v20.props;
    local l_IsOwner_0 = l_props_0.IsOwner;
    local l_IsOwnerFriend_0 = l_props_0.IsOwnerFriend;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local l_Writable_0 = l_props_0.Writable;
    if not l_IsOwner_0 then
        if l_Writable_0 then
            local v26 = {
                v20:DEPRECATED_getPermissionForKey(v6.PlayKey)
            };
            if not (not (l_OwnerType_0 == Enum.CreatorType.User) or not l_IsOwnerFriend_0) then
                table.insert(v26, v20:DEPRECATED_getPermissionForKey(v6.EditKey));
            end;
            return v26;
        else
            return {
                v20:DEPRECATED_getPermissionForKey(v20:getCurrentPermission())
            };
        end;
    else
        return {
            v20:DEPRECATED_getPermissionForKey(v6.OwnerKey)
        };
    end;
end;
v15.getCurrentPermission = function(v27)
    local l_props_1 = v27.props;
    local l_IsOwner_1 = l_props_1.IsOwner;
    local l_CurrentPermission_0 = l_props_1.CurrentPermission;
    if not l_IsOwner_1 then
        return l_CurrentPermission_0;
    else
        return v6.OwnerKey;
    end;
end;
v15.render = function(v31)
    local l_props_2 = v31.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local v34 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.Localization;
    local l_Id_0 = l_props_2.Id;
    local l_Writable_1 = l_props_2.Writable;
    local l_UserName_0 = l_props_2.UserName;
    local l_IsOwner_2 = l_props_2.IsOwner;
    local l_HideSeparator_0 = l_props_2.HideSeparator;
    local l_SetUserPermission_0 = l_props_2.SetUserPermission;
    local l_RemoveUserCollaborator_0 = l_props_2.RemoveUserCollaborator;
    local v42 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_2.IsGroupGame;
    local v43 = v31:getAvailablePermissions();
    local v44 = nil;
    if not (not l_COLLAB2850_FixMcTooltips_0 or l_IsOwner_2) then
        if not v42 then
            if l_Writable_1 then
                if #v43 <= 1 then
                    v44 = v34:getText("PermissionDescriptions", "FriendToEdit");
                end;
            else
                v44 = v34:getText("PermissionDescriptions", "GameOwnerToEdit");
            end;
        else
            v44 = if l_Writable_1 then v34:getText("PermissionDescriptions", "UsersOnlyPlayLevel") else v34:getText("PermissionDescriptions", "GroupOwnerToEdit");
        end;
    end;
    return v2.createElement(v8, {
        LayoutOrder = l_LayoutOrder_0, 
        Name = l_UserName_0, 
        Icon = v2.createElement(v7, {
            Id = l_Id_0, 
            Size = UDim2.fromScale(1, 1)
        }), 
        Writable = if not l_COLLAB2850_FixMcTooltips_0 then l_Writable_1 and not l_IsOwner_2 else (l_Writable_1 and not l_IsOwner_2) and #v43 > 1, 
        Loading = false, 
        IsOwner = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_IsOwner_2, 
        HideSeparator = l_HideSeparator_0, 
        Removable = if not l_COLLAB2850_FixMcTooltips_0 then not l_IsOwner_2 else l_Writable_1 and not l_IsOwner_2, 
        OnRemoved = function()
            l_RemoveUserCollaborator_0(l_Id_0);
        end, 
        TooltipText = v44, 
        CurrentPermission = v31:getCurrentPermission(), 
        AvailablePermissions = v43, 
        OnPermissionChanged = function(v45)
            l_SetUserPermission_0(l_Id_0, v45);
        end
    });
end;
return (v3.connect(function(v46, v47)
    return {
        OwnerType = v46.GameOwnerMetadata.creatorType, 
        IsOwner = v9(v46, v47.Id), 
        IsOwnerFriend = v10(v46, v47.Id), 
        UserName = v11(v46, v47.Id), 
        CurrentPermission = v12(v46, v47.Id)
    };
end, function(v48)
    return {
        SetUserPermission = function(...)
            v48(v13(...));
        end, 
        RemoveUserCollaborator = function(...)
            v48(v14(...));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v15))));
