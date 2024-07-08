local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.Constants);
local v7 = require(l_Parent_0.Src.Actions.SetCurrentScreen);
local l_Components_0 = l_Parent_0.Src.Components;
local v9 = require(l_Components_0.ConvertToPackageWindow.LoadingBar);
local v10 = require(l_Components_0.ConvertToPackageWindow.AssetThumbnailPreview);
local v11 = v2.PureComponent:extend("AssetUpload");
v11.init = function(v12, _)
    v12.state = {
        isLoading = true
    };
end;
v11.render = function(v14)
    local l_props_0 = v14.props;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_props_0.Stylizer.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        ModelPreview = v2.createElement(v10, {
            titleHeight = 24, 
            titlePadding = 12, 
            title = l_props_0.assetName, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        LoadingBar = v2.createElement(v9, {
            loadingText = l_props_0.Localization:getText("Action", "Converting"), 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_props_0.uploadSucceeded ~= nil and l_props_0.onNext or nil
        })
    });
end;
return v3.connect(function(v16, _)
    v16 = v16 or {};
    return {
        uploadSucceeded = v16.AssetConfigReducer.uploadSucceeded, 
        assetId = v16.AssetConfigReducer.assetId, 
        assetName = v16.AssetConfigReducer.assetName
    };
end, function(v18)
    return {
        onNext = function()
            v18(v7(v6.SCREENS.UPLOAD_ASSET_RESULT));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11)));
