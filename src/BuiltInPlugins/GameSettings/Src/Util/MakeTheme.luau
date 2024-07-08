local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v1.Util;
local l_Style_0 = v1.Style;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_join_0 = v1.Dash.join;
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local v11 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_GameSettingsExpandToggleButtonTitleWidth_0 = game:GetFastFlag("GameSettingsExpandToggleButtonTitleWidth");
local v13 = {
    Title = {
        Font = Enum.Font.SourceSans, 
        TextSize = 22, 
        TextColor3 = l_StyleKey_0.TitlebarText
    }, 
    Header = {
        Font = Enum.Font.SourceSans, 
        TextSize = 22, 
        TextColor3 = l_StyleKey_0.BrightText
    }, 
    Subtitle = {
        Font = Enum.Font.SourceSans, 
        TextSize = 20, 
        TextColor3 = l_StyleKey_0.SubText
    }, 
    Normal = {
        Font = Enum.Font.SourceSans, 
        TextSize = 20, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    SemiBold = {
        Font = Enum.Font.SourceSansSemibold, 
        TextSize = 20, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Smaller = {
        Font = Enum.Font.SourceSans, 
        TextSize = 18, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Warning = {
        Font = Enum.Font.SourceSans, 
        TextSize = 18, 
        TextColor3 = l_StyleKey_0.WarningText
    }, 
    Error = {
        Font = Enum.Font.SourceSans, 
        TextSize = 18, 
        TextColor3 = l_StyleKey_0.ErrorText
    }, 
    HeaderLink = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        Font = Enum.Font.SourceSans, 
        TextSize = 16, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Small = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        Font = Enum.Font.SourceSans, 
        TextSize = 14, 
        TextColor3 = l_StyleKey_0.MainText
    }, 
    Subtext = {
        Font = Enum.Font.SourceSans, 
        TextSize = 14, 
        TextColor3 = l_StyleKey_0.DimmedText
    }, 
    SmallError = {
        Font = Enum.Font.SourceSans, 
        TextSize = 14, 
        TextColor3 = l_StyleKey_0.ErrorText
    }
};
local v14 = l_getRawComponentStyle_0("Button");
local v15 = {
    fontStyle = v13, 
    backgroundColor = l_StyleKey_0.MainBackground, 
    hyperlink = l_StyleKey_0.LinkText, 
    warningColor = l_StyleKey_0.WarningText, 
    warningIcon = "rbxasset://textures/GameSettings/Warning.png", 
    separator = l_StyleKey_0.SubBackground2, 
    scrollBar = l_StyleKey_0.ScrollBar, 
    scrollBarBackground = l_StyleKey_0.ScrollBarBackground, 
    button = {
        width = 125, 
        height = 35
    }, 
    buttonBar = {
        offset = -29
    }, 
    header = {
        height = 45
    }, 
    menuBar = {
        backgroundColor = l_StyleKey_0.MenuBarBackground
    }, 
    rowHeight = 35, 
    robuxFeeBase = {
        icon = {
            imageColor = l_StyleKey_0.MainText, 
            image = "rbxasset://textures/ui/common/robux_small.png", 
            size = 16
        }, 
        priceField = {
            width = 150
        }, 
        subText = if not v11 then {
            width = 500
        } else nil, 
        height = if not v11 then {
            withSubText = 137, 
            withoutSubText = 121
        } else nil, 
        spacing = not v11 and 10 or 5, 
        transparency = {
            enabled = 0, 
            disabled = 0.5
        }, 
        pricePadding = not v11 and 25 or 10
    }, 
    searchBar = {
        border = l_StyleKey_0.Border, 
        borderHover = l_StyleKey_0.DialogMainButton, 
        borderSelected = l_StyleKey_0.DialogMainButton, 
        placeholderText = l_StyleKey_0.DimmedText, 
        searchIcon = l_StyleKey_0.SubText, 
        clearButton = {
            imageSelected = l_StyleKey_0.SubText, 
            image = l_StyleKey_0.SubText
        }, 
        dropDown = {
            backgroundColor = l_StyleKey_0.InputFieldBackground, 
            itemText = l_StyleKey_0.MainText, 
            headerText = l_StyleKey_0.SubText, 
            hovered = {
                backgroundColor = l_StyleKey_0.ButtonHover
            }, 
            item = {
                offset = 2
            }, 
            selected = {
                backgroundColor = l_StyleKey_0.ButtonSelected
            }
        }
    }, 
    menuEntry = {
        hover = l_StyleKey_0.MenuEntryHover, 
        highlight = l_StyleKey_0.MenuEntryHighlight, 
        text = if not v11 then l_StyleKey_0.BrightText else l_StyleKey_0.TextContrast
    }, 
    footer = {
        gradient = l_StyleKey_0.MainText, 
        height = 65
    }, 
    titleSpacing = if not v11 then nil else 20, 
    textBox = {
        background = l_StyleKey_0.InputFieldBackground, 
        disabled = l_StyleKey_0.InputFieldBackgroundDisabled, 
        borderDefault = l_StyleKey_0.Border, 
        borderHover = l_StyleKey_0.DialogMainButton, 
        tooltip = l_StyleKey_0.DimmedText, 
        text = l_StyleKey_0.MainText, 
        height = 42
    }, 
    textWithInlineLink = {
        maxWidth = 380
    }, 
    radioButton = {
        background = l_StyleKey_0.InputFieldBackground, 
        title = l_StyleKey_0.BrightText, 
        description = l_StyleKey_0.DimmedText, 
        size = 20, 
        padding = not v11 and 5 or 10, 
        descriptionWidth = 500, 
        sapcing = 10, 
        image = {
            background = "rbxasset://textures/GameSettings/RadioButton.png", 
            selected = l_StyleKey_0.RadioButtonImage, 
            selectedDisabled = l_StyleKey_0.RadioButtonDisabledImage
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
    radioButtonSet = {
        warningLabel = {
            color = l_StyleKey_0.WarningText, 
            height = 30
        }, 
        description = {
            height = 25
        }, 
        padding = 5
    }, 
    checkBox = {
        background = l_StyleKey_0.InputFieldBackground, 
        title = l_StyleKey_0.BrightText
    }, 
    devProducts = {
        headerPadding = 20, 
        titlePadding = 12
    }, 
    badges = {
        headerPadding = 20, 
        titlePadding = 12, 
        refreshButton = {
            icon = l_StyleKey_0.RefreshImage, 
            offset = {
                x = -10
            }, 
            size = 18
        }
    }, 
    dropDown = {
        background = l_StyleKey_0.Button, 
        hover = l_StyleKey_0.ButtonHover, 
        text = l_StyleKey_0.BrightText, 
        disabled = l_StyleKey_0.InputFieldBackgroundDisabled, 
        handle = l_StyleKey_0.MainText, 
        border = l_StyleKey_0.Border, 
        gradient = l_StyleKey_0.SubBackground2
    }, 
    dropDownEntry = {
        background = l_StyleKey_0.MenuBarBackground, 
        hover = l_StyleKey_0.MenuEntryHover, 
        highlight = l_StyleKey_0.MenuEntryHighlight, 
        text = l_StyleKey_0.MainText
    }, 
    dialog = {
        background = l_StyleKey_0.MainBackground, 
        text = l_StyleKey_0.MainText, 
        size = {
            width = 480, 
            height = 308
        }, 
        spacing = 20
    }, 
    subjectThumbnail = {
        background = l_StyleKey_0.TableItem, 
        maskImage = "rbxasset://textures/StudioSharedUI/avatarMask.png", 
        loadingImage = "rbxasset://textures/StudioSharedUI/default_user.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }, 
    groupThumbnail = {
        loadingImage = "rbxasset://textures/StudioSharedUI/default_group.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }, 
    badgeIconThumbnail = {
        loadingImage = "rbxasset://textures/StudioSharedUI/default_badge.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }, 
    dottedBorder = {
        image = "rbxasset://textures/GameSettings/DottedBorder.png", 
        sliceCenter = Rect.new(2, 2, 265, 148), 
        square = {
            image = "rbxasset://textures/GameSettings/DottedBorder_Square.png", 
            sliceCenter = Rect.new(2, 2, 148, 148)
        }
    }, 
    plus = {
        image = "rbxasset://textures/GameSettings/CenterPlus.png", 
        rectOffset = Vector2.new(121, 63), 
        rectSize = Vector2.new(24, 24)
    }, 
    thumbnail = {
        background = l_StyleKey_0.SubBackground2, 
        count = l_StyleKey_0.DimmedText
    }, 
    newThumbnail = {
        background = l_StyleKey_0.SubBackground, 
        border = l_StyleKey_0.SubBackground2, 
        plus = l_StyleKey_0.MainText
    }, 
    thumbnailDrag = {
        background = l_StyleKey_0.SubBackground, 
        border = l_StyleKey_0.CurrentMarkerSelected
    }, 
    cancelButton = {
        ButtonColor = l_StyleKey_0.Button, 
        TextColor = l_StyleKey_0.MainText, 
        BorderColor = l_StyleKey_0.Border
    }, 
    defaultButton = {
        ButtonColor = l_StyleKey_0.DialogMainButton, 
        TextColor = Color3.new(1, 1, 1), 
        BorderColor = l_StyleKey_0.SubBackground2
    }, 
    collaboratorItem = {
        collapseStateArrow = l_StyleKey_0.MainText, 
        deleteButton = l_StyleKey_0.SubBackground
    }, 
    table = {
        height = 350, 
        header = {
            height = 32
        }, 
        item = {
            background = l_StyleKey_0.TableItem, 
            height = 32, 
            padding = 5
        }, 
        icon = {
            height = 40
        }, 
        menu = {
            itemPadding = 30, 
            buttonSize = 32, 
            buttonPaddingY = 10
        }, 
        textPadding = 6
    }, 
    toggleButton = {
        height = 24
    }, 
    editButton = {
        image = "rbxasset://textures/GameSettings/edit.png", 
        imageColor = l_StyleKey_0.MainText
    }, 
    copyButton = {
        image = "rbxasset://textures/GameSettings/copy.png", 
        imageColor = l_StyleKey_0.MainText
    }, 
    uiListLayout = {
        padding = 10
    }, 
    createButton = {
        PaddingX = 75, 
        PaddingY = 10
    }, 
    viewButton = {
        PaddingX = 75, 
        PaddingY = 10
    }, 
    mainView = {
        publishText = {
            offset = 70, 
            width = 250
        }, 
        publishButton = {
            offset = 125, 
            paddingX = 75, 
            paddingY = 15
        }
    }, 
    shutdownButton = {
        PaddingX = 75, 
        PaddingY = 10
    }, 
    settingsPage = {
        settingPadding = 32, 
        marginX = 25, 
        marginY = if not v11 then nil else 20, 
        headerPadding = 6, 
        reloadButton = {
            paddingX = 75, 
            paddingY = 15
        }, 
        failLabelPaddingX = 400, 
        failPageListPaddingY = 16, 
        toggleButtonSize = UDim2.fromOffset(40, 24), 
        toggleButtonTitleWidth = if not l_GameSettingsExpandToggleButtonTitleWidth_0 then nil else 200
    }, 
    backButton = {
        image = "rbxasset://textures/PublishPlaceAs/navigation_pushBack.png", 
        size = 32
    }, 
    placePage = {
        textBox = {
            length = 100
        }
    }, 
    requirementsLink = {
        height = 22, 
        length = 250, 
        paddingY = 25, 
        paddingX = 5
    }, 
    tooltipIcon = {
        paddingX = 5, 
        paddingY = 30, 
        size = 14
    }, 
    emailDialog = {
        Size = {
            X = 500, 
            Y = 350
        }
    }, 
    optInWarning = {
        padding = 5, 
        size = 20, 
        transparency = 0.5
    }, 
    extraOptInInfo = {
        padding = 30, 
        length = 250, 
        height = 150
    }, 
    warningDialog = {
        headerOffset = -60, 
        description = {
            length = 387
        }, 
        icon = {
            size = 16
        }
    }, 
    selectInput = {
        button = {
            height = 50
        }, 
        padding = 10, 
        width = 195
    }, 
    playabilityWidget = {
        buttonPane = {
            padding = 165, 
            spacing = 20
        }, 
        spacing = 45, 
        titlePane = {
            spacing = 15
        }
    }, 
    guidelinesFrame = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 130)
    }, 
    guidelinesTitle = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(0, 180, 1, 0), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v13.Title.Font, 
        TextColor3 = v13.Title.TextColor3, 
        TextSize = v13.Title.TextSize
    }, 
    guidelinesDescriptionFrame = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, -180, 1, 0), 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, 10, 0, 0)
    }, 
    chosenGuidelineText = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        Size = UDim2.new(1, 0, 0, 19), 
        Font = v13.Normal.Font, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextSize = v13.Normal.TextSize, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, 
    openQuestionnaireButton = {
        Style = "GameSettingsButton", 
        PaddingX = 40, 
        PaddingY = 15
    }, 
    titleLink = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        Position = UDim2.new(0, 0, 0.2, 0), 
        TextSize = v13.HeaderLink.TextSize
    }, 
    guidelinesDescriptionListLayout = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Vertical, 
        Padding = UDim.new(0, 16), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, 
    guidelinesDescriptionText = if not l_GameSettingsExperienceGuidelines_0 then nil else {
        TextColor3 = v13.Small.TextColor3, 
        BackgroundTransparency = 1, 
        Font = v13.Small.Font, 
        TextSize = v13.Small.TextSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        TextTransparency = 0.25, 
        ClipsDescendants = true
    }, 
    [l_ComponentSymbols_0.Button] = l_join_0(v14, {
        ["&GameSettingsPrimaryButton"] = l_join_0(v14["&RoundPrimary"], {
            TextSize = v13.Normal.TextSize
        }), 
        ["&GameSettingsButton"] = l_join_0(v14["&Round"], {
            TextSize = v13.Normal.TextSize
        })
    }), 
    [l_ComponentSymbols_0.Image] = l_join_0(l_getRawComponentStyle_0("Image"), {
        ["&TooltipStyle"] = {
            Image = "rbxasset://textures/GameSettings/MoreDetails.png", 
            Color = l_StyleKey_0.SubText, 
            [l_StyleModifier_0.Hover] = {
                Color = l_StyleKey_0.MainTextHover
            }
        }, 
        ["&WarningStyle"] = {
            Image = "rbxasset://textures/GameSettings/Warning.png"
        }
    })
};
local v16 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/StudioSharedUI/radio_selected_enabled_dark.png", 
    [l_StyleKey_0.RadioButtonDisabledImage] = "rbxasset://textures/StudioSharedUI/radio_selected_disabled_dot_dark.png", 
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_dark_theme.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Information.png"
};
local v17 = {
    [l_StyleKey_0.RadioButtonImage] = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png", 
    [l_StyleKey_0.RadioButtonDisabledImage] = "rbxasset://textures/StudioSharedUI/radio_selected_disabled_dot.png", 
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_light_theme.png", 
    [l_StyleKey_0.InformationImage] = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Information.png"
};
return function(v18)
    return ((if not v18 then l_StudioTheme_0.new(v16, v17) else l_StudioTheme_0.mock(v16, v17)):extend(v15));
end;
