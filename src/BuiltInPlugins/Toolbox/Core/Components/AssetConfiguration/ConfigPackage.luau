local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.AssetConfigConstants);
local l_UI_0 = v3.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_Pane_0 = l_UI_0.Pane;
local v14 = v2.PureComponent:extend("ConfigPackage");
v14.init = function(v15, _)
    v15.toggleCallback = function()
        local l_props_0 = v15.props;
        l_props_0.ToggleCallback(not l_props_0.PackageOn);
    end;
end;
v14.render = function(v18)
    local l_props_1 = v18.props;
    local l_Title_0 = l_props_1.Title;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_TotalHeight_0 = l_props_1.TotalHeight;
    local l_PackageOn_0 = l_props_1.PackageOn;
    local l_PackageEnabled_0 = l_props_1.PackageEnabled;
    local l_PackageWarningText_0 = l_props_1.PackageWarningText;
    local _ = l_props_1.ToggleCallback;
    local l_Stylizer_0 = v18.props.Stylizer;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local l_Localization_0 = l_props_1.Localization;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v2.createElement(l_TextLabel_0, {
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextColor = l_publishAsset_0.titleTextColor, 
            Font = v7.FONT, 
            LayoutOrder = 1
        }), 
        RightFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -v8.TITLE_GUTTER_WIDTH, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 5)
            }), 
            ToggleButtonContainer = v2.createElement(l_Pane_0, {
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 34), 
                Padding = {
                    Bottom = 10
                }, 
                Spacing = 10, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ToggleButton = v2.createElement(l_ToggleButton_0, {
                    Disabled = not l_PackageEnabled_0, 
                    LayoutOrder = 1, 
                    OnClick = v18.toggleCallback, 
                    Selected = l_PackageOn_0, 
                    Size = UDim2.new(0, 40, 0, 24)
                }), 
                ErrorText = if not (l_props_1.PackageWarningText ~= nil) then nil else v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Font = v7.FONT, 
                    Size = UDim2.new(1, -50, 0, 0), 
                    Text = l_PackageWarningText_0, 
                    TextWrapped = true, 
                    TextColor = if l_PackageWarningText_0 == l_Localization_0:getText("AssetConfigPackage", "Non3DRoot3DDescendentsWarning") then l_Stylizer_0.assetConfig.warningColor else l_Stylizer_0.assetConfig.errorColor, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextSize = v7.FONT_SIZE_LARGE
                })
            }), 
            TipsLabel = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                LayoutOrder = 3, 
                Text = l_Localization_0:getText("AssetConfigPackage", "HelpTextV2"), 
                StyleModifier = l_StyleModifier_0.Disabled, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v7.FONT_SIZE_LARGE
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
