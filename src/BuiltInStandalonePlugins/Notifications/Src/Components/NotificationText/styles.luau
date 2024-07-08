local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-NotificationText", {
    AutomaticSize = Enum.AutomaticSize.Y, 
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("> #Subject", {
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        TextColor3 = "$TextPrimary", 
        TextSize = 18, 
        Font = Enum.Font.SourceSans, 
        TextWrapped = true, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    }, {
        l_createStyleRule_0("::UISizeConstraint", {
            MaxSize = Vector2.new(math.huge, 36), 
            MinSize = Vector2.new(0, 18)
        })
    }), 
    l_createStyleRule_0("> #Subline", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        TextColor3 = "$TextSecondary", 
        TextSize = 18, 
        Font = Enum.Font.SourceSans, 
        TextWrapped = true, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    }, {
        l_createStyleRule_0("::UISizeConstraint", {
            MaxSize = Vector2.new(math.huge, 36), 
            MinSize = Vector2.new(0, 18)
        })
    }), 
    l_createStyleRule_0("> #ElapsedTime", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        TextColor3 = "$TextSecondary", 
        TextSize = 15, 
        Font = Enum.Font.SourceSans, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    })
});
