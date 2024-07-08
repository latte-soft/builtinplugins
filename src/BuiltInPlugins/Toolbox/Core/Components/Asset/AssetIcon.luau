local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.Images);
local v10 = require(l_Util_0.Urls);
local v11 = require(l_Parent_0.Core.Types.Category);
local v12 = require(l_Parent_0.Core.Components.Asset.AssetIconBadge);
local v13 = require(l_Parent_0.Core.Components.Asset.AssetBackground);
local v14 = require(l_Parent_0.Core.Components.Audio.AudioPreviewButton);
local v15 = require(l_Parent_0.Core.Components.Audio.AudioProgressBar);
local v16 = require(l_Parent_0.Core.Components.ImageWithDefault);
local v17 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v18 = require(l_Parent_0.Core.Components.Asset.Preview.PopUpWrapperButton);
local v19 = require(l_Parent_0.Core.ContextServices.ModalContext);
local l_ImageCarousel_0 = v4.UI.ImageCarousel;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v23 = v2.PureComponent:extend("AssetIcon");
local v24 = UDim2.new(1, -14, 0, 14);
local v25 = UDim2.new(0, 14, 0, 14);
local v26 = UDim2.new(0, 16, 0, 16);
v23._createImageDataForCarousel = function(v27, v28, v29)
    local v30 = v27.props or v29;
    local v31 = nil;
    local l_assetMediaIds_0 = v30.assetMediaIds;
    if type(l_assetMediaIds_0) == "table" and #l_assetMediaIds_0 > 0 then
        v31 = if not v28 then {
            v27.thumbnailUrl
        } else {
            v30.assetId
        };
        v5.forEach(l_assetMediaIds_0, function(v33)
            if not v28 then
                table.insert(v31, (v10.constructAssetThumbnailUrl(v33, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE)));
                return ;
            else
                table.insert(v31, v33);
                return ;
            end;
        end);
    end;
    return v31;
end;
v23.init = function(v34, v35)
    v34.thumbnailUrl = v10.constructAssetThumbnailUrl(v35.assetId, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    v34.state = {
        isHovered = false, 
        imageUrlsForCarousel = v34:_createImageDataForCarousel(false, v35), 
        imageIdsForCarousel = v34:_createImageDataForCarousel(true, v35)
    };
    v34.onMouseEnter = function()
        v34:setState({
            isHovered = true
        });
        v35.Modal.onTooltipTriggered(v35.assetId, v8.TOOLTIP_TYPE.ASSET_ICON);
    end;
    v34.onMouseLeave = function()
        v34:setState({
            isHovered = false
        });
    end;
    v34.onAssetPreviewButtonClicked = function()
        v34.props.onAssetPreviewButtonClicked();
    end;
    v34.assetMediaLogged = {};
    v34.LogAssetMediaImpression = function(v36, _)
        local l_assetTileLocation_0 = v35.assetTileLocation;
        local v39 = l_assetTileLocation_0 == v8.ASSET_TILE_LOCATION.MORE_FROM;
        if not v34.assetMediaLogged[v36] then
            v34.assetMediaLogged[v36] = true;
            v34.props.AssetAnalytics:get():logAssetMediaImpression(v34.props.assetData, v34.state.imageIdsForCarousel[v36], v36, v34.props.searchId, if not v39 then if l_assetTileLocation_0 == v8.ASSET_TILE_LOCATION.BROWSE then v8.ASSET_MEDIA_IMPRESSION_SOURCE.ON_HOVER_BROWSE else "" else v8.ASSET_MEDIA_IMPRESSION_SOURCE.ON_HOVER_MORE_FROM, if not v39 then nil else v34.props.originalAssetId);
            return ;
        else
            return ;
        end;
    end;
    v34.OnImageCarouselChange = function(v40, v41)
        v34.LogAssetMediaImpression(v40, v41);
    end;
    v34.OnSetImageCarouselImages = function(v42)
        v34.LogAssetMediaImpression(v42, true);
    end;
end;
v23.didUpdate = function(v43, v44)
    local l_props_0 = v43.props;
    if v44.assetId ~= l_props_0.assetId then
        v43.thumbnailUrl = v10.constructAssetThumbnailUrl(l_props_0.assetId, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v8.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    end;
    if v44.assetMediaIds ~= l_props_0.assetMediaIds then
        v43:setState({
            imageUrlsForCarousel = v43:_createImageDataForCarousel(false, nil), 
            imageIdsForCarousel = v43:_createImageDataForCarousel(true, nil)
        });
    end;
end;
v23.render = function(v46)
    local l_props_1 = v46.props;
    local l_assetId_0 = l_props_1.assetId;
    local l_assetName_0 = l_props_1.assetName;
    local v50 = l_props_1.LayoutOrder or 0;
    local l_backgroundIndex_0 = l_props_1.backgroundIndex;
    local l_isEndorsed_0 = l_props_1.isEndorsed;
    local l_typeId_0 = l_props_1.typeId;
    local l_isPackage_0 = l_props_1.isPackage;
    local l_currentSoundId_0 = l_props_1.currentSoundId;
    local l_isLoading_0 = l_props_1.isLoading;
    local l_onMouseEnter_0 = v46.onMouseEnter;
    local l_onMouseLeave_0 = v46.onMouseLeave;
    local l_isHovered_0 = v46.state.isHovered;
    local l_isHovered_1 = l_props_1.isHovered;
    local l_status_0 = l_props_1.status;
    local l_thumbnailUrl_0 = v46.thumbnailUrl;
    local v63 = l_props_1.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v8.TOOLTIP_TYPE.ASSET_ICON);
    local v64 = l_typeId_0 == Enum.AssetType.Audio.Value;
    local v65 = l_status_0 and v9.AssetStatus[l_status_0];
    return v2.createElement(v13, {
        backgroundIndex = l_backgroundIndex_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
        ZIndex = 1, 
        LayoutOrder = v50, 
        [v2.Event.MouseEnter] = l_onMouseEnter_0, 
        [v2.Event.MouseLeave] = l_onMouseLeave_0
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v8.ASSET_CORNER_RADIUS)
        }), 
        AssetImage = if v46.state.imageUrlsForCarousel ~= nil then v2.createElement(l_ImageCarousel_0, {
            AutoAdvanceTimer = v8.ASSET_TILE_IMAGE_CAROUSEL_AUTO_ADVANCE_TIMER, 
            ImageScaleType = Enum.ScaleType.Crop, 
            ImageCornerRadius = v8.ASSET_CORNER_RADIUS, 
            ImageStrings = v46.state.imageUrlsForCarousel, 
            OnImageChange = v46.OnImageCarouselChange, 
            OnImageChangeTransparencyThreshold = v8.IMAGE_CAROUSEL_ON_IMAGE_CHANGE_TRANSPARENCY_THRESHOLD, 
            OnSetImages = v46.OnSetImageCarouselImages, 
            ResetWhenHoveredOff = true, 
            Size = UDim2.new(1, 0, 1, 0)
        }) else v2.createElement(v16, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = l_thumbnailUrl_0, 
            defaultImage = ""
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v8.ASSET_CORNER_RADIUS)
            })
        }), 
        Badge = if l_isEndorsed_0 or l_isPackage_0 then v2.createElement(v12, {
            assetId = l_assetId_0, 
            isPackage = l_isPackage_0, 
            floatLeft = v64
        }) else nil, 
        PreviewAudioButton = v64 and v2.createElement(v14, {
            ZIndex = 3, 
            assetId = l_assetId_0, 
            currentSoundId = l_currentSoundId_0, 
            isLoading = l_isLoading_0
        }), 
        AudioProgressBar = v64 and v2.createElement(v15, {
            AnchorPoint = Vector2.new(0, 1), 
            assetId = l_assetId_0, 
            currentSoundId = l_currentSoundId_0, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, 2)
        }), 
        AssetPreviewTriggerButton = not (v11.getTabForCategoryName(l_props_1.categoryName) == v11.CREATIONS) and v2.createElement(v18, {
            position = v24, 
            ShowIcon = l_isHovered_1, 
            onClick = v46.onAssetPreviewButtonClicked, 
            ZIndex = 2
        }), 
        AssetStatus = (l_isHovered_1 and v65) and v2.createElement("ImageLabel", {
            Position = v25, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = v26, 
            Image = v65, 
            BackgroundTransparency = 1
        }), 
        TooltipWrapper = l_isHovered_0 and v2.createElement(v17, {
            Text = l_assetName_0, 
            canShowCurrentTooltip = v63, 
            isHovered = l_isHovered_0
        })
    });
end;
return v3.connect(function(v66, v67)
    v66 = v66 or {};
    local v68 = if v66.assets.idToAssetMap ~= nil then v66.assets.idToAssetMap[v67.assetId] else nil;
    local v69 = v66.sound or {};
    local v70 = v66.pageInfo or {};
    local v71 = v70.selectedBackgroundIndex or 1;
    local v72 = v70.hoveredBackgroundIndex or 0;
    return {
        assetData = v68, 
        assetMediaIds = if not not v68 and v68.Asset then v68.Asset.AssetMediaIds else nil, 
        backgroundIndex = v72 ~= 0 and v72 or v71, 
        categoryName = v70.categoryName or v11.DEFAULT.name, 
        elapsedTime = v69.elapsedTime or 0, 
        searchId = v70.searchId, 
        totalTime = v69.totalTime or 0
    };
end, nil)((l_withContext_0({
    AssetAnalytics = v7, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v19
})(v23)));
