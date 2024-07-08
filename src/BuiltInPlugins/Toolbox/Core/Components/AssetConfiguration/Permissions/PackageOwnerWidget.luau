local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Urls);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigConstants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v11 = require(l_Permissions_0.PermissionsConstants);
local v12 = require(l_Permissions_0.CollaboratorItem);
local v13 = require(l_Permissions_0.GroupCollaboratorItem);
local l_deepJoin_0 = require(l_Packages_0.Framework).Util.deepJoin;
local function v16(v15)
    if v15.CanManage then
        return {
            {
                Key = v11.EditKey, 
                Display = v15.Localization:getText("AssetConfigPackagePermissions", "EditLabel"), 
                Description = v15.Localization:getText("AssetConfigPackagePermissions", "EditDescription")
            }
        };
    else
        return {};
    end;
end;
local function _()
    return {};
end;
local v18 = v2.PureComponent:extend("PackageOwnerWidget");
v18.init = function(v19)
    v19.rolePermissionChanged = function(v20, v21)
        local l_props_0 = v19.props;
        l_props_0.PermissionsChanged((l_deepJoin_0(l_props_0.Permissions, {
            [v11.RoleSubjectKey] = {
                [v20] = {
                    [v11.ActionKey] = v21
                }
            }
        })));
    end;
end;
v18.render = function(v23)
    local l_props_1 = v23.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local _ = nil;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_1.LayoutOrder or 0, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v2.createElement("TextLabel", {
            Font = v6.FONT, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            LayoutOrder = 0, 
            Text = l_props_1.Localization:getText("AssetConfigPackagePermissions", "PackageCreator"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 50, 0, 50)
        }), 
        Owner = if l_props_1.OwnerType == Enum.CreatorType.User then v2.createElement(v12, {
            LayoutOrder = 1, 
            Removable = false, 
            SubjectType = Enum.CreatorType.User, 
            CollaboratorName = l_props_1.OwnerName, 
            CollaboratorId = l_props_1.OwnerId, 
            CollaboratorIcon = v5.constructRBXThumbUrl(v7.rbxThumbTypes.AvatarHeadShot, l_props_1.OwnerId, v7.rbxThumbSizes.AvatarHeadshotImageSize), 
            UseMask = true, 
            Action = l_props_1.Localization:getText("AssetConfigPackagePermissions", "OwnerLabel"), 
            Enabled = l_props_1.Enabled, 
            Items = {}, 
            RolePermissionChanged = nil
        }) else v2.createElement(v13, {
            LayoutOrder = 1, 
            Removable = false, 
            GroupData = l_props_1.GroupMetadata, 
            Enabled = l_props_1.Enabled, 
            Items = v16(l_props_1), 
            RolePermissionChanged = v23.rolePermissionChanged, 
            Permissions = l_props_1.Permissions
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v18));
