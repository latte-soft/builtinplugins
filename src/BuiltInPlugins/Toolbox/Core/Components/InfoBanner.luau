local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("InfoBanner");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_FONT_SIZE_LARGE_0 = v4.FONT_SIZE_LARGE;
    return v2.createElement("TextLabel", {
        Position = l_props_0.Position or UDim2.new(0, 0, 0, 0), 
        Size = l_props_0.Size or UDim2.new(1, 0, 0, l_FONT_SIZE_LARGE_0 + 2 * v4.INFO_BANNER_PADDING), 
        BackgroundTransparency = 1, 
        ZIndex = l_props_0.ZIndex or 0, 
        Visible = l_props_0.Visible ~= nil and l_props_0.Visible or l_props_0.Visible == nil, 
        Text = l_props_0.Text or "", 
        TextColor3 = l_Stylizer_0.infoBanner.textColor, 
        Font = v4.FONT, 
        TextSize = l_FONT_SIZE_LARGE_0, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextWrapped = true, 
        ClipsDescendants = true
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
