local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
return v3.createReducer({
    allowedAssetTypesForRelease = {}, 
    allowedAssetTypesForUpload = {}, 
    allowedAssetTypesForFree = {}, 
    allowedBundleTypeSettings = {}
}, {
    [require(l_Actions_0.SetAllowedAssetTypes).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            allowedAssetTypesForRelease = v6.allowedAssetTypesForRelease, 
            allowedAssetTypesForUpload = v6.allowedAssetTypesForUpload, 
            allowedAssetTypesForFree = v6.allowedAssetTypesForFree
        });
    end, 
    [require(l_Actions_0.SetAllowedBundleTypes).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            allowedBundleTypeSettings = v8.allowedBundleTypeSettings
        });
    end
});
