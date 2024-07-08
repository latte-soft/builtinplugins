local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v10 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScroller);
local v11 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTabs);
local v12 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v13 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v14 = require(l_script_FirstAncestor_0.Core.Util.Images);
local v15 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v16 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v17 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v19 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v20 = require(l_script_FirstAncestor_0.Core.Components.CategoryDropDown.CategoryDropDown);
local v21 = require(l_script_FirstAncestor_0.Core.Components.CallToActionBanner.CallToActionBanner);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v23 = require(l_script_FirstAncestor_0.Core.Thunks.GetAssetPreviewDataForStartup);
local v24 = require(l_script_FirstAncestor_0.Core.Util.getStartupAssetId);
local l_withContext_0 = l_ContextServices_0.withContext;
local v26 = require(l_Packages_0.Dash);
local l_Pane_0 = v2.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v2.Wrappers.withAbsoluteSizeAndPosition;
local v29 = v3.PureComponent:extend("AudioWrapper");
local v30 = table.freeze({
    Creator = {
        Id = 1750384777, 
        Name = "Monstercat"
    }
});
v29.init = function(v31, _)
    v31.sizerRef = v3.createRef();
    v31.state = {
        selectedTab = v12.SOUND_EFFECTS.name, 
        audioTabSize = UDim2.new(0, 330, 0, v13.AUDIO_TABS_HEIGHT)
    };
    v31.onTabSelect = function(v33)
        local l_props_0 = v31.props;
        local l_state_0 = v31.state;
        local v36 = if not l_state_0.selectedCategory then nil else l_state_0.selectedCategory.name;
        local l_LogPageView_0 = l_props_0.LogPageView;
        v31:setState({
            selectedTab = v33, 
            selectedCategory = v3.None
        });
        l_LogPageView_0(v33, v36);
    end;
    v31.onCategorySelect = function(v38)
        local l_props_1 = v31.props;
        local l_state_1 = v31.state;
        local v41 = v38 or v3.None;
        local v42 = if not v38 then nil else v38.name;
        local l_selectedTab_0 = l_state_1.selectedTab;
        local l_LogPageView_1 = l_props_1.LogPageView;
        v31:setState({
            selectedCategory = v41
        });
        l_LogPageView_1(l_selectedTab_0, v42);
    end;
    v31.renderTopContent = function()
        local l_props_2 = v31.props;
        local l_state_2 = v31.state;
        local l_selectedTab_1 = l_state_2.selectedTab;
        local l_audioTabSize_0 = l_state_2.audioTabSize;
        local l_Localization_0 = l_props_2.Localization;
        local v50 = l_props_2.Settings:get("Plugin");
        local l_SearchWithOptions_0 = l_props_2.SearchWithOptions;
        local v52 = l_props_2.AssetAnalytics:get();
        return v3.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 11)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = l_audioTabSize_0, 
                BackgroundColor3 = l_props_2.Stylizer.audioTabs.backgroundButtonColor
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }); 
                v3.createElement(v11, {
                    Size = UDim2.new(1, 0, 0, 30), 
                    SelectedTab = v31.state.selectedTab, 
                    OnTabSelect = v31.onTabSelect
                })
            }), 
            CallToActionBanner = if not (l_selectedTab_1 == v12.MUSIC.name) then nil else v21.Generator({
                LayoutOrder = 2, 
                Image = v14.MONSTER_CAT_BANNER, 
                Text = l_Localization_0:getText("Audio", "FindTracks", {
                    creatorName = v30.Creator.Name
                }), 
                OnClick = function()
                    l_SearchWithOptions_0(v31.props.Network.networkInterface, v50, v30);
                    v52:onCallToActionBannerClicked(v30.Creator.Id);
                end
            }), 
            v3.createElement(v20, {
                LayoutOrder = 3, 
                Subcategories = l_props_2.SubcategoryDict, 
                AudioType = l_selectedTab_1, 
                OnCategorySelect = v31.onCategorySelect
            })
        });
    end;
    v31.onAbsoluteSizeChanged = function(v53)
        if v53.AbsoluteSize.X < 375 then
            v31:setState({
                audioTabSize = UDim2.new(1, 0, 0, v13.AUDIO_TABS_HEIGHT)
            });
            return ;
        else
            v31:setState({
                audioTabSize = UDim2.new(0, 330, 0, v13.AUDIO_TABS_HEIGHT)
            });
            return ;
        end;
    end;
    v31.logImpression = function(v54, v55, v56, v57)
        local l_props_3 = v31.props;
        local l_state_3 = v31.state;
        local l_selectedTab_2 = l_state_3.selectedTab;
        local v61 = if not l_state_3.selectedCategory then nil else l_state_3.selectedCategory.name;
        if not l_props_3.LogAssetImpression then
            return ;
        else
            return l_props_3.LogAssetImpression(v54, v57, v55, v56, l_props_3.AbsoluteSize, l_props_3.AbsolutePosition, {
                audioType = l_selectedTab_2, 
                categoryName = v61
            });
        end;
    end;
end;
v29.didMount = function(v62)
    local l_props_4 = v62.props;
    local v64 = tonumber((v24()));
    if v64 then
        l_props_4.getAssetPreviewDataForStartup(v64, l_props_4.TryInsert, l_props_4.Localization, v62.props.Network.networkInterface, l_props_4.OnAssetPreviewButtonClicked);
    end;
    if v62.sizerRef.current then
        v62.onAbsoluteSizeChanged(v62.sizerRef.current);
    end;
end;
v29.render = function(v65)
    local l_props_5 = v65.props;
    local l_state_4 = v65.state;
    local l_AssetSections_0 = l_props_5.AssetSections;
    local l_CanInsertAsset_0 = l_props_5.CanInsertAsset;
    local l_SortName_0 = l_props_5.SortName;
    local l_TryInsert_0 = l_props_5.TryInsert;
    local v72 = not not l_AssetSections_0[#l_AssetSections_0] and l_AssetSections_0[#l_AssetSections_0].name or nil;
    local l_selectedTab_3 = l_state_4.selectedTab;
    local l_selectedCategory_0 = l_state_4.selectedCategory;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local v76 = nil;
    if l_selectedCategory_0 then
        v76 = {
            l_selectedCategory_0.name
        };
    end;
    return v3.createElement(l_Pane_0, v26.join({
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = v65.sizerRef, 
        [v3.Change.AbsoluteSize] = v65.onAbsoluteSizeChanged
    }, l_props_5.WrapperProps), {
        Results = v5.Generator({
            networkInterface = v65.props.Network.networkInterface, 
            categoryName = l_selectedTab_3, 
            sortName = l_SortName_0, 
            queryParams = {}, 
            sectionName = v72, 
            initialPageSize = 20, 
            tags = v76, 
            render = function(v77)
                return v10.Generator({
                    Assets = v77.assets, 
                    Loading = v77.loading, 
                    Total = v77.total, 
                    FetchNextPage = v77.fetchNextPage, 
                    TryInsert = l_TryInsert_0, 
                    CanInsertAsset = l_CanInsertAsset_0, 
                    RenderTopContent = v65.renderTopContent, 
                    AudioType = l_selectedTab_3, 
                    LogImpression = v65.logImpression, 
                    OnAssetPreviewButtonClicked = l_props_5.OnAssetPreviewButtonClicked, 
                    ParentAbsoluteSize = l_props_5.AbsoluteSize, 
                    TryOpenAssetConfig = l_props_5.TryOpenAssetConfig
                });
            end
        })
    });
end;
return l_withAbsoluteSizeAndPosition_0((v4.connect(function()
    return {};
end, function(v78)
    return {
        SearchWithOptions = function(v79, v80, v81)
            v78(v17(v79, v80, v81));
        end, 
        getPageInfoAnalyticsContextInfo = function()
            return v78(v16());
        end, 
        getAssetPreviewDataForStartup = function(v82, v83, v84, v85, v86)
            v78(v23(v82, v83, v84, v85, v86));
        end
    };
end)((l_withContext_0({
    AssetAnalytics = v15, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v18, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v19
})(v29)))));
