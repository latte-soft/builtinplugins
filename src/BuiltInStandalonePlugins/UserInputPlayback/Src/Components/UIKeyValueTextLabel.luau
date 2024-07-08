local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_TextLabel_0 = v2.UI.TextLabel;
local v5 = v1.PureComponent:extend("UIKeyValueTextLabel");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.HeightPx), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_Stylizer_0.PaddingPx), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        KeyTextLabel = v1.createElement(l_TextLabel_0, {
            Text = l_props_0.Label .. ":", 
            Size = UDim2.new(0, l_Stylizer_0.KeyWidthPx, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }), 
        ValueTextLabel = v1.createElement(l_TextLabel_0, {
            Text = l_props_0.Value, 
            Size = UDim2.new(1, -l_Stylizer_0.KeyWidthPx, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 2
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v5));
