local _ = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_1.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_1.Src.Util.Constants);
local l_ToggleButton_0 = v3.UI.ToggleButton;
local v9 = v4.PureComponent:extend("ConfigComment");
v9.render = function(v10)
    local l_props_0 = v10.props;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_props_0.TotalHeight), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v4.createElement("TextLabel", {
            Size = UDim2.new(0, v7.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_props_0.Title, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextColor3 = l_props_0.Stylizer.publishAsset.titleTextColor, 
            Font = v7.FONT, 
            LayoutOrder = 1
        }), 
        ToggleButton = v4.createElement(l_ToggleButton_0, {
            Disabled = not l_props_0.CommentEnabled, 
            LayoutOrder = 2, 
            OnClick = l_props_0.ToggleCallback, 
            Selected = l_props_0.CommentOn
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
