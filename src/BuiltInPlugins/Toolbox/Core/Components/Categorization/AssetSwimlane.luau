local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Components.Asset.Asset);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_Categorization_0 = l_script_FirstAncestor_0.Core.Components.Categorization;
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v6 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v8 = require(l_script_FirstAncestor_0.Core.ContextServices.ModalContext);
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v10 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v11 = require(l_Categorization_0.Swimlane);
local v12 = require(l_script_FirstAncestor_0.Core.Hooks.useContextualAssets);
local v13 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v14 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxContextualRecommendationsShadowTraffic);
local v15 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local l_useState_0 = v1.useState;
local l_useCallback_0 = v1.useCallback;
return function(v18)
    local v19 = v8:use();
    local v20 = v9:use();
    local v21 = v12();
    local v22, v23 = l_useState_0(0);
    local v24 = l_useCallback_0(function()
        v18.OnClickSeeAllAssets(v18.SectionName or v18.PathName, v18.CategoryName, v18.SortName, nil, v18.QueryParams);
    end, {
        v18.CategoryName, 
        v18.OnClickSeeAllAssets, 
        v18.PathName, 
        v18.QueryParams, 
        v18.SectionName, 
        v18.SortName
    });
    local v26 = l_useCallback_0(function(v25)
        v23(v25);
    end, {});
    local v27 = l_useCallback_0(function()
        v23(0);
    end, {});
    local v32 = l_useCallback_0(function(_, v29)
        local l_Id_0 = v29.Asset.Id;
        local v31 = false;
        if v22 == l_Id_0 then
            v31 = v19.canHoverAsset();
        end;
        return v1.createElement(v2, {
            assetId = l_Id_0, 
            assetData = v29, 
            assetTileLocation = v6.ASSET_TILE_LOCATION.BROWSE, 
            canInsertAsset = v18.CanInsertAsset, 
            isHovered = v31, 
            logImpression = v18.LogAssetImpression, 
            onAssetHovered = v26, 
            onAssetHoverEnded = v27, 
            onAssetPreviewButtonClicked = v18.OnAssetPreviewButtonClicked, 
            onSearchByCreator = if not v13() then nil else v18.OnSearchByCreator, 
            parentAbsolutePosition = v18.ParentAbsolutePosition, 
            parentSize = v18.ParentAbsoluteSize, 
            shouldLogOnMount = v18.ShouldLogAssetOnMount, 
            swimlaneCategory = v18.SwimlaneCategory, 
            tryInsert = v18.TryInsert, 
            tryOpenAssetConfig = v18.TryOpenAssetConfig
        });
    end, {
        v19, 
        v22, 
        v26, 
        v27, 
        v18.CanInsertAsset, 
        v18.LogAssetImpression, 
        v18.OnAssetPreviewButtonClicked, 
        v18.OnSearchByCreator, 
        v18.ParentAbsolutePosition, 
        v18.ParentAbsoluteSize, 
        v18.ShouldLogAssetOnMount, 
        v18.SwimlaneCategory, 
        v18.TryInsert, 
        v18.TryOpenAssetConfig
    });
    local v36 = l_useCallback_0(function(v33)
        local v34 = v5.shouldShowPrices(v18.CategoryName);
        local v35 = nil;
        v35 = if not v34 then v6.ASSET_HEIGHT else v6.ASSET_HEIGHT + v6.PRICE_HEIGHT;
        if v14() and v18.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
            return nil;
        else
            return v1.createElement(v11, {
                Data = v33.assets, 
                IsLoading = v33.loading, 
                LayoutOrder = v18.LayoutOrder, 
                OnClickSeeAll = v24, 
                OnRenderItem = v32, 
                Size = UDim2.new(0, v18.SwimlaneWidth, 0, v35), 
                Total = v33.total, 
                Title = v18.Title, 
                ZIndex = v18.ZIndex
            });
        end;
    end, {
        v24, 
        v32, 
        v18.CategoryName, 
        v18.LayoutOrder, 
        v18.SwimlaneWidth, 
        v18.Title, 
        v18.ZIndex
    });
    if v18.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME and (not (#v21.assetsInCameraViewport ~= 0) or #v21.assetsInCameraVicinity == 0) then
        return nil;
    else
        return v10.Generator({
            assetsInCameraViewport = if v18.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v21.assetsInCameraViewport else nil, 
            assetsInCameraVicinity = if v18.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v21.assetsInCameraVicinity else nil, 
            networkInterface = v20.networkInterface, 
            categoryName = v18.CategoryName, 
            includeUnverifiedCreators = v18.IncludeUnverifiedCreators, 
            qualityFilterData = if not v15() then nil else v18.QualityFilterData, 
            sortName = v18.SortName, 
            queryParams = v18.QueryParams, 
            sectionName = v18.SectionName, 
            initialPageSize = v18.InitialPageSize, 
            render = v36, 
            searchSource = v18.searchSource
        });
    end;
end;
