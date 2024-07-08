local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v3 = {
    ContentHeight = UDim2.new(1, 0, 1, -130), 
    SelectedTopicTextColor = l_StyleKey_0.MainText, 
    TopicTextColor = l_StyleKey_0.SubText, 
    CircleColor = l_StyleKey_0.ForegroundContrast, 
    CircleSize = 24, 
    HintKeyBorder = l_StyleKey_0.SubText, 
    HintKeyBackground = l_StyleKey_0.ForegroundContrast, 
    HintKeyBorderPressed = l_StyleKey_0.MainText, 
    HintKeyBackgroundPressed = l_StyleKey_0.SubText, 
    HintKeyTextColor = l_StyleKey_0.MainText, 
    HintKeyTextColorPressed = l_StyleKey_0.TextContrast, 
    IconSize = UDim2.fromOffset(16, 16), 
    Padding = 15, 
    PaddingSmall = 5
};
local v4 = {
    CheckmarkImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Light/Standard/Checkmark.png", 
    ListSelectedImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Light/Standard/List-Selected.png", 
    ListImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Light/Standard/List.png", 
    CloseImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Light/Standard/Close.png"
};
local v5 = {
    CheckmarkImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Dark/Standard/Checkmark.png", 
    ListSelectedImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Dark/Standard/List-Selected.png", 
    ListImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Dark/Standard/List.png", 
    CloseImage = "rbxasset://studio_svg_textures/Lua/Tutorials/Dark/Standard/Close.png"
};
return function(v6)
    local _ = nil;
    return (if not v6 then l_StudioTheme_0.new(v5, v4) else l_StudioTheme_0.mock()):extend(v3);
end;
