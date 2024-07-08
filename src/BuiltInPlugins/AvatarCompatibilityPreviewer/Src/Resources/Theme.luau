local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Style_0 = v2.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_UIData_0 = v2.UIData;
local v8 = require(l_UIData_0.Alert.style);
local v9 = require(l_UIData_0.Button.style);
local v10 = require(l_UIData_0.DropdownMenu.style);
local v11 = require(l_UIData_0.Image.style);
local v12 = require(l_UIData_0.Pane.style);
local v13 = require(l_UIData_0.ScrollingFrame.style);
local v14 = require(l_UIData_0.SelectInput.style);
local v15 = require(l_UIData_0.Separator.style);
local v16 = require(l_UIData_0.SimpleTab.style);
local v17 = require(l_UIData_0.Tooltip.style);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v21 = v2.SharedFlags.getFFlagDevFrameworkAssetRenderModelEnableSky();
local v22 = game:DefineFastFlag("DebugAvatarPreviewerDropdownMenuInfiniteMaxHeight", false);
local v23 = {};
l_ComponentSymbols_0:add("AddItemButton");
v23[l_ComponentSymbols_0.AddItemButton] = {
    Height = 42, 
    Image = "rbxasset://textures/AvatarCompatibilityPreviewer/add.png", 
    ImageColor = l_StyleKey_0.TextSecondary, 
    ImageColorDisabled = l_StyleKey_0.TextDisabled, 
    ImageSize = 20, 
    PaddingTop = 3, 
    PaddingBottom = 3, 
    FailureDialogSpacing = UDim.new(0, 4)
};
l_ComponentSymbols_0:add("AnimationControllerDisplay");
v23[l_ComponentSymbols_0.AnimationControllerDisplay] = {
    Padding = 30, 
    Position = UDim2.new(0, 0, 1, -12), 
    Size = UDim2.new(1, 0, 0, 32)
};
l_ComponentSymbols_0:add("AnimationPlaybackSlider");
v23[l_ComponentSymbols_0.AnimationPlaybackSlider] = {
    PlayImage = l_StyleKey_0.PlayImage, 
    PauseImage = "rbxasset://textures/LayeredClothingEditor/Icon_Pause.png", 
    PlayButtonWidth = 20, 
    PlayTimeLabelWidth = 60, 
    Padding = 12
};
l_ComponentSymbols_0:add("AnimationPreview");
v23[l_ComponentSymbols_0.AnimationPreview] = {
    PausedAnimationAlpha = 0.5, 
    ["&BodyPreview"] = {
        FrontRightAngleLerp = 0.4
    }, 
    ["&FacePreview"] = {
        FieldOfView = 30, 
        FrontRightAngleLerp = 0.08, 
        InitialDistance = 2.8
    }
};
l_ComponentSymbols_0:add("AssetPalettes");
v23[l_ComponentSymbols_0.AssetPalettes] = {
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    BackgroundColorHover = l_StyleKey_0.ActionHover, 
    ScrollingFrame = v1.Dictionary.join(v13, {
        BackgroundColor3 = l_StyleKey_0.SubBackground2, 
        BackgroundTransparency = 0, 
        Padding = 0, 
        ScrollBarThickness = 0, 
        Spacing = UDim.new(0, 5)
    }), 
    Size = UDim2.new(1, 0, 0, 24)
};
l_ComponentSymbols_0:add("AutoSetupScreen");
v23[l_ComponentSymbols_0.AutoSetupScreen] = {
    AlertPaddingHorizontal = UDim.new(0, 20), 
    AlertPaddingVertical = UDim.new(0, 8), 
    ControlsPosition = UDim2.new(1, -16, 1, -16), 
    SpinRate = -0.25
};
l_ComponentSymbols_0:add("AvatarScreen");
v23[l_ComponentSymbols_0.AvatarScreen] = {
    AssetPalettes = {
        BackgroundColor = l_StyleKey_0.SubBackground2, 
        SeparatorColor = l_StyleKey_0.SubBackground, 
        SeparatorWidth = 4, 
        Width = 122
    }, 
    Tabs = {
        Height = 64, 
        VerticalOffset = -4
    }
};
l_ComponentSymbols_0:add("Background");
v23[l_ComponentSymbols_0.Background] = {
    Image = l_StyleKey_0.PreviewerBackgroundImage
};
if v19() then
    l_ComponentSymbols_0:add("BodyPointsTool");
    v23[l_ComponentSymbols_0.BodyPointsTool] = {
        ProjectionImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "projection.png", 
        SymmetricalImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "symmetry.png"
    };
end;
if v19() then
    l_ComponentSymbols_0:add("CageEditingTool");
    v23[l_ComponentSymbols_0.CageEditingTool] = {
        FalloffImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "radius@2x.png", 
        RadiusImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "radius@2x.png", 
        SymmetryImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "symmetry@2x.png"
    };
end;
l_ComponentSymbols_0:add("Catalog");
v23[l_ComponentSymbols_0.Catalog] = {
    ScrollingFrame = v1.Dictionary.join(v13, {
        BorderColor3 = l_StyleKey_0.Border, 
        Padding = 10, 
        VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    }), 
    ScrollingFrameHeight = UDim.new(1, -42), 
    CellSize = UDim2.fromOffset(90, 90)
};
l_ComponentSymbols_0:add("CatalogItemButton");
v23[l_ComponentSymbols_0.CatalogItemButton] = {
    HoverX = {
        Color = l_StyleKey_0.TextSecondary, 
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/x_dark.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 4), 
        Size = UDim2.fromOffset(13, 13)
    }, 
    AccessoryTypeImage = {
        Color = l_StyleKey_0.TextSecondary, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.fromOffset(4, 4), 
        Size = UDim2.fromOffset(13, 13), 
        LayeredImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/layered@2x.png", 
        RigidImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/rigid@2x.png"
    }, 
    UserImage = {
        Color = l_StyleKey_0.TextSecondary, 
        Image = "rbxasset://textures/AvatarCompatibilityPreviewer/user.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 1, -20), 
        Size = UDim2.fromOffset(13, 16)
    }, 
    ItemNamePaddingBottom = UDim.new(0, 12)
};
l_ComponentSymbols_0:add("ContextualSurveyDialogButton");
v23[l_ComponentSymbols_0.ContextualSurveyDialogButton] = {
    Image = l_StyleKey_0.SendFeedback, 
    Position = UDim2.new(0, 28, 1, -60), 
    Size = UDim2.fromOffset(24, 24)
};
if not v18() then
    l_ComponentSymbols_0:add("DummyPreview");
    v23[l_ComponentSymbols_0.DummyPreview] = {
        Ambient = Color3.fromRGB(170, 185, 200), 
        LightColor = Color3.fromRGB(242, 236, 227), 
        LightDirection = Vector3.new(0.5, -1, 0.1), 
        PanSpeedMultiplier = 0.25, 
        PlatformHeight = 0.2, 
        PlatformSize = 5
    };
end;
l_ComponentSymbols_0:add("EquippedItemsSidebar");
v23[l_ComponentSymbols_0.EquippedItemsSidebar] = {
    CellSize = UDim2.fromOffset(50, 50), 
    FrameSizeOffset = 50, 
    ItemSpacing = UDim.new(0, 2), 
    PositionOffset = UDim2.fromOffset(5, 10), 
    ScrollingFrameSizeOffset = 83, 
    SidebarSpacing = 10, 
    Size = UDim2.new(0, 50, 1, -20)
};
l_ComponentSymbols_0:add("EquippedItemPreview");
v23[l_ComponentSymbols_0.EquippedItemPreview] = {
    HoverX = {
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/x_dark.png", 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 4), 
        Size = UDim2.fromOffset(13, 13)
    }, 
    StrokeColor = l_StyleKey_0.Border, 
    StrokeThickness = 1, 
    ItemHiddenTransparency = 0.7, 
    ItemWornTransparency = 0
};
l_ComponentSymbols_0:add("EquippedItemSideMenu");
v23[l_ComponentSymbols_0.EquippedItemSideMenu] = {
    DotsBackground = l_StyleKey_0.TextSecondary, 
    DotsBackgroundHover = l_StyleKey_0.TextContrast, 
    IconSize = 16, 
    Margin = 1
};
l_ComponentSymbols_0:add("ImportPage");
v23[l_ComponentSymbols_0.ImportPage] = {
    ArrowImage = "rbxasset://textures/AvatarCompatibilityPreviewer/img_triangle.png", 
    ArrowColor = l_StyleKey_0.TextPrimary, 
    Avatar = {
        IconSize = 75, 
        InnerPadding = 2, 
        NameFontSize = 16, 
        NameLines = 2, 
        Padding = 4, 
        TitleColor = l_StyleKey_0.TextLink, 
        PreviewAmbient = Color3.new(0.4, 0.4, 0.4)
    }, 
    BackButton = {
        Size = UDim2.fromOffset(24, 24), 
        IconSize = 12
    }, 
    HeaderHeight = 35, 
    GridPadding = UDim2.fromOffset(5, 15), 
    SearchBarHeight = UDim.new(0.8, 0)
};
l_ComponentSymbols_0:add("ItemDataPreviewModel");
v23[l_ComponentSymbols_0.ItemDataPreviewModel] = {
    InstanceAmbient = Color3.new(0.4, 0.4, 0.4)
};
l_ComponentSymbols_0:add("ModelPreview");
v23[l_ComponentSymbols_0.ModelPreview] = {
    Ambient = Color3.fromRGB(170, 185, 200), 
    EnableSky = true, 
    LightColor = if not v21 then Color3.fromRGB(242, 236, 227) else Color3.fromRGB(221, 242, 242), 
    LightDirection = if not v21 then Vector3.new(0.5, -1, 0.1) else Vector3.new(0.4, -0.5, 0.6), 
    PanSpeedMultiplier = 0.25, 
    PlatformHeight = 0.2, 
    PlatformSize = 5
};
l_ComponentSymbols_0:add("Notice");
v23[l_ComponentSymbols_0.Notice] = {
    BackgroundColor = l_StyleKey_0.SubBackground, 
    CornerRadius = UDim.new(0, 6), 
    TextColor = l_StyleKey_0.TextPrimary, 
    TextSize = 20, 
    Padding = {
        Left = 8, 
        Right = 8, 
        Top = 4, 
        Bottom = 4
    }
};
l_ComponentSymbols_0:add("PickTabMenu");
if v20() then
    v23[l_ComponentSymbols_0.PickTabMenu] = {
        CornerRadius = UDim.new(0, 6), 
        ImageColor = l_StyleKey_0.TextPrimary, 
        Padding = 6, 
        Position = UDim2.new(1, -32, 0, 0), 
        Size = UDim2.fromOffset(32, 32)
    };
end;
if not v18() then
    l_ComponentSymbols_0:add("PrimaryDummyPreview");
    v23[l_ComponentSymbols_0.PrimaryDummyPreview] = {
        BackgroundImage = l_StyleKey_0.PreviewerBackgroundImage
    };
end;
l_ComponentSymbols_0:add("ResetCameraButton");
v23[l_ComponentSymbols_0.ResetCameraButton] = {
    Size = UDim2.fromOffset(32, 32), 
    Spacing = 5, 
    Image = l_StyleKey_0.ResetCameraImage
};
l_ComponentSymbols_0:add("SelectScreen");
v23[l_ComponentSymbols_0.SelectScreen] = {
    ButtonHeight = 24, 
    Spacing = UDim.new(0, 18)
};
l_ComponentSymbols_0:add("SkinPreview");
v23[l_ComponentSymbols_0.SkinPreview] = {
    HoveredBorderColor = l_StyleKey_0.SecondaryStatesHoverOutlineBorder, 
    HoveredBorderThickness = 1, 
    SelectedBorderColor = l_StyleKey_0.PrimaryMain, 
    SelectedBorderThickness = 2, 
    DisabledColorToBlend = Color3.fromRGB(76, 76, 76)
};
l_ComponentSymbols_0:add("StageSelector");
v23[l_ComponentSymbols_0.StageSelector] = {
    BackgroundColor = l_StyleKey_0.MainBackground, 
    ButtonSelectedBackgroundColor = l_StyleKey_0.ButtonHover, 
    ButtonHeight = 32, 
    IconColor = l_StyleKey_0.MainText, 
    IconColorDisabled = l_StyleKey_0.MainTextDisabled, 
    IconSize = 18, 
    Width = 64
};
l_ComponentSymbols_0:add("Stars");
v23[l_ComponentSymbols_0.Stars] = {
    StarColor = l_StyleKey_0.MainText, 
    StarSize = UDim2.fromOffset(16, 16), 
    StarFilled = l_StyleKey_0.Star, 
    StarUnfilled = l_StyleKey_0.StarUnfilled, 
    StarSpacing = 4, 
    RatingSpacing = 10
};
l_ComponentSymbols_0:add("SubmitDialog");
v23[l_ComponentSymbols_0.SubmitDialog] = {
    Width = 500
};
l_ComponentSymbols_0:add("SubmitInner");
v23[l_ComponentSymbols_0.SubmitInner] = {
    CallToActionSpacing = UDim.new(0, 18), 
    CheckboxSpacing = UDim.new(0, 4), 
    ContentPadding = 40
};
l_ComponentSymbols_0:add("Survey");
v23[l_ComponentSymbols_0.Survey] = {
    HeadIndent = 22, 
    Spacing = 10, 
    MessageHeight = 96
};
l_ComponentSymbols_0:add("SurveyDialog");
v23[l_ComponentSymbols_0.SurveyDialog] = {
    Width = 440, 
    FinishDialogSize = Vector2.new(250, 30)
};
l_ComponentSymbols_0:add("TabBar");
if v20() then
    v23[l_ComponentSymbols_0.TabBar] = {
        BackgroundColor = l_StyleKey_0.SubBackground, 
        BackgroundColorHover = l_StyleKey_0.ActionHover
    };
end;
l_ComponentSymbols_0:add("TestingScreen");
v23[l_ComponentSymbols_0.TestingScreen] = {
    ButtonHeight = 24, 
    Spacing = UDim.new(0, 18)
};
l_ComponentSymbols_0:add("UGCValidationErrorDialog");
v23[l_ComponentSymbols_0.UGCValidationErrorDialog] = {
    DetailsSpacing = 12, 
    IconTextSpacing = 4, 
    TitleDetailsSpacing = 26, 
    AlertMinContentSize = Vector2.new(500, 300), 
    TextSize = 18, 
    WarningColor = l_StyleKey_0.WarningText, 
    WarningFont = Enum.Font.SourceSansSemibold, 
    WarningImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
};
l_ComponentSymbols_0:add("UGCValidationNotice");
v23[l_ComponentSymbols_0.UGCValidationNotice] = {
    Position = UDim2.fromOffset(8, -4), 
    Size = UDim2.new(1, -64, 0, 48), 
    ValidationIconSize = UDim2.fromOffset(24, 24), 
    WarningColor = l_StyleKey_0.WarningText, 
    WarningImage = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
};
l_ComponentSymbols_0:add("UGCValidationStatusIcon");
local v24 = {
    Color = Color3.new(1, 1, 1), 
    Position = UDim2.fromOffset(4, 14), 
    Size = UDim2.fromOffset(24, 24)
};
v23[l_ComponentSymbols_0.UGCValidationStatusIcon] = {
    ["&Failure"] = v1.Dictionary.join(v24, {
        Color = l_StyleKey_0.WarningText, 
        Image = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "warning.png"
    }), 
    ["&Success"] = v1.Dictionary.join(v24, {
        Image = l_StyleKey_0.UGCValidationSuccessImage
    })
};
l_ComponentSymbols_0:add("DisambiguationMenu");
v23[l_ComponentSymbols_0.DisambiguationMenu] = {
    MinContentSize = Vector2.new(500, 300), 
    ConfirmCancelContentSize = Vector2.new(200, 150), 
    HorizontalSpacing = 8, 
    VerticalSpacing = 8, 
    TitleContentsSpacing = 24, 
    TextSpacing = 8, 
    DropdownWidth = 150, 
    AttachmentDropdownWidth = 120, 
    IconBackground = l_StyleKey_0.SubBackground, 
    IconSize = UDim2.fromOffset(72, 72)
};
v23[l_ComponentSymbols_0.Alert] = v1.Dictionary.join(v8, {
    ["&WarningLong"] = v1.Dictionary.join(v8["&Warning"], {
        MaxWidth = 900
    })
});
if v19() then
    v23[l_ComponentSymbols_0.Button] = v1.Dictionary.join(v9, {
        ["&RoundHighlighted"] = v1.Dictionary.join(v9["&Round"], {
            BackgroundStyle = v1.Dictionary.join(v9.BackgroundStyle, {
                BorderColor = l_StyleKey_0.SubText
            }), 
            [l_StyleModifier_0.Hover] = v1.Dictionary.join(v9[l_StyleModifier_0.Hover], {
                BackgroundStyle = v1.Dictionary.join(v9[l_StyleModifier_0.Hover].BackgroundStyle, {
                    BorderColor = l_StyleKey_0.SubText
                })
            })
        })
    });
end;
if v22 then
    v23[l_ComponentSymbols_0.DropdownMenu] = v1.Dictionary.join(v10, {
        MaxHeight = math.huge
    });
    v23[l_ComponentSymbols_0.SelectInput] = v1.Dictionary.join(v14, {
        DropdownMenu = v1.Dictionary.join(v14.DropdownMenu, {
            MaxHeight = math.huge
        })
    });
end;
v23[l_ComponentSymbols_0.Image] = v1.Dictionary.join(v11, {
    ["&EquippedItemHideIcon"] = {
        Image = l_StyleKey_0.Hide
    }, 
    ["&EquippedItemHideHoverIcon"] = {
        Image = l_StyleKey_0.HideHover
    }, 
    ["&EquippedItemHoverMenuBackground"] = {
        Image = l_StyleKey_0.HoverMenu
    }, 
    ["&EquippedItemUnhideIcon"] = {
        Image = l_StyleKey_0.Unhide
    }, 
    ["&EquippedItemUnhideHoverIcon"] = {
        Image = l_StyleKey_0.UnhideHover
    }, 
    ["&EquippedItemDisabledBackground"] = {
        Image = l_StyleKey_0.HoverMenuDisabled
    }, 
    ["&EquippedItemDotsIcon"] = {
        Image = l_StyleKey_0.Dots, 
        ImageColor3 = l_StyleKey_0.Button, 
        [l_StyleModifier_0.Hover] = {
            ImageColor3 = l_StyleKey_0.ImageButtonHover
        }
    }, 
    ["&PickTabMenu"] = {
        Image = l_StyleKey_0.DotsVertical, 
        Size = UDim2.fromOffset(20, 20)
    }
});
v23[l_ComponentSymbols_0.Separator] = v1.Dictionary.join(v15, {
    ["&SelectScreenSeparator"] = {
        StretchMargin = 5
    }
});
v23[l_ComponentSymbols_0.Pane] = v1.Dictionary.join(v12, {
    ["&EquippedItemPreview"] = {
        Background = l_StyleKey_0.Button, 
        CornerRadius = UDim.new(0, 4), 
        [l_StyleModifier_0.Hover] = {
            Background = l_StyleKey_0.ButtonHover
        }, 
        [l_StyleModifier_0.Disabled] = {
            Background = l_StyleKey_0.ButtonPressed
        }
    }, 
    ["&EquippedItemPreviewInner"] = {
        CornerRadius = UDim.new(0, 4)
    }, 
    ["&EquippedItemHoverMenu"] = {
        Background = l_StyleKey_0.ForegroundMuted
    }, 
    ["&SkinPreview"] = {
        CornerRadius = UDim.new(0, 4)
    }
});
v23[l_ComponentSymbols_0.SimpleTab] = v1.Dictionary.join(v16, {
    ["&AssetPaletteTab"] = {
        BackgroundColor = l_StyleKey_0.SubBackground2, 
        BackgroundTransparency = 1, 
        BorderSize = 0, 
        Padding = {
            Left = 12, 
            Top = 2, 
            Bottom = 0, 
            Right = 12
        }, 
        TopLineHeight = 0, 
        [l_StyleModifier_0.Selected] = {
            BackgroundColor = l_StyleKey_0.SubBackground2, 
            Font = Enum.Font.SourceSansBold
        }
    }, 
    ["&CategoryTab"] = {
        BorderSize = 0
    }
});
v23[l_ComponentSymbols_0.Tooltip] = v1.Dictionary.join(v17, {
    ["&NoDelay"] = {
        ShowDelay = 0
    }
});
return v23;
