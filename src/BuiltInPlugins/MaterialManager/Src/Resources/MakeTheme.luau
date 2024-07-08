local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_getRawComponentStyle_0 = v1.Style.getRawComponentStyle;
local l_getFFlagBetterMaterialManagerPreviews_0 = require(l_Parent_0.Src.Flags).getFFlagBetterMaterialManagerPreviews;
local l_Dash_0 = v1.Dash;
local l_join_0 = v1.Dash.join;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v14 = l_getRawComponentStyle_0("RoundBox");
local v15 = l_getRawComponentStyle_0("SelectInput");
local v16 = l_getRawComponentStyle_0("ExpandablePane");
local v17 = l_deepCopy_0(v14);
local v18 = l_deepCopy_0(v15);
local v19 = l_deepCopy_0(v16);
local function v30()
    local l_SourceSansBold_0 = Enum.Font.SourceSansBold;
    local l_SourceSansBold_1 = Enum.Font.SourceSansBold;
    local v22 = UDim2.fromOffset(20, 20);
    local v23 = UDim2.fromOffset(5, 5);
    local v24 = UDim2.fromOffset(20, 20);
    local v25 = UDim.new(0, 108);
    local v26 = UDim.new(0, 89);
    local v27 = UDim2.new(1, -30, 0, 5);
    local v28 = UDim2.fromOffset(30, 30);
    local v29 = UDim2.new(1, 0, 0, 30);
    return {
        MaterialBrowser = {
            BackgroundColor = l_StyleKey_0.MainBackground, 
            GridBackgroundColor = l_StyleKey_0.ScrollingFrameBackgroundColor, 
            HideIcon = "rbxasset://textures/MaterialManager/chevrons-left.png", 
            IconColor = l_StyleKey_0.ButtonText, 
            IconSize = v22, 
            MainViewSize = UDim2.new(1, 0, 1, -36), 
            MaterialEditorSize = UDim2.new(0, 315, 1, 0), 
            MaterialEditorWidth = 315, 
            MaterialGridSize = UDim2.new(1, -315, 1, 0), 
            MaterialTileWidth = 200, 
            MinSideBarWidth = 120, 
            Padding = 10, 
            TopBarSize = UDim2.new(1, 0, 0, 36)
        }, 
        MaterialPreview = {
            Ambient = if not l_getFFlagBetterMaterialManagerPreviews_0() then Color3.new(0.274, 0.274, 0.274) else Color3.fromRGB(120, 120, 135), 
            BackgroundColor = l_StyleKey_0.Button, 
            BackgroundColorHover = l_StyleKey_0.ButtonHover, 
            LightColor = if not l_getFFlagBetterMaterialManagerPreviews_0() then Color3.new(1, 1, 1) else Color3.fromRGB(316, 316, 331), 
            LightDirection = Vector3.new(-10, -10, 5)
        }, 
        GeneralSettings = {
            DialogColumnSize = UDim2.new(0, 145, 0, 25), 
            LabelColumnWidth = v25, 
            ItemSpacing = 3, 
            ContentPadding = 5
        }, 
        TextureSettings = {
            ColumnWidth = 145, 
            ContentPadding = 5, 
            ItemSpacing = 3, 
            LabelColumnWidth = v25, 
            LabelWidth = v26
        }, 
        PhysicalSettings = {
            ButtonPadding = 18, 
            ButtonSize = UDim2.new(1, -6, 0, 25), 
            DialogColumnSize = UDim2.new(0, 145, 0, 25), 
            LabelColumnWidth = v25, 
            ItemSpacing = 3, 
            ContentPadding = 5
        }, 
        LabeledElement = {
            FillDirection = Enum.FillDirection.Horizontal, 
            ImageSize = v24, 
            LabelYSize = UDim.new(0, 24), 
            TextXAlignment = Enum.TextXAlignment.Left
        }, 
        CustomSelectInput = l_join_0(v18, {
            PlaceholderTextColor = l_StyleKey_0.ButtonText, 
            BackgroundStyle = l_join_0(v17, {
                Color = l_StyleKey_0.SelectInputBackgroundColor
            })
        }), 
        CustomExpandablePane = l_Dash_0.joinDeep(v19, {
            Header = {
                Background = l_StyleKey_0.Titlebar, 
                Text = {
                    Font = l_SourceSansBold_0, 
                    TextSize = 18
                }
            }
        }), 
        MaterialGrid = {
            BackgroundColor = l_StyleKey_0.ScrollingFrameBackgroundColor, 
            ChevronRight = "rbxasset://textures/MaterialManager/chevrons-right.png", 
            GridPadding = 4, 
            IconColor = l_StyleKey_0.ButtonText, 
            IconSize = v22, 
            ListHeight = 40, 
            ListPadding = 2, 
            Padding = 5, 
            ShowIcon = "rbxasset://textures/MaterialManager/chevrons-right.png"
        }, 
        MaterialListItem = {
            ApplyIcon = {
                Image = "rbxasset://textures/MaterialManager/Apply_To_Selection.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            ApplyIconPosition = UDim2.new(1, -4, 0, 4), 
            ButtonSize = UDim2.fromOffset(28, 28), 
            Height = 40, 
            IconSize = v22, 
            MaterialVariantIcon = {
                Image = "rbxasset://textures/MaterialManager/Material_Variant.png"
            }, 
            Spacing = 4, 
            TextSize = 20
        }, 
        MaterialTileItem = {
            ApplyIcon = {
                Image = "rbxasset://textures/MaterialManager/Apply_To_Selection.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            ApplyIconPosition = UDim2.new(1, -4, 0, 4), 
            ApplyIconAnchorPoint = Vector2.new(1, 0), 
            ButtonSize = UDim2.fromOffset(28, 28), 
            Gradient = l_StyleKey_0.Gradient, 
            GradientHover = l_StyleKey_0.GradientHover, 
            GradientPosition = UDim2.new(0.5, 0, 1, -2), 
            GradientSize = UDim2.new(1, -8, 0, 24), 
            IconSize = v22, 
            MaterialVariantIcon = {
                Image = "rbxasset://textures/MaterialManager/Material_Variant.png"
            }, 
            MaterialVariantIconAnchorPoint = Vector2.new(1, 1), 
            MaterialVariantIconPosition = UDim2.new(1, -4, 1, -4), 
            Padding = 6, 
            StatusIconPosition = UDim2.new(0, 10, 0, 10), 
            TextSize = 20
        }, 
        MaterialHeader = {
            ButtonPosition = v27, 
            ButtonSize = v28, 
            ButtonStyle = "RoundSubtle", 
            Close = {
                Image = "rbxasset://textures/ui/TopBar/close.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            HeaderBackground = l_StyleKey_0.ScrollingFrameBackgroundColor, 
            HeaderSize = UDim2.new(1, 0, 0, 300), 
            ImagePosition = v23, 
            ImageSize = v24
        }, 
        MaterialInformation = {
            ApplyToSelection = {
                Image = "rbxasset://textures/MaterialManager/Apply_To_Selection.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            ButtonPosition = v27, 
            ButtonSize = v28, 
            ButtonStyle = "RoundSubtle", 
            CreateVariant = {
                Image = "rbxasset://textures/MaterialManager/Create_New_Variant.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            Delete = {
                Image = "rbxasset://textures/MaterialManager/Delete.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            HeaderFont = l_SourceSansBold_1, 
            ImagePosition = v23, 
            ImageSize = v24, 
            LabelRowSize = v29, 
            Padding = 10, 
            TitleTextSize = 22
        }, 
        MaterialOverrides = {
            HeaderFont = l_SourceSansBold_1, 
            ImageSize = v24, 
            LabelRowSize = v29, 
            OverrideSize = UDim2.fromOffset(140, 20), 
            Padding = 10, 
            SectionHeaderTextSize = 18, 
            Spacing = 20
        }, 
        OverrideSettings = {
            ContentPadding = 5, 
            ItemSpacing = 3, 
            LabelColumnWidth = v25
        }, 
        TerrainDetailsEditor = {
            ButtonSize = v28, 
            ButtonStyle = "RoundSubtle", 
            Delete = {
                Image = "rbxasset://textures/MaterialManager/Delete.png", 
                Color = l_StyleKey_0.BrightText
            }, 
            DialogColumnSize = UDim2.new(0, 145, 0, 25), 
            ImagePosition = v23, 
            ImageSize = v24, 
            LabelColumnWidth = v25, 
            NameLabelSize = UDim2.new(0, 110, 0, 20)
        }, 
        TerrainDetailsSettings = {
            ContentPadding = 5, 
            DialogColumnSize = UDim2.new(0, 145, 0, 25), 
            ItemSpacing = 3, 
            LabelColumnWidth = v25
        }, 
        TilingSettings = {
            ContentPadding = 5, 
            DialogColumnSize = UDim2.new(0, 145, 0, 25), 
            ItemSpacing = 3, 
            LabelColumnWidth = v25
        }, 
        StatusIcon = {
            Error = {
                Image = "rbxasset://textures/StudioSharedUI/alert_error@2x.png"
            }, 
            Warning = {
                Image = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png"
            }
        }, 
        TopBar = {
            CreateNewVariant = {
                Image = "rbxasset://textures/MaterialManager/Create_New_Variant.png", 
                Color = l_StyleKey_0.BrightText, 
                Position = UDim2.fromOffset(6, 6), 
                Size = UDim2.fromOffset(16, 16)
            }, 
            ShowInExplorer = {
                Image = "rbxasset://textures/MaterialManager/Show_In_Explorer.png", 
                Color = l_StyleKey_0.BrightText, 
                Position = UDim2.fromOffset(6, 6), 
                Size = UDim2.fromOffset(16, 16), 
                [l_StyleModifier_0.Disabled] = {
                    Transparency = 0.5
                }
            }, 
            DEPRECATED_MaterialAsToolMouseIcon = {
                Image = l_StyleKey_0.FillBucket, 
                Color = l_StyleKey_0.BrightText, 
                Position = UDim2.fromOffset(3, 3), 
                Size = UDim2.fromOffset(20, 20), 
                [l_StyleModifier_0.Disabled] = {
                    Transparency = 0.5
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundColor = l_StyleKey_0.ButtonPressed
                }
            }, 
            TopBarButtonWidth = 28, 
            BackgroundColor = l_StyleKey_0.Titlebar, 
            ViewTypeBackground = l_StyleKey_0.Button, 
            ButtonSize = UDim2.fromOffset(28, 28), 
            Padding = 4, 
            SearchBarMaxWidth = 600, 
            SpacerWidth = 12, 
            ViewTypeSize = UDim2.new(0, 50, 1, 0)
        }, 
        PromptSelectorWithPreview = {
            ExpandIcon = "rbxasset://textures/StudioSharedUI/preview_expand.png", 
            ClearIcon = "rbxasset://textures/StudioSharedUI/preview_clear.png", 
            ImportIcon = "rbxasset://textures/StudioSharedUI/import@2x.png", 
            PreviewBackgroundColor = l_StyleKey_0.ScrollingFrameBackgroundColor, 
            PreviewBorderColor = l_StyleKey_0.Border, 
            ImportIconColor = l_StyleKey_0.ButtonText, 
            ImportImageBackground = l_StyleKey_0.ImportImageBackground, 
            ButtonColor = l_StyleKey_0.Button, 
            ButtonHeight = 24, 
            ButtonIconColor = l_StyleKey_0.Icon, 
            ButtonIconHoveredColor = Color3.fromRGB(255, 255, 255), 
            ToolbarTransparency = 0.4, 
            ToolbarBackgroundColor = l_StyleKey_0.ToolbarBackgroundColor, 
            ToolbarButtonBackgroundColor = l_StyleKey_0.ToolbarButtonBackgroundColor, 
            ToolbarHeight = 32, 
            ColumnWidth = 145, 
            LabelColumnWidth = v25, 
            PreviewSize = 74, 
            PaddingVertical = 4, 
            PaddingHorizontal = 21, 
            TextHeight = 16, 
            ExpandedPreviewDefaultSize = Vector2.new(400, 400), 
            ExpandedPreviewMinSize = Vector2.new(100, 100), 
            ExpandedPreviewPadding = UDim.new(0, 16)
        }, 
        ViewTypeButton = {
            Grid = l_StyleKey_0.GridIcon, 
            List = l_StyleKey_0.ListIcon, 
            ViewTypeBackground = l_StyleKey_0.Button, 
            ViewTypeSize = UDim2.new(0, 50, 1, 0)
        }, 
        ActionButton = {
            ButtonSize = UDim2.fromOffset(28, 28)
        }
    };
end;
return function(v31)
    local _ = nil;
    local v33 = l_join_0(l_DarkTheme_0, {
        [l_StyleKey_0.ScrollingFrameBackgroundColor] = Color3.fromRGB(41, 41, 41), 
        [l_StyleKey_0.SelectInputBackgroundColor] = Color3.fromRGB(60, 60, 60), 
        [l_StyleKey_0.ImportImageBackground] = Color3.fromRGB(34, 34, 34), 
        [l_StyleKey_0.GridIcon] = "rbxasset://textures/MaterialManager/Grid_DT.png", 
        [l_StyleKey_0.ListIcon] = "rbxasset://textures/MaterialManager/List_DT.png", 
        [l_StyleKey_0.Gradient] = "rbxasset://textures/MaterialManager/Gradient_DT.png", 
        [l_StyleKey_0.GradientHover] = "rbxasset://textures/MaterialManager/Gradient_Hover_DT.png", 
        [l_StyleKey_0.FillBucket] = "rbxasset://textures/MaterialManager/Fill.png"
    });
    local v34 = l_join_0(l_LightTheme_0, {
        [l_StyleKey_0.ScrollingFrameBackgroundColor] = Color3.fromRGB(245, 245, 245), 
        [l_StyleKey_0.SelectInputBackgroundColor] = Color3.fromRGB(255, 255, 255), 
        [l_StyleKey_0.ImportImageBackground] = Color3.fromRGB(255, 255, 255), 
        [l_StyleKey_0.GridIcon] = "rbxasset://textures/MaterialManager/Grid_LT.png", 
        [l_StyleKey_0.ListIcon] = "rbxasset://textures/MaterialManager/List_LT.png", 
        [l_StyleKey_0.Gradient] = "rbxasset://textures/MaterialManager/Gradient_LT.png", 
        [l_StyleKey_0.GradientHover] = "rbxasset://textures/MaterialManager/Gradient_Hover_LT.png", 
        [l_StyleKey_0.FillBucket] = "rbxasset://textures/MaterialManager/Fill-lighttheme.png"
    });
    return (if not v31 then l_StudioTheme_0.new(v33, v34) else l_StudioTheme_0.mock(v33, v34)):extend((v30()));
end;
