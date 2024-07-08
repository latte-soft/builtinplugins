local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = v2.PureComponent:extend("Header");
v6.render = function(v7)
    local l_props_0 = v7.props;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 45)
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -5)
        }), 
        Header = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v5.FONT, 
            LayoutOrder = l_props_0.LayoutOrder or 1, 
            Text = l_props_0.Title, 
            TextColor3 = l_props_0.Stylizer.publishAsset.textColor, 
            TextSize = 24, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(0, 0, 0, 45)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
