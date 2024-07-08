local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("Separator");
v4.render = function(v5)
    local l_props_0 = v5.props;
    return v1.createElement("Frame", {
        Size = l_props_0.Size or UDim2.new(1, 0, 0, 2), 
        Position = l_props_0.Position, 
        BackgroundColor3 = l_props_0.Stylizer.separator, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder or 1
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
