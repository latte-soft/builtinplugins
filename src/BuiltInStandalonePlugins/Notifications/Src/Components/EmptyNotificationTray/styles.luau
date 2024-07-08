local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
local v1 = UDim2.new(0, 96, 0, 96);
return l_createStyleRule_0(".Component-EmptyNotificationTray", {
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 1, -43), 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 12)
    }), 
    l_createStyleRule_0("> #ErrorState", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        l_createStyleRule_0("> #ErrorImage", {
            Image = "$NotificationErrorIcon", 
            Size = v1, 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("> #RefreshButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = "$BackgroundPaper", 
            TextColor3 = "$TextPrimary", 
            TextSize = 24, 
            TextWrapped = true, 
            Font = Enum.Font.SourceSansSemibold
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            l_createStyleRule_0("::UIStroke", {
                Color = "$SecondaryRestingOutlineBorder", 
                Thickness = 1, 
                LineJoinMode = Enum.LineJoinMode.Round, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            })
        })
    }), 
    l_createStyleRule_0("> #EmptyState", {}, {
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 6)
        }), 
        l_createStyleRule_0("> #EmptyImage", {
            Image = "$NotificationEmptyTrayIcon", 
            Size = v1, 
            BackgroundTransparency = 1
        })
    }), 
    l_createStyleRule_0(">> .Component-EmptyNotificationTray-Centering", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }), 
    l_createStyleRule_0(">> .Component-EmptyNotificationTray-MainText", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextColor3 = "$TextPrimary", 
        TextSize = 18, 
        TextWrapped = true, 
        Font = Enum.Font.SourceSansSemibold
    }), 
    l_createStyleRule_0(">> .Component-EmptyNotificationTray-SubText", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextColor3 = "$TextSecondary", 
        TextSize = 18, 
        TextWrapped = true, 
        Font = Enum.Font.SourceSansSemibold
    })
});
