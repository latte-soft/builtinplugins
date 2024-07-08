local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
return l_createStyleRule_0(".Component-EnableTeamCreate", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$SecondaryMuted"
}, {
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, 16)
    }), 
    l_createStyleRule_0("> #Text", {
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextColor3 = "$TextPrimary", 
        TextSize = v2.detailFontSize
    }), 
    l_createStyleRule_0("> #Button", {
        BackgroundColor3 = "$PrimaryMain", 
        TextColor3 = "$TextContrast", 
        TextSize = v2.buttonFontSize
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        })
    })
});
