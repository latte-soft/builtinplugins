local l_createStyleRule_0 = require(script:FindFirstAncestor("SuperTemplate").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CounterExample", {
    BackgroundColor3 = "$BackgroundPaper", 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, 10)
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$BackgroundHover"
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
    })
});
