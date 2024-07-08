local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
l_ComponentSymbols_0:add("Icon");
local v10 = {
    [l_ComponentSymbols_0.Checkbox] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Checkbox], {
        Spacing = 8
    }), 
    [l_ComponentSymbols_0.IconButton] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.IconButton], {
        IconColor = l_StyleKey_0.TextPrimary, 
        Background = l_StyleKey_0.ForegroundMain, 
        Size = UDim2.fromOffset(24, 24), 
        ["&Disabled"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.IconButton], {
            IconColor = l_StyleKey_0.ButtonDisabled, 
            BackgroundStyle = "None", 
            Size = UDim2.fromOffset(24, 24)
        }), 
        ["&ToggledOff"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.IconButton], {
            TextColor = l_StyleKey_0.DimmedText, 
            IconColor = l_StyleKey_0.TextPrimary, 
            Size = UDim2.fromOffset(24, 24)
        })
    }), 
    [l_ComponentSymbols_0.Pane] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane], {
        ["&ColorTextInput"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane]["&BorderBox"]), 
        ["&WStyle"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane]["&BorderBox"], {
            Background = l_StyleKey_0.SubBackground, 
            Border = {
                Color = l_StyleKey_0.SubBackground
            }
        }), 
        ["&PaneHover"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane], {
            Background = l_StyleKey_0.SubBackground
        }), 
        ["&SelectedTag"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane], {
            Background = l_StyleKey_0.ActionSelected
        }), 
        ["&ButtonHover"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Pane], {
            Background = l_StyleKey_0.ButtonHover
        })
    }), 
    [l_ComponentSymbols_0.SearchBar] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.SearchBar], {
        ["&\t"] = {
            Padding = {
                Top = -1, 
                Left = 5, 
                Bottom = -1, 
                Right = 5
            }
        }
    }), 
    [l_ComponentSymbols_0.SimpleTab] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.SimpleTab], {
        Padding = {
            Left = 12, 
            Top = 4, 
            Bottom = 0, 
            Right = 12
        }
    }), 
    [l_ComponentSymbols_0.TextInput] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.TextInput], {
        ["&ColorTextInput"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.TextInput], {
            BottomTextSpacing = -2
        })
    }), 
    [l_ComponentSymbols_0.TextLabel] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.TextLabel], {
        ["&ButtonText"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.TextLabel], {
            TextColor = l_StyleKey_0.TextSecondary
        }), 
        ["&ButtonTextHover"] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.TextLabel], {
            TextColor = l_StyleKey_0.TextPrimary
        })
    }), 
    [l_ComponentSymbols_0.Tooltip] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.Tooltip], {
        ShowDelay = 0.7
    }), 
    ColorPicker = {
        Padding = 10, 
        Spacing = 8, 
        BodySize = UDim2.new(1, 0, 1, -80), 
        BodySpacing = 8, 
        PickerSize = UDim2.new(0.5, 0, 1, 0)
    }, 
    ColorPropertiesPanel = {
        Size = UDim2.new(0.5, 0, 0, 96), 
        Spacing = 7, 
        TextInputSize = UDim2.new(1, 0, 0, 24)
    }, 
    ColorPickerTopControls = {
        Size = UDim2.new(1, 0, 0, 72), 
        Spacing = 5, 
        TitleTextSize = UDim2.new(1, -48, 0, 24), 
        ButtonsPaneSize = UDim2.new(1, 0, 0, 24), 
        ButtonsPaneSpacing = 10, 
        ButtonsPanePadding = 8, 
        CancelButtonSize = UDim2.new(0.5, 0, 0, 24), 
        SubmitButtonSize = UDim2.new(0.5, 0, 0, 24), 
        ColorPaneSize = UDim2.new(1, 0, 0, 26), 
        ColorPaneSpacing = 10, 
        ColorPanePadding = 2, 
        ColorPreviewSize = UDim2.new(0.5, 0, 0, 24), 
        PreviewTitleSize = UDim2.new(0.5, 0, 0, 24)
    }, 
    ColorValueSlider = {
        Size = UDim2.new(1, -4, 0, 25), 
        Black = Color3.fromRGB(0, 0, 0), 
        White = Color3.fromRGB(1, 1, 1), 
        GradientImage = "rbxasset://textures/TagEditor/lineargradient.png", 
        PositionIndicatorSize = UDim2.new(0, 8, 0, 5), 
        PositionIndicatorAnchor = Vector2.new(0.5, 0), 
        PositionIndicatorImage = "rbxasset://textures/TagEditor/trianglesmall.png"
    }, 
    EmojiPage = {
        Padding = 2, 
        SkinToneModifierPaneSize = UDim2.new(1, -8, 0, 24), 
        SkinToneModifierButtonSize = UDim2.fromOffset(24, 24), 
        GridSize = UDim2.new(1, 0, 1, -32), 
        GridPosition = UDim2.new(0, 0, 0, 32), 
        GridCellSize = UDim2.fromOffset(28, 28)
    }, 
    HueSaturationPicker = {
        Size = UDim2.new(1, -4, 1, -50), 
        Black = Color3.fromRGB(1, 1, 1), 
        GradientImage = "rbxasset://textures/TagEditor/huesatgradient.png", 
        PositionIndicatorSize = UDim2.new(0, 8, 0, 5), 
        PositionIndicatorAnchor = Vector2.new(0.5, 1), 
        PositionIndicatorImage = "rbxasset://textures/TagEditor/trianglesmall.png"
    }, 
    [l_ComponentSymbols_0.Icon] = {
        Size = UDim2.fromOffset(16, 16), 
        TextSize = 20, 
        IconColor = l_StyleKey_0.TextPrimary, 
        ["&WorldView"] = {
            IconColor = l_StyleKey_0.TextPrimary, 
            Size = UDim2.fromOffset(32, 32), 
            Padding = 2, 
            TextSize = 30
        }, 
        ["&Preview"] = {
            IconColor = l_StyleKey_0.TextPrimary, 
            Size = UDim2.fromOffset(28, 28), 
            Padding = 2, 
            TextSize = 28
        }
    }, 
    IconPicker = {
        TopPaneSize = UDim2.new(1, 0, 0, 144), 
        TopPaneSpacing = 2, 
        CancelButtonSize = UDim2.fromOffset(65, 24), 
        TitleTextSize = UDim2.new(1, 0, 0, 24), 
        MiddlePaneSize = UDim2.new(1, 0, 0, 48), 
        PreviewIconSize = UDim2.fromOffset(40, 40), 
        SearchBarPaneSize = UDim2.new(1, -44, 0, 48), 
        SearchBarSize = UDim2.new(1, 0, 0, 24), 
        IconNameTextSize = UDim2.new(1, 0, 0, 20), 
        TabsPaneSize = UDim2.new(1, 0, 0, 36), 
        SelectedPageSize = UDim2.new(1, 0, 1, -144)
    }, 
    IconsPage = {
        GridCellSize = UDim2.fromOffset(24, 24), 
        GridCellPadding = UDim2.fromOffset(4, 4)
    }, 
    MainGui = {
        SplitPaneMinsizes = {
            UDim.new(0, 100), 
            UDim.new(0, 60)
        }, 
        SplitPaneInitialSizes = {
            UDim.new(0.5, 0), 
            UDim.new(0.5, 0)
        }, 
        SoloTopPaneSize = UDim2.new(1, 0, 1, -35)
    }, 
    NewTagTextInput = {
        Height = 30, 
        EditingSize = UDim2.new(1, 0, 0, 30), 
        TextInputSize = UDim2.new(1, -30, 0, 30), 
        Spacing = 9, 
        IconColorHover = l_StyleKey_0.ActionEnabled, 
        IconColor = l_StyleKey_0.ActionEnabled, 
        IconSize = UDim2.fromOffset(16, 16)
    }, 
    TagTopPane = {
        SearchBarPaneSize = UDim2.new(1, -8, 0, 30), 
        SearchBarSize = UDim2.new(1, -60, 0, 30), 
        NewTagRowSize = UDim2.new(1, -8, 0, 30), 
        WorldViewButtonSize = UDim2.fromOffset(98, 30), 
        ButtonSize = UDim2.fromOffset(24, 24), 
        Padding = {
            Top = 5, 
            Bottom = 5, 
            Left = 0, 
            Right = 0
        }, 
        RowSpacing = 9, 
        NewGroupIcon = "rbxasset://textures/TagEditor/Folder.png", 
        DeleteIcon = "rbxasset://textures/TagEditor/Trash.png"
    }, 
    TagListView = {
        Size = UDim2.new(1, 0, 1, -60), 
        Spacing = UDim.new(0, 1), 
        CanvasYPadding = 14
    }, 
    TagListRow = {
        CheckboxSize = UDim2.fromOffset(24, 24), 
        Size = UDim2.new(1, 0, 0, 24), 
        Spacing = 9, 
        TextSize = UDim2.new(1, -100, 0, 24), 
        GroupTextSize = UDim2.new(1, -108, 0, 24), 
        AssignIcon = "rbxasset://textures/TagEditor/Add.png", 
        AssignIconColor = l_StyleKey_0.PrimaryMain, 
        UnassignIcon = "rbxasset://textures/TagEditor/Remove.png", 
        UnassignIconColor = l_StyleKey_0.ErrorMain, 
        PaddingIndented = {
            Top = 0, 
            Bottom = 0, 
            Left = 14, 
            Right = 0
        }, 
        PaddingUnindented = 0, 
        EditAssignmentsIcon = "rbxasset://textures/TagEditor/Compose.png", 
        StopAssigningIcon = "rbxasset://textures/TagEditor/Close.png", 
        ArrowColor = l_StyleKey_0.TextPrimary, 
        ClosedArrowImage = "rbxassetid://2606412312", 
        OpenArrowImage = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png"
    }, 
    TagListGroupRow = {
        Size = UDim2.new(1, 0, 0, 24), 
        Spacing = 9, 
        SpacerSize = UDim2.fromOffset(24, 24), 
        TextSize = UDim2.new(1, -108, 0, 24), 
        IconColorActive = l_StyleKey_0.TextContrast, 
        IconColorInactive = l_StyleKey_0.ActionEnabled, 
        EditAssignmentsIcon = "rbxasset://textures/TagEditor/Compose.png", 
        StopAssigningIcon = "rbxasset://textures/TagEditor/Close.png", 
        ArrowColor = l_StyleKey_0.TextPrimary, 
        ClosedArrowImage = "rbxasset://textures/TagEditor/rightarrow.png", 
        OpenArrowImage = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png"
    }, 
    TagListUnknownRow = {
        CheckboxSize = UDim2.fromOffset(24, 24), 
        Size = UDim2.new(1, 0, 0, 24), 
        TextSize = UDim2.new(1, -100, 0, 24), 
        AssignIcon = "rbxasset://textures/TagEditor/Add.png", 
        AssignIconColor = l_StyleKey_0.PrimaryMain, 
        Spacing = 9, 
        PaddingIndented = {
            Top = 0, 
            Bottom = 0, 
            Left = 14, 
            Right = 0
        }
    }, 
    TagSettingsPane = {}, 
    TagSettingsListView = {
        Size = UDim2.new(1, 0, 1, -30), 
        CanvasSize = UDim2.new(1, 0, 0, 164), 
        Padding = 4, 
        Spacing = UDim.new(0, 2), 
        GroupRow = {
            Size = UDim2.fromOffset(24, 24), 
            Icon = "rbxasset://textures/TagEditor/rightarrow.png", 
            UnassignIcon = "rbxasset://textures/TagEditor/Remove.png", 
            NewGroupIcon = "rbxasset://textures/TagEditor/Add.png", 
            DropDownWidth = 170, 
            ItemHeight = 30, 
            MaxHeight = 150
        }, 
        VisualizeAsRow = {
            Size = UDim2.fromOffset(90, 24), 
            Icon = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
            DropDownWidth = 120, 
            ItemHeight = 30, 
            MaxHeight = 150
        }, 
        TaggedInstancesRow = {
            Icon = "rbxasset://textures/TagEditor/rightarrow.png", 
            Size = UDim2.fromOffset(24, 24)
        }, 
        ShowTextRow = {
            Size = UDim2.fromOffset(16, 16)
        }, 
        AlwaysOnTopRow = {
            Size = UDim2.fromOffset(16, 16)
        }, 
        IconRow = {
            Size = UDim2.fromOffset(18, 16)
        }, 
        ColorRow = {
            Size = UDim2.fromOffset(24, 24), 
            Icon = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png"
        }
    }, 
    TagSettingRow = {
        Size = UDim2.new(1, 0, 0, 24), 
        TextSize = UDim2.new(1, -40, 0, 24), 
        Spacing = 10
    }, 
    TagSettingsToggleButton = {
        ClosedArrowImage = "rbxasset://textures/TagEditor/rightarrow.png", 
        OpenArrowImage = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        Size = UDim2.new(1, 0, 0, 30), 
        Spacing = 10
    }
};
return function(v11)
    local _ = nil;
    local v13 = l_join_0(l_DarkTheme_0, {
        VisibleIcon = "rbxasset://textures/TagEditor/VisibilityOnDarkTheme.png", 
        VisibleOffIcon = "rbxasset://textures/TagEditor/VisibilityOffDarkTheme.png"
    });
    local v14 = l_join_0(l_LightTheme_0, {
        VisibleIcon = "rbxasset://textures/TagEditor/VisibilityOnLightTheme.png", 
        VisibleOffIcon = "rbxasset://textures/TagEditor/VisibilityOffLightTheme.png"
    });
    return (if not v11 then l_StudioTheme_0.new(v13, v14) else l_StudioTheme_0.mock(v13, v14)):extend(v10);
end;
