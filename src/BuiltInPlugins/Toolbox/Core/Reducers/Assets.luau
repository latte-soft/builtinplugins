local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.DebugFlags);
local v7 = require(l_Util_0.PagedRequestCursor);
local l_Math_0 = require(l_Packages_0.Framework).Util.Math;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v10 = require(l_Actions_0.ClearAssets);
local v11 = require(l_Parent_0.Core.Actions.SetAssetMediaIds);
local v12 = require(l_Actions_0.GetAssets);
local v13 = require(l_Actions_0.SetLoading);
local v14 = require(l_Actions_0.SetCachedCreatorInfo);
local v15 = require(l_Actions_0.SetAssetPreview);
local v16 = require(l_Actions_0.SetPreviewModel);
local v17 = require(l_Actions_0.ClearPreview);
local v18 = require(l_Actions_0.SetCanManageAsset);
local v19 = require(l_Actions_0.SetCodeSummaryForAsset);
local v20 = require(l_Actions_0.SetPluginData);
local v21 = require(l_Actions_0.SetMostRecentAssetInsertTime);
local v22 = require(l_Actions_0.GetAssetContentAttributionInfo);
local v23 = require(l_Parent_0.Core.Actions.UpdateAssetData);
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local function v42(v25, v26, v27, v28)
    if v26 then
        local v29 = {};
        local v30 = {};
        local v31 = {
            Voting = v2.None
        };
        for _, v33 in ipairs(v26) do
            local l_Id_0 = v33.Asset.Id;
            local v35 = #v30 + 1;
            if v29[l_Id_0] == nil then
                local v36 = v25.assetsReceived or 0;
                v33.Context = v2.Dictionary.join(v33.Context or {}, {
                    page = l_Math_0.round(v36 / v5.TOOLBOX_ITEM_SEARCH_LIMIT, 0) + 1, 
                    pagePosition = v35, 
                    position = v36 + v35
                });
                v29[l_Id_0] = v2.Dictionary.join(v33, v31);
                v30[v35] = l_Id_0;
            end;
        end;
        local v37 = math.max(v25.totalAssets or 0, v27 or 0);
        local v38 = (v25.assetsReceived or 0) + #v30;
        local v39 = false;
        if not v28 then
            local v40 = false;
            if v37 <= v38 then
                v40 = #v26 == 0;
            end;
            local l_hasReachedBottom_0 = v25.hasReachedBottom;
            if not l_hasReachedBottom_0 then
                l_hasReachedBottom_0 = v40;
                if not l_hasReachedBottom_0 then
                    l_hasReachedBottom_0 = false;
                    if #v30 == 0 then
                        l_hasReachedBottom_0 = v37 > 0;
                    end;
                end;
            end;
            v39 = l_hasReachedBottom_0;
        else
            v39 = not v7.isNextPageAvailable(v28);
        end;
        return v2.Dictionary.join(v25, {
            idToAssetMap = v2.Dictionary.join(v25.idToAssetMap or {}, v29), 
            idsToRender = v2.List.join(v25.idsToRender or {}, v30), 
            totalAssets = v37, 
            assetsReceived = v38, 
            hasReachedBottom = v39, 
            currentCursor = v28 or v7.createDefaultCursor()
        });
    else
        if v6.shouldDebugWarnings() then
            warn("Lua Toolbox: handleAssetsAddedToState() got assets = nil");
        end;
        return v25;
    end;
end;
return v3.createReducer({
    idToAssetMap = {}, 
    idsToRender = {}, 
    isLoading = true, 
    totalAssets = 0, 
    assetsReceived = 0, 
    hasReachedBottom = false, 
    currentCursor = v7.createDefaultCursor(), 
    previewModel = nil, 
    previewAssetId = nil, 
    previewSwimlaneName = nil, 
    isPreviewing = false, 
    mostRecentAssetInsertTime = 0, 
    manageableAssets = {}, 
    previewPluginData = nil, 
    creatingUniverseName = nil, 
    creatingUniverseRootPlaceId = nil, 
    codeSummaryMap = if not v24() then nil else {}
}, {
    [v10.name] = function(v43, _)
        return v2.Dictionary.join(v43, {
            idsToRender = {}, 
            totalAssets = 0, 
            assetsReceived = 0, 
            hasReachedBottom = false, 
            currentCursor = v7.createDefaultCursor(), 
            manageableAssets = {}
        });
    end, 
    [v13.name] = function(v45, v46)
        return v2.Dictionary.join(v45, {
            isLoading = v46.isLoading
        });
    end, 
    [v14.name] = function(v47, v48)
        return v2.Dictionary.join(v47, {
            cachedCreatorInfo = v48.cachedCreatorInfo
        });
    end, 
    [v11.name] = function(v49, v50)
        local v51 = if not not v49.idToAssetMap and v49.idToAssetMap[v50.assetId] then v49.idToAssetMap[v50.assetId].Asset else nil;
        if v51 == nil then
            return v49;
        else
            return v2.Dictionary.join(v49, {
                idToAssetMap = v2.Dictionary.join(v49.idToAssetMap, {
                    [v50.assetId] = v2.Dictionary.join(v49.idToAssetMap[v50.assetId], {
                        Asset = v2.Dictionary.join(v51, {
                            AssetMediaIds = v50.assetMediaIds
                        })
                    })
                })
            });
        end;
    end, 
    [v12.name] = function(v52, v53)
        return v42(v52, v53.assets, v53.totalResults, v53.cursor);
    end, 
    [v15.name] = function(v54, v55)
        return v2.Dictionary.join(v54, {
            isPreviewing = v55.isPreviewing, 
            previewAssetId = v55.previewAssetId, 
            previewSwimlaneName = if not v55.previewSwimlaneName then v2.None else v55.previewSwimlaneName
        });
    end, 
    [v16.name] = function(v56, v57)
        return v2.Dictionary.join(v56, {
            previewModel = v57.previewModel
        });
    end, 
    [v17.name] = function(v58, _)
        return v2.Dictionary.join(v58, {
            previewModel = v2.None, 
            previewPluginData = v2.None
        });
    end, 
    [v18.name] = function(v60, v61)
        return v2.Dictionary.join(v60, {
            manageableAssets = v2.Dictionary.join(v60.manageableAssets, {
                [tostring(v61.assetId)] = v61.canManage
            })
        });
    end, 
    [v20.name] = function(v62, v63)
        return v2.Dictionary.join(v62, {
            previewPluginData = v63.pluginData
        });
    end, 
    [v21.name] = function(v64, v65)
        return v2.Dictionary.join(v64, {
            mostRecentAssetInsertTime = v65.mostRecentAssetInsertTime
        });
    end, 
    [v22.name] = function(v66, v67)
        return v2.Dictionary.join(v66, {
            creatingUniverseId = v67.creatingUniverseId, 
            creatingUniverseName = v67.creatingUniverseName, 
            creatingUniverseRootPlaceId = v67.creatingUniverseRootPlaceId
        });
    end, 
    [v19.name] = if not v24() then nil else function(v68, v69)
        return v2.Dictionary.join(v68, {
            codeSummaryMap = v2.Dictionary.join(v68, {
                [tostring(v69.assetId)] = v69.codeSummary
            })
        });
    end, 
    [v23.name] = function(v70, v71)
        if not if not not v70.idToAssetMap and v70.idToAssetMap[v71.assetId] then v70.idToAssetMap[v71.assetId] else nil then
            return ;
        else
            return v2.Dictionary.join(v70, {
                idToAssetMap = v2.Dictionary.join(v70.idToAssetMap, {
                    [v71.assetId] = v71.assetData
                })
            });
        end;
    end
});
