local l_createStyleRule_0 = require(script:FindFirstAncestor("ModerationDialog").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-Checkbox", {}, {
    l_createStyleRule_0("::UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, 
        Padding = UDim.new(0, 12), 
        SortOrder = Enum.SortOrder.LayoutOrder
    }), 
    l_createStyleRule_0(">> ImageButton", {
        Size = UDim2.new(0, 16, 0, 16), 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0(">> .Unchecked", {
        Image = "$CheckboxUncheckedImage", 
        HoverImage = "$CheckboxHoveredImage"
    }), 
    l_createStyleRule_0(">> .Checked", {
        Image = "$CheckboxCheckedImage"
    }), 
    l_createStyleRule_0(">> TextButton", {
        Font = Enum.Font.SourceSans, 
        TextColor3 = "$TextPrimary", 
        TextSize = 16, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1
    })
});
