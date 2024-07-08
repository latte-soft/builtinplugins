local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v2.Util.GetTextSize;
local v7 = v1.PureComponent:extend("Header");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local _ = nil;
    local v12 = l_GetTextSize_0(l_props_0.Title, l_Stylizer_0.fontStyle.Header.TextSize, l_Stylizer_0.fontStyle.Header.Font);
    return v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Header, {
        Size = UDim2.new(0, v12.X, 0, v12.Y), 
        Text = l_props_0.Title, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        LayoutOrder = l_props_0.LayoutOrder or 1
    }));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
