local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Packages_0.Framework).UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.LayoutOrderIterator);
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetConfigUtil);
local v12 = require(l_Util_0.AssetConfigConstants);
local v13 = v2.PureComponent:extend("SalesComponent");
v13.init = function(v14, _)
    v14.onToggle = function()
        local l_props_0 = v14.props;
        local l_CanChangeSalesStatus_0 = l_props_0.CanChangeSalesStatus;
        local _ = l_props_0.NewAssetStatus;
        local l_CurrentAssetStatus_0 = l_props_0.CurrentAssetStatus;
        local l_OnStatusChange_0 = l_props_0.OnStatusChange;
        if l_CanChangeSalesStatus_0 then
            l_OnStatusChange_0(not not v11.isOnSale(l_CurrentAssetStatus_0) and v12.ASSET_STATUS.OffSale or v12.ASSET_STATUS.OnSale);
        end;
    end;
end;
v13.render = function(v21)
    local l_Stylizer_0 = v21.props.Stylizer;
    local l_props_1 = v21.props;
    local l_Title_0 = l_props_1.Title;
    local l_NewAssetStatus_1 = l_props_1.NewAssetStatus;
    local _ = l_props_1.CurrentAssetStatus;
    local l_AssetTypeEnum_0 = l_props_1.AssetTypeEnum;
    local l_assetConfig_0 = l_Stylizer_0.assetConfig;
    local v29 = l_props_1.Localization:getText("AssetConfigSales", "Target", {
        market = not v11.isMarketplaceAsset(l_AssetTypeEnum_0) and "Catalog" or "Marketplace", 
        user = not v11.isMarketplaceAsset(l_AssetTypeEnum_0) and "user" or "developer"
    });
    local l_CanChangeSalesStatus_1 = l_props_1.CanChangeSalesStatus;
    local l_labelTextColor_0 = l_assetConfig_0.labelTextColor;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local v33 = v9.new();
    return v2.createElement(l_TitledFrame_0, {
        Title = l_Title_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ToggleButton = v2.createElement(l_ToggleButton_0, {
            Disabled = not l_CanChangeSalesStatus_1, 
            LayoutOrder = v33:getNextOrder(), 
            OnClick = v21.onToggle, 
            Selected = v11.isOnSale(l_NewAssetStatus_1), 
            Size = UDim2.new(0, 40, 0, 24)
        }), 
        Label = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            TextColor3 = l_labelTextColor_0, 
            BorderSizePixel = 0, 
            Font = v10.FONT, 
            TextSize = v10.FONT_SIZE_SMALL, 
            Text = v29, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = v33:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13));
