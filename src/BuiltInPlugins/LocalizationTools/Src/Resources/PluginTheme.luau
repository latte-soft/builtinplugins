local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_createDefaultTheme_0 = l_Style_0.createDefaultTheme;
local l_Box_0 = v1.UI.Box;
local v12 = string.format("rbxasset://studio_svg_textures/Lua/Localization/%s/Large/", "Light/");
local v13 = string.format("rbxasset://studio_svg_textures/Lua/Localization/%s/Large/", "Dark/");
local v14 = string.format("rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/", "Light/");
local v15 = string.format("rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/", "Dark/");
local v16 = {
    [l_StyleKey_0.ProgressSpinnerImage] = "rbxasset://textures/DarkThemeLoadingCircle.png", 
    [l_StyleKey_0.Import] = v13 .. "ImportCSV.png", 
    [l_StyleKey_0.Export] = v13 .. "ExportCSV.png", 
    [l_StyleKey_0.TextCapture] = v13 .. "TextCapture.png", 
    [l_StyleKey_0.TextCaptureOn] = v13 .. "TextCaptureStop.png", 
    [l_StyleKey_0.ArrowExpanded] = v15 .. "ArrowDown.png", 
    [l_StyleKey_0.ArrowCollapsed] = v15 .. "ArrowRight.png"
};
local v17 = {
    [l_StyleKey_0.ProgressSpinnerImage] = "rbxasset://textures/LightThemeLoadingCircle.png", 
    [l_StyleKey_0.Import] = v12 .. "ImportCSV.png", 
    [l_StyleKey_0.Export] = v12 .. "ExportCSV.png", 
    [l_StyleKey_0.TextCapture] = v12 .. "TextCapture.png", 
    [l_StyleKey_0.TextCaptureOn] = v12 .. "TextCaptureStop.png", 
    [l_StyleKey_0.ArrowExpanded] = v14 .. "ArrowDown.png", 
    [l_StyleKey_0.ArrowCollapsed] = v14 .. "ArrowRight.png"
};
return function(v18)
    l_ComponentSymbols_0:add("MainView");
    l_ComponentSymbols_0:add("MessageFrame");
    l_ComponentSymbols_0:add("CloudTableSection");
    l_ComponentSymbols_0:add("ProgressSpinner");
    l_ComponentSymbols_0:add("LabeledTextButton");
    l_ComponentSymbols_0:add("Collapsible");
    l_ComponentSymbols_0:add("EmbeddedTableSection");
    l_ComponentSymbols_0:add("UploadDialogContent");
    l_ComponentSymbols_0:add("ErrorDialog");
    l_ComponentSymbols_0:add("WarningDialog");
    l_ComponentSymbols_0:add("LabeledImageButton");
    l_ComponentSymbols_0:add("ImageLocalizationSection");
    local v19 = {
        [l_ComponentSymbols_0.Button] = v2.Dictionary.join(l_getRawComponentStyle_0("Button"), {
            Background = l_Box_0, 
            BackgroundStyle = {
                Color = l_StyleKey_0.Button, 
                BorderColor = l_StyleKey_0.Border, 
                BorderSize = 1
            }, 
            ["&TextButton"] = {
                TextColor = l_StyleKey_0.BrightText, 
                [l_StyleModifier_0.Hover] = {
                    BackgroundStyle = {
                        Color = l_StyleKey_0.ButtonHover
                    }
                }
            }, 
            ["&DisabledTextButton"] = {
                TextColor = l_StyleKey_0.DimmedText
            }, 
            ["&PrimeTextButton"] = {
                TextColor = l_StyleKey_0.DialogMainButtonText, 
                BackgroundStyle = {
                    Color = l_StyleKey_0.DialogMainButton, 
                    BorderColor = l_StyleKey_0.Border, 
                    BorderSize = 1
                }, 
                [l_StyleModifier_0.Hover] = {
                    BackgroundStyle = {
                        Color = l_StyleKey_0.DialogMainButtonHover
                    }
                }
            }
        }), 
        [l_ComponentSymbols_0.LinkText] = v2.Dictionary.join(l_getRawComponentStyle_0("LinkText"), {
            EnableHover = true, 
            Font = Enum.Font.SourceSans, 
            TextColor = l_StyleKey_0.LinkText, 
            TextSize = 16
        }), 
        [l_ComponentSymbols_0.TitledFrame] = v2.Dictionary.join(l_getRawComponentStyle_0("TitledFrame"), {
            TextColor = l_StyleKey_0.BrightText, 
            TextSize = 16
        }), 
        [l_ComponentSymbols_0.MainView] = {
            EmptyFrameHeight = 1000, 
            MainBackground = l_StyleKey_0.MainBackground, 
            Padding = 5, 
            PaddingRight = 20, 
            PaddingTop = 10, 
            ScrollBarBorderColor = l_StyleKey_0.Border, 
            ScrollBarColor = l_StyleKey_0.ScrollBar, 
            ScrollingFrameackground = l_StyleKey_0.ScrollBarBackground, 
            ScrollingFrameCanvasHeight = 450, 
            ScrollingFrameHeight = -20
        }, 
        [l_ComponentSymbols_0.MessageFrame] = {
            BackgroundColor = l_StyleKey_0.RibbonTab, 
            BorderColor = l_StyleKey_0.Border, 
            Height = 20, 
            Padding = 5, 
            TextColor = l_StyleKey_0.BrightText
        }, 
        [l_ComponentSymbols_0.CloudTableSection] = {
            LeftIndent = 15, 
            MessageFrameBackground = l_StyleKey_0.MainBackground, 
            MessageFrameBorder = l_StyleKey_0.Border, 
            PaddingTop = 5, 
            SectionLabelSize = 20, 
            SectionLabelTextSize = 10, 
            TextColor = l_StyleKey_0.BrightText, 
            LinkTextHeight = 50, 
            PublishMessageHeight = 150
        }, 
        [l_ComponentSymbols_0.ProgressSpinner] = {
            ImageRectSize = 80, 
            ProgressSpinnerImageUrl = l_StyleKey_0.ProgressSpinnerImage, 
            Size = 81
        }, 
        [l_ComponentSymbols_0.LabeledTextButton] = {
            ButtonWidth = 100, 
            ButtonHeight = 35, 
            Height = 50, 
            LabelWidth = 250, 
            TextColor = l_StyleKey_0.BrightText, 
            DisabledTextColor = l_StyleKey_0.DimmedText
        }, 
        [l_ComponentSymbols_0.Collapsible] = {
            DisabledTextColor = l_StyleKey_0.DimmedText, 
            IconSize = 16, 
            IconColor = l_StyleKey_0.BrightText, 
            IconImageOpen = l_StyleKey_0.ArrowExpanded, 
            IconImageClosed = l_StyleKey_0.ArrowCollapsed, 
            TextColor = l_StyleKey_0.BrightText, 
            TopBarHeight = 24
        }, 
        [l_ComponentSymbols_0.EmbeddedTableSection] = {
            ExportButtonImage = l_StyleKey_0.Export, 
            ImportButtonImage = l_StyleKey_0.Import, 
            LeftIndent = 15, 
            PaddingTop = 5, 
            SectionLabelSize = 20, 
            SectionLabelTextSize = 10, 
            TextColor = l_StyleKey_0.BrightText, 
            TextCaptureButtonImage = {
                On = l_StyleKey_0.TextCaptureOn, 
                Off = l_StyleKey_0.TextCapture
            }
        }, 
        [l_ComponentSymbols_0.LabeledImageButton] = {
            BackgroundColor = l_StyleKey_0.Button, 
            BackgroundColorHovered = l_StyleKey_0.ButtonHover, 
            Height = 50, 
            ImageButtonSize = 50, 
            ImageLabelSize = 30, 
            LabelWidth = 260, 
            TextColor = l_StyleKey_0.BrightText, 
            DisabledTextColor = l_StyleKey_0.DimmedText, 
            TextLabelSize = 20, 
            TextLabelTextSize = 6
        }, 
        [l_ComponentSymbols_0.UploadDialogContent] = {
            BrightText = l_StyleKey_0.BrightText, 
            DimmedText = l_StyleKey_0.DimmedText, 
            ErrorText = l_StyleKey_0.ErrorText, 
            WarningText = l_StyleKey_0.WarningText, 
            Padding = 15, 
            PatchInfoFrameHeight = 290, 
            TableContentsFrameHeight = 90, 
            TableContentPaddingLeft = 30, 
            TableContentPaddingTop = 5, 
            ThisPatchWIllFrameHeight = 130, 
            ButtonFrameHeight = 40, 
            ButtonWidth = 100, 
            ButtonHeight = 35, 
            BorderColor = l_StyleKey_0.Border, 
            MainBackground = l_StyleKey_0.MainBackground, 
            MainButton = l_StyleKey_0.MainButton
        }, 
        [l_ComponentSymbols_0.ErrorDialog] = {
            BrightText = l_StyleKey_0.BrightText, 
            DimmedText = l_StyleKey_0.DimmedText, 
            ErrorText = l_StyleKey_0.ErrorText, 
            WarningText = l_StyleKey_0.WarningText, 
            Padding = 15, 
            ButtonFrameHeight = 40, 
            ButtonWidth = 100, 
            ButtonHeight = 35, 
            BorderColor = l_StyleKey_0.Border, 
            MainBackground = l_StyleKey_0.MainBackground, 
            MainButton = l_StyleKey_0.MainButton
        }, 
        [l_ComponentSymbols_0.WarningDialog] = {
            BrightText = l_StyleKey_0.BrightText, 
            DimmedText = l_StyleKey_0.DimmedText, 
            ErrorText = l_StyleKey_0.ErrorText, 
            WarningText = l_StyleKey_0.WarningText, 
            Padding = 15, 
            ButtonFrameHeight = 40, 
            ButtonWidth = 100, 
            ButtonHeight = 35, 
            BorderColor = l_StyleKey_0.Border, 
            MainBackground = l_StyleKey_0.MainBackground, 
            MainButton = l_StyleKey_0.MainButton
        }, 
        [l_ComponentSymbols_0.ImageLocalizationSection] = {
            LeftIndent = 15, 
            PaddingTop = 20, 
            Spacing = 15, 
            SectionLabelSize = 20, 
            SectionLabelTextSize = 10, 
            TextColor = l_StyleKey_0.BrightText, 
            LabelWidth = 260, 
            ButtonWidth = 100, 
            ButtonHeight = 35
        }
    };
    local _ = nil;
    return (if v18 then l_createDefaultTheme_0({
        getThemeName = function()
            return "Dark";
        end, 
        themesList = {
            Dark = v2.Dictionary.join(l_DarkTheme_0, v16)
        }
    }) else l_StudioTheme_0.new(v16, v17)):extend(v19);
end;
