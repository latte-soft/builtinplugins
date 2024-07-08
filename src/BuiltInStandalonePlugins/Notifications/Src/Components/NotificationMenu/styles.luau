local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Components.NotificationMenu.constants);
return l_createStyleRule_0(".Component-NotificationMenu", {
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, 4)
    }), 
    l_createStyleRule_0(">> .Component-NotificationMenuInner", {
        BackgroundColor3 = "$SecondaryMain"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        l_createStyleRule_0(">> .Component-NotificationMenuOptionButton", {
            BorderSizePixel = 0, 
            Font = v2.TEXT_FONT, 
            TextSize = v2.TEXT_SIZE, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = "$TextPrimary", 
            BackgroundColor3 = "$SecondaryMain"
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            l_createStyleRule_0("::UISizeConstraint", {
                MaxSize = Vector2.new(math.huge, 48)
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, v2.LEFT_RIGHT_BUTTON_PADDING), 
                PaddingRight = UDim.new(0, v2.LEFT_RIGHT_BUTTON_PADDING), 
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$ActionHover"
            }), 
            l_createStyleRule_0(":pressed", {
                BackgroundColor3 = "$ActionActivated"
            })
        })
    })
});
