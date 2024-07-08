local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Style_0 = v1.Style;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local v4 = require(l_Parent_0.Packages.Cryo);
local l_UIData_0 = v1.UIData;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v7 = require(l_UIData_0.ExpandablePane.style);
local v8 = v7["&Default"];
local l_Header_0 = v7.Header;
local v10 = require(l_UIData_0.Button.style);
local v11 = v10["&RoundPrimary"];
local v12 = v10["&Round"];
local l_Style_1 = v1.Style;
local l_BaseTheme_0 = l_Style_1.Themes.BaseTheme;
local l_StudioTheme_0 = l_Style_1.Themes.StudioTheme;
local l_DarkTheme_0 = l_Style_1.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_1.Themes.LightTheme;
local l_StyleKey_0 = l_Style_1.StyleKey;
local l_join_0 = v1.Dash.join;
local v20 = {
    [l_ComponentSymbols_0.ExpandablePane] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.ExpandablePane], {
        ["&Arrowless"] = l_join_0(v8, {
            Header = l_join_0(l_Header_0, {
                Arrow = {
                    Size = UDim2.fromOffset(0, 0)
                }, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Padding = 0
            })
        })
    }), 
    [l_ComponentSymbols_0.SelectInput] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.SelectInput], {
        ["&Editable"] = l_join_0(v8, {
            PlaceholderTextColor = l_StyleKey_0.TitlebarText
        }), 
        ["&NonEditable"] = l_join_0(v8, {
            PlaceholderTextColor = l_StyleKey_0.DimmedText
        })
    }), 
    [l_ComponentSymbols_0.Button] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Button], {
        ["&Active"] = l_join_0(v11, {
            TextSize = 24
        }), 
        ["&Passive"] = l_join_0(v11, {
            TextSize = 24
        }), 
        ["&Cancel"] = l_join_0(v12, {
            TextSize = 24
        })
    }), 
    [l_ComponentSymbols_0.StyledDialog] = v4.Dictionary.join(l_getRawComponentStyle_0("StyledDialog"), {
        ["&CancelDialog"] = {
            ButtonPadding = 24, 
            ContentPadding = 0, 
            ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center
        }
    }), 
    [l_ComponentSymbols_0.DropdownMenu] = v4.Dictionary.join(l_getRawComponentStyle_0("DropdownMenu"), {
        ["&Search"] = {
            Offset = Vector2.new(-12, 0)
        }
    }), 
    backgroundColor = l_StyleKey_0.MainBackground, 
    fontStyle = {
        Subtitle = {
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            TextColor3 = l_StyleKey_0.SubText
        }, 
        Normal = {
            Font = Enum.Font.SourceSans, 
            TextSize = 20, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }, 
        Subtext = {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }
    }, 
    buttonBar = {
        padding = 25, 
        edgePadding = 35
    }, 
    confirmTcDialog = {
        TitleText = {
            Font = Enum.Font.SourceSansSemibold, 
            TextSize = 22, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }, 
        DescriptionText = {
            Font = Enum.Font.SourceSans, 
            TextSize = 18, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }
    }, 
    cancelDialog = {
        Text = {
            Font = Enum.Font.SourceSans, 
            TextSize = 24, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }, 
        Size = Vector2.new(343, 65), 
        Position = UDim2.new(0.5, 0, 0.5, 10)
    }, 
    saveToRobloxView = {
        Text = {
            Font = Enum.Font.SourceSans, 
            TextSize = 20, 
            TextColor3 = l_StyleKey_0.MainText, 
            YOffset = 70
        }, 
        publishButton = {
            offset = 125, 
            paddingX = 75, 
            paddingY = 15
        }
    }, 
    permissionsView = {
        Padding = 2
    }, 
    menuEntry = {
        hover = l_StyleKey_0.MenuEntryHover
    }, 
    searchWidget = {
        paddingTop = UDim.new(0, 32), 
        paddingHorizontal = UDim.new(0, 67), 
        ageWarning = {
            fontStyle = {
                Font = Enum.Font.SourceSans, 
                TextSize = 16, 
                TextColor3 = l_StyleKey_0.MainText
            }, 
            Height = 15
        }
    }, 
    searchBar = {
        border = l_StyleKey_0.Border, 
        borderHover = l_StyleKey_0.MainButton, 
        borderSelected = l_StyleKey_0.MainButton, 
        placeholderText = l_StyleKey_0.DimmedText, 
        backgroundColor = l_StyleKey_0.SubBackground2, 
        collabTypeTextPosition = UDim2.new(0, 26, 0, 14), 
        friendsAccessTextPosition = UDim2.new(1, -28, 0, 14), 
        searchIcon = l_StyleKey_0.SubText, 
        friendIcon = {
            Image = l_StyleKey_0.FriendIcon, 
            LabelWidth = 20, 
            LabelHeight = 13, 
            FrameWidth = 37, 
            Width = 17, 
            Height = 10
        }, 
        clearButton = {
            imageSelected = l_StyleKey_0.SubText, 
            image = l_StyleKey_0.SubText
        }, 
        headerHeight = 25, 
        itemHeight = 75, 
        ribbonWidth = 5, 
        thumbnailSize = 48, 
        thumbnailPaddingLeft = 40, 
        renderItemTextPadding = 19, 
        searchBarHeight = 40, 
        clearButtonIconSize = 32, 
        textPadding = 16, 
        nameLabelWidth = 460, 
        nameHeight = 55, 
        dropDown = {
            collaboratorTypeText = {
                Font = Enum.Font.SourceSans, 
                TextSize = 16, 
                TextColor3 = l_StyleKey_0.MainText
            }, 
            backgroundColor = l_StyleKey_0.InputFieldBackground, 
            itemText = l_StyleKey_0.MainText, 
            headerText = l_StyleKey_0.SubText, 
            hovered = {
                backgroundColor = l_StyleKey_0.Dropdown, 
                itemText = l_StyleKey_0.MainText
            }, 
            item = {
                offset = 2
            }, 
            selected = {
                backgroundColor = l_StyleKey_0.ButtonHover
            }, 
            maxHeight = 425, 
            eligibilityLabelWidth = 100
        }
    }, 
    groupThumbnail = {
        loadingImage = "rbxasset://textures/StudioSharedUI/default_group.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }, 
    subjectThumbnail = {
        background = l_StyleKey_0.TableItem, 
        maskImage = "rbxasset://textures/StudioSharedUI/avatarMask.png", 
        loadingImage = "rbxasset://textures/StudioSharedUI/default_user.png", 
        loadFailureImage = "rbxasset://textures/GameSettings/ModeratedAsset.jpg"
    }, 
    selectInput = {
        button = {
            height = 50
        }, 
        padding = 10, 
        width = not game:GetFastFlag("StudioManageCollabWideBox2") and 195 or 264
    }, 
    scrollingFrame = {
        yPadding = 47, 
        xPadding = 25, 
        yPaddingNonOwner = 35
    }, 
    saveMessage = {
        boxHeight = 45, 
        textStyle = {
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            TextColor3 = l_StyleKey_0.TitlebarText
        }, 
        InnerTextPosition = UDim2.new(0, 67, 0.5, 0)
    }, 
    footer = {
        height = 65, 
        gradientSize = 3, 
        gradientTransparency = 0.9, 
        border = l_StyleKey_0.FooterBorder
    }, 
    collaboratorItem = {
        FadeTransparency = 0.75, 
        groupCollaboratorItem = {
            ExpandTextSize = 14, 
            size = UDim2.new(0, 665, 0, 60), 
            collaboratorItemOffset = 16, 
            expandablePaneSize = UDim2.new(1, 0, 0, 34), 
            headerComponent = {
                size = UDim2.new(0, 608, 0, 34), 
                arrowLabel = {
                    position = UDim2.new(0, 42, 0.5, 0), 
                    size = UDim2.new(0, 17, 0, 17)
                }, 
                textLabel = {
                    position = UDim2.new(0, 60, 0.5, 0)
                }
            }
        }, 
        deleteButton = {
            size = 32, 
            xOffset = 6, 
            hovered = l_StyleKey_0.Dropdown
        }, 
        permissionEditor = {
            heightOffset = 54, 
            yOffset = 11
        }, 
        collaboratorName = {
            withIcon = {
                size = UDim2.new(1, -264, 0, 54), 
                xOffset = 72
            }, 
            withoutIcon = {
                UDim2.new(1, -126, 0, 54); 
                xOffset = 50
            }
        }, 
        ownerLabel = {
            withIconSize = UDim2.new(1, -264, 0, 54), 
            withoutIconSize = UDim2.new(1, -126, 0, 54), 
            position = UDim2.new(1, -7, 0.5, 0)
        }, 
        iconContainerSize = 40, 
        nonRolesetFrame = {
            width = 665, 
            height = 74, 
            position = nil, 
            anchorPoint = nil
        }, 
        rolesetFrame = {
            width = 608, 
            height = 54, 
            position = UDim2.new(1.5, 200, 0, 20), 
            anchorPont = Vector2.new(1, 0)
        }
    }, 
    deleteIcon = l_StyleKey_0.CloseWidget, 
    arrows = {
        right = l_StyleKey_0.RightArrow, 
        down = l_StyleKey_0.DownArrow
    }
};
return function(v21)
    local _ = nil;
    local v23 = l_join_0(l_DarkTheme_0, {
        [l_StyleKey_0.CloseWidget] = "rbxasset://textures/ManageCollaborators/closeWidget_dark.png", 
        [l_StyleKey_0.RightArrow] = "rbxasset://textures/ManageCollaborators/arrowRight_dark.png", 
        [l_StyleKey_0.DownArrow] = "rbxasset://textures/ManageCollaborators/arrowDown_dark.png", 
        [l_StyleKey_0.FriendIcon] = "rbxasset://textures/ManageCollaborators/friendIcon_dark.png", 
        [l_StyleKey_0.FooterBorder] = Color3.fromRGB(0, 0, 0)
    });
    local v24 = l_join_0(l_LightTheme_0, {
        [l_StyleKey_0.CloseWidget] = "rbxasset://textures/ManageCollaborators/closeWidget_light.png", 
        [l_StyleKey_0.RightArrow] = "rbxasset://textures/ManageCollaborators/arrowRight_light.png", 
        [l_StyleKey_0.DownArrow] = "rbxasset://textures/ManageCollaborators/arrowDown_light.png", 
        [l_StyleKey_0.FriendIcon] = "rbxasset://textures/ManageCollaborators/friendIcon_light.png", 
        [l_StyleKey_0.FooterBorder] = Color3.fromRGB(244, 244, 244), 
        [l_StyleKey_0.Dropdown] = Color3.fromRGB(228, 238, 254)
    });
    return (if not v21 then l_StudioTheme_0.new(v23, v24) else l_StudioTheme_0.mock(v23, v24)):extend(v20);
end;
