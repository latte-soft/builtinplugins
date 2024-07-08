local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Util_0.Images);
local v6 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RoundBox_0 = v6.UI.RoundBox;
local l_Container_0 = v6.UI.Container;
local v11 = v2.PureComponent:extend("CatalogTag");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement(l_Container_0, {
        Background = l_RoundBox_0, 
        BackgroundStyle = "CatalogTag", 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, {
        Title = v2.createElement("TextLabel", {
            TextColor3 = l_Stylizer_0.tags.textColor, 
            Text = l_props_0.Text, 
            TextSize = v4.FONT_SIZE_TITLE, 
            Font = v4.FONT, 
            Size = UDim2.new(0, l_props_0.textSize.X, 0, l_props_0.textSize.Y), 
            Position = UDim2.new(0, 3, 0, 3), 
            BackgroundTransparency = 1
        }), 
        Close = v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = v5.CLOSE_BUTTON, 
            Size = UDim2.new(0, 16, 0, 16), 
            ImageColor3 = l_Stylizer_0.tags.textColor, 
            Position = UDim2.new(0, (3 + l_props_0.textSize.X) + 3, 0.5, -8), 
            [v2.Event.MouseButton1Click] = l_props_0.onClose
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
