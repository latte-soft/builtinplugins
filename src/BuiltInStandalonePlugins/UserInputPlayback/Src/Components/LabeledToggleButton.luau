local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v8 = v1.PureComponent:extend("LabeledToggleButton");
v8.defaultProps = {
    Disabled = false, 
    Selected = false
};
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_UI_0.Pane, {
        Size = l_Stylizer_0.ComponentSize, 
        AutomaticSize = Enum.AutomaticSize.X, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = {
            Left = l_Stylizer_0.LeftInsetPx
        }, 
        Spacing = l_Stylizer_0.PaddingPx, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        ToggleButton = v1.createElement(l_ToggleButton_0, {
            OnClick = l_props_0.OnClick, 
            Size = l_Stylizer_0.ToggleSize, 
            Selected = l_props_0.Selected, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Disabled = l_props_0.Disabled
        }), 
        TextLabel = v1.createElement(l_TextLabel_0, {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_props_0.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            StyleModifier = not not l_props_0.Disabled and l_StyleModifier_0.Disabled or nil
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
