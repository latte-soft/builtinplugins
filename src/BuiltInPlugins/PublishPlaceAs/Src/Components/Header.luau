local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("Header");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement("TextLabel", {
        Size = UDim2.new(1, 0, 0, 45), 
        Text = l_props_0.Title, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextSize = 28, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        Font = l_Stylizer_0.header.font, 
        TextColor3 = l_Stylizer_0.header.text, 
        LayoutOrder = l_props_0.LayoutOrder or 1
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
