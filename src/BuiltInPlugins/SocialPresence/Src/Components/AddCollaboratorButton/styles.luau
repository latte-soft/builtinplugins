local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-AddCollaboratorButton", {
    AutomaticSize = Enum.AutomaticSize.XY, 
    Size = UDim2.new(0, 24, 1, 0), 
    Text = "", 
    LayoutOrder = 100
}, {
    l_createStyleRule_0("> ImageLabel", {
        Image = "$AddCollaboratorIcon", 
        Size = UDim2.fromOffset(16, 16), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> TextLabel", {
        TextColor3 = "$TextPrimary", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.X, 
        Font = Enum.Font.BuilderSans, 
        TextSize = 16
    })
});
