local l_createStyleRule_0 = require(script:FindFirstAncestor("ControlsEmulator").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Widget-Button", {
    BorderSizePixel = 3, 
    BorderColor3 = "$ForegroundMain", 
    BorderMode = Enum.BorderMode.Outline, 
    Size = UDim2.new(0, 36, 0, 36)
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(1, 0)
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$BackgroundHover"
    })
});
