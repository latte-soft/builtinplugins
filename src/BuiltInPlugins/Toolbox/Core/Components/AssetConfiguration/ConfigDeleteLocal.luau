local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.AssetConfigConstants);
local v9 = require(l_Util_0.LayoutOrderIterator);
local l_UI_0 = v3.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v14 = v2.PureComponent:extend("ConfigDeleteLocal");
v14.init = function(v15, _)
    v15.toggleCallback = function()
        local l_props_0 = v15.props;
        l_props_0.ToggleCallback(not l_props_0.DeleteLocal);
    end;
end;
v14.render = function(v18)
    local l_props_1 = v18.props;
    local l_Title_0 = l_props_1.Title;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_TotalHeight_0 = l_props_1.TotalHeight;
    local l_DeleteLocal_0 = l_props_1.DeleteLocal;
    local l_publishAsset_0 = v18.props.Stylizer.publishAsset;
    local v25 = l_props_1.Localization:getText("AssetConfigDeleteLocal", "InformationText");
    local v26 = v9.new();
    local v27 = v9.new();
    return v2.createElement("Frame", {
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
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v7.FONT, 
            LayoutOrder = v26:getNextOrder()
        }), 
        RightFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -v8.TITLE_GUTTER_WIDTH, 0, 0), 
            LayoutOrder = v26:getNextOrder()
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25), 
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 0), 
                PaddingTop = UDim.new(0, 0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 0)
            }), 
            ToggleButton = v2.createElement(l_ToggleButton_0, {
                OnClick = v18.toggleCallback, 
                Selected = l_DeleteLocal_0, 
                Size = UDim2.new(0, 40, 0, 24), 
                LayoutOrder = v27:getNextOrder()
            }), 
            TipsLabel = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v25, 
                StyleModifier = l_StyleModifier_0.Disabled, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v7.FONT_SIZE_LARGE, 
                LayoutOrder = v27:getNextOrder()
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));
