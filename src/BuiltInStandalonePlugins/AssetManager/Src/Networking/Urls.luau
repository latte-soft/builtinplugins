local v0 = {
    _FrameworkAPI = require(script:FindFirstAncestor("AssetManager").Packages.Framework).RobloxAPI.new()
};
v0.CreateFetchGroupsRequest = v0._FrameworkAPI.Develop.V1.User.Groups.canManage;
v0.CreateFetchAssetsForUserRequest = v0._FrameworkAPI.APIS.ToolboxService.V1.Inventory.user;
v0.CreateFetchAssetsForGroupRequest = v0._FrameworkAPI.APIS.ToolboxService.V1.Inventory.group;
v0.CreateFetchAssetInfosRequest = v0._FrameworkAPI.APIS.ToolboxService.V1.Items.details;
return v0;
