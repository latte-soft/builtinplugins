local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.MaterialFramework);
local l_Style_0 = v2.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_Image_0 = v2.UI.Image;
local v10 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local v11 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Theme_0 = v3.Resources.Theme;
local v14 = require(l_Parent_0.Src.Resources.Theme);
local v15 = {
    Image = "rbxasset://textures/DevConsole/Close.png", 
    Color = l_StyleKey_0.ErrorText, 
    Size = UDim2.fromScale(1, 1)
};
local v16 = {
    Header = {
        GenerateButtonSize = UDim2.fromOffset(80, 32), 
        UploadButtonSize = UDim2.fromOffset(32, 32), 
        MultiLinePrompt = true, 
        Padding = 10, 
        PromptHeight = not v10() and 64 or 88, 
        RowHeight = 32, 
        Size = UDim2.new(1, 0, 0, 102), 
        VerticalSpacing = 6, 
        ErrorPadding = 32, 
        ErrorSpacing = 32, 
        ErrorLabelSpacing = 8, 
        RetryButtonSize = UDim2.new(0, 150, 0, 44), 
        ErrorMessageTextColor = l_StyleKey_0.TextSecondary, 
        AddImageButtonIconColor = l_StyleKey_0.MainText, 
        AddImageButtonIconColorNoImage = l_StyleKey_0.MainText, 
        ImagePadding = 5, 
        ImageCornerRadius = UDim.new(0, 8), 
        ImageBackgroundColor3 = l_StyleKey_0.InputFieldBackground, 
        ImageColor3 = Color3.new(1, 1, 1), 
        ImageBorderColor = l_StyleKey_0.InputFieldBorder
    }, 
    [l_StyleModifier_0.Selected] = {
        Header = {
            ImageColor3 = Color3.new(0.5, 0.5, 0.5), 
            ImageBorderColor = l_StyleKey_0.InputFieldBorderSelected, 
            AddImageButtonIconColor = Color3.new(1, 1, 1)
        }
    }, 
    [l_StyleModifier_0.Hover] = {
        Header = {
            ImageColor3 = Color3.new(0.5, 0.5, 0.5), 
            ImageBorderColor = l_StyleKey_0.InputFieldBorderHover, 
            AddImageButtonIconColor = Color3.new(1, 1, 1)
        }, 
        TextureItem = {
            ImageColor3 = Color3.new(0.9, 0.9, 0.9)
        }
    }, 
    ErrorBox = {
        Padding = 32, 
        MaxWidth = 400, 
        PrimaryColor = l_StyleKey_0.ErrorText, 
        CornerRadius = 8, 
        CloseButtonPosition = UDim2.new(1, 19, 0.5, 0), 
        CloseButtonSize = UDim2.fromOffset(13, 13), 
        RightPadding = 15
    }, 
    MainView = {
        ErrorPadding = 8, 
        ErrorInnerPadding = 12, 
        ErrorMaxWidth = math.huge
    }, 
    MaterialView = {
        LabelWidth = 100, 
        Padding = 8, 
        PreviewHeight = 192, 
        PreviewTileSize = UDim2.new(0, 192, 0, 192), 
        PrimarySettingsGroupBackgroundColor = l_StyleKey_0.ForegroundContrast, 
        SaveAndApplyButtonSize = UDim2.fromOffset(220, 32), 
        ApplyButtonSize = UDim2.fromOffset(120, 32), 
        SettingsGroupPadding = {
            Left = 6, 
            Right = 6
        }, 
        SettingsGroupSpacing = 10, 
        SettingSpacing = 6, 
        StudsPerTileSettingSize = UDim2.new(1, 0, 0, 32), 
        VerticalSpacing = 6
    }, 
    ModalView = {
        CloseButtonSize = UDim2.fromOffset(24, 24), 
        ContentSize = UDim2.new(1, -30, 1, -30), 
        Transparency = 0.5
    }, 
    Setting = {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    }, 
    TextureBrowser = {
        CellPadding = UDim2.fromOffset(6, 6), 
        CellSize = UDim2.fromOffset(128, 128), 
        Padding = {
            Top = 4, 
            Left = 10, 
            Right = 10
        }
    }, 
    TextureItem = {
        BackgroundColor = l_StyleKey_0.ForegroundMain, 
        BorderColor = l_StyleKey_0.ForegroundContrast, 
        CornerRadius = UDim.new(0, 6), 
        ImageColor3 = Color3.new(1, 1, 1), 
        BorderThickness = 2, 
        SelectedBorderColor = l_StyleKey_0.ActionSelected, 
        Size = UDim2.fromOffset(128, 128)
    }, 
    [l_ComponentSymbols_0.Button] = v1.join(l_getRawComponentStyle_0("Button"), {
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
            BackgroundStyle = v15, 
            [l_StyleModifier_0.Hover] = {
                BackgroundStyle = v15
            }
        }
    })
};
if not v11() then
    return function(v17)
        local _ = nil;
        return (if not v17 then l_StudioTheme_0.new() else l_StudioTheme_0.mock()):extend(v16);
    end;
else
    return function(v19)
        local _ = nil;
        return (if not v19 then l_Theme_0.new() else l_Theme_0.mock()):extend(v14);
    end;
end;
