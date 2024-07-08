local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    isItemTagsFeatureEnabled = false, 
    enabledAssetTypesForItemTags = {}, 
    maximumItemTagsPerItem = 0
}, {
    [require(l_Parent_0.Core.Actions.SetTagsMetadata).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            isItemTagsFeatureEnabled = v4.isItemTagsFeatureEnabled, 
            enabledAssetTypesForItemTags = v4.enabledAssetTypesForItemTags, 
            maximumItemTagsPerItem = v4.maximumItemTagsPerItem
        });
    end
});
