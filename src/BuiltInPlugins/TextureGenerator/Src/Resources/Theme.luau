local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Style_0 = v2.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_UIData_0 = v2.UIData;
local v7 = require(l_UIData_0.Alert.style);
local v8 = require(l_UIData_0.IconButton.style);
local v9 = require(l_UIData_0.Image.style);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = {};
local v12 = game:DefineFastFlag("TextureGeneratorFixTooltipAnchorPoint", false);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorAddFeedback);
l_ComponentSymbols_0:add("TermsOfServiceScreen");
v11[l_ComponentSymbols_0.TermsOfServiceScreen] = {
    AlertSize = UDim2.new(0.95, 0, 0, 70), 
    ButtonPaneSize = UDim2.new(0.95, 0, 0, 300), 
    ButtonAnchorPoint = Vector2.new(0.5, 0.5), 
    ButtonSize = UDim2.new(0, 75, 0, 30)
};
l_ComponentSymbols_0:add("EntryArea");
v11[l_ComponentSymbols_0.EntryArea] = {
    BackgroundColor = l_StyleKey_0.Titlebar
};
l_ComponentSymbols_0:add("GenerationAngleHelp");
v11[l_ComponentSymbols_0.GenerationAngleHelp] = {
    AnchorPoint = if not v12 then Vector2.new(0, 0) else UDim2.new(0, 0, 0, 0), 
    HelpImage = {
        Color = l_StyleKey_0.TextSecondary, 
        Image = "rbxasset://textures/StudioSharedUI/Help.png", 
        Size = UDim2.fromOffset(16, 16)
    }, 
    Padding = {
        Top = 8, 
        Left = 8, 
        Right = 8
    }, 
    Position = if not v12 then UDim2.new(0, 0, 0, 0) else Vector2.new(0, 0), 
    Spacing = 8, 
    TextStyle = "Label", 
    ZIndex = 1
};
l_ComponentSymbols_0:add("PreviewArea");
v11[l_ComponentSymbols_0.PreviewArea] = {
    GenerateButtonSize = UDim2.fromOffset(130, 32), 
    GenerateButtonStyle = "RoundPrimary", 
    LeftIcon = "rbxasset://textures/DeveloperFramework/icon_backward.png", 
    RightIcon = "rbxasset://textures/DeveloperFramework/icon_forward.png", 
    Padding = 8, 
    PreviewLabelSize = UDim2.new(1, 0, 0, 24), 
    PreviewLabelStyle = "Label", 
    PromptLabelSize = UDim2.new(1, 0, 0, 80), 
    Size = UDim2.new(1, 0, 0, 300)
};
local v14 = UDim2.fromOffset(75, 32);
local v15 = UDim2.fromOffset(42, 42);
local v16 = UDim2.fromOffset(32, 32);
local v17 = {
    Left = 0, 
    Right = not v13() and 4 or 2
};
local v18 = v17.Left + v17.Right;
local v19 = UDim2.fromOffset(42, 42);
local v20 = (v15.X.Offset + v14.X.Offset) + v18;
local v21 = (v15.X.Offset + v16.X.Offset) + v18;
local v22 = (v15.X.Offset + v16.X.Offset * 3) + v18 * 3;
l_ComponentSymbols_0:add("GenerationCard");
v11[l_ComponentSymbols_0.GenerationCard] = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    CancelButtonSize = v14, 
    CancelButtonStyle = "Round", 
    InstanceViewSize = v15, 
    MenuButtonSize = v16, 
    Padding = v17, 
    PreviewImageSize = v19, 
    ProgressBarWidth = UDim.new(1, -v20), 
    PromptLabelProgressSize = UDim2.new(1, -v20, 0, 40), 
    PromptLabelSize = UDim2.new(1, -v21, 0, 40), 
    PromptLabelCompletedSize = UDim2.new(1, -v22, 0, 40), 
    StrokeColor = l_StyleKey_0.Border, 
    SelectedStrokeColor = l_StyleKey_0.DialogMainButton, 
    ErrorStrokeColor = l_StyleKey_0.WarningMain, 
    ThumbsUpIcon = l_StyleKey_0.ThumbsUp, 
    ThumbsDownIcon = l_StyleKey_0.ThumbsDown, 
    ThumbsUpOutlineIcon = l_StyleKey_0.ThumbsUpOutline, 
    ThumbsDownOutlineIcon = l_StyleKey_0.ThumbsDownOutline
};
l_ComponentSymbols_0:add("ViewSelector");
v11[l_ComponentSymbols_0.ViewSelector] = {
    BackgroundColor = l_StyleKey_0.Titlebar, 
    DisablePan = true, 
    DisableZoom = true, 
    InitialFocusDirection = Vector3.new(0, 0, 1), 
    LightColor = Color3.new(1, 1, 1), 
    LightDirection = -Vector3.new(1, 1, 1), 
    Size = UDim2.new(1, 0, 0, 300)
};
v11[l_ComponentSymbols_0.Alert] = v1.Dictionary.join(v7, {
    ["&EntryError"] = v1.Dictionary.join(v7["&Error"], {
        HorizontalPadding = UDim.new(0, 12)
    })
});
v11[l_ComponentSymbols_0.Image] = v1.Dictionary.join(v9, {
    ["&Colored"] = {
        Color = l_StyleKey_0.TextPrimary
    }, 
    ["&ColoredWarning"] = {
        Color = l_StyleKey_0.WarningMain
    }, 
    ["&PreviewAreaNext"] = {
        Image = l_StyleKey_0.PreviewAreaNext, 
        Color = l_StyleKey_0.TextPrimary, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(16, 16), 
        Position = UDim2.fromScale(0.5, 0.5)
    }, 
    ["&PreviewAreaPrevious"] = {
        Image = l_StyleKey_0.PreviewAreaPrevious, 
        Color = l_StyleKey_0.TextPrimary, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(16, 16), 
        Position = UDim2.fromScale(0.5, 0.5)
    }
});
v11[l_ComponentSymbols_0.IconButton] = v1.Dictionary.join(v8, {
    ["&PreviewAreaImageRotateButton"] = {
        BackgroundColor = l_StyleKey_0.SecondaryMain, 
        Color = l_StyleKey_0.SecondaryMuted, 
        Cursor = "PointingHand", 
        HoverColor = l_StyleKey_0.SecondaryStatesHoverBackground, 
        IconScaleType = Enum.ScaleType.Fit, 
        IconSize = 16, 
        ImageTransparency = 0.5, 
        Size = UDim2.fromOffset(24, 24)
    }
});
return v11;
