local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Dash);
local l_Pane_0 = v3.UI.Pane;
local v8 = require(l_Parent_0.Core.Util.Constants);
local v9 = require(l_Parent_0.Core.Util.Layouter);
local v10 = require(l_Parent_0.Core.ContextServices.Settings);
local v11 = require(l_Parent_0.Core.ContextServices.ModalContext);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local v13 = require(l_Parent_0.Core.Types.Category);
local v14 = require(l_Parent_0.Core.Components.Asset.Asset);
local v15 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v20 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v21 = v4.PureComponent:extend("AssetGrid");
v21.defaultProps = {
    AssetIds = {}, 
    Size = UDim2.new(1, 0, 1, 0)
};
v21.didMount = function(v22)
    v22.calculateRenderBounds();
    v22.updateTopContentHeight();
end;
v21.init = function(v23, _)
    v23.state = {
        displayedAssetIds = {}, 
        hoveredAssetId = 0, 
        isTopContentWithinView = true, 
        lowerIndexToRender = 0, 
        topContentHeight = 0, 
        upperIndexToRender = 0, 
        width = 0
    };
    v23.scrollingFrameRef = v4.createRef();
    v23.topContentRef = v4.createRef();
    v23.tryRerender = function(v25)
        local l_props_0 = v23.props;
        local l_current_0 = v23.scrollingFrameRef.current;
        if l_current_0 then
            if not (not (l_current_0.CanvasSize.Y.Offset - (l_current_0.CanvasPosition.Y + l_current_0.AbsoluteWindowSize.Y) < v8.DIST_FROM_BOTTOM_BEFORE_NEXT_PAGE) or not l_props_0.RequestNextPage) then
                l_props_0.RequestNextPage();
            end;
            v23.calculateRenderBounds(v25);
            return ;
        else
            return ;
        end;
    end;
    v23.calculateRenderBounds = function(v28)
        v23:setState(function(v29)
            local l_props_1 = v23.props;
            local v31 = v13.shouldShowPrices(l_props_1.categoryName);
            local l_lowerIndexToRender_0 = v29.lowerIndexToRender;
            local l_topContentHeight_0 = v29.topContentHeight;
            local v34 = (v29.width - 2 * v8.MAIN_VIEW_PADDING) - v8.SCROLLBAR_PADDING;
            local v35 = math.max(math.floor(l_lowerIndexToRender_0 / v9.getAssetsPerRow(v34)) * v9.getAssetCellHeightWithPadding(v31), 0);
            local v36 = l_topContentHeight_0 - v35;
            if l_topContentHeight_0 < v35 then
                v36 = 0;
            end;
            local v37, v38 = v9.calculateRenderBoundsForScrollingFrame(v23.scrollingFrameRef.current, v34, v36, v31);
            if not (not v28 and v37 == v29.lowerIndexToRender) or v38 ~= v29.upperIndexToRender then
                return {
                    displayedAssetIds = v9.sliceAssetsFromBounds(l_props_1.AssetIds or {}, v37, v38), 
                    lowerIndexToRender = v37, 
                    upperIndexToRender = v38
                };
            else
                return ;
            end;
        end);
    end;
    v23.onScroll = function(v39)
        if not v23.props.isPreviewing then
            v23.tryRerender();
        end;
        v23:setState(function(v40)
            local v41 = nil;
            if not (not v39 or not v23.props.RenderTopContent) then
                v41 = v39.CanvasPosition.Y <= v40.topContentHeight;
            end;
            if v40.hoveredAssetId ~= 0 then
                return {
                    hoveredAssetId = 0, 
                    isTopContentWithinView = v41
                };
            elseif v41 ~= v40.isTopContentWithinView then
                return {
                    isTopContentWithinView = v41
                };
            else
                return ;
            end;
        end);
    end;
    v23.onAssetHovered = function(v42)
        v23:setState(function(v43)
            local l_Modal_0 = v23.props.Modal;
            if not (v43.hoveredAssetId == 0) or not l_Modal_0.canHoverAsset() then
                return ;
            else
                return {
                    hoveredAssetId = v42
                };
            end;
        end);
    end;
    v23.onAssetHoverEnded = function(v45)
        v23:setState(function(v46)
            if v46.hoveredAssetId == v45 then
                return {
                    hoveredAssetId = 0
                };
            else
                return ;
            end;
        end);
    end;
    v23.onFocusLost = function(_, v48)
        if v48.UserInputType == Enum.UserInputType.Focus then
            v23.onAssetHoverEnded();
        end;
    end;
    v23.getAssetElements = function()
        local l_props_2 = v23.props;
        local l_state_0 = v23.state;
        local l_AbsoluteSize_0 = l_props_2.AbsoluteSize;
        local l_AbsolutePosition_0 = l_props_2.AbsolutePosition;
        local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
        local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
        local l_TryInsert_0 = l_props_2.TryInsert;
        local l_AssetMap_0 = l_props_2.AssetMap;
        local v57 = v13.shouldShowPrices(l_props_2.categoryName);
        local _ = nil;
        local v59 = {
            UIGridLayout = v4.createElement("UIGridLayout", {
                CellPadding = UDim2.new(0, v8.BETWEEN_ASSETS_HORIZONTAL_PADDING, 0, v8.BETWEEN_ASSETS_VERTICAL_PADDING), 
                CellSize = if not v57 then UDim2.new(0, v8.ASSET_WIDTH_NO_PADDING, 0, v8.ASSET_HEIGHT) else UDim2.new(0, v8.ASSET_WIDTH_NO_PADDING, 0, v8.ASSET_HEIGHT + v8.PRICE_HEIGHT), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v4.Event.Changed] = v23.tryRerender
            })
        };
        for v60, v61 in ipairs(l_state_0.displayedAssetIds) do
            local v62 = v61[1];
            v59[tostring(v62)] = v4.createElement(v14, {
                assetId = v62, 
                assetData = l_AssetMap_0[v62], 
                assetTileLocation = v8.ASSET_TILE_LOCATION.BROWSE, 
                canInsertAsset = l_CanInsertAsset_0, 
                isHovered = v62 == v23.state.hoveredAssetId, 
                LayoutOrder = v60, 
                logImpression = l_props_2.LogAssetImpression, 
                onAssetHovered = v23.onAssetHovered, 
                onAssetHoverEnded = v23.onAssetHoverEnded, 
                onAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                onSearchByCreator = if not v20() then nil else l_props_2.OnSearchByCreator, 
                parentSize = l_AbsoluteSize_0, 
                parentAbsolutePosition = l_AbsolutePosition_0, 
                tryInsert = l_TryInsert_0, 
                tryOpenAssetConfig = l_TryOpenAssetConfig_0
            });
        end;
        return v59;
    end;
    v23.calculateCanvasHeight = function()
        local l_props_3 = v23.props;
        return (v9.calculateAssetsHeight(#l_props_3.AssetIds, (v23.state.width - 2 * v8.MAIN_VIEW_PADDING) - v8.SCROLLBAR_PADDING, (v13.shouldShowPrices(l_props_3.categoryName))) + v8.ASSET_OUTLINE_EXTRA_HEIGHT) + 2 * v8.MAIN_VIEW_PADDING;
    end;
    v23.getWidth = function()
        v23:setState(function(v64)
            local l_current_1 = v23.scrollingFrameRef.current;
            if l_current_1 and v64.width ~= l_current_1.AbsoluteSize.X then
                return {
                    width = l_current_1.AbsoluteSize.X
                };
            else
                return ;
            end;
        end);
    end;
    v23.updateTopContentHeight = function()
        v23:setState(function(v66)
            local l_current_2 = v23.topContentRef.current;
            local v68 = not not l_current_2 and l_current_2.AbsoluteSize.Y or 0;
            if v68 ~= v66.topContentHeight then
                return {
                    topContentHeight = v68
                };
            else
                return ;
            end;
        end);
    end;
end;
v21.didUpdate = function(v69, v70, v71)
    local l_props_4 = v69.props;
    local l_state_1 = v69.state;
    local v74 = l_state_1.upperIndexToRender - l_state_1.lowerIndexToRender;
    local v75 = #(l_state_1.displayedAssetIds or {});
    local v76 = l_props_4.networkErrors or {};
    if not (not ((not v76[#v76] and v75 < v74) and v75 ~= 0) or not l_props_4.RequestNextPage) then
        l_props_4.RequestNextPage();
    end;
    if v70.AssetIds ~= l_props_4.AssetIds then
        v69:calculateRenderBounds(false);
    end;
    if not (v71.topContentHeight == l_state_1.topContentHeight) or v71.width ~= l_state_1.width then
        v69.tryRerender(true);
    end;
end;
v21.getDerivedStateFromProps = function(v77, v78)
    local v79 = v78.lowerIndexToRender or 0;
    local v80 = v78.upperIndexToRender or 0;
    local v81 = v9.sliceAssetsFromBounds(v77.AssetIds or {}, v79, v80);
    local v82 = false;
    for _, v84 in ipairs(v77.AssetIds) do
        if v78.hoveredAssetId == v84 then
            v82 = true;
            break;
        end;
    end;
    local _ = nil;
    return v2.Dictionary.join(v78, {
        displayedAssetIds = v81, 
        hoveredAssetId = not v82 and 0 or v78.hoveredAssetId, 
        lowerIndexToRender = v79, 
        upperIndexToRender = v80
    });
end;
v21.render = function(v86)
    local l_props_5 = v86.props;
    local l_state_2 = v86.state;
    local l_categoryName_0 = l_props_5.categoryName;
    local l_isPreviewing_0 = l_props_5.isPreviewing;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Position_0 = l_props_5.Position;
    local l_RenderTopContent_0 = l_props_5.RenderTopContent;
    local l_Size_0 = l_props_5.Size;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_lowerIndexToRender_1 = l_state_2.lowerIndexToRender;
    local l_topContentHeight_1 = l_state_2.topContentHeight;
    local l_width_0 = l_state_2.width;
    local v99 = v86.getAssetElements();
    local v100 = v86.calculateCanvasHeight();
    local v101 = math.max(math.floor(l_lowerIndexToRender_1 / v9.getAssetsPerRow((l_width_0 - 2 * v8.MAIN_VIEW_PADDING) - v8.SCROLLBAR_PADDING)) * v9.getAssetCellHeightWithPadding((v13.shouldShowPrices(l_categoryName_0))), 0);
    local v102 = l_topContentHeight_1 - v101;
    if l_topContentHeight_1 < v101 then
        v102 = 0;
    end;
    local v103 = not not l_RenderTopContent_0 and l_RenderTopContent_0() or nil;
    if v103 then
        v101 = v101 + 10;
    end;
    v103 = v86.state.isTopContentWithinView and v103;
    return v4.createElement(l_Pane_0, v6.join({
        BackgroundColor = l_Stylizer_0.homeView.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, l_props_5.WrapperProps), {
        StyledScrollingFrame = v4.createElement(v15, {
            CanvasSize = UDim2.new(0, 0, 0, v100), 
            LayoutOrder = l_LayoutOrder_0, 
            onScroll = v86.onScroll, 
            scrollingEnabled = not l_isPreviewing_0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor = l_Stylizer_0.homeView.backgroundColor, 
            [v4.Ref] = v86.scrollingFrameRef, 
            OnAbsoluteSizeChanged = v86.getWidth
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v8.MAIN_VIEW_PADDING), 
                PaddingLeft = UDim.new(0, v8.MAIN_VIEW_PADDING), 
                PaddingRight = UDim.new(0, v8.MAIN_VIEW_PADDING), 
                PaddingTop = UDim.new(0, v8.MAIN_VIEW_PADDING)
            }), 
            TopContent = if not v103 then nil else v4.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_topContentHeight_1), 
                [v4.Change.AbsoluteSize] = v86.updateTopContentHeight, 
                [v4.Ref] = v86.topContentRef, 
                ZIndex = 2
            }, {
                v103
            }), 
            InnerGrid = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, v101 + v102), 
                Size = UDim2.new(1, 0, 1, -v102), 
                [v4.Event.InputEnded] = v86.onFocusLost
            }, v99)
        })
    });
end;
v21 = v5.connect(function(v104, v105)
    v104 = v104 or {};
    return {
        assetMap = v105.AssetMap, 
        categoryName = (v104.pageInfo or {}).categoryName or v13.DEFAULT.name, 
        isPreviewing = (v104.assets or {}).isPreviewing or false, 
        networkErrors = v104.networkErrors or {}
    };
end, nil)((l_withContext_0({
    Settings = v10, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v11
})(v21)));
TypedComponent = function(v106, v107)
    return v4.createElement(v21, v106, v107);
end;
return l_withAbsoluteSizeAndPosition_0(TypedComponent);
