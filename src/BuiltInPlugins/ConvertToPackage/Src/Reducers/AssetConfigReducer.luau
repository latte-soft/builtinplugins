local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
return v3.createReducer({
    assetConfigData = {}, 
    versionHistory = nil, 
    changed = {}, 
    assetId = nil, 
    assetName = nil, 
    instances = nil, 
    clonedInstance = nil, 
    assetTypeEnum = nil, 
    screenConfigs = {}, 
    isCatalogItemCreator = false, 
    currentScreen = require(l_Parent_0.Src.Util.Constants).SCREENS.CONFIGURE_ASSET, 
    totalResults = 0, 
    resultsArray = {}, 
    filteredResultsArray = {}
}, {
    [require(l_Actions_0.SetCurrentScreen).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            currentScreen = v6.currentScreen
        });
    end, 
    [require(l_Actions_0.SetAssetConfigData).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            assetConfigData = v8.assetConfigData
        });
    end, 
    [require(l_Actions_0.SetAssetName).name] = function(v9, v10)
        return v2.Dictionary.join(v9, {
            assetName = v10.assetName
        });
    end, 
    [require(l_Actions_0.AddChange).name] = function(v11, v12)
        return v2.Dictionary.join(v11, {
            changed = v2.Dictionary.join(v11.changed or {}, {
                [v12.setting] = v12.value
            })
        });
    end, 
    [require(l_Actions_0.ClearChange).name] = function(v13, v14)
        return v2.Dictionary.join(v13, {
            changed = v2.Dictionary.join(v13.changed or {}, {
                [v14.setting] = v2.None
            })
        });
    end, 
    [require(l_Actions_0.UploadResult).name] = function(v15, v16)
        return v2.Dictionary.join(v15, {
            uploadSucceeded = v16.uploadSucceeded
        });
    end
});
