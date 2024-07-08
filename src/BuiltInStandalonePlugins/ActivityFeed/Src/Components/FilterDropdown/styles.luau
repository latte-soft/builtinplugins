local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-FilterDropdown", {
    BorderSizePixel = 1, 
    BackgroundColor3 = "$BackgroundPaper", 
    BorderColor3 = "$BackgroundDefault"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, v2.bubbleCornerRadius)
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ActionHover"
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 8), 
        PaddingRight = UDim.new(0, 8), 
        PaddingTop = UDim.new(0, 3), 
        PaddingBottom = UDim.new(0, 3)
    }), 
    l_createStyleRule_0("> #Selected", {
        TextColor3 = "$TextPrimary", 
        TextSize = v2.normalFontSize, 
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    l_createStyleRule_0("> #ButtonContainer", {
        Position = UDim2.new(1, -34, 0, 0), 
        Size = UDim2.new(0, 34, 1, 0)
    }, {
        l_createStyleRule_0("> #Button", {
            Size = UDim2.new(0, 16, 0, 16), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = "$arrowdownicon"
        })
    })
});
