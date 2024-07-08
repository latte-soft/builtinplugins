local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local l_DisableSalesPageForAvatarCreations2_0 = game:GetFastFlag("DisableSalesPageForAvatarCreations2");
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v11 = require(l_AssetConfiguration_0.SalesComponent);
local v12 = require(l_AssetConfiguration_0.PriceComponent);
local v13 = require(l_Parent_0.Core.Actions.SetFieldError);
local v14 = if not l_DisableSalesPageForAvatarCreations2_0 then nil else require(l_Parent_0.Core.Util.Urls);
local v15 = if not l_DisableSalesPageForAvatarCreations2_0 then nil else v7.UI.ScrollingFrame;
local l_Separator_0 = v7.UI.Separator;
local v17 = if not l_DisableSalesPageForAvatarCreations2_0 then nil else v7.UI.TextWithInlineLink;
local l_GetTextSize_0 = v7.Util.GetTextSize;
local l_Util_0 = l_Parent_0.Core.Util;
local v20 = require(l_Util_0.Constants);
local v21 = require(l_Util_0.LayoutOrderIterator);
local v22 = require(l_Util_0.AssetConfigUtil);
local v23 = require(l_Util_0.AssetConfigConstants);
local v24 = if not l_DisableSalesPageForAvatarCreations2_0 then nil else 30;
local v25 = if not l_DisableSalesPageForAvatarCreations2_0 then nil else 500;
local v26 = v5.PureComponent:extend("SalesPage");
v26.init = function(v27)
    v27.frameRef = v5.createRef();
    if l_DisableSalesPageForAvatarCreations2_0 then
        v27.openCreatorDashboardConfigureLink = function()
            local v28 = v14.constructCreatorDashboardAssetConfigUrl(v27.props.assetId);
            if v28 and v28 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v28);
            end;
        end;
    end;
end;
v26.didMount = function(v29)
    v29.props.setFieldError(v23.FIELD_NAMES.Price, not v29.props.isPriceValid);
end;
v26.willUpdate = function(v30, v31, _)
    local l_isPriceValid_0 = v30.props.isPriceValid;
    if l_isPriceValid_0 ~= v31.isPriceValid then
        v30.props.setFieldError(v23.FIELD_NAMES.Price, not l_isPriceValid_0);
    end;
end;
if l_DisableSalesPageForAvatarCreations2_0 then
    v26.renderCreatorDashboardLinkContent = function(v34)
        local l_Stylizer_0 = v34.props.Stylizer;
        local l_props_0 = v34.props;
        return v5.createElement(v15, {
            Size = l_props_0.size, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.layoutOrder, 
            [v5.Ref] = v34.frameRef
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 30), 
                PaddingBottom = UDim.new(0, 30), 
                PaddingLeft = UDim.new(0, v24), 
                PaddingRight = UDim.new(0, v24)
            }), 
            Body = v5.createElement(v17, {
                OnLinkClicked = v34.openCreatorDashboardConfigureLink, 
                Text = v34.props.Localization:getText("General", "CreatorDashboardLinkMessage", {
                    creatorDashboardLink = "{creatorDashboardLink}"
                }), 
                LinkText = v34.props.Localization:getText("General", "CreatorDashboard", {
                    creatorDashboardLink = "{creatorDashboardLink}"
                }), 
                LinkPlaceholder = "{creatorDashboardLink}", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                MaxWidth = v25, 
                TextProps = {
                    BackgroundTransparency = 1, 
                    Font = v20.FONT, 
                    TextColor3 = l_Stylizer_0.TextColor, 
                    TextSize = v20.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Center
                }
            })
        });
    end;
end;
v26.render = function(v37)
    if not l_DisableSalesPageForAvatarCreations2_0 or not v22.isCatalogAsset(v37.props.assetTypeEnum) then
        local l_Stylizer_1 = v37.props.Stylizer;
        local l_props_1 = v37.props;
        local l_size_0 = l_props_1.size;
        local l_newAssetStatus_0 = l_props_1.newAssetStatus;
        local l_currentAssetStatus_0 = l_props_1.currentAssetStatus;
        local l_onStatusChange_0 = l_props_1.onStatusChange;
        local l_assetTypeEnum_0 = l_props_1.assetTypeEnum;
        local l_allowedAssetTypesForRelease_0 = l_props_1.allowedAssetTypesForRelease;
        local l_price_0 = l_props_1.price;
        local l_minPrice_0 = l_props_1.minPrice;
        local l_maxPrice_0 = l_props_1.maxPrice;
        local l_feeRate_0 = l_props_1.feeRate;
        local l_onPriceChange_0 = l_props_1.onPriceChange;
        local l_isPriceValid_1 = l_props_1.isPriceValid;
        local l_layoutOrder_0 = l_props_1.layoutOrder;
        local v53 = v22.isReadyForSale(l_newAssetStatus_0);
        if v22.isBuyableMarketplaceAsset(l_assetTypeEnum_0) then
            v53 = true;
        end;
        local v54 = l_allowedAssetTypesForRelease_0[l_assetTypeEnum_0.Name];
        local v55 = v22.isCatalogAsset(l_props_1.assetTypeEnum);
        if l_DisableSalesPageForAvatarCreations2_0 then
            v55 = false;
        end;
        local v56 = nil;
        local v57 = nil;
        if v55 then
            v56 = string.format(l_ContentProvider_0.BaseUrl .. "catalog/configure?id=%d#/sales", l_props_1.assetId);
            v57 = l_GetTextSize_0(l_props_1.Localization:getText("General", "PremiumBenefits"), nil, nil, Vector2.new(0, 0));
        end;
        local v58 = v21.new();
        return v5.createElement("ScrollingFrame", {
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            [v5.Ref] = v37.frameRef
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 30), 
                PaddingBottom = UDim.new(0, 30), 
                PaddingLeft = UDim.new(0, 30), 
                PaddingRight = UDim.new(0, 30)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 32), 
                [v5.Change.AbsoluteContentSize] = function(v59)
                    if v37.frameRef.current then
                        v37.frameRef.current.CanvasSize = UDim2.new(l_size_0.X.Scale, l_size_0.X.Offset, 0, v59.AbsoluteContentSize.y + 60);
                    end;
                end
            }), 
            SalesStatus = v5.createElement(v11, {
                Title = l_props_1.Localization:getText("General", "SalesSale"), 
                AssetTypeEnum = l_assetTypeEnum_0, 
                NewAssetStatus = l_newAssetStatus_0, 
                CurrentAssetStatus = l_currentAssetStatus_0, 
                OnStatusChange = l_onStatusChange_0, 
                CanChangeSalesStatus = v53, 
                LayoutOrder = v58:getNextOrder()
            }), 
            Separator1 = v5.createElement(l_Separator_0, {
                LayoutOrder = v58:getNextOrder()
            }), 
            PriceComponent = v54 and v5.createElement(v12, {
                AssetTypeEnum = l_assetTypeEnum_0, 
                AllowedAssetTypesForRelease = l_allowedAssetTypesForRelease_0, 
                NewAssetStatus = l_newAssetStatus_0, 
                Price = l_price_0, 
                MinPrice = l_minPrice_0, 
                MaxPrice = l_maxPrice_0, 
                FeeRate = l_feeRate_0, 
                IsPriceValid = l_isPriceValid_1, 
                OnPriceChange = l_onPriceChange_0, 
                LayoutOrder = v58:getNextOrder()
            }), 
            Separator2 = not not v55 and v5.createElement(l_Separator_0, {
                LayoutOrder = v58:getNextOrder()
            }) or nil, 
            PremiumBenefitsLink = not not v55 and v5.createElement("TextButton", {
                LayoutOrder = v58:getNextOrder(), 
                BackgroundTransparency = 1, 
                Font = v20.FONT, 
                Text = v37.props.Localization:getText("General", "PremiumBenefits"), 
                Size = UDim2.fromOffset(v57.X, v57.Y), 
                TextColor3 = l_Stylizer_1.link, 
                TextSize = v20.FONT_SIZE_MEDIUM, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v5.Event.Activated] = function()
                    l_GuiService_0:OpenBrowserWindow(v56);
                end
            }) or nil
        });
    else
        return v37:renderCreatorDashboardLinkContent();
    end;
end;
return v6.connect(function(v60, _)
    v60 = v60 or {};
    return {
        assetId = v60.assetId, 
        assetTypeEnum = v60.assetTypeEnum
    };
end, function(v62)
    return {
        setFieldError = function(v63, v64)
            v62(v13(v23.SIDE_TABS.Sales, v63, v64));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v26)));
