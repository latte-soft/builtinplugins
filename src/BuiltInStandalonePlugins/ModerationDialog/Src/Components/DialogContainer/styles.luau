local l_createStyleRule_0 = require(script:FindFirstAncestor("ModerationDialog").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-DialogContainer", {
    BackgroundColor3 = "$ForegroundMain", 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("> UIListLayout", {
        Padding = UDim.new(0, 16)
    }), 
    l_createStyleRule_0(">> Frame", {
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0(">> .Separator", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = "$Divider", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0
    })
});
