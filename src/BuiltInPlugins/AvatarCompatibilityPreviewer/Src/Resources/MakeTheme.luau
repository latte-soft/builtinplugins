local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Style_0 = v2.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local v9 = v1.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.Dots] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/OptionsDots.png", 
    [l_StyleKey_0.DotsVertical] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/dots_vertical.png", 
    [l_StyleKey_0.Hide] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/hide.png", 
    [l_StyleKey_0.HideHover] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/hide_hover.png", 
    [l_StyleKey_0.HoverMenu] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/hover_menu.png", 
    [l_StyleKey_0.HoverMenuDisabled] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/hover_menu_disabled.png", 
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Light.png", 
    [l_StyleKey_0.PreviewerBackgroundImage] = "rbxasset://textures/AvatarCompatibilityPreviewer/bg_dark.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://textures/AssetImport/btn_dark_resetcam_28x28.png", 
    [l_StyleKey_0.SendFeedback] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/rate_feedback@2x.png", 
    [l_StyleKey_0.Star] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/star.png", 
    [l_StyleKey_0.StarUnfilled] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/star_unfilled.png", 
    [l_StyleKey_0.UGCValidationSuccessImage] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/ugc_validation_success.png", 
    [l_StyleKey_0.Unhide] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/unhide.png", 
    [l_StyleKey_0.UnhideHover] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/unhide_hover.png"
});
local v10 = v1.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.Dots] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/OptionsDots.png", 
    [l_StyleKey_0.DotsVertical] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/dots_vertical.png", 
    [l_StyleKey_0.Hide] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/hide.png", 
    [l_StyleKey_0.HideHover] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/hide_hover.png", 
    [l_StyleKey_0.HoverMenu] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/hover_menu.png", 
    [l_StyleKey_0.HoverMenuDisabled] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/hover_menu_disabled.png", 
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png", 
    [l_StyleKey_0.PreviewerBackgroundImage] = "rbxasset://textures/AvatarCompatibilityPreviewer/bg_light.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://textures/AssetImport/btn_light_resetcam_28x28.png", 
    [l_StyleKey_0.SendFeedback] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Standard/rate_feedback@2x.png", 
    [l_StyleKey_0.Star] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/star.png", 
    [l_StyleKey_0.StarUnfilled] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/star_unfilled.png", 
    [l_StyleKey_0.UGCValidationSuccessImage] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/ugc_validation_success.png", 
    [l_StyleKey_0.Unhide] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/unhide.png", 
    [l_StyleKey_0.UnhideHover] = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Light/Large/unhide_hover.png"
});
return function(v11)
    local _ = nil;
    return (if not v11 then l_StudioTheme_0.new(v9, v10) else l_StudioTheme_0.mock(v9, v10)):extend(v3);
end;
