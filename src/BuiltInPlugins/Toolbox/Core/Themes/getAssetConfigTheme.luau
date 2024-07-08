local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Style_0 = require(l_Packages_0.Framework).Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_StyleModifier_0 = require(l_Packages_0.Framework).Util.StyleModifier;
local l_Colors_0 = l_Style_0.Colors;
local v8 = require(l_Parent_0.Core.Util.Constants);
local v9 = require(l_Packages_0.Cryo);
return function()
    local v10 = l_getRawComponentStyle_0("RoundBox");
    local v11 = l_getRawComponentStyle_0("Button");
    local v12 = l_getRawComponentStyle_0("RadioButton");
    return {
        assetConfig = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            brightText = l_StyleKey_0.BrightText, 
            errorColor = l_StyleKey_0.ErrorText, 
            warningColor = l_StyleKey_0.WarningText, 
            labelTextColor = l_StyleKey_0.DimmedText, 
            textColor = l_StyleKey_0.MainText, 
            inputBottomText = {
                textColor = l_StyleKey_0.DimmedText, 
                textErrorColor = l_StyleKey_0.ErrorText, 
                textSize = 18, 
                bottomTextSpacing = 6
            }, 
            publishAsset = {
                warningIconColor = Color3.fromHex("#FFAA21")
            }, 
            packagePermissions = {
                backgroundColor = l_StyleKey_0.MainBackground, 
                subTextColor = l_StyleKey_0.SubText, 
                collaboratorItem = {
                    deleteButton = l_StyleKey_0.Toolbox_DeleteIconColor
                }, 
                searchBar = {
                    border = l_StyleKey_0.InputFieldBorder, 
                    borderHover = l_Colors_0.Blue, 
                    borderSelected = l_Colors_0.Blue, 
                    placeholderText = l_StyleKey_0.DimmedText, 
                    backgroundColor = l_StyleKey_0.InputFieldBackground, 
                    searchIcon = l_StyleKey_0.SubText, 
                    clearButton = {
                        image = l_StyleKey_0.SubText
                    }, 
                    dropDown = {
                        backgroundColor = l_StyleKey_0.InputFieldBackground, 
                        itemText = l_StyleKey_0.MainText, 
                        headerText = l_StyleKey_0.SubText, 
                        hovered = {
                            backgroundColor = l_StyleKey_0.ItemHovered, 
                            itemText = l_StyleKey_0.ButtonText
                        }, 
                        selected = {
                            backgroundColor = l_StyleKey_0.ButtonSelected
                        }
                    }
                }, 
                subjectThumbnail = {
                    backgroundColor = l_StyleKey_0.TableItem, 
                    defaultImageColor = l_StyleKey_0.AssetConfig_SubjectThumbnailDefaultImageColor
                }
            }
        }, 
        detailedDropdown = {
            displayText = l_StyleKey_0.MainText, 
            descriptionText = l_StyleKey_0.SubText, 
            backgroundColor = l_StyleKey_0.MainBackground, 
            borderColor = l_StyleKey_0.DialogButtonBorder, 
            hovered = {
                displayText = l_StyleKey_0.MainTextHover
            }
        }, 
        configFooter = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            borderColor = l_StyleKey_0.Border
        }, 
        divider = {
            horizontalLineColor = l_StyleKey_0.Toolbox_HorizontalLineColor, 
            verticalLineColor = l_StyleKey_0.AssetConfig_DividerHorizontalLineColor
        }, 
        inputFields = {
            backgroundColor = l_StyleKey_0.InputFieldBackground, 
            toolTip = l_StyleKey_0.DimmedText, 
            error = l_StyleKey_0.ErrorText
        }, 
        linkButton = {
            textColor = l_Colors_0.Blue
        }, 
        loading = {
            text = l_StyleKey_0.MainText
        }, 
        nav = {
            mainButton = {
                background = l_StyleKey_0.DialogMainButton, 
                hoverBackground = l_StyleKey_0.DialogMainButtonHover, 
                pressBackground = l_StyleKey_0.DialogMainButtonPressed, 
                borderColor = l_StyleKey_0.Border, 
                textColor = l_StyleKey_0.DialogMainButtonText
            }, 
            button = {
                background = l_StyleKey_0.DialogButton, 
                hoverBackground = l_StyleKey_0.DialogButtonHover, 
                pressBackground = l_StyleKey_0.DialogButtonPressed, 
                borderColor = l_StyleKey_0.Border, 
                textColor = l_StyleKey_0.DialogButtonText
            }
        }, 
        previewArea = {
            backgroundColor = l_StyleKey_0.MainBackground, 
            textColor = l_StyleKey_0.MainText, 
            selectedColor = l_StyleKey_0.AssetConfig_PreviewSelectedColor
        }, 
        sideTab = {
            contentColor = l_StyleKey_0.TitlebarText, 
            backgroundColor = l_StyleKey_0.MainBackground, 
            selecteBarColor = l_StyleKey_0.AssetConfig_SidetabSelectedBarColor, 
            selecteBarTrans = l_StyleKey_0.AssetConfig_SidetabSelectedBarTransparency, 
            selecteBarZindex = l_StyleKey_0.AssetConfig_SidetabSelectedBarZIndex, 
            selecteIndicatorColor = l_Colors_0.BLUE_PRIMARY, 
            selecteIndicatorTrans = l_StyleKey_0.AssetConfig_SidetabSelectedIndicatorZindex, 
            textColor = l_StyleKey_0.MainText
        }, 
        tags = {
            textColor = l_StyleKey_0.MainText
        }, 
        thumbnailPreview = {
            background = l_StyleKey_0.Item, 
            border = l_StyleKey_0.Border, 
            text = l_StyleKey_0.MainText, 
            warningIconSize = UDim2.fromOffset(64, 64)
        }, 
        typeSelection = {
            background = l_StyleKey_0.TableItem, 
            selector = {
                title = l_StyleKey_0.MainText, 
                description = l_StyleKey_0.MainTextDisabled
            }, 
            footer = {
                background = l_StyleKey_0.MainBackground, 
                border = l_StyleKey_0.Border
            }
        }, 
        typeValidation = {
            background = l_StyleKey_0.TableItem, 
            successResultColor = l_StyleKey_0.TextSuccess, 
            failureResultColor = l_StyleKey_0.TextError
        }, 
        uploadResult = {
            greenText = Color3.fromRGB(2, 183, 87), 
            redText = Color3.fromRGB(255, 68, 68), 
            text = l_StyleKey_0.MainText, 
            buttonColor = l_StyleKey_0.AssetConfig_UploadResultButtonColor, 
            idText = l_StyleKey_0.DimmedText, 
            background = l_StyleKey_0.TableItem, 
            link = l_StyleKey_0.LinkText
        }, 
        versions = {
            thumbnailBorderColor = Color3.fromRGB(117, 117, 117), 
            buttonSelectedColor = Color3.fromRGB(0, 162, 255), 
            buttonDefaultColor = Color3.fromRGB(117, 117, 117), 
            textColor = l_StyleKey_0.MainText, 
            dimmedTextColor = l_StyleKey_0.DimmedText, 
            errorColor = l_StyleKey_0.ErrorText
        }, 
        ugcBundleValidation = {
            nameMinWidth = 200, 
            nameTextSize = 20, 
            placeholderIconColor = l_StyleKey_0.DimmedText, 
            previewBackgroundColor = l_StyleKey_0.SubBackground, 
            previewSize = 60, 
            warningColor = l_StyleKey_0.WarningText, 
            validationIconSize = 14, 
            validationStyles = {
                error = {
                    iconColor = l_StyleKey_0.TextError, 
                    textColor = l_StyleKey_0.TextError
                }, 
                pending = {
                    iconColor = l_StyleKey_0.DimmedText, 
                    textColor = l_StyleKey_0.DimmedText
                }, 
                success = {
                    iconColor = l_StyleKey_0.TextSuccess, 
                    textColor = l_StyleKey_0.DimmedText
                }
            }
        }, 
        [l_ComponentSymbols_0.Button] = v9.Dictionary.join(v11, {
            ["&SelectedDetailedDropdownItem"] = {
                BackgroundStyle = v9.Dictionary.join(v10, {
                    Color = l_StyleKey_0.ItemSelected, 
                    TextColor = l_StyleKey_0.MainTextSelected
                })
            }
        }), 
        [l_ComponentSymbols_0.RoundBox] = v9.Dictionary.join(v10, {
            ["&CatalogTag"] = {
                Color = l_StyleKey_0.MainBackground, 
                BorderColor = l_StyleKey_0.Border
            }, 
            ["&TagsComponent"] = {
                Color = l_StyleKey_0.InputFieldBackground, 
                BorderColor = l_StyleKey_0.Border, 
                [l_StyleModifier_0.Selected] = {
                    BorderColor = l_StyleKey_0.InputFieldBorderSelected
                }, 
                [l_StyleModifier_0.Disabled] = {
                    Color = l_StyleKey_0.InputFieldBackgroundDisabled
                }
            }, 
            ["&TagsComponentError"] = {
                BorderColor = l_StyleKey_0.ErrorText
            }
        }), 
        [l_ComponentSymbols_0.StyledDialog] = v9.Dictionary.join(l_getRawComponentStyle_0("StyledDialog"), {
            ["&AssetConfigWarningDialog"] = {
                ButtonSpacing = 8
            }
        }), 
        [l_ComponentSymbols_0.RadioButton] = v9.Dictionary.join(v12, {
            ["&AssetConfigRadioButton"] = {
                TextSize = v8.FONT_SIZE_ASSET_CONFIG_INPUT, 
                BackgroundStyle = v9.Dictionary.join(v12.BackgroundStyle, {
                    BackgroundStyle = v9.Dictionary.join(v12.BackgroundStyle.BackgroundStyle, {
                        Color = l_StyleKey_0.InputFieldBackground
                    }), 
                    [l_StyleModifier_0.Selected] = v9.Dictionary.join(v12.BackgroundStyle[l_StyleModifier_0.Selected], {
                        BackgroundStyle = v9.Dictionary.join(v12.BackgroundStyle[l_StyleModifier_0.Selected].BackgroundStyle, {
                            Color = l_StyleKey_0.InputFieldBackground
                        })
                    })
                })
            }
        }), 
        [l_ComponentSymbols_0.RadioButtonList] = v9.Dictionary.join(l_getRawComponentStyle_0("RadioButtonList"), {
            ["&AssetConfigRadioButtonList"] = {
                Padding = 17, 
                RadioButtonStyle = "AssetConfigRadioButton"
            }
        })
    };
end;
