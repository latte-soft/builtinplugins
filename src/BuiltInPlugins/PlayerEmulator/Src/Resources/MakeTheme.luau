local l_EnablePseudolocalizationInPlayerEmulator_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_StudioTheme_0 = v4.Style.Themes.StudioTheme;
local l_StyleKey_0 = v4.Style.StyleKey;
local l_Spritesheet_0 = v4.Util.Spritesheet;
local function v9()
    local v8 = l_Spritesheet_0("rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", {
        SpriteSize = 12, 
        NumSprites = 4
    });
    return v3.Dictionary.join({
        Arrow = {
            rightArrowImage = v8[1], 
            downArrowImage = v8[3], 
            dimension = 12
        }, 
        BackgroundColor = l_StyleKey_0.MainBackground, 
        ButtonColor = l_StyleKey_0.MainBackground, 
        HoverColor = l_StyleKey_0.ButtonHover, 
        PressedColor = l_StyleKey_0.ButtonPressed, 
        BorderColor = l_StyleKey_0.Border, 
        TextColor = l_StyleKey_0.MainText, 
        ErrorColor = l_StyleKey_0.ErrorText, 
        LinkColor = l_StyleKey_0.LinkText, 
        Green = Color3.fromRGB(64, 166, 81), 
        White = Color3.fromRGB(255, 255, 255), 
        DisabledColor = l_StyleKey_0.MainTextDisabled
    }, {
        ROW_HEIGHT = 25, 
        MAINVIEW_PADDING_TOP = UDim.new(0, 15), 
        MAINVIEW_PADDING_LEFT = UDim.new(0, 10), 
        MAINSWITCH_LABEL_SIZE = UDim2.new(0, 150, 0, 25), 
        TEXT_INDENT_PADDING = UDim.new(0, 4), 
        HORIZONTAL_LISTLAYOUT_PADDING = UDim.new(0, 5), 
        DROPDOWN_BUTTON_SIZE = UDim2.new(0, 170, 0, 25), 
        DROPDOWN_ARROW_IMAGE = "rbxasset://textures/menuDownArrow.png", 
        DROPDOWN_ARROW_POSITION = UDim2.new(1, -15, 0.5, 0), 
        DROPDOWN_ARROW_SIZE = UDim2.new(0, 5, 0, 3), 
        SELECTOR_SIZE = UDim2.new(0, 300, 0, not l_EnablePseudolocalizationInPlayerEmulator_0 and 30 or 32), 
        DROPDOWN_MAX_HEIGHT = 200, 
        SCROLLBAR_THICKNESS = 10, 
        LANGUAGE_SECTION_SIZE = UDim2.new(0, 300, 0, 50), 
        LANGUAGE_INSTRUCTION_SIZE = UDim2.new(0, 300, 0, 20), 
        LANGUAGE_INSTRUCTION_TEXT_SIZE = 14, 
        LOCALEID_TEXTBOX_SIZE = UDim2.new(0, 75, 0, 25), 
        PSEUDOLOCALIZATION_SECTION_SIZE = UDim2.new(0, 300, 0, 25), 
        TOGGLE_ITEM_FRAME_SIZE = UDim2.new(0, 300, 0, 25), 
        TOGGLE_BUTTON_HEIGHT = 15, 
        TOGGLE_BUTTON_WIDTH = 25, 
        TOGGLE_BUTTON_OFFSET = 255, 
        COLLAPSE_ARROW_OFFSET = 265, 
        LISTITEM_INDENT_LEFT = UDim.new(0, 20), 
        LISTITEM_CHECKBOX_HEIGHT = 18, 
        CHECKBOX_FRAME_SIZE = UDim2.new(1, 0, 0, 20), 
        CHECKBOX_HEIGHT = 18, 
        CHECKBOX_TEXT_SIZE = 11
    });
end;
return function()
    local v10 = v2.RunningUnderCLI();
    local v11 = nil;
    v11 = if not v10 then l_StudioTheme_0.new() else l_StudioTheme_0.mock();
    v11:extend(v9());
    return v11;
end;
