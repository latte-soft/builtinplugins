local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v3 = l_StudioTheme_0.new({
    [l_StyleKey_0.HttpOverviewTextColor] = Color3.fromRGB(136, 136, 136), 
    [l_StyleKey_0.EmphasisTextColor] = Color3.fromRGB(255, 255, 255), 
    [l_StyleKey_0.ScrollbarColor] = Color3.fromRGB(204, 204, 204), 
    [l_StyleKey_0.SubTitleTextColor] = Color3.fromRGB(170, 170, 170), 
    Separator = {
        Weight = 1, 
        StretchMargin = 7, 
        Color = Color3.fromRGB(170, 170, 170)
    }
}, {
    [l_StyleKey_0.HttpOverviewTextColor] = Color3.fromRGB(46, 46, 46), 
    [l_StyleKey_0.EmphasisTextColor] = Color3.fromRGB(0, 0, 0), 
    [l_StyleKey_0.ScrollbarColor] = Color3.fromRGB(25, 25, 25), 
    [l_StyleKey_0.SubTitleTextColor] = Color3.fromRGB(0, 0, 0), 
    Separator = {
        Weight = 1, 
        StretchMargin = 7, 
        Color = Color3.fromRGB(0, 0, 0)
    }
});
v3:extend({
    BackgroundColor = l_StyleKey_0.MainBackground, 
    ButtonColor = l_StyleKey_0.Button, 
    HttpOverviewTextColor = l_StyleKey_0.HttpOverviewTextColor, 
    ProgressBarColor = l_StyleKey_0.DialogMainButtonSelected, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    BorderColor = l_StyleKey_0.Border, 
    SubTextColor = l_StyleKey_0.SubText, 
    InfoTextColor = l_StyleKey_0.DimmedText, 
    SubTitleTextColor = l_StyleKey_0.SubTitleTextColor, 
    EmphasisTextColor = l_StyleKey_0.EmphasisTextColor, 
    TextColor = l_StyleKey_0.MainText, 
    ErrorColor = l_StyleKey_0.ErrorText, 
    LinkColor = l_StyleKey_0.LinkText, 
    Green = Color3.fromRGB(64, 166, 81), 
    White = Color3.fromRGB(255, 255, 255), 
    DisabledColor = l_StyleKey_0.MainTextDisabled, 
    ScrollbarColor = l_StyleKey_0.ScrollbarColor, 
    ScrollbarTransparency = 0.7, 
    ScrollbarSize = 8, 
    Font = Enum.Font.SourceSans, 
    FontBold = Enum.Font.SourceSansSemibold
});
return v3;
