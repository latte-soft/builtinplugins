local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_Util_0 = v3.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextInput_0 = l_UI_0.TextInput;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v15 = v2.PureComponent:extend("RobuxFeeBase");
v15.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v20 = l_LayoutOrderIterator_0.new();
    local v21 = not not l_props_0.TaxRate and l_props_0.TaxRate or 0.9;
    local v22 = type(l_props_0.Price) == "number" and l_props_0.Price or 0;
    local v23 = v22 > 0 and l_props_0.MinimumFee or 0;
    local v24 = string.format("%.f", v22);
    local l_SubText_0 = l_props_0.SubText;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_OnPriceChanged_0 = l_props_0.OnPriceChanged;
    local v28 = l_Localization_0:getText("Monetization", "MarketplaceFee");
    local v29 = l_GetTextSize_0(v28, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local v30 = l_Localization_0:getText("Monetization", "MarketplaceFeeIs", {
        string.format("%2d", v21 * 100)
    });
    local v31 = if not v4 then l_GetTextSize_0(v30, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.robuxFeeBase.subText.width, math.huge)) else nil;
    local v32 = math.max(v23, (math.ceil(v22 * v21)));
    local v33 = string.format("%.f", v32);
    local v34 = l_Localization_0:getText("Monetization", "EarnLabel");
    local v35 = l_GetTextSize_0(v34, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local v36 = string.format("%.f", v22 - v32 > 0 and v22 - v32 or 0);
    local v37 = not l_SubText_0 or l_props_0.ShowPriceChangeWarning;
    local v38 = not not l_Enabled_0 and l_Stylizer_0.robuxFeeBase.transparency.enabled or l_Stylizer_0.robuxFeeBase.transparency.disabled;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = if not v4 then nil else l_Stylizer_0.robuxFeeBase.pricePadding, 
        HorizontalAlignment = if not v4 then nil else Enum.HorizontalAlignment.Left
    }, {
        TextInput = v2.createElement(l_TextInput_0, {
            BottomText = l_SubText_0, 
            Disabled = not l_Enabled_0, 
            LayoutOrder = 0, 
            LeadingComponent = l_Image_0, 
            LeadingComponentProps = {
                ImageColor3 = l_Stylizer_0.robuxFeeBase.icon.imageColor, 
                Image = l_Stylizer_0.robuxFeeBase.icon.image, 
                Size = UDim2.new(0, l_Stylizer_0.robuxFeeBase.icon.size, 0, l_Stylizer_0.robuxFeeBase.icon.size)
            }, 
            OnTextChanged = l_OnPriceChanged_0, 
            Width = l_Stylizer_0.robuxFeeBase.priceField.width, 
            Text = v24
        }), 
        FeeFrame = v37 and v2.createElement(not v4 and "Frame" or l_Pane_0, if not v4 then {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v20:getNextOrder()
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v20:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Stylizer_0.robuxFeeBase.spacing
        }, {
            HorizontalLayout = if not v4 then v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) else nil, 
            FeeLabel = if not v4 then v2.createElement("TextLabel", v1.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                Size = UDim2.new(0, v29.X, 1, 0), 
                BackgroundTransparency = 1, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTransparency = v38, 
                Text = v28, 
                LayoutOrder = 1
            })) else v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Text = v28
            }), 
            RobuxIcon = v2.createElement("ImageLabel", {
                Size = UDim2.new(0, l_Stylizer_0.robuxFeeBase.icon.size, 0, l_Stylizer_0.robuxFeeBase.icon.size), 
                ImageColor3 = l_Stylizer_0.robuxFeeBase.icon.imageColor, 
                Image = l_Stylizer_0.robuxFeeBase.icon.image, 
                ImageTransparency = v38, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            FeeAmount = if not v4 then v2.createElement("TextLabel", v1.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTransparency = v38, 
                Text = v33, 
                LayoutOrder = 3
            })) else v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                Text = v33
            })
        }), 
        FeeSubText = v37 and if v4 then v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v20:getNextOrder(), 
            Style = "Label", 
            Text = v30, 
            TextWrapped = true
        }) else v2.createElement("TextLabel", v1.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
            Size = UDim2.new(0, math.ceil(v31.X), 0, v31.Y), 
            BackgroundTransparency = 1, 
            Text = v30, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            LayoutOrder = v20:getNextOrder()
        })), 
        EarnFrame = v37 and v2.createElement(not v4 and "Frame" or l_Pane_0, if not v4 then {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v20:getNextOrder()
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v20:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Stylizer_0.robuxFeeBase.spacing
        }, {
            HorizontalLayout = if not v4 then v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) else nil, 
            EarnLabel = if not v4 then v2.createElement("TextLabel", v1.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                Size = UDim2.new(0, v35.X, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTransparency = v38, 
                Text = v34, 
                LayoutOrder = 1
            })) else v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Text = v34
            }), 
            RobuxIcon = v2.createElement("ImageLabel", {
                Size = UDim2.new(0, l_Stylizer_0.robuxFeeBase.icon.size, 0, l_Stylizer_0.robuxFeeBase.icon.size), 
                ImageColor3 = l_Stylizer_0.robuxFeeBase.icon.imageColor, 
                Image = l_Stylizer_0.robuxFeeBase.icon.image, 
                ImageTransparency = v38, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            EarnAmount = if not v4 then v2.createElement("TextLabel", v1.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTransparency = v38, 
                Text = v36, 
                LayoutOrder = 3
            })) else v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                Text = v36, 
                TextTransparency = v38
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
