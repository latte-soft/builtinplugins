local l_StyleKey_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Style.StyleKey;
return {
    RowHeight = 24, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    SelectedColor = l_StyleKey_0.DialogMainButton, 
    SelectedTextColor = l_StyleKey_0.DialogMainButtonText, 
    BackgroundColor = l_StyleKey_0.MainBackground, 
    HeadingColor = l_StyleKey_0.CategoryItem, 
    BorderColor = l_StyleKey_0.Border, 
    Indent = 20, 
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = l_StyleKey_0.MainText
    }
};
