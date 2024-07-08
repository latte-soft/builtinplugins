local l_Parent_0 = script.Parent.Parent.Parent;
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local v2 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v2.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_StyleKey_0 = v2.Style.StyleKey;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_getRawComponentStyle_0 = v2.Style.getRawComponentStyle;
local l_ComponentSymbols_0 = v2.Style.ComponentSymbols;
local l_UI_0 = v2.UI;
local l_Box_0 = l_UI_0.Box;
local l_Image_0 = l_UI_0.Image;
local l_Colors_0 = v2.Style.Colors;
local l_Spritesheet_0 = l_Util_0.Spritesheet;
local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
local v15 = l_Spritesheet_0("rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", {
    SpriteSize = 12, 
    NumSprites = 4
});
local v16 = v15[2];
local v17 = v15[4];
local v18 = v15[1];
local v19 = v15[3];
l_ComponentSymbols_0:add("ListItem");
l_ComponentSymbols_0:add("Tile");
local v20 = {
    Background = l_Box_0, 
    BackgroundStyle = {
        Color = l_StyleKey_0.MainBackground, 
        BorderColor = l_StyleKey_0.Border, 
        BorderSize = 1
    }, 
    Foreground = l_Image_0, 
    ForegroundStyle = {
        Color = l_StyleKey_0.MainText
    }, 
    [l_StyleModifier_0.Hover] = {
        BackgroundStyle = {
            Color = l_StyleKey_0.ButtonHover, 
            BorderColor = l_StyleKey_0.Border, 
            BorderSize = 1
        }
    }
};
local v21 = {
    Color = l_StyleKey_0.MainTextDisabled
};
local v22 = l_join_0(v20.ForegroundStyle, v17, {
    Size = UDim2.new(0, 10, 0, 10), 
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0)
});
local v23 = l_join_0(v20.ForegroundStyle, v16, {
    Size = UDim2.new(0, 10, 0, 10), 
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0)
});
local v24 = {
    ["&AssetManagerButton"] = v20, 
    ["&OverlayButton"] = l_join_0(v20, {
        ForegroundStyle = l_join_0(v20.ForegroundStyle, {
            Image = "rbxasset://textures/StudioSharedUI/menu.png"
        })
    }), 
    ["&PreviousButton"] = l_join_0(v20, {
        ForegroundStyle = v22, 
        [l_StyleModifier_0.Disabled] = {
            ForegroundStyle = l_join_0(v22, v21)
        }
    }), 
    ["&NextButton"] = l_join_0(v20, {
        ForegroundStyle = v23, 
        [l_StyleModifier_0.Disabled] = {
            ForegroundStyle = l_join_0(v23, v21)
        }
    }), 
    ["&BulkImporterButton"] = l_join_0(v20, {
        ForegroundStyle = l_join_0(v20.ForegroundStyle, {
            Image = "rbxasset://textures/StudioSharedUI/import.png"
        })
    }), 
    ["&TreeItemButton"] = l_join_0(v20, {
        TextSize = 16, 
        TextColor = l_StyleKey_0.MainText, 
        Font = Enum.Font.SourceSans, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        BackgroundStyle = l_join_0(v20.BackgroundStyle, {
            BorderSize = 0
        })
    }), 
    ["&GridViewButton"] = l_join_0(v20, {
        ForegroundStyle = l_join_0(v20.ForegroundStyle, {
            Image = "rbxasset://textures/StudioSharedUI/grid.png"
        })
    }), 
    ["&ListViewButton"] = l_join_0(v20, {
        ForegroundStyle = l_join_0(v20.ForegroundStyle, {
            Image = "rbxasset://textures/StudioSharedUI/list.png"
        })
    }), 
    ["&SortButton"] = if not l_EnableAssetManagerSortButton_0 then nil else l_join_0(v20, {
        BackgroundStyle = l_join_0(v20.BackgroundStyle, {
            BorderSize = 0
        }), 
        ForegroundStyle = l_join_0(v20.ForegroundStyle, {
            Image = "rbxasset://textures/StudioSharedUI/sort.png", 
            Size = UDim2.new(0, 16, 0, 16), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }), 
        [l_StyleModifier_0.Selected] = {
            BackgroundStyle = {
                Color = l_StyleKey_0.ButtonSelected
            }
        }
    })
};
local v25 = {
    Font = Enum.Font.SourceSans, 
    TextSize = 16, 
    EnableHover = true
};
local v26 = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    ButtonColor = l_StyleKey_0.Button, 
    ProgressBarColor = l_StyleKey_0.DialogMainButtonSelected, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    BorderColor = l_StyleKey_0.Border, 
    SubTextColor = l_StyleKey_0.SubText, 
    InfoTextColor = l_StyleKey_0.DimmedText, 
    TextColor = l_StyleKey_0.MainText, 
    ErrorColor = l_StyleKey_0.ErrorText, 
    LinkColor = l_StyleKey_0.LinkText, 
    Green = Color3.fromRGB(64, 166, 81), 
    White = Color3.fromRGB(255, 255, 255), 
    DisabledColor = l_StyleKey_0.MainTextDisabled, 
    ScrollbarTransparency = 0.7, 
    ScrollbarSize = 8, 
    Font = Enum.Font.SourceSans, 
    FontBold = Enum.Font.SourceSansSemibold, 
    FontSizeSmall = 14, 
    FontSizeMedium = 16, 
    FontSizeLarge = 18, 
    AssetGridContainer = {
        CellPadding = UDim2.new(0, 4, 0, 6), 
        LoadButton = {
            Offset = 125, 
            PaddingX = 75, 
            PaddingY = 15
        }
    }, 
    MainView = {
        ConfirmRemovePlaceDialogSize = Vector2.new(400, 50), 
        PublishText = {
            Offset = 70, 
            Width = 250
        }, 
        PublishButton = {
            Offset = 125, 
            PaddingX = 75, 
            PaddingY = 15
        }
    }, 
    NavBar = {
        BackgroundColor = l_StyleKey_0.Titlebar, 
        ImageSize = 24, 
        Padding = 12, 
        Height = 38, 
        TruncatedTextScale = 0.4
    }, 
    Overlay = {
        Background = {
            WidthScale = -0.25, 
            Transparency = 0.75
        }, 
        Foreground = {
            WidthScale = 0.75
        }, 
        CloseButton = {
            Size = 16, 
            Images = {
                Close = "rbxasset://textures/StudioSharedUI/close.png"
            }
        }, 
        Padding = {
            Right = 11
        }
    }, 
    TopBar = {
        Height = 24, 
        Button = {
            Size = 24
        }, 
        Padding = 15, 
        Tooltip = {
            TextSize = 14, 
            Width = 210, 
            Padding = 5
        }
    }, 
    RecentView = {
        ItemPadding = UDim.new(0, 6), 
        Bar = {
            BackgroundColor = l_StyleKey_0.Titlebar, 
            Height = 24, 
            Padding = 10, 
            Arrow = {
                Expanded = v19, 
                Collapsed = v18, 
                Color = l_StyleKey_0.MainText, 
                Size = 9
            }, 
            Button = {
                Size = 24
            }
        }
    }, 
    TreeViewItem = {
        Height = 16, 
        Indent = 20, 
        Offset = 3, 
        Padding = 5, 
        ColorIcon = l_Colors_0.White, 
        Arrow = {
            Expanded = v19, 
            Collapsed = v16, 
            Color = l_StyleKey_0.MainText, 
            Size = 9
        }
    }, 
    [l_ComponentSymbols_0.Tile] = {
        Size = UDim2.new(0, 85, 0, 121), 
        BackgroundTransparency = 1, 
        AssetPreview = {
            Button = {
                Offset = 14
            }, 
            Image = "rbxasset://textures/StudioToolbox/AssetPreview/MAGNIFIER_PH.png"
        }, 
        Image = {
            FrameSize = UDim2.new(0, 69, 0, 69), 
            ImageSize = UDim2.new(0, 32, 0, 32), 
            Position = UDim2.new(0, 8, 0, 8), 
            FolderPosition = UDim2.new(0.5, 0, 0.5, 0), 
            FolderAnchorPosition = Vector2.new(0.5, 0.5), 
            BackgroundColor = l_StyleKey_0.ScrollBarBackground, 
            RBXThumbSize = 150, 
            PlaceHolder = "rbxasset://textures/StudioSharedUI/TransparentWhiteImagePlaceholder.png", 
            Folder = "rbxasset://textures/StudioSharedUI/folder.png", 
            StartingPlace = {
                Size = 24, 
                Icon = "rbxasset://textures/StudioSharedUI/spawn_withbg_24.png", 
                XOffset = 8, 
                YOffset = 37
            }, 
            ModerationStatus = {
                Size = 24, 
                XOffset = 4, 
                YOffset = 4, 
                Rejected = "rbxasset://textures/StudioSharedUI/alert_error_withbg.png", 
                Pending = l_StyleKey_0.TilePendingImage
            }
        }, 
        Text = {
            Color = l_StyleKey_0.MainText, 
            Size = 16, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            XAlignment = Enum.TextXAlignment.Left, 
            YAlignment = Enum.TextYAlignment.Top, 
            BackgroundTransparency = 1, 
            Frame = {
                Size = UDim2.new(0, 69, 0, 32), 
                Position = UDim2.new(0, 8, 0, 81)
            }
        }, 
        EditText = {
            TextPadding = 10, 
            TextWrapped = true, 
            ClearTextOnFocus = false, 
            XAlignment = Enum.TextXAlignment.Center, 
            Frame = {
                BackgroundColor = l_StyleKey_0.InputFieldBackground, 
                BorderColor = l_StyleKey_0.ButtonSelected
            }
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundTransparency = 0, 
            BackgroundColor = l_StyleKey_0.ButtonHover, 
            AssetPreview = {
                Button = {
                    Offset = 14
                }, 
                Image = "rbxasset://textures/StudioToolbox/AssetPreview/MAGNIFIER_PH.png"
            }
        }, 
        [l_StyleModifier_0.Selected] = {
            BackgroundTransparency = 0, 
            BackgroundColor = l_StyleKey_0.ItemSelected
        }
    }, 
    [l_ComponentSymbols_0.ListItem] = {
        Font = Enum.Font.SourceSans, 
        Size = UDim2.new(1, 0, 0, 24), 
        BackgroundTransparency = 1, 
        Spacing = UDim.new(0, 4), 
        Image = {
            FrameSize = UDim2.new(0, 24, 0, 24), 
            ImageSize = UDim2.new(0, 20, 0, 20), 
            ImagePosition = UDim2.new(0.5, 0, 0.5, 0), 
            ImageAnchorPosition = Vector2.new(0.5, 0.5), 
            BackgroundColor = l_StyleKey_0.MainBackground, 
            RBXThumbSize = 150, 
            Folder = "rbxasset://textures/StudioSharedUI/folder.png", 
            ModerationStatus = {
                Rejected = "rbxasset://textures/StudioSharedUI/alert_error.png", 
                Pending = l_StyleKey_0.ListItemPendingImage
            }
        }, 
        Text = {
            Color = l_StyleKey_0.MainText, 
            Size = 16, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            XAlignment = Enum.TextXAlignment.Left, 
            YAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            Frame = {
                Size = UDim2.new(1, -24, 0, 24), 
                XOffset = -24, 
                YOffset = 24, 
                Padding = 10
            }
        }, 
        EditText = {
            TextPadding = 10, 
            ClearTextOnFocus = false, 
            XAlignment = Enum.TextXAlignment.Center, 
            Frame = {
                BackgroundColor = l_StyleKey_0.InputFieldBackground, 
                BorderColor = l_StyleKey_0.ButtonSelected
            }
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundTransparency = 0, 
            BackgroundColor = l_StyleKey_0.ButtonHover, 
            Image = {
                BackgroundColor = l_StyleKey_0.ButtonHover
            }
        }, 
        [l_StyleModifier_0.Selected] = {
            BackgroundTransparency = 0, 
            BackgroundColor = l_StyleKey_0.ItemSelected, 
            Image = {
                BackgroundColor = l_StyleKey_0.ItemSelected
            }
        }
    }, 
    [l_ComponentSymbols_0.Button] = l_join_0(l_getRawComponentStyle_0("Button"), v24), 
    [l_ComponentSymbols_0.DropdownMenu] = if not l_EnableAssetManagerSortButton_0 then nil else l_join_0(l_getRawComponentStyle_0("DropdownMenu"), {
        Width = 150, 
        MaxHeight = 100, 
        ItemHeight = 25, 
        Text = {
            TextSize = 14
        }
    }), 
    [l_ComponentSymbols_0.Image] = {
        ["&NavBarPathSeparator"] = l_join_0(v16, {
            Size = UDim2.new(0, 10, 0, 10), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
    }, 
    [l_ComponentSymbols_0.LinkText] = l_join_0(l_getRawComponentStyle_0("LinkText"), {
        ["&AssetManagerDefault"] = v25, 
        ["&BulkImporterTooltip"] = l_join_0(v25, {
            TextColor = l_StyleKey_0.LinkText
        }), 
        ["&MainViewTooltip"] = l_join_0(v25, {
            TextColor = l_StyleKey_0.LinkText, 
            ShowUnderline = false
        }), 
        ["&NavBar"] = l_join_0(v25, {
            TextColor = l_StyleKey_0.DialogButtonText, 
            ShowUnderline = false, 
            [l_StyleModifier_0.Disabled] = {
                EnableHover = false
            }
        })
    })
};
local v27 = {
    [l_StyleKey_0.TilePendingImage] = "rbxasset://textures/StudioSharedUI/pending_withbg.png", 
    [l_StyleKey_0.ListItemPendingImage] = "rbxasset://textures/StudioSharedUI/pending-dark.png"
};
local v28 = {
    [l_StyleKey_0.TilePendingImage] = "rbxasset://textures/StudioSharedUI/pending_withbg.png", 
    [l_StyleKey_0.ListItemPendingImage] = "rbxasset://textures/StudioSharedUI/pending-light.png"
};
return function(v29)
    return ((if not v29 then l_StudioTheme_0.new(v27, v28) else l_StudioTheme_0.mock(v27, v28)):extend(v26));
end;
