local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_PreviewConstants_0 = v2.Util.AccessoryAndBodyToolShared.PreviewConstants;
local v4 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v4.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_UI_0 = v4.UI;
local l_Spritesheet_0 = v4.Util.Spritesheet;
local l_Style_0 = v4.Style;
local l_makeTheme_0 = l_Style_0.makeTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_Box_0 = l_UI_0.Box;
local l_RoundBox_0 = l_UI_0.RoundBox;
local v18 = l_deepCopy_0((l_getRawComponentStyle_0("RoundBox")));
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local v21 = v1.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Light.png", 
    [l_StyleKey_0.AddMoreImage] = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Light.png", 
    [l_StyleKey_0.MoreActionsImage] = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Light.png", 
    [l_StyleKey_0.AddMoreBigImage] = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Light.png"
});
local v22 = v1.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.PlayImage] = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png", 
    [l_StyleKey_0.AddMoreImage] = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png", 
    [l_StyleKey_0.MoreActionsImage] = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png", 
    [l_StyleKey_0.AddMoreBigImage] = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png"
});
local function _()
    l_StyleKey_0.PlayImage = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png";
    l_StyleKey_0.AddMoreImage = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png";
    l_StyleKey_0.MoreActionsImage = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png";
    l_StyleKey_0.AddMoreBigImage = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png";
end;
local function v25(v24)
    if v24 then
        l_StyleKey_0.PlayImage = "rbxasset://textures/LayeredClothingEditor/Icon_Play_Dark.png";
        l_StyleKey_0.AddMoreImage = "rbxasset://textures/LayeredClothingEditor/Icon_AddMore_Dark.png";
        l_StyleKey_0.MoreActionsImage = "rbxasset://textures/LayeredClothingEditor/Icon_MoreAction_Dark.png";
        l_StyleKey_0.AddMoreBigImage = "rbxasset://textures/LayeredClothingEditor/AddMore_Big_50X50_Dark.png";
    end;
    return {
        BackgroundColor = l_StyleKey_0.MainBackground, 
        ButtonColor = l_StyleKey_0.Button, 
        RibbonTab = l_StyleKey_0.RibbonTab, 
        ProgressBarColor = l_StyleKey_0.DialogMainButtonSelected, 
        ScrollBarColor = l_StyleKey_0.ScrollBar, 
        HoverColor = l_StyleKey_0.ButtonHover, 
        BorderColor = l_StyleKey_0.Border, 
        SubTextColor = l_StyleKey_0.SubText, 
        InfoTextColor = l_StyleKey_0.DimmedText, 
        TitleTextColor = l_StyleKey_0.TitlebarText, 
        TextColor = l_StyleKey_0.MainText, 
        TextDisabledColor = Color3.fromRGB(148, 148, 148), 
        ErrorColor = l_StyleKey_0.ErrorText, 
        LinkColor = l_StyleKey_0.LinkText, 
        Green = Color3.fromRGB(64, 166, 81), 
        White = Color3.fromRGB(255, 255, 255), 
        DisabledColor = l_StyleKey_0.MainTextDisabled, 
        ScrollbarTransparency = 0.7, 
        ScrollbarSize = 7, 
        TextSize = 18, 
        RowHeight = 32, 
        Font = Enum.Font.SourceSans, 
        FontBold = Enum.Font.SourceSansSemibold, 
        PopupMessageSize = Vector2.new(200, 100), 
        MainPadding = 20, 
        HeaderPadding = 8, 
        SliderHeight = 32, 
        ScrollBarThickness = 8, 
        TabHeight = 32, 
        BorderSize = 1, 
        PreviewViewportFrameHeight = 250
    }, {
        AssetTypeScreen = {
            ContentHeight = 120, 
            ContentSpacing = 16
        }, 
        CageControls = {
            Padding = 6, 
            ButtonSize = 32, 
            CageModeIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Cage Mode.png", 
            InnerCageIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Inner Cage.png", 
            OuterCageIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Outer Cage.png", 
            AutoWeightIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Auto-Weight.png", 
            OptionsIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Option Dots.png", 
            ButtonStyle = {
                Padding = 0, 
                Background = l_RoundBox_0, 
                BackgroundStyle = v1.Dictionary.join(v18, {
                    Color = l_StyleKey_0.Button
                }), 
                [l_StyleModifier_0.Hover] = {
                    BackgroundStyle = v1.Dictionary.join(v18, {
                        Color = l_StyleKey_0.ButtonHover
                    })
                }, 
                [l_StyleModifier_0.Disabled] = {
                    BackgroundStyle = v1.Dictionary.join(v18, {
                        Color = l_StyleKey_0.ButtonDisabled
                    }), 
                    TextColor = l_StyleKey_0.ButtonTextDisabled
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundStyle = v1.Dictionary.join(v18, {
                        Color = l_StyleKey_0.DialogMainButton
                    })
                }
            }
        }, 
        VisibilityControls = {
            Padding = 6, 
            PaddingSmall = 2, 
            ButtonSize = 32, 
            CageVisibilityIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Cage Visibility.png", 
            MeshPartVisibilityIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Mesh Visibility Icon.png", 
            OptionsIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Option Dots.png", 
            FocusMannequinIcon = "rbxasset://textures/LayeredClothingEditor/WorkspaceIcons/Center Camera to Mannequin.png"
        }, 
        WorkspaceEditorControls = {
            ButtonSize = 32, 
            VisibilityControlsOffset = 128, 
            PaneOffsetY = 20
        }, 
        EditorScreen = {
            PreviewHeight = 350, 
            GenerateHeight = 56
        }, 
        GenerateScreen = {
            GenerateDropdownButtonWidth = 228, 
            GenerateButtonWidth = 150, 
            BackButtonWidth = 96, 
            GenerateDropdownButtonHeight = 36, 
            ButtonHeight = 48, 
            ArrowWidth = 24, 
            WarningIcon = "rbxasset://textures/StudioSharedUI/statusWarning.png", 
            IconSize = 16, 
            DropdownItemHeight = 22
        }, 
        PreviewFrame = {
            Padding = 6, 
            GridContainerSpacing = 4, 
            GridContainerPadding = 8, 
            Height = 350, 
            GridContainerBackgroundColor = l_StyleKey_0.SubBackground2
        }, 
        DeformerDropdownMenu = v1.Dictionary.join(l_Spritesheet_0("rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", {
            SpriteSize = 12, 
            NumSprites = 4
        })[3], {
            Size = UDim2.new(0, 10, 0, 10), 
            Color = l_StyleKey_0.MainText, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -6, 0.5, 0), 
            Padding = 96, 
            DropdownFramePadding = 12, 
            ArrowSize = 24, 
            DropdownFrameWidth = 216, 
            Font = Enum.Font.SourceSans, 
            TextSize = 18
        }), 
        LatticeToolSettings = {
            UIPadding = 24, 
            Height = 24, 
            ButtonWidth = 64, 
            LayoutPadding = 6
        }, 
        AddItemFromExplorerButton = {
            AddFromExploreButtonFrameHeight = 25, 
            AddFromExploreButtonImage = l_StyleKey_0.AddMoreImage, 
            AddFromExploreButtonSize = UDim2.new(0, 20, 0, 20)
        }, 
        EditingModeFrame = {
            CageRowTextLabelSize = 0.3
        }, 
        EditingModeRadioButtonList = {
            Padding = 8
        }, 
        InExperiencePreviewerFrame = {
            Size = UDim2.fromOffset(240, 80)
        }, 
        SelectItemFrame = {
            AddFromExploreButtonFrameHeight = 25
        }, 
        SelectItemList = {
            SelectItemListScrollingFrameStyle = {
                BackgroundColor3 = l_StyleKey_0.CategoryItem, 
                ScrollBarThickness = 7, 
                BorderSizePixel = 0, 
                AutoSizeCanvas = true, 
                AutoSizeLayoutElement = "UIListLayout", 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        }, 
        SelectItemListRow = {
            MoreButtonSize = 20, 
            SelectableRowStyle = {
                Background = l_Box_0, 
                BackgroundStyle = {
                    BorderSize = 0, 
                    Transparency = 1
                }, 
                [l_StyleModifier_0.Hover] = {
                    BackgroundStyle = {
                        Color = l_StyleKey_0.ButtonHover, 
                        Transparency = 0
                    }
                }, 
                [l_StyleModifier_0.Selected] = {
                    BackgroundStyle = {
                        Color = l_StyleKey_0.DialogMainButtonSelected, 
                        Transparency = 0
                    }
                }
            }
        }, 
        SelectItemMoreButton = {
            MoreButtonImage = l_StyleKey_0.MoreActionsImage, 
            MoreButtonSize = 20
        }, 
        PreviewGrid = {
            TileSize = UDim2.new(0, 120, 0, 120), 
            TilePadding = UDim2.new(0, 6, 0, 6), 
            TileInnerBorder = Vector2.new(10, 10), 
            ImageFrameSize = UDim2.new(0, 120, 0, 118), 
            ImageSize = UDim2.new(0, 100, 0, 98), 
            TextLabelSize = UDim2.new(0, 120, 0, 22), 
            ButtonBackgroundColor = l_StyleKey_0.ButtonPressed, 
            TextSize = 18, 
            DefaultTileImages = {
                [l_PreviewConstants_0.TABS_KEYS.Avatars] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Avatars.png", 
                [l_PreviewConstants_0.TABS_KEYS.Clothing] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Clothing.png", 
                [l_PreviewConstants_0.TABS_KEYS.Animations] = "rbxasset://textures/LayeredClothingEditor/Default_Preview_Animation.png"
            }, 
            AddNewImage = l_StyleKey_0.AddMoreBigImage, 
            SmallImageSize = UDim2.new(0, 46, 0, 42), 
            ImageBackgroundColor = l_StyleKey_0.CategoryItem
        }, 
        EditTransparencyView = {
            TitleHeight = 32
        }, 
        AnimPlaybackSlider = {
            PlayImage = l_StyleKey_0.PlayImage, 
            PauseImage = "rbxasset://textures/LayeredClothingEditor/Icon_Pause.png", 
            PlayButtonWidth = 20, 
            PlayTimeLabelWidth = 60, 
            Padding = 24
        }, 
        ScaleTypeDropdown = {
            DropdownHeight = 24, 
            DropdownWidth = 160, 
            Spacing = 6
        }, 
        Tile = {
            TileSize = UDim2.new(0, 140, 0, 160), 
            TileInnerBorder = Vector2.new(10, 10), 
            ImageFrameSize = UDim2.new(0, 120, 0, 118), 
            ImageSize = UDim2.new(0, 100, 0, 98), 
            TextLabelSize = UDim2.new(0, 120, 0, 22), 
            ButtonBackgroundColor = l_StyleKey_0.ButtonPressed, 
            TextSize = 18, 
            ImageBackgroundColor = l_StyleKey_0.CategoryItem
        }, 
        SelectFrame = {
            TextBoxHeight = 24, 
            LabelWidth = 64
        }, 
        PointTool = {
            DefaultPointSize = 0.015
        }, 
        Point = {
            DefaultPointSize = 0.015, 
            DefaultColor = Color3.new(0, 1, 1), 
            HoveredColor = Color3.new(1, 1, 0), 
            SelectedColor = Color3.new(1, 1, 0), 
            SelectedColorNoWeight = Color3.new(1, 0, 0)
        }, 
        ControlPoint = {
            Transparency = 0.7, 
            PointSize = 0.1, 
            DefaultColor = Color3.new(0, 0, 1), 
            HoveredColor = Color3.new(1, 1, 0), 
            SelectedColor = Color3.new(1, 0, 0)
        }, 
        Lattice = {
            LinkColor = Color3.new(0, 0, 0)
        }, 
        Wireframe = {
            WireColorInner = Color3.fromRGB(68, 103, 128), 
            WireColorOuter = Color3.fromRGB(140, 65, 168)
        }, 
        ResetSettings = {
            ButtonHeight = 36
        }, 
        PreviewToStarterCharacterButton = {
            ButtonHeight = 36
        }, 
        TextInput = v1.Dictionary.join(l_getRawComponentStyle_0("TextInput"), {
            PlaceholderTextColor = l_StyleKey_0.DimmedText, 
            TextColor = l_StyleKey_0.MainText, 
            ["&RoundedBorder"] = {
                Padding = {
                    Left = 10, 
                    Top = 5, 
                    Right = 10, 
                    Bottom = 5
                }, 
                BackgroundStyle = {
                    Color = l_StyleKey_0.RibbonTab, 
                    BorderColor = l_StyleKey_0.RibbonTab, 
                    Transparency = 0, 
                    BorderTransparency = 0, 
                    BackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
                    BorderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
                    SliceCenter = Rect.new(3, 3, 13, 13)
                }
            }
        }), 
        InstanceSelector = {
            HoverLineThickness = 0.02
        }, 
        MeshPartTool = {
            Transparency = 0.8, 
            InBoundsColor = Color3.new(0, 0, 1), 
            OutBoundsColor = Color3.new(1, 0, 0), 
            LineThickness = 5, 
            LineColor = Color3.new(0, 0, 0)
        }
    };
end;
local function v27(v26)
    v26[l_ComponentSymbols_0.SimpleTab] = v1.Dictionary.join(l_getRawComponentStyle_0("SimpleTab"), {
        Color = l_StyleKey_0.ButtonText, 
        BackgroundColor = l_StyleKey_0.MainBackground, 
        BorderColor = l_StyleKey_0.MainBackground, 
        TopLineColor = l_StyleKey_0.DialogMainButton, 
        BottomLineColor = l_StyleKey_0.Border, 
        [l_StyleModifier_0.Hover] = {
            Color = l_StyleKey_0.DialogMainButton
        }, 
        [l_StyleModifier_0.Selected] = {
            BottomLineColor = l_StyleKey_0.MainBackground, 
            BackgroundColor = l_StyleKey_0.MainBackground, 
            BorderColor = l_StyleKey_0.Border
        }, 
        [l_StyleModifier_0.Disabled] = {
            Color = l_StyleKey_0.ButtonTextDisabled
        }
    });
end;
local function v34(v28)
    local v29, v30 = v25(v28);
    local v31 = {};
    for v32, v33 in pairs(v30) do
        v31[l_ComponentSymbols_0:add(v32)] = v33;
    end;
    v27(v31);
    return v1.Dictionary.join(v29, v31);
end;
local v35 = {
    makePluginTheme = function()
        return l_makeTheme_0(v2.StyleRoot, v34(), (l_StudioTheme_0.new(v21, v22)))();
    end, 
    mock = function()
        return l_makeTheme_0(v2.StyleRoot, v34(true), (l_StudioTheme_0.mock(v21, v22)))();
    end
};
v35.getMockTheme = function(_)
    return v35.mock();
end;
return v35;
