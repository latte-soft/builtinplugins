local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Core.Components.AssetGrid);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v6 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScrollerWrapper);
local v7 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v8 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedCategoryMap);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v12 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v13 = require(l_script_FirstAncestor_0.Core.Types.Sort);
local v14 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local v15 = require(l_script_FirstAncestor_0.Core.Hooks.useContextualAssets);
local v16 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v17 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v18 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersFixInResultsView);
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
local l_LinkText_0 = v2.UI.LinkText;
local l_useCallback_0 = v1.useCallback;
local l_TOOLBOX_ITEM_SEARCH_LIMIT_0 = v8.TOOLBOX_ITEM_SEARCH_LIMIT;
local v23 = {
    Size = UDim2.new(1, 0, 0, 0), 
    Category = v7.FREE_MODELS.name, 
    SearchTerm = nil, 
    SectionName = nil, 
    SortName = v13.getDefaultSortNameForCategory(v7.FREE_MODELS.name)
};
local function v25(v24)
    return v24.pageInfo or {};
end;
return function(v26)
    local v27 = v3.join(v23, v26);
    local v28 = v2.ContextServices.Localization:use();
    local v29 = v2.ContextServices.Stylizer:use();
    local v30 = v11:use();
    local v31 = v14(v25);
    local v32 = v15();
    local v33 = l_useCallback_0(function()
        return v1.createElement(l_LinkText_0, {
            LayoutOrder = 1, 
            OnClick = v27.OnClickBack, 
            Style = "Unobtrusive", 
            Text = "< " .. v28:getText("General", "BackToHome", {
                assetType = v9(v28)[v27.CategoryName]
            })
        });
    end, {
        v28, 
        v27.CategoryName, 
        v27.OnClickBack
    });
    return v12.Generator({
        assetsInCameraViewport = if v27.SectionName == v8.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v32.assetsInCameraViewport else nil, 
        assetsInCameraVicinity = if v27.SectionName == v8.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v32.assetsInCameraVicinity else nil, 
        networkInterface = v30.networkInterface, 
        categoryName = v27.CategoryName, 
        sectionName = v27.SectionName, 
        sortName = v27.SortName, 
        searchTerm = v27.SearchTerm, 
        queryParams = v27.QueryParams, 
        initialPageSize = l_TOOLBOX_ITEM_SEARCH_LIMIT_0, 
        includeUnverifiedCreators = v31.includeUnverifiedCreators, 
        searchSource = v27.SearchSource, 
        qualityFilterData = if not not v17() and v18() then v31.qualityFilterData else nil, 
        render = l_useCallback_0(function(v34)
            if v34.loading and #v34.assetIds == 0 then
                return v1.createElement("Frame", {
                    BackgroundColor3 = v29.backgroundColor, 
                    LayoutOrder = v27.LayoutOrder, 
                    Position = v27.Position, 
                    Size = v27.Size
                }, {
                    LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    })
                });
            elseif not v7.categoryIsAudio(v27.CategoryName) then
                return v4({
                    AssetIds = v34.assetIds, 
                    AssetMap = v34.assetMap, 
                    LayoutOrder = v27.LayoutOrder, 
                    Position = v27.Position, 
                    RenderTopContent = v33, 
                    RequestNextPage = v34.fetchNextPage, 
                    Size = v27.Size, 
                    CanInsertAsset = v27.CanInsertAsset, 
                    LogAssetImpression = v27.LogAssetImpression, 
                    OnAssetPreviewButtonClicked = v27.OnAssetPreviewButtonClicked, 
                    OnSearchByCreator = if not v16() then nil else v27.OnSearchByCreator, 
                    TryInsert = v27.TryInsert, 
                    TryOpenAssetConfig = v27.TryOpenAssetConfig
                });
            else
                return v1.createElement(v6, {
                    ResultsState = v34, 
                    PageSize = l_TOOLBOX_ITEM_SEARCH_LIMIT_0, 
                    RenderTopContent = v33, 
                    SwimlaneName = v27.SwimlaneName, 
                    AssetLogicWrapperProps = {
                        CanInsertAsset = v27.CanInsertAsset, 
                        LogAssetImpression = v27.LogAssetImpression, 
                        OnAssetPreviewButtonClicked = v27.OnAssetPreviewButtonClicked, 
                        TryInsert = v27.TryInsert, 
                        TryOpenAssetConfig = v27.TryOpenAssetConfig
                    }
                });
            end;
        end, {})
    });
end;
