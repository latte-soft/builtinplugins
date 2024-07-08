local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(script.Parent.SingleSelectButtonGroup);
local v3 = require(l_Parent_0.Src.Util.Constants);
return function(v4)
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 22), 
        BackgroundTransparency = 1
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, (v3.MIN_WIDGET_SIZE.X - 208) / 2)
        }), 
        Toggle = v1.createElement(v2, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 208, 0, 22), 
            Selected = v4.Selected, 
            Select = v4.Select, 
            Options = v4.Options
        })
    });
end;
