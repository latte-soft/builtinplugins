local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CollaboratorThumbnail", {
    BackgroundTransparency = 1
}, {
    l_createStyleRule_0(">> #ActivityRing", {
        Image = "$ActivityRingImage", 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = "$ForegroundContrast"
    }, {
        l_createStyleRule_0(".Idle", {
            ImageColor3 = Color3.fromRGB(140, 140, 140), 
            ImageTransparency = 0.2
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    }), 
    l_createStyleRule_0(">> #Avatar", {
        Size = UDim2.fromScale(0.7, 0.7), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = "$SecondaryContrast", 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0(".Idle", {
            BackgroundColor3 = "$ForegroundContrast", 
            ImageColor3 = Color3.fromRGB(140, 140, 140), 
            ImageTransparency = 0.2
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })
});
