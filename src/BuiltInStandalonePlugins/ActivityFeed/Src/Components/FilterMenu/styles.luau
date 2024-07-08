local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-FilterMenu", {
    BackgroundColor3 = "$ForegroundMain"
}, {
    l_createStyleRule_0(">> .Component-OptionButton", {
        Size = UDim2.new(0, 58, 1, 0), 
        AutoButtonColor = false, 
        TextColor3 = "$TextPrimary"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    }), 
    l_createStyleRule_0(">> #Header", {
        Size = UDim2.new(1, 0, 0, v2.filterHeaderHeight)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        l_createStyleRule_0("::UIListLayout", {
            Padding = UDim.new(0, 4)
        }), 
        l_createStyleRule_0(">> #Clear", {
            BackgroundColor3 = "$SecondaryMain"
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$SecondaryHoverBackground"
            })
        }), 
        l_createStyleRule_0(">> #Apply", {
            BackgroundColor3 = "$PrimaryMain"
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$PrimaryHoverBackground"
            })
        }), 
        l_createStyleRule_0("> TextLabel", {
            Size = UDim2.new(1, -124, 1, 0), 
            BackgroundTransparency = 1, 
            TextSize = v2.headerFontSize, 
            TextColor3 = "$TextPrimary"
        })
    }), 
    l_createStyleRule_0("> #Contents", {
        Size = UDim2.new(1, 0, 1, -v2.filterHeaderHeight), 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 16), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        l_createStyleRule_0("> #ByDateRangeFilter", {
            Size = UDim2.new(1, 0, 0, 40)
        }, {}), 
        l_createStyleRule_0(">> .Component-SpacerSmall", {
            Size = UDim2.new(1, 0, 0, 8), 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0(">> .Component-Spacer", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1
        }), 
        l_createStyleRule_0(">> .Component-FilterMenu-By", {
            Size = UDim2.new(1, 0, 0, v2.byHeight), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("> #Label", {
                Position = UDim2.new(0, 2, 0, 0), 
                Size = UDim2.new(0.5, 0, 1, 0), 
                TextSize = v2.normalFontSize, 
                TextColor3 = "$TextPrimary", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1
            }), 
            l_createStyleRule_0("> #SelectAll", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                TextSize = v2.normalFontSize, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundTransparency = 1, 
                TextColor3 = "$TextPrimary"
            }, {
                l_createStyleRule_0(":hover", {
                    TextColor3 = "$TextSecondary"
                })
            })
        }), 
        l_createStyleRule_0(">> .Component-FilterMenu-CheckBoxes", {
            Size = UDim2.new(1, 0, 0, v2.checkBoxRowHeight)
        }, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = UDim.new(0, 8)
            }), 
            l_createStyleRule_0(">> #CheckboxContainer", {
                Size = UDim2.new(0, 24, 0, v2.checkBoxRowHeight)
            }), 
            l_createStyleRule_0(">> .Component-Checkbox", {
                Position = UDim2.new(0, 0, 0, v2.checkBoxRowHeight / 2 - 12)
            }), 
            l_createStyleRule_0(">> .Component-CheckboxButton", {
                TextColor3 = "$TextPrimary", 
                Size = UDim2.new(1, -100, 0, v2.checkBoxRowHeight), 
                BackgroundTransparency = 1, 
                TextSize = v2.normalFontSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    })
});
