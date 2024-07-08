local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-NotificationTray", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$BackgroundPaper", 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0(">> .Component-NotificationTrayScrollingFrame", {
        Size = UDim2.new(1, -4, 1, -38), 
        Position = UDim2.new(0, 0, 0, 38), 
        CanvasSize = UDim2.new(1, -4, 1, -38), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 6, 
        ScrollBarImageColor3 = "$NotificationScrollBarColor", 
        VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
        ScrollingDirection = Enum.ScrollingDirection.Y
    }, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 4)
        })
    }), 
    l_createStyleRule_0(">> .Component-NotificationTrayLoading", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        })
    })
});
