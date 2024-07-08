local l_Style_0 = require(script.Parent.Parent.Parent.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_Colors_0 = l_Style_0.Colors;
local v4 = {
    previewArea = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        textColor = l_StyleKey_0.MainText, 
        selectedColor = l_Colors_0.White
    }, 
    publishAsset = {
        titleTextColor = l_StyleKey_0.SubText, 
        textColor = l_StyleKey_0.MainText, 
        tipsTextColor = l_StyleKey_0.TextDisabled, 
        showDropdownRibbon = false, 
        highlightDropdownSelectedItem = true
    }, 
    divider = {
        horizontalLineColor = l_StyleKey_0.Border, 
        verticalLineColor = l_StyleKey_0.Border
    }, 
    scrollingFrame = {
        scrollbarBackgroundColor = l_StyleKey_0.ScrollBarBackground, 
        scrollbarImageColor = l_StyleKey_0.TextDisabled
    }, 
    sideTab = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        leftBorderColor = l_Colors_0.Blue, 
        tabBackground = l_StyleKey_0.Titlebar, 
        contentColor = l_StyleKey_0.TitlebarText, 
        selectedColor = l_Colors_0.White, 
        textColor = l_StyleKey_0.MainText
    }
};
local v5 = {
    previewArea = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        textColor = l_StyleKey_0.MainText, 
        selectedColor = l_Colors_0.Blue
    }, 
    publishAsset = {
        titleTextColor = l_StyleKey_0.SubText, 
        textColor = l_StyleKey_0.MainText, 
        tipsTextColor = l_Colors_0.Blue, 
        showDropdownRibbon = true, 
        highlightDropdownSelectedItem = false
    }, 
    divider = {
        horizontalLineColor = l_StyleKey_0.Titlebar, 
        verticalLineColor = l_StyleKey_0.Titlebar
    }, 
    scrollingFrame = {
        scrollbarBackgroundColor = l_Colors_0.Gray_Lightest, 
        scrollbarImageColor = l_Colors_0.Gray_Lightest
    }, 
    sideTab = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        leftBorderColor = l_StyleKey_0.Border, 
        tabBackground = l_StyleKey_0.Titlebar, 
        contentColor = l_StyleKey_0.TitlebarText, 
        selectedColor = l_Colors_0.Blue, 
        textColor = l_StyleKey_0.MainText
    }
};
local v6 = {
    assetConfig = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        textColor = l_StyleKey_0.MainText, 
        labelTextColor = l_StyleKey_0.DimmedText, 
        separatorColor = l_StyleKey_0.Border, 
        errorColor = l_StyleKey_0.ErrorText
    }, 
    cancelButton = {
        ButtonColor = l_StyleKey_0.Button, 
        ButtonColor_Hover = l_StyleKey_0.ButtonHover, 
        ButtonColor_Disabled = l_StyleKey_0.ButtonDisabled, 
        TextColor = l_StyleKey_0.MainText, 
        TextColor_Disabled = l_StyleKey_0.DimmedText, 
        BorderColor = l_StyleKey_0.Border
    }, 
    defaultButton = {
        ButtonColor = l_StyleKey_0.PrimaryMain, 
        ButtonColor_Hover = l_StyleKey_0.PrimaryStatesHoverBackground, 
        ButtonColor_Disabled = l_StyleKey_0.DialogMainButtonDisabled, 
        TextColor = l_StyleKey_0.TextContrast, 
        TextColor_Disabled = l_StyleKey_0.TextDisabled, 
        BorderColor = l_StyleKey_0.Light
    }, 
    footer = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        borderColor = l_StyleKey_0.Border
    }, 
    Labels = {
        TitleBarText = l_StyleKey_0.TitlebarText, 
        TitleBarBackground = l_StyleKey_0.Titlebar
    }, 
    loading = {
        text = l_StyleKey_0.MainText, 
        backgroundBar = l_StyleKey_0.TextPrimary, 
        bar = l_StyleKey_0.CurrentMarker
    }, 
    messageBox = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        textColor = l_StyleKey_0.MainText, 
        informativeTextColor = l_StyleKey_0.SubText
    }, 
    nav = {
        mainButton = {
            background = l_StyleKey_0.DialogMainButton, 
            hoverBackground = l_StyleKey_0.DialogMainButtonHover, 
            pressBackground = l_StyleKey_0.DialogMainButtonPressed, 
            textColor = l_StyleKey_0.DialogMainButtonText
        }, 
        button = {
            background = l_StyleKey_0.DialogButton, 
            hoverBackground = l_StyleKey_0.DialogButtonHover, 
            pressBackground = l_StyleKey_0.DialogButtonPressed, 
            textColor = l_StyleKey_0.DialogButtonText
        }
    }, 
    textField = {
        backgroundColor = l_StyleKey_0.MainBackground, 
        borderColor = l_StyleKey_0.Border, 
        borderHoveredColor = l_StyleKey_0.CurrentMarker, 
        borderSelectedColor = l_Colors_0.Blue
    }, 
    thumbnailPreview = {
        background = l_StyleKey_0.Item, 
        border = l_StyleKey_0.Border, 
        text = l_StyleKey_0.MainText, 
        placeholderColor = l_StyleKey_0.MainText
    }, 
    typeSelection = {
        background = l_StyleKey_0.TableItem, 
        selector = {
            title = l_StyleKey_0.MainText, 
            description = l_StyleKey_0.TextDisabled
        }, 
        footer = {
            background = l_StyleKey_0.MainBackground, 
            border = l_StyleKey_0.Border
        }
    }, 
    typeValidation = {
        background = l_StyleKey_0.TableItem
    }, 
    uploadResult = {
        text = l_StyleKey_0.MainText, 
        successText = l_StyleKey_0.SuccessMain, 
        background = l_StyleKey_0.TableItem, 
        link = l_StyleKey_0.TextLink
    }
};
return function(v7)
    local _ = nil;
    return ((if not v7 then l_StudioTheme_0.new(v4, v5) else l_StudioTheme_0.mock(v4, v5)):extend(v6));
end;
