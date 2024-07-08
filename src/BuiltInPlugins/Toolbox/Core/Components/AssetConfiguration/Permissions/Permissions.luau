local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_ScrollingFrame_0 = v4.UI.ScrollingFrame;
local l_Separator_0 = require(l_Packages_0.Framework).UI.Separator;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v11 = require(l_Permissions_0.PackageOwnerWidget);
local v12 = require(l_Permissions_0.CollaboratorSearchWidget);
local v13 = require(l_Permissions_0.CollaboratorsWidget);
local v14 = require(l_Permissions_0.PermissionsConstants);
local v15 = require(l_Parent_0.Core.Util.Constants);
local v16 = require(l_Parent_0.Core.Thunks.SearchCollaborators);
local v17 = require(l_Parent_0.Core.Actions.SetCollaborators);
local v18 = require(l_Parent_0.Core.Actions.SetGroupMetadata);
local v19 = require(l_Parent_0.Core.Actions.AddChange);
local v20 = v2.PureComponent:extend("Permissions");
v20.init = function(v21)
    v21.state = {
        OwnerType = Enum.CreatorType[v21.props.Owner.type]
    };
end;
v20.render = function(v22)
    local l_Stylizer_0 = v22.props.Stylizer;
    local v24 = l_LayoutOrderIterator_0.new();
    local v25 = true;
    if v22.props.CurrentUserPackagePermission ~= v14.OwnKey then
        v25 = v22.props.CurrentUserPackagePermission == v14.EditKey;
    end;
    local v26 = v22.props.CurrentUserPackagePermission == v14.OwnKey;
    local v27 = v22.state.OwnerType == Enum.CreatorType.User;
    return v2.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        EnableScrollBarBackground = true, 
        LayoutOrder = v22.props.LayoutOrder, 
        Size = v22.props.Size
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v15.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingBottom = UDim.new(0, v15.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingLeft = UDim.new(0, v15.PERMISSIONS_UI_EDGE_PADDING), 
            PaddingRight = UDim.new(0, v15.PERMISSIONS_UI_EDGE_PADDING)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, v15.PERMISSIONS_TAB_LIST_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        OwnerWidget = v2.createElement(v11, {
            LayoutOrder = v24:getNextOrder(), 
            Enabled = true, 
            OwnerName = v22.props.Owner.username, 
            OwnerId = v22.props.Owner.targetId, 
            OwnerType = v22.state.OwnerType, 
            CanManage = v26, 
            GroupMetadata = v22.props.GroupMetadata, 
            Permissions = v22.props.Permissions, 
            PermissionsChanged = v22.props.PermissionsChanged
        }), 
        Separator = v2.createElement(l_Separator_0, {
            LayoutOrder = v24:getNextOrder()
        }), 
        SearchbarWidget = (v26 and v27) and v2.createElement(v12, {
            LayoutOrder = v24:getNextOrder(), 
            Enabled = true, 
            GroupMetadata = v22.props.GroupMetadata, 
            SearchRequested = v22.props.SearchRequested, 
            SearchData = v22.props.SearchData, 
            Permissions = v22.props.Permissions, 
            PermissionsChanged = v22.props.PermissionsChanged
        }), 
        RevokedWarningMessage = v26 and v2.createElement("TextLabel", {
            LayoutOrder = v24:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v15.FONT_SIZE_MEDIUM * 2), 
            Text = if not v27 then v22.props.Localization:getText("AssetConfigPackagePermissions", "GroupOwnedWarningAllVersions") else v22.props.Localization:getText("AssetConfigPackagePermissions", "UserOwnedWarningAllVersions"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v15.FONT, 
            TextSize = v15.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        }), 
        CollaboratorListWidget = (v25 and v27) and v2.createElement(v13, {
            LayoutOrder = v24:getNextOrder(), 
            Enabled = true, 
            OwnerId = v22.props.Owner.targetId, 
            OwnerType = v22.state.OwnerType, 
            CanManage = v26, 
            GroupMetadata = v22.props.GroupMetadata, 
            Permissions = v22.props.Permissions, 
            PermissionsChanged = v22.props.PermissionsChanged, 
            GroupMetadataChanged = v22.props.GroupMetadataChanged
        })
    });
end;
return v3.connect(function(v28, v29)
    local v30 = {};
    local v31 = v28.collaborators or {};
    local l_NoAccessKey_0 = v14.NoAccessKey;
    if v28[v29.Owner.targetId] and Enum.CreatorType[v29.Owner.type] == Enum.CreatorType.Group then
        v30 = v28[v29.Owner.targetId].groupMetadata;
    end;
    if not ((not (v29.AssetId ~= nil) or not v28.packagePermissions) or not v28.packagePermissions[v29.AssetId]) then
        l_NoAccessKey_0 = v28.packagePermissions[v29.AssetId];
    end;
    return {
        Owner = not not v28.assetConfigData and v28.assetConfigData.Creator or v29.Owner, 
        GroupMetadata = v30, 
        Permissions = v31, 
        CurrentUserPackagePermission = l_NoAccessKey_0
    };
end, function(v33)
    return {
        SearchRequested = function(...)
            v33(v16(...));
        end, 
        PermissionsChanged = function(v34)
            v33(v17(v34));
            v33(v19("permissions", v34));
        end, 
        GroupMetadataChanged = function(v35)
            v33(v18(v35));
            v33(v19("groupMetadata", v35));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v20)));
