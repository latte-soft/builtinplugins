local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local v2 = {
    MainBackground = l_Style_0.StyleKey.MainBackground, 
    Separator = {
        Weight = 1, 
        StretchMargin = 15, 
        Color = Color3.fromRGB(150, 150, 150)
    }, 
    BorderColor = Color3.fromRGB(229, 229, 229)
};
return function(v3)
    local _ = nil;
    return (if not v3 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v2);
end;
