local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Style_0 = require(l_script_FirstAncestor_0.Packages.Framework).Style;
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local v8 = v1.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.PreviewAreaNext] = "rbxasset://studio_svg_textures/Lua/TextureGenerator/Dark/Standard/next.png", 
    [l_StyleKey_0.PreviewAreaPrevious] = "rbxasset://studio_svg_textures/Lua/TextureGenerator/Dark/Standard/previous.png", 
    [l_StyleKey_0.ThumbsUp] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Dark/Standard/ThumbsUp.png", 
    [l_StyleKey_0.ThumbsDown] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Dark/Standard/ThumbsDown.png", 
    [l_StyleKey_0.ThumbsUpOutline] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Dark/Standard/ThumbsUpOutline.png", 
    [l_StyleKey_0.ThumbsDownOutline] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Dark/Standard/ThumbsDownOutline.png"
});
local v9 = v1.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.PreviewAreaNext] = "rbxasset://studio_svg_textures/Lua/TextureGenerator/Light/Standard/next.png", 
    [l_StyleKey_0.PreviewAreaPrevious] = "rbxasset://studio_svg_textures/Lua/TextureGenerator/Light/Standard/previous.png", 
    [l_StyleKey_0.ThumbsUp] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Light/Standard/ThumbsUp.png", 
    [l_StyleKey_0.ThumbsDown] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Light/Standard/ThumbsDown.png", 
    [l_StyleKey_0.ThumbsUpOutline] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Light/Standard/ThumbsUpOutline.png", 
    [l_StyleKey_0.ThumbsDownOutline] = "rbxasset://studio_svg_textures/Shared/GenerativeAI/Light/Standard/ThumbsDownOutline.png"
});
return function(v10)
    local _ = nil;
    return (if not v10 then l_StudioTheme_0.new(v8, v9) else l_StudioTheme_0.mock(v8, v9)):extend(v3);
end;
