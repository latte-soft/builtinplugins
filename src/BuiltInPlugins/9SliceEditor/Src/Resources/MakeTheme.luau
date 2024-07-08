local l_Parent_0 = script.Parent.Parent.Parent;
local l_Style_0 = require(l_Parent_0.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v5 = require(l_Parent_0.Src.Util.Constants);
l_ComponentSymbols_0:add("AlertDialog");
l_ComponentSymbols_0:add("ImageDragger");
l_ComponentSymbols_0:add("SliceEditor");
l_ComponentSymbols_0:add("TextEditor");
l_ComponentSymbols_0:add("ImageEditor");
local v6 = {
    [l_StyleKey_0.SubtleBackgroundColor] = Color3.fromRGB(40, 40, 40)
};
local v7 = {
    [l_StyleKey_0.SubtleBackgroundColor] = Color3.fromRGB(249, 249, 249)
};
local v8 = {
    Button = {
        Size = UDim2.fromOffset(75, 28), 
        Style = "Round"
    }, 
    [l_ComponentSymbols_0.TextEditor] = {
        OffsetItemSpacing = UDim.new(0, 7), 
        PixelDimensionsHeightPx = 40
    }, 
    TextOffsetItem = {
        PaneSize = UDim2.fromOffset(110, 20), 
        LabelXWidth = 50, 
        TextBoxSize = UDim2.fromOffset(50, 20), 
        LabelTextBoxSpacing = 10, 
        Style = "RoundedBorder"
    }, 
    [l_ComponentSymbols_0.AlertDialog] = {
        PopupMessageSize = Vector2.new(400, 60), 
        TextSize = 18
    }, 
    [l_ComponentSymbols_0.ImageDragger] = {
        EdgeHandleSize = UDim2.fromOffset(30, 28), 
        EdgeHandleInsetPx = 2
    }, 
    [l_ComponentSymbols_0.ImageEditor] = {
        PaneBackgroundColor = l_StyleKey_0.SubtleBackgroundColor, 
        PaneBorderColor = l_StyleKey_0.Border
    }, 
    [l_ComponentSymbols_0.SliceEditor] = {
        TextAreaSize = UDim2.fromOffset(v5.TEXTEDITOR_XSIZE, v5.TEXTEDITOR_YSIZE + 60), 
        ImageAreaSize = UDim2.fromOffset((v5.BACKGROUND_SIZE + 10) + v5.TEXTEDITOR_XSIZE, (v5.BACKGROUND_SIZE + v5.TEXTSIZE) + 10), 
        ButtonsAreaSize = UDim2.fromOffset(((v5.BACKGROUND_SIZE + 10) + v5.TEXTEDITOR_XSIZE) + 10, 42), 
        ButtonsSpacing = UDim.new(0, 10), 
        VerticalSpacing = UDim.new(0, 5), 
        HorizontalSpacing = UDim.new(0, 5), 
        InfoBoxSize = UDim2.fromOffset(300, 200), 
        PaddingPx = 2, 
        TextAreaXWindowScaleFactor = 0.05
    }
};
return function(v9)
    local _ = nil;
    return (if not v9 then l_StudioTheme_0.new(v6, v7) else l_StudioTheme_0.mock(v6, v7)):extend(v8);
end;
