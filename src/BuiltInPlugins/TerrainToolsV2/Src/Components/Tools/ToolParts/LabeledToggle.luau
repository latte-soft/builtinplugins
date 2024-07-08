local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Packages.Roact);
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.LabeledElementPair);
local l_ToggleButton_0 = require(l_Parent_0.ToggleButtons).ToggleButton;
return function(v4)
    return v0.createElement(v2, {
        Size = UDim2.new(1, 0, 0, 18), 
        InfoMessage = v4.InfoMessage, 
        TeachingCallout = v4.TeachingCallout, 
        Text = v4.Text, 
        Tooltip = v4.Tooltip, 
        LayoutOrder = v4.LayoutOrder
    }, {
        ToggleButton = v0.createElement(l_ToggleButton_0, {
            IsOn = v4.IsOn, 
            SetIsOn = v4.SetIsOn, 
            Disabled = v4.Disabled, 
            Position = UDim2.new(0, 0, 0, 3)
        })
    });
end;
