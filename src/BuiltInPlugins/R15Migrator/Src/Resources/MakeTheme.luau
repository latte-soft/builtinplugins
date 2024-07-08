local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v7 = require(v1.UIData.TreeView.style);
local v8 = require(l_script_FirstAncestor_0.Packages.Cryo);
l_ComponentSymbols_0:add("ProgressBar");
l_ComponentSymbols_0:add("PopUpFrame");
l_ComponentSymbols_0:add("TabInstructions");
l_ComponentSymbols_0:add("IconTab");
l_ComponentSymbols_0:add("MainTabsView");
l_ComponentSymbols_0:add("SelectAllRow");
l_ComponentSymbols_0:add("CharacterConversionPane");
l_ComponentSymbols_0:add("CharacterConversionPaneFooter");
l_ComponentSymbols_0:add("CharacterConversionList");
l_ComponentSymbols_0:add("CharacterPreview");
l_ComponentSymbols_0:add("CharacterSplitView");
l_ComponentSymbols_0:add("CharacterInstanceTree");
l_ComponentSymbols_0:add("ExpandableCharacterListItem");
l_ComponentSymbols_0:add("ScriptIssueRow");
l_ComponentSymbols_0:add("ScriptIssueTreeView");
l_ComponentSymbols_0:add("ScriptConversionPane");
l_ComponentSymbols_0:add("ScriptConversionExpandablePane");
l_ComponentSymbols_0:add("ReplacementRulesExpandablePane");
l_ComponentSymbols_0:add("ScriptConversionPaneFooter");
l_ComponentSymbols_0:add("ScriptConversionPaneHeader");
l_ComponentSymbols_0:add("ConfirmRevertDialog");
l_ComponentSymbols_0:add("ConfirmCommitDialog");
l_ComponentSymbols_0:add("ReplaceOptionsPane");
l_ComponentSymbols_0:add("ReplaceOptionItem");
l_ComponentSymbols_0:add("ScriptIconView");
l_ComponentSymbols_0:add("LoadingScreen");
l_ComponentSymbols_0:add("ScriptConversionConsole");
l_ComponentSymbols_0:add("AnimationConversionPane");
l_ComponentSymbols_0:add("AnimationConversionPaneFooter");
l_ComponentSymbols_0:add("PreviewModelComponent");
l_ComponentSymbols_0:add("DisplayAvatarsComponent");
l_ComponentSymbols_0:add("ReplaceRevertButtons");
l_ComponentSymbols_0:add("AnimationPreviewComponent");
l_ComponentSymbols_0:add("AnimationList");
l_ComponentSymbols_0:add("AnimationListRow");
l_ComponentSymbols_0:add("MediaPlayerControls");
l_ComponentSymbols_0:add("InitialFlow");
l_ComponentSymbols_0:add("SummaryPane");
l_ComponentSymbols_0:add("StatusTable");
l_ComponentSymbols_0:add("PublishBlockedDialog");
l_ComponentSymbols_0:add("Buttons");
l_ComponentSymbols_0:add("PublishWarningDialog");
local v9 = UDim2.new(0, 128, 0, 36);
local v10 = {
    Color = l_StyleKey_0.MainText, 
    StretchMargin = 0, 
    Weight = 1
};
local v11 = {
    Right = 10
};
local v12 = {
    ResultContainerPadding = {
        Left = 12, 
        Right = 12, 
        Top = 5
    }, 
    ResultContainerSpacing = 5, 
    ResultContainerSize = UDim2.new(1, 0, 0, 35), 
    ResultSize = UDim2.new(1, 0, 0, 22)
};
local v13 = {
    Complete = "rbxasset://textures/R15Migrator/Icon_Checkmark.png", 
    Reverted = "rbxasset://textures/R15Migrator/Icon_Reverted.png", 
    Warning = "rbxasset://textures/R15Migrator/Icon_Warning.png", 
    Error = "rbxasset://textures/R15Migrator/Icon_Error.png", 
    VariableError = "rbxasset://textures/R15Migrator/Icon_Error.png"
};
local v14 = {
    Color = l_StyleKey_0.MainText, 
    Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
    ImageRectOffset = Vector2.new(12, 0), 
    ImageRectSize = Vector2.new(12, 12), 
    Size = UDim2.fromOffset(12, 12), 
    [l_StyleModifier_0.Selected] = {
        ImageRectOffset = Vector2.new(24, 0)
    }
};
local v15 = string.format("rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/", "Light");
local v16 = {
    [l_StyleKey_0.Delete] = string.format("rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/", "Dark") .. "Terrain_Delete.png"
};
local v17 = {
    [l_StyleKey_0.Delete] = v15 .. "Terrain_Delete.png"
};
local v18 = {
    TabPaneSize = UDim2.new(1, -36, 1, 0), 
    BackgroundColor = l_StyleKey_0.BackgroundPaper, 
    ViewBackgroundColor = l_StyleKey_0.ForegroundMain
};
local v19 = {
    Size = UDim2.fromOffset(16, 16), 
    Icon = "rbxasset://textures/R15Migrator/ic-blue-arrow.png", 
    BackgroundStyle = {
        BorderSize = 0
    }
};
local v20 = {
    RowHeight = 32, 
    TextConfig = {
        Font = Enum.Font.SourceSans, 
        TextColor = l_StyleKey_0.TitlebarText, 
        TextSize = 14
    }, 
    Spacing = 2, 
    Padding = {
        Left = 16
    }, 
    RefreshButton = v19
};
local v21 = {
    Color = l_StyleKey_0.MainText, 
    StretchMargin = 0, 
    Weight = 1
};
local v22 = {
    Padding = {
        Top = 12, 
        Bottom = 12, 
        Left = 24, 
        Right = 24
    }, 
    TextSize = 14, 
    Font = Enum.Font.SourceSans
};
local v23 = {
    TextSize = 25, 
    BackgroundColor = Color3.fromRGB(0, 0, 0), 
    BackgroundTransparency = 0.2, 
    BarHeight = 12, 
    Padding = {
        Left = 24, 
        Right = 24
    }
};
local v24 = {
    TopBarColor = l_StyleKey_0.SubBackground2, 
    BackgroundColor = l_StyleKey_0.SubBackground, 
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        Offset = Vector2.new(24, 0), 
        Color = l_StyleKey_0.DimmedText, 
        HoverColor = l_StyleKey_0.BrightText
    }, 
    TopBarHeight = 16, 
    TopBarPadding = {
        Right = 8
    }
};
local v25 = {
    FooterHeight = 88
};
local v26 = v8.Dictionary.join({
    Spacing = 5, 
    SeparatorStyle = v10, 
    RevertButtonSize = v9, 
    ReplaceButtonSize = v9, 
    ButtonSpacing = 10, 
    ButtonPadding = v11
}, v12);
local v27 = {
    RowHeight = 32, 
    Spacing = 4, 
    SectionHeadBackgroundColor = l_StyleKey_0.MainBackground, 
    SelectedColor = l_StyleKey_0.DialogMainButtonSelected
};
local v28 = {
    ViewportBackgroundColor = l_StyleKey_0.SubBackground, 
    ViewportAspectRatio = 0.7702702702702703, 
    SelectionColor = Color3.fromRGB(13, 105, 172), 
    ViewportHeight = 300, 
    TreeHeight = 300
};
local v29 = {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = UDim2.fromOffset(12, 12), 
        ImageRectSize = Vector2.new(12, 12), 
        Offset = Vector2.new(12, 0), 
        Color = l_StyleKey_0.MainText
    }, 
    ArrowPadding = 12, 
    Width = 200, 
    HorizontalSpacing = 8, 
    VerticalSpacing = 8
};
local v30 = {
    RowHeight = 20, 
    CompactNoBorder = v8.Dictionary.join(v7, {
        Text = {
            Font = Enum.Font.SourceSans, 
            TextColor = l_StyleKey_0.MainText, 
            TextSize = 16
        }, 
        Indent = 16, 
        RowHeight = 20, 
        Arrow = {
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            Size = 12, 
            ExpandedOffset = Vector2.new(24, 0), 
            CollapsedOffset = Vector2.new(12, 0), 
            Color = l_StyleKey_0.MainText
        }, 
        IconPadding = 3, 
        HoverColor = l_StyleKey_0.ButtonHover, 
        SelectedColor = l_StyleKey_0.DialogMainButton, 
        SelectedTextColor = l_StyleKey_0.DialogMainButtonText
    })
};
local v31 = {
    Size = 36, 
    Color = l_StyleKey_0.MainText
};
local v32 = {
    ExpandablePaneHeaderSize = UDim2.new(1, 0, 0, 36)
};
local v33 = {
    HeaderHeight = 42, 
    FooterHeight = 88, 
    HeaderColor = l_StyleKey_0.ForegroundContrast
};
local v34 = {
    HeaderColor = l_StyleKey_0.ForegroundContrast
};
local v35 = v8.Dictionary.join({
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    RevertButtonSize = v9, 
    ReplaceButtonSize = v9, 
    Spacing = 5, 
    ButtonSpacing = 10, 
    SeparatorStyle = v10, 
    ButtonPadding = v11
}, v12);
local v36 = {
    FilterHeight = 36, 
    FilterWidth = 192, 
    ItemHeight = 22, 
    ListItemTextSize = 14, 
    ListItemPadding = 6, 
    Padding = {
        Left = 12, 
        Top = 5, 
        Right = 12
    }, 
    Spacing = 5, 
    SeparatorStyle = v10
};
local v37 = {
    StatusImageSize = UDim2.fromOffset(16, 16), 
    Spacing = 4, 
    CountTextSize = 15, 
    StatusIcons = v13, 
    RevertedIconColor = l_StyleKey_0.BrightText
};
local v38 = {
    StatusIcons = v13, 
    RowHeight = 24, 
    ConsoleHeight = 48, 
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    IconSize = UDim2.fromOffset(16, 16), 
    Padding = {
        Left = 8, 
        Right = 8
    }, 
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        Offset = Vector2.new(0, 0), 
        Color = l_StyleKey_0.DimmedText, 
        HoverColor = l_StyleKey_0.BrightText
    }
};
local v39 = {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = l_StyleKey_0.MainText, 
        Padding = 6
    }, 
    Spacing = 12, 
    Indent = 16, 
    TextSize = 14, 
    LinkColor = l_StyleKey_0.LinkText, 
    IconViewSize = UDim2.fromOffset(76, 16)
};
local v40 = {
    ButtonSize = UDim2.fromOffset(72, 36), 
    Spacing = 8, 
    Padding = {
        Left = 24, 
        Right = 24
    }
};
local v41 = {
    SelectAllRow = {
        RowHeight = 20, 
        Padding = 2
    }
};
local v42 = {
    MinContentSize = Vector2.new(400, 100)
};
local v43 = {
    MinContentSize = Vector2.new(400, 100)
};
local v44 = {
    PaneHeight = 250, 
    TitleTextSize = 22, 
    SaveRulesSize = UDim2.fromOffset(100, 36), 
    Padding = {
        Left = 24, 
        Right = 24, 
        Top = 24, 
        Bottom = 24
    }, 
    Spacing = 12, 
    ListHeightOffset = 194, 
    RowHeight = 48, 
    SeparatorStyle = v21
};
local v45 = {
    TextInputSize = UDim2.fromOffset(170, 36), 
    FromLabelSize = UDim2.fromOffset(85, 36), 
    ToggleSize = UDim2.fromOffset(48, 0), 
    ArrowSize = UDim2.fromOffset(24, 0), 
    BackgroundColor = l_StyleKey_0.SubBackground, 
    Spacing = 16, 
    Arrow = "\226\134\146", 
    Padding = {
        Left = 10, 
        Right = 10
    }
};
local v46 = {
    FooterHeight = 88, 
    Header = {
        Arrow = v14, 
        Container = {
            Padding = {
                Left = 8, 
                Right = 8
            }, 
            BackgroundColor = l_StyleKey_0.ForegroundContrast, 
            BorderColor3 = l_StyleKey_0.OtherDivider, 
            BorderSizePixel = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            Spacing = 6, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, 
        Text = {
            Font = Enum.Font.SourceSansBold, 
            TextColor = l_StyleKey_0.MainText, 
            TextSize = 14
        }
    }, 
    ExpandedOffset = 272, 
    CollapsedOffset = 20, 
    HeaderHeight = 20
};
local v47 = {
    PanePadding = {
        Left = 10, 
        Top = 20
    }, 
    Spacing = 5, 
    SubTextSize = 13, 
    TextSize = 16, 
    ReadyTextSize = 20, 
    VerticalTextSpacing = 25, 
    ThumbnailPanelVerticalTextSpacing = 5, 
    BackgroundColor = l_StyleKey_0.ForegroundMain, 
    Width = 400, 
    ThumbnailHeight = 225, 
    ThumbnailPanelHeight = 245, 
    ButtonPadding = Vector2.new(30, 10), 
    ButtonPanePadding = Vector2.new(30, 30), 
    CompleteIcon = v13.Complete, 
    IconSize = UDim2.fromOffset(24, 24), 
    ConfirmationLabelYPadding = 3, 
    LoadingIndicatorHeight = 20, 
    LoadingIndicatorPadding = 5, 
    ConfirmationExperienceNameColor = "#2BB1FF", 
    OpenPaneButtonsSpaceing = 8
};
local v48 = {
    HeaderColor = l_StyleKey_0.ForegroundContrast, 
    DividerColor = l_StyleKey_0.OtherDivider, 
    Arrow = v14, 
    CompleteIcon = v13.Complete, 
    SortBy = {
        Height = 36, 
        Width = 192, 
        Spacing = 20
    }, 
    RefreshButton = v19, 
    ButtonTextSize = 16, 
    ButtonPadding = Vector2.new(30, 10), 
    ButtonFont = Enum.Font.SourceSans, 
    ExpandedPaneSpacing = UDim.new(0, 6), 
    ExpandablePanePadding = {
        Left = 10, 
        Top = 6, 
        Right = 18, 
        Bottom = 10
    }, 
    ExpandedHeaderStatusFontSize = 14, 
    ExpandedHeaderStatusFont = Enum.Font.SourceSansSemibold, 
    ExpandedHeaderStatusPosition = UDim2.new(1, -100, 0, 0), 
    ExpandedHeaderStatusSize = UDim2.new(0, 100, 1, 0), 
    ExpandedHeaderStatusCompleteColor = Color3.fromHex("00E87E"), 
    ExpandedHeaderStatusAdpatedColor = Color3.fromHex("E1E1E1"), 
    ExpandedHeaderStatusNotReadyPublishColor = Color3.fromHex("F6837E"), 
    ExpandedHeaderStatusReadyPublishColor = Color3.fromHex("00E87E")
};
local v49 = {
    RowHeight = 28, 
    MaxTableHeight = 196, 
    ColumnOffset = 60
};
local v50 = v8.Dictionary.join({
    SeparatorStyle = v10, 
    Spacing = 5, 
    Padding = v11
}, v12);
local v51 = {
    Spacing = 10, 
    PreviewContainerSize = UDim2.new(1, 0, 0, 148)
};
local v52 = {
    Padding = 5, 
    BackgroundColor = l_StyleKey_0.ForegroundContrast, 
    ResetButtonSize = UDim2.fromOffset(28, 28)
};
local v53 = {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = UDim2.fromOffset(12, 12), 
        ImageRectSize = Vector2.new(12, 12), 
        Position = UDim2.new(0.5, -6, 0.5, -6), 
        Offset = Vector2.new(12, 0), 
        Color = l_StyleKey_0.MainText
    }, 
    Padding = 10, 
    PreviewWindowSize = UDim2.new(0.5, -10, 1, 0), 
    PreviewWindowPosition = UDim2.new(0.5, 10, 0, 0)
};
local v54 = {
    ButtonSize = UDim2.new(0, 71, 0, 28), 
    Spacing = 10
};
local v55 = {
    SelectedBorderColor = l_StyleKey_0.DialogMainButtonSelected, 
    SelectedColor = l_StyleKey_0.MainBackground, 
    StatusImageSize = UDim2.fromOffset(16, 16), 
    Icons = {
        Success = "rbxasset://textures/R15Migrator/Icon_Checkmark.png", 
        Warning = "rbxasset://textures/R15Migrator/Icon_Warning.png"
    }, 
    Content = {
        Padding = {
            Left = 28, 
            Top = 10, 
            Right = 28, 
            Bottom = 10
        }
    }, 
    Header = {
        Arrow = v14, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = 16, 
            Right = 16
        }, 
        Size = UDim2.new(1, 0, 0, 32), 
        Spacing = 6, 
        Text = {
            Font = Enum.Font.SourceSans, 
            TextColor = l_StyleKey_0.TitlebarText, 
            TextSize = 14
        }, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }
};
local v56 = {
    SelectAllRow = {
        RowHeight = 40, 
        Padding = 8
    }, 
    Padding = 10
};
local v57 = {
    Offset = UDim2.fromOffset(-8, 0), 
    Padding = 2, 
    ContentPadding = {
        Left = 20, 
        Right = 20
    }, 
    Anchor = Vector2.new(0, 0.5), 
    LabelSize = UDim2.new(0.5, -34, 1, 0), 
    Label1Position = UDim2.new(0, 0, 0.5, 0), 
    Label2Position = UDim2.new(0.5, 10, 0.5, 0), 
    LoadingIcon = "rbxasset://textures/StudioSharedUI/pending.png", 
    FailedIcon = "rbxasset://textures/R15Migrator/Icon_Error.png", 
    DoneIcon = "rbxasset://textures/R15Migrator/Icon_Checkmark.png", 
    Arrow = "\226\134\146", 
    ArrowPosition = UDim2.new(0.5, -24, 0.5, 0), 
    IconPosition = UDim2.new(1, -16, 0.5, 0), 
    IconSize = UDim2.fromOffset(16, 16), 
    Spacing = 10, 
    TextSize = 14
};
local v58 = {
    Padding = 2, 
    Spacing = 15, 
    BackgroundColor = l_StyleKey_0.ForegroundMuted, 
    ImageColor = l_StyleKey_0.MainText, 
    ButtonSize = UDim2.fromOffset(28, 28), 
    SliderSize = UDim2.new(1, -43, 1, 0)
};
local v59 = {
    Spacing = 30, 
    Padding = 10, 
    TextSpacing = 10, 
    ImageSize = 40, 
    WarningIcon = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png", 
    TextSize = UDim2.new(1, -70, 1, 0), 
    LabelSize = UDim2.new(1, 0, 0, 0)
};
local v60 = {
    [l_ComponentSymbols_0.ProgressBar] = v23, 
    [l_ComponentSymbols_0.PopUpFrame] = v24, 
    [l_ComponentSymbols_0.TabInstructions] = v22, 
    [l_ComponentSymbols_0.IconTab] = v31, 
    [l_ComponentSymbols_0.MainTabsView] = v18, 
    [l_ComponentSymbols_0.SelectAllRow] = v20, 
    [l_ComponentSymbols_0.CharacterConversionPane] = v25, 
    [l_ComponentSymbols_0.CharacterConversionPaneFooter] = v26, 
    [l_ComponentSymbols_0.CharacterConversionList] = v27, 
    [l_ComponentSymbols_0.CharacterPreview] = v28, 
    [l_ComponentSymbols_0.CharacterSplitView] = v29, 
    [l_ComponentSymbols_0.CharacterInstanceTree] = v30, 
    [l_ComponentSymbols_0.ExpandableCharacterListItem] = v55, 
    [l_ComponentSymbols_0.ScriptIssueRow] = v39, 
    [l_ComponentSymbols_0.ScriptIssueTreeView] = v41, 
    [l_ComponentSymbols_0.ScriptConversionPane] = v32, 
    [l_ComponentSymbols_0.ScriptConversionExpandablePane] = v33, 
    [l_ComponentSymbols_0.ReplacementRulesExpandablePane] = v34, 
    [l_ComponentSymbols_0.ScriptConversionPaneFooter] = v35, 
    [l_ComponentSymbols_0.ScriptConversionPaneHeader] = v36, 
    [l_ComponentSymbols_0.ConfirmRevertDialog] = v42, 
    [l_ComponentSymbols_0.ConfirmCommitDialog] = v43, 
    [l_ComponentSymbols_0.ReplaceOptionsPane] = v44, 
    [l_ComponentSymbols_0.ReplaceOptionItem] = v45, 
    [l_ComponentSymbols_0.ScriptIconView] = v37, 
    [l_ComponentSymbols_0.LoadingScreen] = v40, 
    [l_ComponentSymbols_0.ScriptConversionConsole] = v38, 
    [l_ComponentSymbols_0.AnimationConversionPane] = v46, 
    [l_ComponentSymbols_0.AnimationConversionPaneFooter] = v50, 
    [l_ComponentSymbols_0.PreviewModelComponent] = v52, 
    [l_ComponentSymbols_0.DisplayAvatarsComponent] = v53, 
    [l_ComponentSymbols_0.ReplaceRevertButtons] = v54, 
    [l_ComponentSymbols_0.AnimationPreviewComponent] = v51, 
    [l_ComponentSymbols_0.AnimationList] = v56, 
    [l_ComponentSymbols_0.AnimationListRow] = v57, 
    [l_ComponentSymbols_0.MediaPlayerControls] = v58, 
    [l_ComponentSymbols_0.InitialFlow] = v47, 
    [l_ComponentSymbols_0.SummaryPane] = v48, 
    [l_ComponentSymbols_0.StatusTable] = v49, 
    [l_ComponentSymbols_0.PublishBlockedDialog] = v59, 
    [l_ComponentSymbols_0.Buttons] = {
        Spacing = 10, 
        Padding = 10, 
        CloseButtonSize = UDim2.fromOffset(120, 32), 
        GoToButtonSize = UDim2.fromOffset(180, 32), 
        CancelButtonSize = UDim2.fromOffset(120, 32), 
        ContinueButtonSize = UDim2.fromOffset(180, 32)
    }, 
    [l_ComponentSymbols_0.PublishWarningDialog] = v59
};
return function(v61)
    local _ = nil;
    return (if not v61 then l_StudioTheme_0.new(v16, v17) else l_StudioTheme_0.mock()):extend(v60);
end;
