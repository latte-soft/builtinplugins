local l_game_FastInt_0 = game:GetFastInt("ToolboxPriceTextBoxMaxCount");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_GetTextSize_0 = v4.Util.GetTextSize;
local v14 = require(l_Packages_0.Dash);
local l_Util_0 = l_Parent_0.Core.Util;
local v16 = require(l_Util_0.LayoutOrderIterator);
local v17 = require(l_Util_0.Constants);
local v18 = require(l_Util_0.AssetConfigUtil);
local v19 = require(l_Util_0.Images);
local v20 = require(l_Util_0.ToolboxUtilities);
local l_GuiService_0 = game:GetService("GuiService");
local v22 = v3.PureComponent:extend("PriceComponent");
local l_PriceComponentTextSize_0 = game:GetFastFlag("PriceComponentTextSize");
v22.init = function(v24, v25)
    v24.onPriceChange = function(v26)
        if v25.OnPriceChange then
            v25.OnPriceChange(v26);
        end;
    end;
    v24.onClickLearnMore = function()
        l_GuiService_0:OpenBrowserWindow(v20.getVerificationDocumentationUrl());
    end;
end;
v22.render = function(v27)
    local l_props_0 = v27.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_AssetTypeEnum_0 = l_props_0.AssetTypeEnum;
    local l_AllowedAssetTypesForRelease_0 = l_props_0.AllowedAssetTypesForRelease;
    local l_AllowedAssetTypesForFree_0 = l_props_0.AllowedAssetTypesForFree;
    local l_NewAssetStatus_0 = l_props_0.NewAssetStatus;
    local l_Price_0 = l_props_0.Price;
    local l_MinPrice_0 = l_props_0.MinPrice;
    local l_MaxPrice_0 = l_props_0.MaxPrice;
    local l_FeeRate_0 = l_props_0.FeeRate;
    local l_IsPriceValid_0 = l_props_0.IsPriceValid;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v41 = v16.new();
    local v42 = v18.calculatePotentialEarning(l_AllowedAssetTypesForRelease_0, l_Price_0, l_AssetTypeEnum_0, l_MinPrice_0);
    local l_assetConfig_0 = l_Stylizer_0.assetConfig;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v45 = math.max(100 - l_FeeRate_0, 0);
    local v46 = tostring((math.floor((math.min(v42, (1 - l_FeeRate_0 / 100) * l_MaxPrice_0)))));
    local v48 = if not l_AllowedAssetTypesForFree_0 then nil else v14.find(l_AllowedAssetTypesForFree_0, function(v47)
        return v47 == l_AssetTypeEnum_0.Name;
    end);
    local v49 = tonumber(l_Price_0);
    local v50 = if not v49 then nil else l_MaxPrice_0 < v49;
    local v51 = l_GetTextSize_0(v46, v17.FONT_SIZE_MEDIUM, v17.FONT, not not l_PriceComponentTextSize_0 and Vector2.new(225, 24) or Vector2.new(0, 225, 0, 24));
    local v52 = tostring(l_Price_0 or "");
    local v53 = l_game_FastInt_0 < utf8.len(v52);
    local v54 = if not l_IsPriceValid_0 then l_assetConfig_0.errorColor else l_assetConfig_0.labelTextColor;
    local l_publishingRequirements_0 = l_props_0.publishingRequirements;
    local v56 = (l_publishingRequirements_0 and l_publishingRequirements_0.verification) and l_publishingRequirements_0.verification.isVerified;
    local v57 = true;
    if l_publishingRequirements_0 ~= nil then
        v57 = v56;
    end;
    if v57 then
        return v3.createElement(l_TitledFrame_0, {
            Title = l_Localization_0:getText("General", "SalesPrice"), 
            LayoutOrder = l_LayoutOrder_0
        }, {
            InputRow = v3.createElement("Frame", {
                Size = if not v48 then UDim2.new(1, 0, 0, 52) else UDim2.new(1, 0, 0, 67), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v41:getNextOrder()
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                TextInputBox = v3.createElement("Frame", {
                    Size = UDim2.new(0, 225, 0, 40), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    RobuxIcon = v3.createElement("ImageLabel", {
                        Size = v17.Dialog.ROBUX_SIZE, 
                        Image = v19.ROBUX_SMALL, 
                        ImageColor3 = l_assetConfig_0.textColor, 
                        BackgroundTransparency = 1
                    }), 
                    RoundTextBox = v3.createElement(l_DEPRECATED_TextInput_0, {
                        Enabled = v18.isOnSale(l_NewAssetStatus_0), 
                        OnTextChanged = v27.onPriceChange, 
                        Size = UDim2.new(0.9, 0, 1, 0), 
                        Style = (not v53 and l_IsPriceValid_0) and "FilledRoundedBorder" or "FilledRoundedRedBorder", 
                        Text = v52
                    })
                }), 
                PriceRangeFrame = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 225, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingTop = if not v48 then UDim.new(0, 8) else UDim.new(0, 4), 
                        PaddingLeft = UDim.new(0, 26)
                    }), 
                    UIListLayout = if not v48 then nil else v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 0)
                    }), 
                    MinimumPriceLabel = if not v48 or v50 then nil else v3.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1, 
                        LineHeight = 1.5, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = l_Localization_0:getText("General", "SalesMinimumPrice", {
                            minPrice = tostring(l_MinPrice_0)
                        }), 
                        TextColor = v54, 
                        TextSize = v17.FONT_SIZE_SMALL, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    }), 
                    FreePriceLabel = if not v48 or v50 then nil else v3.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2, 
                        LineHeight = 1.5, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = l_Localization_0:getText("General", "SalesFreePrice"), 
                        TextColor = v54, 
                        TextSize = v17.FONT_SIZE_SMALL, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    }), 
                    MaxPriceLabel = if not not v48 and v50 then v3.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1, 
                        LineHeight = 1.5, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = l_Localization_0:getText("General", "SalesMaxPrice", {
                            maxPrice = tostring(l_MaxPrice_0)
                        }), 
                        TextColor = v54, 
                        TextSize = v17.FONT_SIZE_SMALL, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    }) else nil, 
                    PriceRangeLabel = if v48 then nil else v3.createElement(l_TextLabel_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 225, 0, 0), 
                        Text = l_Localization_0:getText("General", "SalesPriceRange", {
                            minPrice = tostring(l_MinPrice_0), 
                            maxPrice = tostring(l_MaxPrice_0)
                        }), 
                        TextColor = v54, 
                        TextSize = v17.FONT_SIZE_SMALL, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            }), 
            CreatorEarningsFrame = v3.createElement("Frame", {
                Size = UDim2.new(0, 225, 0, 24), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 26)
                }), 
                EarningsLabel = v3.createElement(l_TextLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = l_Localization_0:getText("General", "SalesCreatorEarnings", {
                        earningsPercent = tostring(v45)
                    }), 
                    TextColor = l_assetConfig_0.textColor, 
                    TextSize = v17.FONT_SIZE_MEDIUM, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                BaseFrame = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    Robux = v3.createElement("ImageLabel", {
                        Size = v17.Dialog.ROBUX_SIZE, 
                        Image = v19.ROBUX_SMALL, 
                        ImageColor3 = l_assetConfig_0.textColor, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }), 
                    Earnings = v3.createElement(l_TextLabel_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, v51.X, 1, 0), 
                        Text = v46, 
                        TextColor = l_assetConfig_0.textColor, 
                        TextSize = v17.FONT_SIZE_LARGE, 
                        TextXAlignment = Enum.TextXAlignment.Right
                    })
                })
            })
        });
    else
        return v3.createElement(l_TitledFrame_0, {
            Title = l_Localization_0:getText("General", "SalesPrice"), 
            LayoutOrder = l_LayoutOrder_0
        }, {
            RightFrame = v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0)
                }), 
                SalesVerification = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Localization_0:getText("General", "SalesVerification"), 
                    TextColor = l_publishAsset_0.verifyTextColor, 
                    TextSize = v17.FONT_SIZE_LARGE, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                LearnMore = v3.createElement(l_LinkText_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2, 
                    OnClick = v27.onClickLearnMore, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Localization_0:getText("General", "LearnMore")
                })
            })
        });
    end;
end;
return v5.connect(function(v58)
    return {
        publishingRequirements = (v58 or {}).publishingRequirements
    };
end, nil)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v22)));
