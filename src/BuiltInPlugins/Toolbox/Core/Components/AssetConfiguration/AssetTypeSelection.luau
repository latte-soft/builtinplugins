local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.AssetConfigConstants);
local v7 = require(l_Util_0.AssetConfigUtil);
local v8 = require(l_Util_0.getAllowedAssetTypeEnums);
local v9 = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local l_Components_0 = l_Parent_0.Core.Components;
local v11 = require(l_Components_0.NavButton);
local v12 = require(l_Components_0.AssetConfiguration.AssetThumbnailPreview);
local v13 = require(l_Components_0.AssetConfiguration.DefaultThumbnailPreview);
local v14 = require(l_Components_0.AssetConfiguration.AssetTypeSelector);
local l_UseDefaultThumbnailForAnimation_0 = game:GetFastFlag("UseDefaultThumbnailForAnimation");
local l_Actions_0 = l_Parent_0.Core.Actions;
local _ = require(l_Actions_0.SetCurrentScreen);
local v18 = require(l_Actions_0.SetUploadAssetType);
local v19 = require(l_Parent_0.Core.Thunks.AssetConfiguration.GoToNextScreen);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v22 = v2.PureComponent:extend("AssetTypeSelection");
v22.didMount = function(v23)
    if v23:canSkip() then
        v23.props.goToNextScreen();
    end;
end;
v22.getSelectorItems = function(v24)
    local v25 = {
        {
            name = "Game development assets", 
            selectable = false
        }, 
        {
            name = "Model", 
            selectable = true, 
            type = Enum.AssetType.Model
        }
    };
    table.insert(v25, {
        name = "Animation", 
        selectable = true, 
        type = Enum.AssetType.Animation
    });
    local v26 = v8(v24.props.allowedAssetTypesForRelease);
    if #v26 > 0 then
        v25[#v25 + 1] = {
            name = v24.props.Localization:getText("General", "CategoryCreationsCatalogSectionDivider") or "", 
            selectable = false
        };
        for _, v28 in pairs(v26) do
            v25[#v25 + 1] = {
                name = v9(v24.props.Localization)[v28] or "", 
                selectable = true, 
                type = v28
            };
        end;
    end;
    return v25;
end;
v22.canSkip = function(v29)
    if not v7.isBuyableMarketplaceAsset(v29.props.assetTypeEnum) then
        local v30 = 0;
        for _, v32 in pairs(v29:getSelectorItems()) do
            if v32.selectable then
                v30 = v30 + 1;
            end;
        end;
        return v30 == 2;
    else
        return true;
    end;
end;
v22.render = function(v33)
    local l_props_0 = v33.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v36 = l_UseDefaultThumbnailForAnimation_0 and v33.props.assetTypeEnum == Enum.AssetType.Animation;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeSelection.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        AssetThumbnailPreview = not v36 and v2.createElement(v12, {
            Size = UDim2.new(0, 150, 0, 186), 
            Position = UDim2.new(0.5, -75, 0, 48), 
            titleHeight = 24, 
            titlePadding = 12
        }), 
        DefaultThumbnailPreview = v36 and v2.createElement(v13, {
            Size = UDim2.new(0, 150, 0, 186), 
            Position = UDim2.new(0.5, -75, 0, 48)
        }), 
        AssetTypeSelector = v2.createElement(v14, {
            Position = UDim2.new(0.5, -200, 0, 310), 
            height = 40, 
            width = 400, 
            assetTypeEnum = v33.props.assetTypeEnum, 
            onAssetTypeSelected = v33.props.onAssetTypeSelected, 
            items = v33:getSelectorItems()
        }), 
        Footer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 62), 
            Position = UDim2.new(0, 0, 1, -62), 
            BackgroundColor3 = l_Stylizer_0.typeSelection.configFooter.background, 
            BorderColor3 = l_Stylizer_0.typeSelection.configFooter.border
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 24), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 24)
            }), 
            CancelButton = v2.createElement(v11, {
                Size = UDim2.new(0, 120, 0, 32), 
                LayoutOrder = 0, 
                titleText = "Cancel", 
                onClick = l_props_0.onClose
            }), 
            NextButton = v2.createElement(v11, {
                Size = UDim2.new(0, 120, 0, 32), 
                LayoutOrder = 1, 
                titleText = "Next", 
                isPrimary = true, 
                onClick = function()
                    v33.props.goToNextScreen();
                end
            })
        })
    });
end;
return v3.connect(function(v37, _)
    v37 = v37 or {};
    return {
        instances = v37.instances, 
        currentScreen = v37.currentScreen, 
        screenFlowType = v37.screenFlowType, 
        allowedAssetTypesForRelease = v37.allowedAssetTypesForRelease, 
        assetTypeEnum = v37.assetTypeEnum
    };
end, function(v39)
    return {
        goToNextScreen = function()
            v39(v19());
        end, 
        onAssetTypeSelected = function(v40)
            v39(v18(v40));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v22)));
