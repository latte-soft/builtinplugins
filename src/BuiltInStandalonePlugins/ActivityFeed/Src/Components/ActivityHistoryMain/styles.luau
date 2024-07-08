local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local v3 = v2.filterHeaderHeight - 4;
return l_createStyleRule_0(".Component-ActivityHistoryMain", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("> #EventList", {
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("> #HeaderContainer", {
            Size = UDim2.new(1, 0, 0, v2.filterHeaderHeight)
        }, {
            l_createStyleRule_0(">> #Header", {}, {
                l_createStyleRule_0("::UICorner", {
                    CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
                }), 
                l_createStyleRule_0("::UIStroke", {
                    Color = "$Divider", 
                    Thickness = 1
                }), 
                l_createStyleRule_0("> #ToggleFilterMenuButton", {
                    BackgroundColor3 = "$BackgroundPaper", 
                    TextColor3 = "$TextPrimary", 
                    TextSize = v2.headerFontSize
                }, {
                    l_createStyleRule_0("::UICorner", {
                        CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
                    }), 
                    l_createStyleRule_0(":hover", {
                        BackgroundColor3 = "$ActionHover"
                    })
                }), 
                l_createStyleRule_0("> #FilterMenuToggleIconContainer", {
                    Size = UDim2.new(0, v3, 0, v3), 
                    Position = UDim2.new(1, -v3, 0, 0)
                }, {
                    l_createStyleRule_0("> #FilterMenuToggleIcon", {
                        Size = UDim2.new(0, 16, 0, 16), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Image = "$toggleicon", 
                        BackgroundTransparency = 1
                    })
                })
            })
        }), 
        l_createStyleRule_0("> #ActivityHistoryBubbleListContainer", {
            Size = UDim2.new(1, 0, 1, -v2.filterHeaderHeight)
        })
    }), 
    l_createStyleRule_0("> #FilterMenu", {
        Size = UDim2.new(1, 0, 1, 0)
    }), 
    l_createStyleRule_0("> #Footer", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = "$ForegroundMain"
    }, {
        l_createStyleRule_0(">> .Component-TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            TextColor3 = "$TextPrimary", 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 20)
        })
    })
});
