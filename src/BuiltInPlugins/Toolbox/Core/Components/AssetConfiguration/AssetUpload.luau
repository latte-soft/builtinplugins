local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.AssetConfigConstants);
local l_PreviewTypes_0 = v6.PreviewTypes;
local v8 = require(l_Util_0.AssetConfigUtil);
local v9 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v13 = require(l_AssetConfiguration_0.LoadingBarWrapper);
local v14 = require(l_AssetConfiguration_0.ProgressBarWrapper);
local v15 = require(l_AssetConfiguration_0.AssetThumbnailPreview);
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFilterMeshPartsInBundleUpload);
local v17 = v2.PureComponent:extend("AssetUpload");
v17.init = function(v18, _)
    v18.state = {
        isLoading = true
    };
end;
v17.render = function(v20)
    local l_props_0 = v20.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v23 = v8.getPreviewType(l_props_0.assetTypeEnum, l_props_0.instances);
    local v24 = v23 == l_PreviewTypes_0.ModelPreview;
    local v25 = true;
    if v23 ~= l_PreviewTypes_0.Thumbnail then
        v25 = v23 == l_PreviewTypes_0.ImagePicker;
    end;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        ModelPreview = v24 and v2.createElement(v15, {
            title = l_props_0.assetName, 
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186), 
            AssetType = if not v16() then nil else l_props_0.assetTypeEnum, 
            AllowedBundleTypeSettings = if not not v16() and v8.isUGCBundleType(l_props_0.assetTypeEnum) then l_props_0.allowedBundleTypeSettings else nil
        }), 
        ThumbnailPreview = v25 and v2.createElement("ImageLabel", {
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v8.getResultThumbnail(l_props_0.assetId, l_props_0.iconFile), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        LoadingBar = if not v8.isUGCBundleType(l_props_0.assetTypeEnum) then v2.createElement(v13, {
            loadingText = "Uploading", 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_props_0.uploadSucceeded ~= nil and l_props_0.onNext or nil
        }) else v2.createElement(v14, {
            onFinish = l_props_0.onNext
        })
    });
end;
return v3.connect(function(v26, _)
    v26 = v26 or {};
    return {
        uploadSucceeded = v26.uploadSucceeded, 
        instances = v26.instances, 
        assetId = v26.assetId, 
        assetName = not not v26.changed and v26.changed.AssetConfigName or v26.assetName, 
        screenFlowType = v26.screenFlowType, 
        assetTypeEnum = v26.assetTypeEnum, 
        thumbnailStatus = v26.thumbnailStatus, 
        iconFile = v26.iconFile, 
        allowedBundleTypeSettings = if not v16() then nil else v26.allowedBundleTypeSettings
    };
end, function(v28)
    return {
        onNext = function()
            v28(v9(v6.SCREENS.UPLOAD_ASSET_RESULT));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v17)));
