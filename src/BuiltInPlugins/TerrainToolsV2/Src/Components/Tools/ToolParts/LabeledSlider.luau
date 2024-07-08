local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Parent_1 = script.Parent;
local v4 = require(l_Parent_1.LabeledElementPair);
local v5 = require(l_Parent_1.Slider);
return function(v6)
    return v1.createElement(v4, {
        Size = UDim2.new(1, 0, 0, 15), 
        Text = v6.Text, 
        LayoutOrder = v6.LayoutOrder, 
        Tooltip = v6.Tooltip
    }, (v2.Dictionary.join(v6[v1.Children] or {}, {
        Slider = v1.createElement(v5, (v2.Dictionary.join(v6, {
            [v1.Children] = v2.None, 
            LayoutOrder = v2.None, 
            Text = v2.None
        })))
    })));
end;
