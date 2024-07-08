local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactStudioWidgets.RadioButtonSet);
local v3 = v1.Component:extend("ComponentRadioButtonSetPanel");
v3.render = function(v4)
    if v4.props.IsVisible == nil and true or v4.props.IsVisible then
        return v1.createElement(v2, {
            Title = v4.props.Title, 
            Buttons = v4.props.Buttons, 
            Enabled = v4.props.Enabled, 
            LayoutOrder = v4.props.LayoutOrder, 
            Selected = v4.props.Selected, 
            SubDescription = v4.props.SubDescription, 
            SelectionChanged = v4.props.SelectionChanged, 
            Mouse = v4.props.Mouse
        });
    else
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BorderSizePixel = 0
        });
    end;
end;
return v3;
