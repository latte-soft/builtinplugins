local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v3 = {
    [l_StyleKey_0.ActivityRing] = "rbxasset://studio_svg_textures/Lua/SocialPresence/Light/Large/ActivityRing.png", 
    [l_StyleKey_0.AddCollaboratorIcon] = "rbxasset://studio_svg_textures/Shared/WidgetIcons/Light/Standard/AddCollaborator.png", 
    [l_StyleKey_0.CheckboxOnIcon] = "rbxasset://studio_svg_textures/Shared/Utility/Light/Standard/CheckboxOn.png", 
    [l_StyleKey_0.CheckboxOffIcon] = "rbxasset://studio_svg_textures/Shared/Utility/Light/Standard/CheckboxOff.png", 
    [l_StyleKey_0.MoreIcon] = "rbxasset://studio_svg_textures/Shared/Navigation/Light/Standard/More.png", 
    [l_StyleKey_0.RibbonBarHover] = Color3.fromRGB(228, 238, 254)
};
local v4 = {
    [l_StyleKey_0.ActivityRing] = "rbxasset://studio_svg_textures/Lua/SocialPresence/Dark/Large/ActivityRing.png", 
    [l_StyleKey_0.AddCollaboratorIcon] = "rbxasset://studio_svg_textures/Shared/WidgetIcons/Dark/Standard/AddCollaborator.png", 
    [l_StyleKey_0.CheckboxOnIcon] = "rbxasset://studio_svg_textures/Shared/Utility/Dark/Standard/CheckboxOn.png", 
    [l_StyleKey_0.CheckboxOffIcon] = "rbxasset://studio_svg_textures/Shared/Utility/Dark/Standard/CheckboxOff.png", 
    [l_StyleKey_0.MoreIcon] = "rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/More.png", 
    [l_StyleKey_0.RibbonBarHover] = Color3.fromRGB(37, 37, 37)
};
local v5 = {
    activityRing = l_StyleKey_0.ActivityRing, 
    ribbonItem = {
        size = UDim2.new(0, 24, 1, 0), 
        background = l_StyleKey_0.Tab, 
        overflowBackground = l_StyleKey_0.ImageButtonBackground, 
        addIcon = l_StyleKey_0.AddCollaboratorIcon, 
        buttonHover = l_StyleKey_0.RibbonBarHover
    }, 
    footer = {
        height = 24, 
        borderColor = l_StyleKey_0.Border, 
        iconColor = l_StyleKey_0.ButtonText, 
        moreIcon = l_StyleKey_0.MoreIcon, 
        uncheckedIcon = l_StyleKey_0.CheckboxOffIcon, 
        checkedIcon = l_StyleKey_0.CheckboxOnIcon, 
        disableTeamCreateColor = Color3.fromRGB(244, 100, 93)
    }, 
    highlightToggle = {
        height = 28, 
        background = l_StyleKey_0.SubBackground, 
        border = l_StyleKey_0.Border
    }, 
    collaboratorItem = {
        size = UDim2.new(1, 0, 0, 58), 
        expandedSize = UDim2.new(1, 0, 0, 96), 
        thumbnailSize = UDim2.fromOffset(42, 42), 
        hoveredBackground = l_StyleKey_0.SubBackground, 
        usernamePosition = UDim2.fromOffset(48, 4), 
        subtitlePosition = UDim2.fromOffset(48, 24)
    }, 
    jumpButton = {
        background = l_StyleKey_0.ImageButtonBackground, 
        hoveredBackground = l_StyleKey_0.ButtonHover, 
        pressedBackground = l_StyleKey_0.ButtonPressed, 
        textColor = l_StyleKey_0.TextPrimary, 
        baseStyle = {
            BackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
            SliceCenter = Rect.new(3, 3, 13, 13), 
            BorderSize = 0
        }
    }, 
    userThumbnail = {
        avatarBackground = l_StyleKey_0.SecondaryContrast, 
        avatarIdleBackground = l_StyleKey_0.ForegroundContrast, 
        avatarSizeRatio = 0.75, 
        idleTint = Color3.fromRGB(140, 140, 140), 
        loadingImage = "rbxasset://textures/StudioSharedUI/default_user.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }
};
return function(v6)
    local _ = nil;
    return (if not v6 then l_StudioTheme_0.new(v4, v3) else l_StudioTheme_0.mock(v4, v3)):extend(v5);
end;
