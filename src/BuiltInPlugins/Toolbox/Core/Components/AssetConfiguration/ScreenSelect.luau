local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_Components_0 = l_Parent_0.Core.Components;
local v5 = require(l_Components_0.AssetConfiguration.AssetConfig);
local v6 = require(l_Components_0.AssetConfiguration.AssetTypeSelection);
local v7 = require(l_Components_0.AssetConfiguration.AssetValidation);
local v8 = require(l_Components_0.AssetConfiguration.AssetUpload);
local v9 = require(l_Components_0.AssetConfiguration.AssetUploadResult);
local v10 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local function _(v11)
    return v11 == v10.SCREENS.CONFIGURE_ASSET;
end;
local function _(v13)
    return v13 == v10.SCREENS.ASSET_TYPE_SELECTION;
end;
local function _(v15)
    return v15 == v10.SCREENS.ASSET_VALIDATION;
end;
local function _(v17)
    return v17 == v10.SCREENS.UPLOADING_ASSET;
end;
local function _(v19)
    return v19 == v10.SCREENS.UPLOAD_ASSET_RESULT;
end;
local v21 = v2.PureComponent:extend("ScreenSelect");
v21.render = function(v22)
    local l_props_0 = v22.props;
    local l_currentScreen_0 = l_props_0.currentScreen;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        AssetConfig = l_currentScreen_0 == v10.SCREENS.CONFIGURE_ASSET and v2.createElement(v5, {
            Size = UDim2.new(1, 0, 1, 0), 
            assetId = l_props_0.assetId, 
            assetTypeEnum = l_props_0.assetTypeEnum, 
            onClose = l_props_0.onClose, 
            pluginGui = l_props_0.pluginGui
        }), 
        AssetTypeSelection = l_currentScreen_0 == v10.SCREENS.ASSET_TYPE_SELECTION and v2.createElement(v6, {
            Size = UDim2.new(1, 0, 1, 0), 
            onClose = l_props_0.onClose
        }), 
        AssetValidation = l_currentScreen_0 == v10.SCREENS.ASSET_VALIDATION and v2.createElement(v7, {
            Size = UDim2.new(1, 0, 1, 0), 
            onClose = l_props_0.onClose
        }), 
        AssetUpload = l_currentScreen_0 == v10.SCREENS.UPLOADING_ASSET and v2.createElement(v8, {
            Size = UDim2.new(1, 0, 1, 0), 
            onClose = l_props_0.onClose
        }), 
        AssetUploadResult = l_currentScreen_0 == v10.SCREENS.UPLOAD_ASSET_RESULT and v2.createElement(v9, {
            Size = UDim2.new(1, 0, 1, 0), 
            onClose = l_props_0.onClose
        })
    });
end;
return v3.connect(function(v25, _)
    return {
        currentScreen = (v25 or {}).currentScreen
    };
end)(v21);
