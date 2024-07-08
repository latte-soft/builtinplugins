local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-NotificationHeader", {
    Size = UDim2.new(1, 0, 0, 34), 
    BackgroundColor3 = "$BackgroundPaper", 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 0), 
        PaddingBottom = UDim.new(0, 0)
    }), 
    l_createStyleRule_0("> #Title", {
        Size = UDim2.new(0.75, 0, 0, 40), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = "$BackgroundPaper", 
        TextColor3 = "$TextPrimary", 
        TextSize = 20, 
        BorderSizePixel = 0, 
        Font = Enum.Font.SourceSansSemibold, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 3)
        })
    }), 
    l_createStyleRule_0("> #MoreOptionsFrame", {
        Size = UDim2.new(0.25, 0, 0, 40), 
        Position = UDim2.new(1, 0, 0, 0), 
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundColor3 = "$BackgroundPaper", 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0("> #MoreOptionsButton", {
            Size = UDim2.new(0, 28, 0, 28), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundColor3 = "$BackgroundPaper", 
            BorderSizePixel = 0
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$ActionHover"
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundColor3 = "$ActionActivated"
            }), 
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        })
    })
});
