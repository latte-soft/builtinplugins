local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_game_FastInt_0 = game:GetFastInt("ToolboxHomeViewInitialPageSize");
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v3 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Framework);
local v6 = require(l_Packages_0.Roact);
local v7 = require(l_Packages_0.RoactRodux);
local _ = require(l_Packages_0.Dash);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_Parent_0.Core.ContextServices.Settings);
local v12 = require(l_Parent_0.Core.Util.Layouter);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_LoadingIndicator_0 = v5.UI.LoadingIndicator;
local l_Pane_0 = v5.UI.Pane;
local _ = require(l_Parent_0.Core.Components.Asset.Asset);
local v18 = require(l_Parent_0.Core.Components.AssetGrid);
local _ = require(l_Parent_0.Core.Components.AssetLogicWrapper);
local v20 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local v21 = require(l_Parent_0.Core.Components.ResultsFetcher);
local _ = require(l_Parent_0.Core.Types.Category);
local v23 = require(l_Parent_0.Core.Components.Categorization.AssetSwimlane);
local _ = require(l_Parent_0.Core.Components.Categorization.ExpandableTeaser);
local v25 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local v26 = require(l_Parent_0.Core.Components.Categorization.SectionHeader);
local v27 = require(l_Parent_0.Core.Components.Categorization.Swimlane);
local l_Util_0 = l_Parent_0.Core.Util;
local v29 = require(l_Util_0.Constants);
local v30 = require(l_Util_0.getStartupAssetId);
local v31 = require(l_Util_0.Urls);
local v32 = require(l_Parent_0.Core.Thunks.GetAssetPreviewDataForStartup);
local v33 = require(l_Parent_0.Core.Networking.Requests.RequestSearchRequest);
local v34 = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v37 = Vector2.new(75, 90);
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v29.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local v39 = v6.PureComponent:extend("HomeView");
v39.defaultProps = {
    Size = UDim2.new(1, 0, 0, 0)
};
v39.didMount = function(v40)
    local l_props_0 = v40.props;
    local v42 = tonumber((v30()));
    if v42 then
        l_props_0.getAssetPreviewDataForStartup(v42, l_props_0.TryInsert, l_props_0.Localization, l_props_0.Network.networkInterface, l_props_0.OnAssetPreviewButtonClicked);
    end;
    v40.onOverallAbsoluteSizeChange();
end;
v39.init = function(v43)
    v43.sizerRef = v6.createRef();
    v43.state = {
        showTopSearchesFullHeight = false, 
        swimlaneWidth = 0
    };
    v43.onOverallAbsoluteSizeChange = function()
        v43:setState(function(v44)
            local l_current_0 = v43.sizerRef.current;
            if l_current_0 then
                local v46 = v12.getSwimlaneWidth(l_current_0.AbsoluteSize.X);
                local v47 = l_current_0.AbsoluteSize.Y > 475;
                if not (v47 == v44.showTopSearchesFullHeight) or v46 ~= v44.swimlaneWidth then
                    return {
                        absoluteSize = l_current_0.absoluteSize, 
                        showTopSearchesFullHeight = v47, 
                        swimlaneWidth = v46
                    };
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
    end;
    v43.onAbsolutePositionChange = function(v48)
        v43:setState(function(_)
            return {
                absolutePosition = v48.AbsolutePosition
            };
        end);
    end;
    v43.onClickSubcategory = function(v50)
        local l_props_1 = v43.props;
        local l_CategoryName_0 = l_props_1.CategoryName;
        local l_OnClickSubcategory_0 = l_props_1.OnClickSubcategory;
        local l_SortName_0 = l_props_1.SortName;
        local v55 = l_props_1.SubcategoryDict[v50];
        l_OnClickSubcategory_0(v50, v55, l_CategoryName_0, l_SortName_0, v55.queryParams);
    end;
    v43.onClickSeeAllSubcategories = function()
        local l_props_2 = v43.props;
        local l_CategoryName_1 = l_props_2.CategoryName;
        local l_SortName_1 = l_props_2.SortName;
        local l_SubcategoryDict_0 = l_props_2.SubcategoryDict;
        local l_OnClickSeeAllSubcategories_0 = l_props_2.OnClickSeeAllSubcategories;
        if l_OnClickSeeAllSubcategories_0 then
            l_OnClickSeeAllSubcategories_0(l_SubcategoryDict_0, l_CategoryName_1, l_SortName_1);
        end;
    end;
    v43.onClickSearchPill = function(v61)
        local l_props_3 = v43.props;
        local l_CategoryName_2 = l_props_3.CategoryName;
        local _ = l_props_3.SortName;
        local l_requestSearchRequest_0 = l_props_3.requestSearchRequest;
        local l_logSearchAnalytics_0 = l_props_3.logSearchAnalytics;
        l_requestSearchRequest_0(l_props_3.Network.networkInterface, v43.props.Settings:get("Plugin"), v61, l_CategoryName_2);
        l_logSearchAnalytics_0(v61, nil);
    end;
    v43.renderSubcategory = function(_, v68)
        local v69 = "";
        local v70 = nil;
        if not (not v68 or not v68.thumbnail) then
            v69 = v31.constructAssetThumbnailUrl(v68.thumbnail.assetId, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            v70 = Color3.fromHex(v68.thumbnail.backgroundColor);
        end;
        return v6.createElement(v20, {
            BackgroundColor = v70, 
            Image = v69, 
            LayoutOrder = v68.index, 
            Key = v68.name, 
            OnClick = v43.onClickSubcategory, 
            Size = UDim2.new(0, v37.X, 0, v37.Y), 
            Title = v68.displayName
        });
    end;
    v43.createTopContent = function()
        local l_state_0 = v43.state;
        local l_props_4 = v43.props;
        local l_AssetSections_0 = l_props_4.AssetSections;
        local l_CanInsertAsset_0 = l_props_4.CanInsertAsset;
        local l_CategoryName_3 = l_props_4.CategoryName;
        local _ = l_props_4.contextualAssets;
        local l_IncludeUnverifiedCreators_0 = l_props_4.IncludeUnverifiedCreators;
        local l_Localization_0 = l_props_4.Localization;
        local l_OnClickSeeAllAssets_0 = l_props_4.OnClickSeeAllAssets;
        local l_OnAssetPreviewButtonClicked_0 = l_props_4.OnAssetPreviewButtonClicked;
        local l_SortName_3 = l_props_4.SortName;
        local l_TopKeywords_0 = l_props_4.TopKeywords;
        local l_TryInsert_0 = l_props_4.TryInsert;
        local l_TryOpenAssetConfig_0 = l_props_4.TryOpenAssetConfig;
        local l_swimlaneWidth_0 = l_state_0.swimlaneWidth;
        local v86 = l_LayoutOrderIterator_0.new();
        local l_SubcategoryDict_1 = l_props_4.SubcategoryDict;
        local v88 = 0;
        if l_SubcategoryDict_1 then
            for _ in pairs(l_SubcategoryDict_1) do
                v88 = v88 + 1;
            end;
        end;
        local l_Stylizer_0 = l_props_4.Stylizer;
        local l_searchList_0 = l_Stylizer_0.searchList;
        local l_searchPill_0 = l_Stylizer_0.searchPill;
        local l_sectionHeader_0 = l_Stylizer_0.sectionHeader;
        local v94 = l_Localization_0:getText("General", "Categories");
        local _ = l_Localization_0:getText("HomeView", "TheEssentials");
        local v96 = l_Localization_0:getText("HomeView", "TopSearches");
        local v97 = {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v98 = #l_AssetSections_0;
        local _ = v43.sizerRef.current;
        local l_absoluteSize_0 = l_state_0.absoluteSize;
        local l_absolutePosition_0 = l_state_0.absolutePosition;
        for v102, v103 in pairs(l_AssetSections_0) do
            if v102 ~= v98 then
                v97["AssetSwimlane_" .. v102] = v6.createElement(v23, {
                    CanInsertAsset = l_CanInsertAsset_0, 
                    CategoryName = l_CategoryName_3, 
                    IncludeUnverifiedCreators = l_IncludeUnverifiedCreators_0, 
                    InitialPageSize = 20, 
                    LayoutOrder = v102, 
                    LogAssetImpression = l_props_4.LogAssetImpression, 
                    OnClickSeeAllAssets = l_OnClickSeeAllAssets_0, 
                    OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_0, 
                    OnSearchByCreator = if not v2() then nil else l_props_4.OnSearchByCreator, 
                    ParentAbsolutePosition = l_absolutePosition_0, 
                    ParentAbsoluteSize = l_absoluteSize_0, 
                    QualityFilterData = if not v3() then nil else l_props_4.qualityFilterData, 
                    SortName = l_SortName_3, 
                    SearchTerm = nil, 
                    SectionName = v103.name, 
                    SwimlaneCategory = v103.name, 
                    SwimlaneWidth = l_swimlaneWidth_0, 
                    Title = v103.displayName, 
                    TryInsert = l_TryInsert_0, 
                    TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
                    ZIndex = (v98 - v102) + 1
                });
            else
                break;
            end;
        end;
        local v104 = l_TopKeywords_0 and #l_TopKeywords_0 > 0;
        local _ = (l_searchPill_0.textSize + l_searchPill_0.padding.left) + l_searchPill_0.padding.right;
        local v106 = 1;
        if l_state_0.showTopSearchesFullHeight then
            v106 = 2;
        end;
        return v6.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = 20, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            SubcategorySwimlane = if v88 > 0 then v6.createElement(v27, {
                Data = l_SubcategoryDict_1, 
                LayoutOrder = v86:getNextOrder(), 
                OnClickSeeAll = v43.onClickSeeAllSubcategories, 
                OnRenderItem = v43.renderSubcategory, 
                Size = UDim2.new(0, l_swimlaneWidth_0, 0, 0), 
                Title = v94, 
                Total = v88
            }) else nil, 
            TopKeywords = if not v104 then nil else v6.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v86:getNextOrder(), 
                Size = UDim2.new(0, l_swimlaneWidth_0, 0, ((l_searchPill_0.textSize + l_searchPill_0.padding.top) + l_searchPill_0.padding.bottom) * v106 + l_searchList_0.buttonSpacing), 
                Spacing = 10, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                SectionHeader = v6.createElement(v26, {
                    OnClickSeeAll = function()
                    end, 
                    LayoutOrder = v86:getNextOrder(), 
                    SeeAllText = "", 
                    Title = v96
                }), 
                SearchList = v6.createElement(v25, {
                    Items = l_TopKeywords_0, 
                    ItemMinWidth = l_searchPill_0.padding.left + l_searchPill_0.padding.right, 
                    LayoutOrder = v86:getNextOrder(), 
                    MaxRowCount = v106, 
                    OnClick = v43.onClickSearchPill
                })
            }), 
            AssetSections = v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v86:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, v97), 
            GridHeader = l_AssetSections_0[v98] and v6.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_sectionHeader_0.font, 
                LayoutOrder = v86:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_sectionHeader_0.textSize), 
                Text = l_AssetSections_0[v98].displayName, 
                TextColor3 = l_sectionHeader_0.textColor, 
                TextSize = l_sectionHeader_0.textSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end;
end;
v39.render = function(v107)
    local l_props_5 = v107.props;
    local l_CategoryName_4 = l_props_5.CategoryName;
    local l_IncludeUnverifiedCreators_1 = l_props_5.IncludeUnverifiedCreators;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Position_0 = l_props_5.Position;
    local l_SortName_4 = l_props_5.SortName;
    local l_Size_0 = l_props_5.Size;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local l_AssetSections_1 = l_props_5.AssetSections;
    local l_SubcategoryDict_2 = l_props_5.SubcategoryDict;
    local v118 = not not l_AssetSections_1[#l_AssetSections_1] and l_AssetSections_1[#l_AssetSections_1].name or nil;
    local v119 = next(l_SubcategoryDict_2) ~= nil;
    local v120 = false;
    if #l_AssetSections_1 == 1 then
        v120 = (((not v119 and l_AssetSections_1[#l_AssetSections_1]) and not l_AssetSections_1[#l_AssetSections_1].subcategory) and l_props_5.TopKeywords) and #l_props_5.TopKeywords == 0;
    end;
    local l_CanInsertAsset_1 = l_props_5.CanInsertAsset;
    local l_OnAssetPreviewButtonClicked_1 = l_props_5.OnAssetPreviewButtonClicked;
    local l_TryInsert_1 = l_props_5.TryInsert;
    local l_TryOpenAssetConfig_1 = l_props_5.TryOpenAssetConfig;
    local v125 = if not v120 then v107.createTopContent() else nil;
    local function v126()
        return v125;
    end;
    if not l_props_5.hasTutorialLimits then
        return v6.createElement("Frame", {
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v6.Ref] = v107.sizerRef, 
            [v6.Change.AbsoluteSize] = v107.onOverallAbsoluteSizeChange, 
            [v6.Change.AbsolutePosition] = v107.onAbsolutePositionChange
        }, {
            v21.Generator({
                networkInterface = l_props_5.Network.networkInterface, 
                categoryName = l_CategoryName_4, 
                sortName = l_SortName_4, 
                searchTerm = nil, 
                queryParams = {}, 
                sectionName = v118, 
                initialPageSize = l_game_FastInt_0, 
                includeUnverifiedCreators = l_IncludeUnverifiedCreators_1, 
                qualityFilterData = if not v3() then nil else l_props_5.qualityFilterData, 
                render = function(v127)
                    if v127.loading and #v127.assetIds == 0 then
                        return v6.createElement("Frame", {
                            BackgroundColor3 = l_Stylizer_1.backgroundColor, 
                            LayoutOrder = l_LayoutOrder_0, 
                            Position = l_Position_0, 
                            Size = l_Size_0
                        }, {
                            LoadingIndicator = v6.createElement(l_LoadingIndicator_0, {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Position = UDim2.new(0.5, 0, 0.5, 0)
                            })
                        });
                    else
                        return v18({
                            AssetIds = v127.assetIds, 
                            AssetMap = v127.assetMap, 
                            LayoutOrder = l_LayoutOrder_0, 
                            Position = l_Position_0, 
                            RenderTopContent = v126, 
                            RequestNextPage = v127.fetchNextPage, 
                            Size = l_Size_0, 
                            CanInsertAsset = l_CanInsertAsset_1, 
                            OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_1, 
                            OnSearchByCreator = if not v2() then nil else l_props_5.OnSearchByCreator, 
                            LogAssetImpression = l_props_5.LogAssetImpression, 
                            TryInsert = l_TryInsert_1, 
                            TryOpenAssetConfig = l_TryOpenAssetConfig_1
                        });
                    end;
                end
            })
        });
    else
        return v6.createElement(l_Pane_0, {});
    end;
end;
mapStateToProps = function(v128, _)
    v128 = v128 or {};
    local v130 = v128.pageInfo or {};
    return {
        IncludeUnverifiedCreators = v130.includeUnverifiedCreators, 
        hasTutorialLimits = v128.tutorialLimits.assetIds ~= nil, 
        qualityFilterData = if not v3() then nil else v130.qualityFilterData
    };
end;
return v7.connect(mapStateToProps, function(v131)
    return {
        getAssetPreviewDataForStartup = function(v132, v133, v134, v135, v136)
            v131(v32(v132, v133, v134, v135, v136));
        end, 
        requestSearchRequest = function(v137, v138, v139, v140)
            v131(v33(v137, v138, v139, v140, true));
        end, 
        logSearchAnalytics = function(v141, _)
            v131(v34(v141, true));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = v11, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v13
})(v39)));
