local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Style_0 = v2.Style;
local l_Colors_0 = l_Style_0.Colors;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_Image_0 = v2.UI.Image;
local l_UIData_0 = v2.UIData;
local v10 = require(l_UIData_0.Alert.style);
local v11 = require(l_UIData_0.Button.style);
local v12 = require(l_Parent_0.Src.Util.Constants);
local l_PROMPT_HEIGHT_0 = v12.PROMPT_HEIGHT;
local l_TOOLBAR_HEIGHT_0 = v12.TOOLBAR_HEIGHT;
local v15 = {};
l_ComponentSymbols_0:add("LoadingButton");
v15[l_ComponentSymbols_0.LoadingButton] = {
    LoadingIndicatorSize = UDim2.fromOffset(24, 16)
};
l_ComponentSymbols_0:add("App");
v15[l_ComponentSymbols_0.App] = {
    BrowserSize = UDim2.new(1, 0, 1, -l_PROMPT_HEIGHT_0), 
    PromptSize = UDim2.new(1, 0, 0, l_PROMPT_HEIGHT_0)
};
l_ComponentSymbols_0:add("Prompt");
v15[l_ComponentSymbols_0.Prompt] = {
    BackgroundColor = l_StyleKey_0.Titlebar, 
    MultiLine = true, 
    Padding = 8, 
    PromptToolbarSize = UDim2.new(1, 0, 0, l_TOOLBAR_HEIGHT_0)
};
l_ComponentSymbols_0:add("PromptToolbar");
v15[l_ComponentSymbols_0.PromptToolbar] = {
    GenerateButtonSize = UDim2.fromOffset(80, 32)
};
l_ComponentSymbols_0:add("Browser");
v15[l_ComponentSymbols_0.Browser] = {
    CellGroupHeader = {
        AfterContent = true, 
        Collapsible = false, 
        Size = UDim2.new(1, 0, 0, l_TOOLBAR_HEIGHT_0)
    }, 
    Padding = 4, 
    StatusIconImageColor = l_Colors_0.Gray_Light, 
    StatusIconPosition = UDim2.fromOffset(6, 6), 
    StatusIconSize = UDim2.fromOffset(16, 16)
};
l_ComponentSymbols_0:add("PromptGroupFooter");
v15[l_ComponentSymbols_0.PromptGroupFooter] = {
    BackgroundColor = l_StyleKey_0.ForegroundContrast, 
    ButtonColor = l_StyleKey_0.TextSecondary, 
    ButtonImageSize = UDim2.fromOffset(16, 16), 
    ButtonSize = UDim2.fromOffset(24, 24), 
    ButtonSpacing = 4, 
    CopyPromptButtonImage = "rbxasset://textures/MaterialGenerator/Copy_16x16.png", 
    CornerRadius = UDim.new(0, 4), 
    Padding = {
        Left = 6, 
        Right = 4
    }, 
    Style = "RoundBox", 
    TextColor = l_StyleKey_0.TextSecondary
};
l_ComponentSymbols_0:add("Editor");
v15[l_ComponentSymbols_0.Editor] = {
    ApplyButtonBackgroundColor = l_StyleKey_0.Button, 
    ApplyButtonIcon = "rbxasset://textures/MaterialManager/Apply_to_Selection.png", 
    ApplyButtonSize = UDim2.fromOffset(0, 32), 
    CloseButtonSize = UDim2.fromOffset(24, 24), 
    LabelWidth = 100, 
    Padding = 8, 
    PreviewBackgroundColor = l_StyleKey_0.ScrollBarBackground, 
    PreviewHeight = 300, 
    PreviewTileSize = UDim2.fromOffset(192, 192), 
    SettingsPadding = {
        Left = 10, 
        Right = 10, 
        Top = 10, 
        Bottom = 30
    }, 
    SettingSpacing = 8, 
    StudsPerTileSettingSize = UDim2.new(1, 0, 0, 30), 
    UploadAndApplyButtonIcon = "rbxasset://textures/MaterialGenerator/Submit_16x16.png", 
    UploadAndApplyButtonSize = UDim2.fromOffset(180, 32)
};
l_ComponentSymbols_0:add("Setting");
v15[l_ComponentSymbols_0.Setting] = {
    HorizontalSpacing = 16, 
    Size = UDim2.new(1, 0, 0, 30), 
    ValueLabelWidth = 30
};
v15[l_ComponentSymbols_0.Alert] = v1.join(v10, {
    ["&AppError"] = v1.join(v10["&Error"], {
        HorizontalPadding = UDim.new(0, 16), 
        MaxWidth = math.huge
    })
});
local v16 = {
    Color = l_StyleKey_0.ErrorText, 
    Image = "rbxasset://textures/DevConsole/Close.png", 
    Size = UDim2.fromScale(1, 1)
};
v15[l_ComponentSymbols_0.Button] = v1.join(v11, {
    ["&Close"] = {
        Background = l_Image_0, 
        BackgroundStyle = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = "rbxasset://textures/ui/TopBar/close.png", 
            Color = l_StyleKey_0.ButtonText, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(18, 18)
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/ui/TopBar/close.png", 
                Color = l_StyleKey_0.BrightText, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(18, 18)
            }
        }
    }, 
    ["&ErrorClose"] = {
        Background = l_Image_0, 
        BackgroundStyle = v16, 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = v16
        }
    }
});
return v15;
