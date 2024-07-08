local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.Component:extend("DeveloperSubscriptionListHeaderText");
v5.render = function(v6)
    return v1.createElement("TextLabel", v2.Dictionary.join(v6.props.Stylizer.fontStyle.Normal, {
        Size = v6.props.Size, 
        Text = v6.props.Text, 
        LayoutOrder = v6.props.LayoutOrder, 
        TextXAlignment = v6.props.Alignment, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
