local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-MappingsList", {
    Size = UDim2.new(0.5, 0, 1, 0), 
    Position = UDim2.new(0.5, 0, 0, 0)
}, {
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 5)
    }), 
    l_createStyleRule_0("> TextButton", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, 50), 
        TextColor3 = Color3.fromRGB(0, 0, 0), 
        BorderSizePixel = 1, 
        TextXAlignment = Enum.TextXAlignment.Left
    })
});
