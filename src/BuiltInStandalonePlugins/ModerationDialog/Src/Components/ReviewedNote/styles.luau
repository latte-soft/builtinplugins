local l_createStyleRule_0 = require(script:FindFirstAncestor("ModerationDialog").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-ReviewedNote", {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
}, {
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 4), 
        SortOrder = Enum.SortOrder.LayoutOrder
    })
});
