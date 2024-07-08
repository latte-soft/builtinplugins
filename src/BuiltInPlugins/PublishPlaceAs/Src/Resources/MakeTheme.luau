local v0 = require(script.parent.parent.parent.Packages.Framework);
local l_StyleModifier_0 = v0.Util.StyleModifier;
local l_Style_0 = v0.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local v5 = {
    font = Enum.Font.SourceSans, 
    fontStyle = {
        Title = {
            Font = Enum.Font.SourceSans, 
            TextSize = 24, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }, 
        Normal = {
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            TextColor3 = l_StyleKey_0.MainText
        }, 
        Smaller = {
            Font = Enum.Font.SourceSans, 
            TextSize = 20, 
            TextColor3 = l_StyleKey_0.MainText
        }, 
        Subtext = {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            TextColor3 = l_StyleKey_0.DimmedText
        }
    }, 
    backgroundColor = l_StyleKey_0.MainBackground, 
    foregroundColorContrast = l_StyleKey_0.ForegroundContrast, 
    textColor = l_StyleKey_0.MainText, 
    subTextColor = l_StyleKey_0.SubText, 
    dimmerTextColor = l_StyleKey_0.DimmedText, 
    warningTextColor = l_StyleKey_0.WarningText, 
    disabledColor = l_StyleKey_0.Tab, 
    borderColor = l_StyleKey_0.Border, 
    hoverColor = l_Style_0.Colors.Blue, 
    errorColor = l_StyleKey_0.ErrorText, 
    icons = {
        newPlace = "rbxasset://textures/PublishPlaceAs/WhiteNew.png", 
        backArrow = "rbxasset://textures/PublishPlaceAs/navigation_pushBack.png", 
        checkmark = "rbxasset://textures/PublishPlaceAs/common_checkmarkCircle.png", 
        thumbnailPlaceHolder = "rbxasset://textures/StudioSharedUI/TransparentWhiteImagePlaceholder.png", 
        warning = "rbxasset://textures/StudioSharedUI/statusWarning.png", 
        backgroundColor = l_StyleKey_0.IconBackgroundColor, 
        imageColor = l_StyleKey_0.IconImageColor
    }, 
    descriptionBox = {
        maxHeight = 120, 
        textBoxHeight = 90
    }, 
    toggleButton = {
        width = 40, 
        height = 24
    }, 
    dialog = {
        minSize = {
            width = 400, 
            height = 204
        }, 
        spacing = 20
    }, 
    tooltipIcon = {
        paddingY = 30, 
        size = 14
    }, 
    optInLocations = {
        height = 52
    }, 
    requirementsLink = {
        height = 22, 
        length = 250, 
        paddingY = 25
    }, 
    emailDialog = {
        Size = {
            X = 500, 
            Y = 350
        }
    }, 
    selectInput = {
        button = {
            height = 38
        }, 
        fontStyle = {
            Normal = {
                TextSize = 22
            }
        }, 
        padding = 10, 
        width = {
            creator = 330, 
            genre = 210
        }
    }, 
    defaultButton = {
        ButtonColor = l_StyleKey_0.DialogMainButton, 
        ButtonColor_Hover = l_StyleKey_0.LinkText, 
        ButtonColor_Disabled = l_StyleKey_0.DialogMainButtonDisabled, 
        TextColor = l_StyleKey_0.DialogMainButtonText, 
        TextColor_Disabled = l_StyleKey_0.DialogMainButtonTextDisabled, 
        BorderColor = l_StyleKey_0.Light
    }, 
    cancelButton = {
        ButtonColor = l_StyleKey_0.Button, 
        ButtonColor_Hover = l_StyleKey_0.ButtonHover, 
        ButtonColor_Disabled = l_StyleKey_0.ButtonDisabled, 
        TextColor = l_StyleKey_0.ButtonText, 
        TextColor_Disabled = l_StyleKey_0.DimmedText, 
        BorderColor = l_StyleKey_0.Border
    }, 
    pageButton = {
        ButtonColor = l_StyleKey_0.Button, 
        ImageColor = l_StyleKey_0.MainText, 
        BorderColor = l_StyleKey_0.Border, 
        hovered = {
            ButtonColor = l_StyleKey_0.ButtonHover
        }, 
        disabled = {
            ButtonColor = l_StyleKey_0.ButtonDisabled, 
            ImageColor = l_StyleKey_0.DimmedText
        }
    }, 
    menuBar = {
        backgroundColor = l_StyleKey_0.MenuBarBackground
    }, 
    menuEntry = {
        hover = l_StyleKey_0.MenuEntryHover, 
        highlight = l_StyleKey_0.MenuEntryHighlight, 
        text = l_StyleKey_0.BrightText, 
        font = {
            selected = Enum.Font.SourceSansSemibold, 
            unselected = Enum.Font.SourceSans
        }
    }, 
    footer = {
        gradient = l_StyleKey_0.MainText, 
        textbutton = {
            font = Enum.Font.SourceSans
        }
    }, 
    header = {
        font = Enum.Font.SourceSans, 
        text = l_StyleKey_0.BrightText
    }, 
    checkboxset = {
        font = Enum.Font.SourceSans, 
        error = l_StyleKey_0.ErrorText, 
        maxHeight = 65
    }, 
    listDialog = {
        font = Enum.Font.SourceSansSemibold, 
        textColor = l_StyleKey_0.MainText
    }, 
    successText = {
        font = Enum.Font.SourceSans, 
        text = Color3.fromRGB(2, 183, 87)
    }, 
    textWithInlineLink = {
        maxWidth = 380
    }, 
    failText = {
        font = Enum.Font.SourceSans, 
        text = l_StyleKey_0.ErrorText
    }, 
    pageText = {
        font = Enum.Font.SourceSansLight
    }, 
    radioButton = {
        backgroundColor = l_StyleKey_0.InputFieldBackground, 
        size = 20, 
        image = {
            background = "rbxasset://textures/GameSettings/RadioButton.png", 
            selected = l_StyleKey_0.RadioButtonImage
        }
    }, 
    genreInfo = {
        image = l_StyleKey_0.InformationImage, 
        imageSize = 20, 
        imageTextGap = 2, 
        BodyBodyDefault = {
            Font = Enum.Font.SourceSans, 
            TextSize = 18, 
            TextColor = l_StyleKey_0.MainText
        }, 
        paneBackgroundColor = l_StyleKey_0.ForegroundContrast, 
        paneBorderColor = l_StyleKey_0.OtherDivider, 
        panePadding = 8, 
        paneBorderSize = 1
    }, 
    DROPDOWN_WIDTH = 330, 
    DROPDOWN_HEIGHT = 38, 
    MENU_BAR_WIDTH = 192, 
    FOOTER_HEIGHT = 65, 
    SCREEN_CHOOSE_GAME = {
        ARROW_SIZE = 12, 
        PAGE_PADDING = 115, 
        TILE_HEIGHT = 232, 
        ICON_SIZE = 150, 
        NAME_SIZE = 45, 
        NAME_PADDING = 8, 
        TILE_FOOTER_SIZE = 35, 
        FOOTER_SIDE_PADDING = 4, 
        GUIDELINE_LABEL_PADDING = 4, 
        FRAME_BUTTON_SIZE = 32, 
        CELL_PADDING_X = 30, 
        CELL_PADDING_Y = 40
    }, 
    isDarkerTheme = settings().Studio.Theme.Name == "Dark", 
    [l_Style_0.ComponentSymbols.Image] = v0.Dash.join(l_Style_0.getRawComponentStyle("Image"), {
        ["&TooltipStyle"] = {
            Image = "rbxasset://textures/PublishPlaceAs/MoreDetails.png", 
            Color = l_StyleKey_0.SubText, 
            [l_StyleModifier_0.Hover] = {
                Color = l_StyleKey_0.MainTextHover
            }
        }
    })
};
local v6 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/StudioSharedUI/radio_selected_enabled_dark.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Information.png"
};
local v7 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Information.png"
};
return function(v8)
    local _ = nil;
    return ((if not v8 then l_StudioTheme_0.new(v6, v7) else l_StudioTheme_0.mock(v6, v7)):extend(v5));
end;
