local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_LayoutOrderIterator_0 = require(l_Parent_1.Packages.Framework).Util.LayoutOrderIterator;
local v4 = require(l_Parent_0.Util.StateInterfaceTheme);
return function(v5)
    return v2.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 2), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        UIListLayoutHorizontal = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        DividerFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            LayoutOrder = l_LayoutOrderIterator_0.new():getNextOrder(), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v4.getDividerColor(v5)
        })
    });
end;
