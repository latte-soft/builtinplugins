local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-DeviceBlueprint", {
    BackgroundColor3 = "$BackgroundPaper", 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical
    }), 
    l_createStyleRule_0("> TextLabel", {
        TextSize = 24, 
        Font = Enum.Font.Gotham, 
        TextColor3 = "$TextPrimary", 
        Size = UDim2.new(1, 0, 0, 50), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    }), 
    l_createStyleRule_0("> TextButton", {
        TextSize = 50, 
        Font = Enum.Font.Gotham, 
        TextColor3 = "$TextPrimary", 
        Size = UDim2.new(1, 0, 0, 100), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    }), 
    l_createStyleRule_0(">> .X-Circle", {}, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })
});
