local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Sort);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Dash);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_LinkText_0 = v3.UI.LinkText;
local l_Pane_0 = v3.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_script_FirstAncestor_0.Core.Components.Categorization.AssetSwimlane);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v15 = require(l_script_FirstAncestor_0.Core.Util.Layouter);
local v16 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedCategoryMap);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local v19 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v21 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v22 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v23 = v2.PureComponent:extend("SubcategoriesSwimlaneView");
v23.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v23.init = function(v24)
    v24.onClickBack = function(_)
        local l_OnClickBack_0 = v24.props.OnClickBack;
        if l_OnClickBack_0 then
            l_OnClickBack_0();
        end;
    end;
    v24.onClickSeeAllAssets = function(_, _, _, _, v31)
        local l_props_0 = v24.props;
        local l_CategoryName_0 = l_props_0.CategoryName;
        local l_OnClickSeeAllAssets_0 = l_props_0.OnClickSeeAllAssets;
        local l_SortName_0 = l_props_0.SortName;
        if l_OnClickSeeAllAssets_0 then
            l_OnClickSeeAllAssets_0(nil, l_CategoryName_0, l_SortName_0, nil, v31.queryParams);
        end;
    end;
    v24.renderSwimlanes = function()
        local l_props_1 = v24.props;
        local _ = v24.state;
        local l_CategoryName_1 = l_props_1.CategoryName;
        local _ = l_props_1.Localization;
        local _ = l_props_1.Size;
        local _ = l_props_1.SectionName;
        local v42 = l_props_1.SortName or v4.getDefaultSortNameForCategory(l_CategoryName_1);
        local l_SubcategoryDict_0 = l_props_1.SubcategoryDict;
        local _ = l_props_1.Stylizer;
        local l_IncludeUnverifiedCreators_0 = l_props_1.IncludeUnverifiedCreators;
        local l_CanInsertAsset_0 = l_props_1.CanInsertAsset;
        local l_TryInsert_0 = l_props_1.TryInsert;
        local l_TryOpenAssetConfig_0 = l_props_1.TryOpenAssetConfig;
        local l_OnClickSeeAllAssets_1 = l_props_1.OnClickSeeAllAssets;
        local v50 = v15.getSwimlaneWidth(l_props_1.AbsoluteSize.X);
        local l_OnAssetPreviewButtonClicked_0 = l_props_1.OnAssetPreviewButtonClicked;
        local v52 = {};
        local v54 = v6.reduce(l_SubcategoryDict_0, function(v53)
            return v53 + 1;
        end, 1);
        for v55, v56 in pairs(l_SubcategoryDict_0) do
            v52["AssetSwimlane_" .. v55] = v2.createElement(v13, {
                CanInsertAsset = l_CanInsertAsset_0, 
                CategoryName = l_CategoryName_1, 
                SwimlaneCategory = v56.name, 
                OnClickSeeAll = function(v57, v58, v59, _)
                    return v24.onClickSeeAllAssets(v57, v58, v59, nil, v56, v56.queryParams);
                end, 
                NetworkInterface = l_props_1.Network.networkInterface, 
                ShouldLogAssetOnMount = false, 
                SortName = v42, 
                SearchTerm = v56.searchKeywords, 
                IncludeUnverifiedCreators = l_IncludeUnverifiedCreators_0, 
                QualityFilterData = if not v22() then nil else l_props_1.QualityFilterData, 
                QueryParams = v56.queryParams, 
                InitialPageSize = 20, 
                LayoutOrder = v56.index, 
                LogAssetImpression = l_props_1.LogAssetImpression, 
                OnClickSeeAllAssets = l_OnClickSeeAllAssets_1, 
                OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_0, 
                OnSearchByCreator = if not v21() then nil else l_props_1.OnSearchByCreator, 
                PathName = v56.name, 
                ParentAbsolutePosition = l_props_1.AbsolutePosition, 
                ParentAbsoluteSize = l_props_1.AbsoluteSize, 
                SwimlaneWidth = v50, 
                Title = v56.displayName, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
                ZIndex = v54 - v56.index, 
                searchSource = v19.SEARCH_SOURCE.CATEGORY
            });
        end;
        return v52;
    end;
end;
v23.render = function(v61)
    local l_props_2 = v61.props;
    local l_CategoryName_2 = l_props_2.CategoryName;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Localization_1 = l_props_2.Localization;
    local l_Size_1 = l_props_2.Size;
    local _ = l_props_2.SectionName;
    if not l_props_2.SortName then
        local _ = v4.getDefaultSortNameForCategory(l_CategoryName_2);
    end;
    local _ = l_props_2.SubcategoryDict;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local _ = l_props_2.CanInsertAsset;
    local _ = l_props_2.TryInsert;
    local _ = l_props_2.TryOpenAssetConfig;
    local _ = l_props_2.OnClickSeeAllAssets;
    return v2.createElement(l_Pane_0, v6.join({
        BackgroundColor3 = l_Stylizer_1.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_1
    }, l_props_2.WrapperProps), {
        ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            EnableScrollBarBackground = true, 
            LayoutOrder = l_LayoutOrder_0, 
            Padding = v19.MAIN_VIEW_PADDING, 
            Size = l_Size_1
        }, {
            Contents = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = l_Stylizer_1.backgroundColor, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Spacing = 20, 
                Size = UDim2.new(1, 0, 0, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, v6.join({
                BackButton = v2.createElement(l_LinkText_0, {
                    LayoutOrder = -1, 
                    OnClick = v61.onClickBack, 
                    Style = "Unobtrusive", 
                    Text = "< " .. l_Localization_1:getText("General", "BackToHome", {
                        assetType = v16(l_Localization_1)[l_props_2.CategoryName]
                    })
                })
            }, (v61.renderSwimlanes())))
        })
    });
end;
mapStateToProps = function(v75, _)
    local v77 = (v75 or {}).pageInfo or {};
    return {
        IncludeUnverifiedCreators = v77.includeUnverifiedCreators, 
        QualityFilterData = if not v22() then nil else v77.qualityFilterData
    };
end;
return l_withAbsoluteSizeAndPosition_0((v5.connect(mapStateToProps)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v9
})(v23)))));
