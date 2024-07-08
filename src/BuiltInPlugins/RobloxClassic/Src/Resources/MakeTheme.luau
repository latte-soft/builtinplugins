local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
l_ComponentSymbols_0:add("LabeledToggleButton");
local v3 = {
    PaddingPx = 10, 
    PrimaryButtonSize = UDim2.new(0, 160, 0, 32), 
    UIGridCellSize = UDim2.fromOffset(150, 30), 
    UIGridHeightPx = 200, 
    UIGridPadding = UDim2.fromOffset(20, 2), 
    UIGridTopMarginPx = 30, 
    UIGroupWidthPx = 200, 
    UIHeightPx = 300, 
    [l_ComponentSymbols_0.LabeledToggleButton] = {
        ComponentSize = UDim2.new(0, 150, 0, 30), 
        ToggleSize = UDim2.fromOffset(40, 24), 
        LeftInsetPx = 12, 
        PaddingPx = 10
    }
};
return function(v4)
    local _ = nil;
    return (if not v4 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v3);
end;
