local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
return v1.createReducer({
    categoryFilter = "", 
    searchFilter = "", 
    docked = true, 
    selectedTab = v3.Util.AccessoryAndBodyToolShared.PreviewConstants.TABS_KEYS.None, 
    selectedAssets = {}, 
    userAddedAssets = {}, 
    workspacePreviewSelectionEnabled = true
}, {
    SetCategoryFilter = function(v4, v5)
        return v2.Dictionary.join(v4, {
            categoryFilter = v5.categoryFilter
        });
    end, 
    SetSearchFilter = function(v6, v7)
        return v2.Dictionary.join(v6, {
            searchFilter = v7.searchFilter
        });
    end, 
    SetDocked = function(v8, v9)
        return v2.Dictionary.join(v8, {
            docked = v9.docked
        });
    end, 
    SetUserAddedAssets = function(v10, v11)
        return v2.Dictionary.join(v10, {
            userAddedAssets = v11.userAddedAssets
        });
    end, 
    SelectPreviewTab = function(v12, v13)
        return v2.Dictionary.join(v12, {
            selectedTab = v13.selectedTab
        });
    end, 
    SetPreviewAssetsSelected = function(v14, v15)
        return v2.Dictionary.join(v14, {
            selectedAssets = v15.selectedAssets
        });
    end, 
    SetWorkspacePreviewSelectionEnabled = if not v3.Flags.GetFFlagAFTSelectHandleOnly() then nil else function(v16, v17)
        return v2.Dictionary.join(v16, {
            workspacePreviewSelectionEnabled = v17.workspacePreviewSelectionEnabled
        });
    end
});
