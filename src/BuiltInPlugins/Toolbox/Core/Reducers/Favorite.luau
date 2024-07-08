local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local v3 = require(l_Packages_0.Cryo);
local l_Actions_0 = l_Parent_0.Core.Actions;
return (v2.createReducer({
    assetIdToCountsMap = {}, 
    assetIdToFavoritedMap = {}
}, {
    [require(l_Actions_0.GetFavoriteCounts).name] = function(v5, v6)
        return v3.Dictionary.join(v5, {
            assetIdToCountsMap = v3.Dictionary.join(v5.assetIdToCountsMap, {
                [v6.assetId] = v6.favoriteCounts
            })
        });
    end, 
    [require(l_Actions_0.GetFavorited).name] = function(v7, v8)
        return v3.Dictionary.join(v7, {
            assetIdToFavoritedMap = v3.Dictionary.join(v7.assetIdToFavoritedMap, {
                [v8.assetId] = v8.favorited
            })
        });
    end, 
    [require(l_Actions_0.CreateFavorite).name] = function(v9, v10)
        return v3.Dictionary.join(v9, {
            assetIdToCountsMap = v3.Dictionary.join(v9.assetIdToCountsMap, {
                [v10.assetId] = (v9.assetIdToCountsMap[v10.assetId] or 0) + 1
            }), 
            assetIdToFavoritedMap = v3.Dictionary.join(v9.assetIdToFavoritedMap, {
                [v10.assetId] = true
            })
        });
    end, 
    [require(l_Actions_0.DeleteFavorite).name] = function(v11, v12)
        return v3.Dictionary.join(v11, {
            assetIdToCountsMap = v3.Dictionary.join(v11.assetIdToCountsMap, {
                [v12.assetId] = (v11.assetIdToCountsMap[v12.assetId] or 0) - 1
            }), 
            assetIdToFavoritedMap = v3.Dictionary.join(v11.assetIdToFavoritedMap, {
                [v12.assetId] = false
            })
        });
    end
}));
