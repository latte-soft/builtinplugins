local v0 = require(script:FindFirstAncestor("AssetImporter").Packages.Framework);
local l_Style_0 = v0.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v0.Util.StyleModifier;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v7 = require(v0.UIData.ExpandablePane.style);
local v8 = v7["&Section"];
local l_Content_0 = v7.Content;
local l_join_0 = v0.Dash.join;
local v11 = {
    Icons = {
        SmallLength = 16, 
        LargeLength = 32
    }, 
    ImportQueue = {
        CleanupImage = l_StyleKey_0.CleanupImage, 
        ControlsHeight = 40, 
        DisabledTransparancy = 0.5, 
        ImportButtonWidth = 120, 
        LoadingBarWidth = 8, 
        OpenImage = l_StyleKey_0.OpenImage, 
        Padding = 8, 
        ProgressBarHeight = 75, 
        WindowSize = Vector2.new(395, 320), 
        IconPadding = 2, 
        IconButtonSize = 24
    }, 
    AssetList = {
        Padding = 4, 
        RowHeight = 28
    }, 
    AssetListCell = {
        Padding = {
            PaddingTop = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 2), 
            PaddingLeft = UDim.new(0, 4)
        }
    }, 
    PropertySectionHeader = {
        Arrow = {
            Color = l_StyleKey_0.MainText, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [l_StyleModifier_0.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        }, 
        Background = l_StyleKey_0.Titlebar, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = 10, 
            Right = 10
        }, 
        Size = UDim2.new(1, 0, 0, 32), 
        Spacing = 6, 
        Text = {
            Font = Enum.Font.SourceSansBold, 
            TextColor = l_StyleKey_0.TitlebarText, 
            TextSize = 18
        }, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, 
    PropertyView = {
        IconSize = 20, 
        Spacing = 4, 
        ScrollBarOffset = 10, 
        Height = 28, 
        EditorHeight = 24, 
        IconSpacing = 10, 
        FilePickerSize = 28
    }, 
    SuggestionDropdown = {
        DropdownHeight = 50, 
        SubtextSize = 14, 
        SubtextColor = l_StyleKey_0.DimmedText, 
        SubtextOffset = 3, 
        DropdownScrollbarSize = 8
    }, 
    TopBar = {
        ButtonSize = UDim2.new(0, 80, 1, 0), 
        Padding = {
            Left = 10, 
            Top = 6, 
            Right = 10, 
            Bottom = 5
        }, 
        Spacing = 6, 
        TemplateDropDown = UDim2.fromOffset(175, 32), 
        MenuImage = l_StyleKey_0.MenuImage, 
        MenuButtonSize = UDim2.fromOffset(16, 16), 
        MenuItemSize = UDim2.new(1, 0, 0, 40)
    }, 
    PresetNamePrompt = {
        CreateMinContentSize = Vector2.new(300, 125), 
        RenameMinContentSize = Vector2.new(300, 100), 
        LabelSize = UDim2.new(0, 75, 0, 32), 
        Padding = 10, 
        TextboxSize = UDim2.fromOffset(200, 32)
    }, 
    PreviewWindow = {
        ResetCameraImage = l_StyleKey_0.ResetCameraImage, 
        ShowWorkspaceImage = l_StyleKey_0.ShowWorkspaceImage, 
        ShowRigVisualizationImage = l_StyleKey_0.ShowRigVisualizationImage, 
        OptionIconSize = UDim2.new(0, 28, 0, 28), 
        PreviewButtonBar = {
            Size = UDim2.new(0, 28, 1, 0), 
            Position = UDim2.new(1, -38, 0, 10), 
            Spacing = 2
        }, 
        Lighting = {
            Ambient = Color3.fromRGB(170, 185, 200), 
            Color = Color3.fromRGB(242, 236, 227), 
            Direction = Vector3.new(0.5, -1, 0.1)
        }
    }, 
    TreeViewToolbar = {
        Padding = {
            Left = 6, 
            Top = 4, 
            Right = 6, 
            Bottom = 3
        }, 
        Spacing = 6
    }, 
    Sizes = {
        IndicatorOffset = 20, 
        IndicatorSize = 100, 
        PreviewRatio = 0.5, 
        StatusMessagePadding = 24, 
        ToolbarHeight = 30, 
        TopBarHeight = 40
    }, 
    UploadWidget = {
        Width = 500, 
        Height = 100, 
        TextLabelSize = UDim2.new(1, -10, 0, 22), 
        TextSize = 24, 
        SubtextSize = 16, 
        TextAlignment = Enum.TextXAlignment.Center, 
        LoadingBarHeight = 12, 
        LoadingBarContainerSize = UDim2.new(0.8, 0, 0, 10), 
        SuccessColor = Color3.fromRGB(2, 183, 87), 
        FailureColor = Color3.fromRGB(255, 85, 85), 
        TopPadding = {
            Left = 10, 
            Top = 20, 
            Right = 10, 
            Bottom = 10
        }
    }, 
    ErrorWidget = {
        Height = 100, 
        IconSize = 48, 
        IconSpacing = 16, 
        SubtextSize = 18, 
        TextSize = 24, 
        Width = 500
    }, 
    ErrorIcon = {
        Image = "rbxasset://textures/StudioSharedUI/alert_error@2x.png", 
        Size = UDim2.fromOffset(20, 20)
    }, 
    WarningIcon = {
        Image = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png", 
        Size = UDim2.fromOffset(20, 20)
    }, 
    ErrorStatus = {
        TextColor = Color3.fromRGB(255, 85, 85), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 10
    }, 
    WarningStatus = {
        TextColor = Color3.fromRGB(255, 170, 33), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 10
    }, 
    [l_ComponentSymbols_0.ExpandablePane] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.ExpandablePane], {
        ["&ImportTree"] = l_join_0(v8, {
            Content = l_join_0(l_Content_0, {
                Padding = {
                    Left = 4, 
                    Top = 10, 
                    Right = 4, 
                    Bottom = 10
                }
            })
        })
    }), 
    [l_ComponentSymbols_0.LinkText] = l_join_0(l_BaseTheme_0[l_ComponentSymbols_0.LinkText], {
        ["&Disabled"] = {
            TextColor = l_StyleKey_0.TextDisabled
        }
    })
};
local v12 = {
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_dark_theme.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/CameraReset.png", 
    [l_StyleKey_0.ShowRigVisualizationImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/RigVisualization.png", 
    [l_StyleKey_0.ShowWorkspaceImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/WorkspacePreview.png", 
    [l_StyleKey_0.MenuImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/OptionsDots.png", 
    [l_StyleKey_0.OpenImage] = "rbxasset://studio_svg_textures/Lua/FileSync/Dark/Standard/Open.png", 
    [l_StyleKey_0.CleanupImage] = "rbxasset://studio_svg_textures/Shared/InsertableObjects/Dark/Standard/Cleanup.png"
};
local v13 = {
    [l_StyleKey_0.RefreshImage] = "rbxasset://textures/GameSettings/refresh_light_theme.png", 
    [l_StyleKey_0.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/CameraReset.png", 
    [l_StyleKey_0.ShowRigVisualizationImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/RigVisualization.png", 
    [l_StyleKey_0.ShowWorkspaceImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/WorkspacePreview.png", 
    [l_StyleKey_0.MenuImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/OptionsDots.png", 
    [l_StyleKey_0.OpenImage] = "rbxasset://studio_svg_textures/Lua/FileSync/Light/Standard/Open.png", 
    [l_StyleKey_0.CleanupImage] = "rbxasset://studio_svg_textures/Qt/Emulation/Light/Standard/Cleanup.png"
};
return function(v14)
    local _ = nil;
    return (if not v14 then l_StudioTheme_0.new(v12, v13) else l_StudioTheme_0.mock(v12, v13)):extend(v11);
end;
