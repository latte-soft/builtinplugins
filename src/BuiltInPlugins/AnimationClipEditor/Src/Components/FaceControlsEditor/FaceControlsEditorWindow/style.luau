local v0 = require(script:FindFirstAncestor("AnimationClipEditor").Packages.Framework);
local l_UI_0 = v0.UI;
local l_Util_0 = v0.Util;
local l_Cryo_0 = l_Util_0.Cryo;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local _ = l_UI_0.RoundBox;
local l_Image_0 = l_UI_0.Image;
local l_StyleKey_0 = v0.Style.StyleKey;
local l_style_0 = l_UI_0.UIFolderData.RoundBox.style;
local v10 = l_deepCopy_0(l_style_0);
local function v12(v11)
    return {
        Size = UDim2.fromOffset(28, 28), 
        Foreground = l_Image_0, 
        ForegroundStyle = {
            Image = v11
        }, 
        Background = l_style_0, 
        BackgroundStyle = l_Cryo_0.Dictionary.join(v10, {
            Color = l_StyleKey_0.ImageButtonBackground
        }), 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = l_Cryo_0.Dictionary.join(v10, {
                Transparency = 0.5, 
                Color = l_StyleKey_0.ImageButtonHover
            })
        }, 
        [l_StyleModifier_0.Disabled] = {
            BackgroundStyle = l_Cryo_0.Dictionary.join(v10, {
                Color = l_StyleKey_0.ButtonDisabled, 
                Transparency = 0.5
            })
        }
    };
end;
return {
    Controls = {
        Size = UDim2.new(1, 0, 0, 46), 
        Padding = {
            Top = 5, 
            Left = 11, 
            Bottom = 11, 
            Right = 11
        }, 
        PauseButton = v12("rbxasset://textures/DeveloperFramework/MediaPlayerControls/pause_button.png"), 
        PlayButton = v12("rbxasset://textures/DeveloperFramework/MediaPlayerControls/play_button.png")
    }
};
