local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CollaboratorRibbon", {
    BackgroundTransparency = 1, 
    AutomaticSize = Enum.AutomaticSize.X, 
    Size = UDim2.fromScale(0, 1)
}, {
    l_createStyleRule_0(">> .Component-OverflowBubble", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = "$SecondaryMain"
    }, {
        l_createStyleRule_0("> TextLabel", {
            BackgroundTransparency = 1, 
            TextSize = 13, 
            TextColor3 = "$TextPrimary", 
            Font = Enum.Font.BuilderSansBold
        })
    })
});
