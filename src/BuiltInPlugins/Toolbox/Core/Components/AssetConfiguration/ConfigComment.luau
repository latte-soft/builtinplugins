local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigConstants);
local l_ToggleButton_0 = require(l_Packages_0.Framework).UI.ToggleButton;
local v9 = v2.PureComponent:extend("ConfigComment");
v9.init = function(v10, _)
    v10.toggleCallback = function()
        local l_props_0 = v10.props;
        l_props_0.ToggleCallback(not l_props_0.CommentOn);
    end;
end;
v9.render = function(v13)
    local l_props_1 = v13.props;
    local l_Title_0 = l_props_1.Title;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_TotalHeight_0 = l_props_1.TotalHeight;
    local l_CommentOn_0 = l_props_1.CommentOn;
    local l_CommentEnabled_0 = l_props_1.CommentEnabled;
    local _ = l_props_1.ToggleCallback;
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
            Size = UDim2.new(0, v7.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = v13.props.Stylizer.publishAsset.titleTextColor, 
            Font = v6.FONT, 
            LayoutOrder = 1
        }), 
        ToggleButton = v2.createElement(l_ToggleButton_0, {
            Disabled = not l_CommentEnabled_0, 
            LayoutOrder = 2, 
            OnClick = v13.toggleCallback, 
            Selected = l_CommentOn_0, 
            Size = UDim2.new(0, 40, 0, 24)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
