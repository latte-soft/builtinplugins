local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Style_0 = v2.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_Colors_0 = l_Style_0.Colors;
local l_UI_0 = v2.UI;
local l_Box_0 = l_UI_0.Box;
local l_RoundBox_0 = l_UI_0.RoundBox;
local _ = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_join_0 = v2.Dash.join;
local v18 = v1.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.DialogButtonTextDisabled] = Color3.fromRGB(184, 184, 184), 
    [l_StyleKey_0.TrackShadedBackgroundColor] = Color3.fromRGB(243, 243, 243), 
    [l_StyleKey_0.TrackTitleBackgroundColor] = Color3.fromRGB(227, 227, 227), 
    [l_StyleKey_0.TrackPrimaryBackgroundColor] = Color3.fromRGB(243, 243, 243), 
    [l_StyleKey_0.TrackButtonColor] = Color3.fromRGB(136, 136, 136), 
    [l_StyleKey_0.TrackHoveredButtonColor] = l_Colors_0.Blue, 
    [l_StyleKey_0.TrackAddButtonColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.TrackHoveredAddButtonColor] = l_Colors_0.Blue, 
    [l_StyleKey_0.TrackPlusIconColor] = Color3.fromRGB(82, 82, 82), 
    [l_StyleKey_0.TimelineDimmedColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.TimelineBackgroundColor] = Color3.fromRGB(243, 243, 243), 
    [l_StyleKey_0.KeyframePrimaryClusterColor] = Color3.fromRGB(136, 136, 136), 
    [l_StyleKey_0.EventMarkerImageColor] = Color3.fromRGB(184, 184, 184), 
    [l_StyleKey_0.EventMarkerBorderColor] = Color3.fromRGB(136, 136, 136), 
    [l_StyleKey_0.ScrollBarControl] = l_Colors_0.White, 
    [l_StyleKey_0.ScrollBarHover] = Color3.fromRGB(231, 240, 250), 
    [l_StyleKey_0.ScrollBarPressed] = Color3.fromRGB(224, 224, 224), 
    [l_StyleKey_0.StartScreenDarkTextColor] = l_Colors_0.White, 
    [l_StyleKey_0.IKHeaderColor] = Color3.fromRGB(243, 243, 243), 
    [l_StyleKey_0.IKHeaderBorder] = Color3.fromRGB(243, 243, 243), 
    [l_StyleKey_0.KeyframePrimaryBackgroundColor] = l_Colors_0.White, 
    [l_StyleKey_0.KeyframePrimaryBackgroundColorSelected] = l_Colors_0.White, 
    [l_StyleKey_0.KeyframeErrorBackgroundColor] = Color3.fromRGB(255, 161, 161), 
    [l_StyleKey_0.KeyframeErrorBorderColor] = Color3.fromRGB(168, 132, 132), 
    [l_StyleKey_0.KeyframeErrorBackgroundColorSelected] = Color3.fromRGB(255, 161, 161), 
    [l_StyleKey_0.KeyframeErrorBorderColorSelected] = l_Colors_0.Red, 
    [l_StyleKey_0.KeyframePrimaryErrorBackgroundColor] = Color3.fromRGB(255, 161, 161), 
    [l_StyleKey_0.KeyframePrimaryErrorBorderColor] = Color3.fromRGB(168, 132, 132), 
    [l_StyleKey_0.KeyframePrimaryErrorBackgroundColorSelected] = Color3.fromRGB(255, 161, 161), 
    [l_StyleKey_0.KeyframePrimaryErrorBorderColorSelected] = l_Colors_0.Red, 
    [l_StyleKey_0.CurvePositionX] = Color3.fromRGB(255, 0, 0), 
    [l_StyleKey_0.CurvePositionY] = Color3.fromRGB(3, 201, 3), 
    [l_StyleKey_0.CurvePositionZ] = Color3.fromRGB(0, 0, 255), 
    [l_StyleKey_0.CurveRotationX] = Color3.fromRGB(47, 128, 123), 
    [l_StyleKey_0.CurveRotationY] = Color3.fromRGB(255, 0, 255), 
    [l_StyleKey_0.CurveRotationZ] = Color3.fromRGB(255, 165, 0), 
    [l_StyleKey_0.CurveEditorButton] = "rbxasset://textures/AnimationEditor/Button_Curve_Lightmode.png", 
    [l_StyleKey_0.DopeSheetButton] = "rbxasset://textures/AnimationEditor/Button_Dopesheet_Lightmode.png", 
    [l_StyleKey_0.StopRecordingButtonImage] = "rbxasset://textures/AnimationEditor/FaceCaptureUI/StopRecordButton_lightTheme.png", 
    [l_StyleKey_0.FaceCaptureDefaultButtonIconColor] = Color3.fromRGB(82, 82, 82), 
    [l_StyleKey_0.FaceSliderKnob] = l_Colors_0.Blue
});
local v19 = v1.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.DialogButtonTextDisabled] = Color3.fromRGB(92, 92, 92), 
    [l_StyleKey_0.TrackShadedBackgroundColor] = Color3.fromRGB(54, 54, 54), 
    [l_StyleKey_0.TrackTitleBackgroundColor] = Color3.fromRGB(54, 54, 54), 
    [l_StyleKey_0.TrackPrimaryBackgroundColor] = Color3.fromRGB(37, 37, 37), 
    [l_StyleKey_0.TrackButtonColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.TrackHoveredButtonColor] = l_Colors_0.White, 
    [l_StyleKey_0.TrackAddButtonColor] = l_Colors_0.Gray, 
    [l_StyleKey_0.TrackHoveredAddButtonColor] = l_Colors_0.lighter(l_Colors_0.Gray, 0.26), 
    [l_StyleKey_0.TrackPlusIconColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.TimelineDimmedColor] = Color3.fromRGB(102, 102, 102), 
    [l_StyleKey_0.TimelineBackgroundColor] = Color3.fromRGB(56, 56, 56), 
    [l_StyleKey_0.KeyframePrimaryClusterColor] = Color3.fromRGB(170, 170, 170), 
    [l_StyleKey_0.EventMarkerImageColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.EventMarkerBorderColor] = l_Colors_0.White, 
    [l_StyleKey_0.ScrollBarControl] = Color3.fromRGB(64, 64, 64), 
    [l_StyleKey_0.ScrollBarHover] = Color3.fromRGB(80, 80, 80), 
    [l_StyleKey_0.ScrollBarPressed] = Color3.fromRGB(80, 80, 80), 
    [l_StyleKey_0.StartScreenDarkTextColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.IKHeaderColor] = l_Colors_0.Slate, 
    [l_StyleKey_0.IKHeaderBorder] = Color3.fromRGB(26, 26, 26), 
    [l_StyleKey_0.KeyframePrimaryBackgroundColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.KeyframePrimaryBackgroundColorSelected] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.KeyframeErrorBackgroundColor] = l_Colors_0.lighter(l_Colors_0.Black, 0.4), 
    [l_StyleKey_0.KeyframeErrorBorderColor] = Color3.fromRGB(255, 68, 68), 
    [l_StyleKey_0.KeyframeErrorBackgroundColorSelected] = Color3.fromRGB(170, 170, 170), 
    [l_StyleKey_0.KeyframeErrorBorderColorSelected] = Color3.fromRGB(255, 68, 68), 
    [l_StyleKey_0.KeyframePrimaryErrorBackgroundColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.KeyframePrimaryErrorBorderColor] = Color3.fromRGB(255, 68, 68), 
    [l_StyleKey_0.KeyframePrimaryErrorBackgroundColorSelected] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.KeyframePrimaryErrorBorderColorSelected] = Color3.fromRGB(255, 68, 68), 
    [l_StyleKey_0.CurvePositionX] = Color3.fromRGB(255, 0, 0), 
    [l_StyleKey_0.CurvePositionY] = Color3.fromRGB(3, 201, 3), 
    [l_StyleKey_0.CurvePositionZ] = Color3.fromRGB(0, 0, 255), 
    [l_StyleKey_0.CurveRotationX] = Color3.fromRGB(47, 128, 123), 
    [l_StyleKey_0.CurveRotationY] = Color3.fromRGB(255, 0, 255), 
    [l_StyleKey_0.CurveRotationZ] = Color3.fromRGB(255, 165, 0), 
    [l_StyleKey_0.CurveEditorButton] = "rbxasset://textures/AnimationEditor/Button_Curve_Darkmode.png", 
    [l_StyleKey_0.DopeSheetButton] = "rbxasset://textures/AnimationEditor/Button_Dopesheet_Darkmode.png", 
    [l_StyleKey_0.StopRecordingButtonImage] = "rbxasset://textures/AnimationEditor/FaceCaptureUI/StopRecordButton.png", 
    [l_StyleKey_0.FaceCaptureDefaultButtonIconColor] = Color3.fromRGB(255, 255, 255), 
    [l_StyleKey_0.FaceSliderKnob] = l_Colors_0.White
});
local v20 = {
    autokeyOn = "", 
    autokeyOff = "", 
    skipBackward = "rbxasset://textures/AnimationEditor/button_control_previous.png", 
    skipForward = "rbxasset://textures/AnimationEditor/button_control_next.png", 
    play = "rbxasset://textures/AnimationEditor/button_control_play.png", 
    pause = "rbxasset://textures/AnimationEditor/button_pause_white@2x.png", 
    loop = "rbxasset://textures/AnimationEditor/button_loop.png", 
    reverse = "rbxasset://textures/AnimationEditor/button_control_reverseplay.png", 
    goToFirstFrame = "rbxasset://textures/AnimationEditor/button_control_firstframe.png", 
    goToLastFrame = "rbxasset://textures/AnimationEditor/button_control_lastframe.png", 
    selectClipDropdownIcon = "rbxasset://textures/AnimationEditor/btn_expand.png", 
    iconColor = l_StyleKey_0.MainText, 
    iconHighlightColor = l_StyleKey_0.DialogMainButtonText, 
    timeInputBackground = l_StyleKey_0.InputFieldBackground, 
    borderColor = l_StyleKey_0.Border, 
    inputBorderColor = l_StyleKey_0.InputFieldBorder
};
local v21 = {
    itemColor = l_StyleKey_0.Item, 
    hoveredItemColor = l_StyleKey_0.ItemHovered, 
    textColor = l_StyleKey_0.MainText, 
    itemHeight = 22, 
    textSize = 15
};
local v22 = {
    backgroundColor = l_StyleKey_0.MainBackground, 
    shadedBackgroundColor = l_StyleKey_0.TrackShadedBackgroundColor, 
    titleBackgroundColor = l_StyleKey_0.TrackTitleBackgroundColor, 
    selectedBackgroundColor = l_StyleKey_0.ItemSelected, 
    primaryBackgroundColor = l_StyleKey_0.TrackPrimaryBackgroundColor, 
    textColor = l_StyleKey_0.MainText, 
    primaryTextColor = l_StyleKey_0.BrightText, 
    selectedTextColor = l_StyleKey_0.MainTextSelected, 
    textSize = 15, 
    arrow = {
        collapsed = "rbxasset://textures/StudioToolbox/ArrowCollapsed.png", 
        expanded = "rbxasset://textures/StudioToolbox/ArrowExpanded.png"
    }, 
    contextMenu = "rbxasset://textures/AnimationEditor/icon_showmore.png", 
    addButtonBackground = "rbxasset://textures/AnimationEditor/Circle.png", 
    addEventBackground = "rbxasset://textures/AnimationEditor/addEvent_inner.png", 
    addEventBorder = "rbxasset://textures/AnimationEditor/addEvent_border.png", 
    plusIcon = "rbxasset://textures/AnimationEditor/icon_add.png", 
    buttonColor = l_StyleKey_0.TrackButtonColor, 
    hoveredButtonColor = l_StyleKey_0.TrackHoveredButtonColor, 
    addButtonColor = l_StyleKey_0.TrackAddButtonColor, 
    hoveredAddButtonColor = l_StyleKey_0.TrackHoveredAddButtonColor, 
    plusIconColor = l_StyleKey_0.TrackPlusIconColor, 
    hoveredPlusIconColor = l_StyleKey_0.DialogMainButtonText
};
local v23 = {
    mainColor = l_StyleKey_0.DialogMainButton, 
    textColor = l_StyleKey_0.DialogMainButtonText, 
    textSize = 15
};
local v24 = {
    textSize = 16, 
    textColor = l_StyleKey_0.MainText, 
    backgroundColor = l_StyleKey_0.InputFieldBackground, 
    errorBorder = l_StyleKey_0.ErrorText, 
    focusedBorder = l_StyleKey_0.DialogMainButton, 
    defaultBorder = l_StyleKey_0.Border
};
local v25 = {
    image = "rbxasset://textures/AnimationEditor/btn_manage.png", 
    imageColor = l_StyleKey_0.MainText
};
local v26 = {
    clusterColor = l_StyleKey_0.DialogButtonTextDisabled, 
    primaryClusterColor = l_StyleKey_0.KeyframePrimaryClusterColor
};
local v27 = {
    backgroundColor = Color3.fromRGB(182, 182, 182), 
    titleColor = l_StyleKey_0.MainText, 
    font = Enum.Font.Legacy, 
    textSize = 8, 
    backgroundImage = "rbxasset://textures/GameSettings/UncheckedBox.png", 
    selectedImage = "rbxasset://textures/GameSettings/CheckedBoxLight.png"
};
local v28 = Rect.new(3, 0, 4, 6);
local l_FaceSliderKnob_0 = l_StyleKey_0.FaceSliderKnob;
local v30 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Color = l_FaceSliderKnob_0, 
    Image = l_StyleKey_0.SliderKnobImage, 
    Size = UDim2.new(0, 6.5, 0, 6.5), 
    [l_StyleModifier_0.Disabled] = {
        Color = l_StyleKey_0.Button
    }
};
local v31 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Color = l_FaceSliderKnob_0, 
    Image = l_StyleKey_0.SliderKnobImage, 
    Size = UDim2.new(0, 9, 0, 9), 
    [l_StyleModifier_0.Disabled] = {
        Color = l_StyleKey_0.Button
    }
};
local v32 = {
    KnobSize = Vector2.new(18, 18), 
    Background = l_Image_0, 
    BackgroundStyle = {
        Background = Color3.fromRGB(87, 87, 87), 
        Size = UDim2.new(1, 0, 0, 1)
    }, 
    Foreground = l_Image_0, 
    ForegroundStyle = {
        Background = l_StyleKey_0.DialogMainButton, 
        Size = UDim2.new(1, 0, 0, 1), 
        [l_StyleModifier_0.Disabled] = {
            Background = l_StyleKey_0.Button
        }
    }, 
    LowerKnobBackground = l_Image_0, 
    LowerKnobBackgroundStyle = v30, 
    UpperKnobBackground = l_Image_0, 
    UpperKnobBackgroundStyle = v30
};
local v33 = {
    KnobSize = Vector2.new(18, 18), 
    Background = l_Image_0, 
    BackgroundStyle = {
        Background = Color3.fromRGB(87, 87, 87), 
        Size = UDim2.new(1, 0, 0, 1)
    }, 
    Foreground = l_Image_0, 
    ForegroundStyle = {
        Background = l_StyleKey_0.DialogMainButton, 
        Size = UDim2.new(1, 0, 0, 1), 
        [l_StyleModifier_0.Disabled] = {
            Background = l_StyleKey_0.Button
        }
    }, 
    LowerKnobBackground = l_Image_0, 
    LowerKnobBackgroundStyle = v31, 
    UpperKnobBackground = l_Image_0, 
    UpperKnobBackgroundStyle = v31
};
local v34 = {
    KnobSize = Vector2.new(18, 18), 
    Background = l_Image_0, 
    BackgroundStyle = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Color = Color3.fromRGB(87, 87, 87), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)), 
        SliceCenter = v28, 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }, 
    ForegroundStyle = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Image = "rbxasset://textures/DeveloperFramework/slider_bg.png", 
        Color = l_StyleKey_0.DialogMainButton, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(UDim.new(1, 0), UDim.new(0, 1)), 
        SliceCenter = v28, 
        [l_StyleModifier_0.Disabled] = {
            Color = l_StyleKey_0.Button
        }
    }, 
    OutlineStyle = {
        Color = Color3.fromRGB(87, 87, 87)
    }, 
    KnobBackground = l_Image_0, 
    KnobBackgroundStyle = v30
};
local v35 = {
    KnobSize = Vector2.new(18, 18), 
    Background = l_Image_0, 
    BackgroundStyle = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Color = Color3.fromRGB(87, 87, 87), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)), 
        SliceCenter = v28, 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }, 
    ForegroundStyle = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Image = "rbxasset://textures/DeveloperFramework/slider_bg.png", 
        Color = l_StyleKey_0.DialogMainButton, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(UDim.new(1, 0), UDim.new(0, 1)), 
        SliceCenter = v28, 
        [l_StyleModifier_0.Disabled] = {
            Color = l_StyleKey_0.Button
        }
    }, 
    OutlineStyle = {
        Color = Color3.fromRGB(87, 87, 87)
    }, 
    KnobBackground = l_Image_0, 
    KnobBackgroundStyle = v31
};
local v36 = {
    slice = Rect.new(3, 3, 13, 13), 
    backgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
    borderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png"
};
local v37 = {
    MediaControl = {
        Background = l_Box_0, 
        BackgroundStyle = {
            Color = l_StyleKey_0.MainBackground, 
            BorderColor = l_StyleKey_0.Border, 
            BorderSize = 1
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = {
                Color = l_StyleKey_0.ButtonHover, 
                BorderColor = l_StyleKey_0.Border, 
                BorderSize = 1
            }
        }
    }, 
    EventFilter = {
        Background = l_Box_0, 
        BackgroundStyle = {
            Color = l_StyleKey_0.TrackTitleBackgroundColor
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = {
                Color = l_StyleKey_0.ButtonHover
            }
        }
    }, 
    ActiveControl = {
        Background = l_Box_0, 
        BackgroundStyle = {
            Color = l_StyleKey_0.DialogMainButton, 
            BorderColor = l_StyleKey_0.DialogMainButton, 
            BorderSize = 1
        }, 
        [l_StyleModifier_0.Hover] = {
            BackgroundStyle = {
                Color = l_StyleKey_0.DialogMainButtonHover, 
                BorderColor = l_StyleKey_0.DialogMainButtonHover, 
                BorderSize = 1
            }
        }
    }, 
    IKDefault = {
        Background = l_RoundBox_0
    }, 
    IKActive = {
        Background = l_RoundBox_0
    }, 
    FaceControlsEditorActive = {
        Background = l_RoundBox_0
    }, 
    FaceControlsEditorDefault = {
        Background = l_RoundBox_0
    }
};
local v38 = l_getRawComponentStyle_0("Button");
local v39 = l_join_0(v38, {
    ["&ACEHeaderButtonDefault"] = l_join_0(v38["&Round"], {
        Background = l_RoundBox_0
    }), 
    ["&ACEHeaderButtonActive"] = l_join_0(v38["&RoundPrimary"], {})
});
local v40 = {
    imageColor = l_StyleKey_0.EventMarkerImageColor, 
    borderColor = l_StyleKey_0.EventMarkerBorderColor, 
    selectionBorderColor = l_StyleKey_0.DialogMainButton, 
    mainImage = "rbxasset://textures/AnimationEditor/eventMarker_inner.png", 
    borderImage = "rbxasset://textures/AnimationEditor/eventMarker_border.png", 
    selectionBorderImage = "rbxasset://textures/AnimationEditor/eventMarker_border_selected.png", 
    textSize = 15
};
local v41 = {
    controlImage = "rbxasset://textures/AnimationEditor/button_zoom.png", 
    arrowImage = "rbxasset://textures/AnimationEditor/img_triangle.png", 
    imageColor = l_StyleKey_0.MainText, 
    controlColor = l_StyleKey_0.ScrollBarControl, 
    hoverColor = l_StyleKey_0.ScrollBarHover, 
    pressedColor = l_StyleKey_0.ScrollBarPressed, 
    backgroundColor = l_StyleKey_0.ScrollBarBackground, 
    borderColor = l_StyleKey_0.InputFieldBorder, 
    borderSize = 1
};
local v42 = {
    font = Enum.Font.SourceSans, 
    backgroundColor = l_StyleKey_0.MainBackground, 
    borderColor = l_StyleKey_0.Border, 
    playbackTheme = v20, 
    dropdownTheme = v21, 
    trackTheme = v22, 
    eventTheme = {
        filterButton = {
            image = "rbxasset://textures/StudioSharedUI/filter.png", 
            size = UDim2.fromOffset(16, 16)
        }
    }, 
    keyframeTheme = v26, 
    eventMarker = v40, 
    selectionBox = l_StyleKey_0.DialogMainButton, 
    zoomBarTheme = v41, 
    scrollBarTheme = v41, 
    timelineTheme = {
        lineColor = l_StyleKey_0.DimmedText, 
        textColor = l_StyleKey_0.DimmedText, 
        dimmedColor = l_StyleKey_0.TimelineDimmedColor, 
        barColor = l_StyleKey_0.MainBackground, 
        backgroundColor = l_StyleKey_0.TimelineBackgroundColor, 
        lowerTransparency = 0.85, 
        lowerBrightTransparency = 0.7, 
        textSize = 15
    }, 
    scaleControlsTheme = v23, 
    textBox = v24, 
    settingsButtonTheme = v25, 
    dialogTheme = {
        textSize = 16, 
        subTextSize = 15, 
        headerFont = Enum.Font.SourceSansSemibold, 
        textColor = l_StyleKey_0.MainText, 
        subTextColor = l_StyleKey_0.DimmedText, 
        errorTextColor = l_StyleKey_0.ErrorText, 
        deleteImage = "rbxasset://textures/AnimationEditor/icon_close.png", 
        addImage = "rbxasset://textures/AnimationEditor/icon_add.png", 
        errorImage = "rbxasset://textures/AnimationEditor/icon_error.png"
    }, 
    toastTheme = {
        textSize = 16, 
        textColor = l_StyleKey_0.MainText, 
        shadowTransparency = 0.75, 
        shadowColor = Color3.new(), 
        shadowSize = 35
    }, 
    startScreenTheme = {
        textSize = 16, 
        textColor = l_StyleKey_0.MainText, 
        darkTextColor = l_StyleKey_0.StartScreenDarkTextColor
    }, 
    gridTheme = {
        lineColor = BrickColor.new(Color3.new(1, 1, 1))
    }, 
    ikTheme = {
        textColor = l_StyleKey_0.MainText, 
        primaryTextColor = l_StyleKey_0.MainTextSelected, 
        textSize = 15, 
        lineColor = l_StyleKey_0.DimmedText, 
        ikLineColor = Color3.fromRGB(182, 80, 203), 
        transparency = 0.6, 
        leafNodeImage = "rbxasset://textures/AnimationEditor/icon_hierarchy_end_white.png", 
        expandImage = "rbxasset://textures/AnimationEditor/button_expand.png", 
        collapseImage = "rbxasset://textures/AnimationEditor/button_collapse.png", 
        pinImage = "rbxasset://textures/AnimationEditor/Pin.png", 
        iconColor = l_StyleKey_0.DimmedText, 
        iconHighlightColor = l_StyleKey_0.BrightText, 
        selected = l_StyleKey_0.ItemSelected, 
        headerColor = l_StyleKey_0.IKHeaderColor, 
        headerBorder = l_StyleKey_0.IKHeaderBorder, 
        pinHover = l_StyleKey_0.DialogMainButtonHover
    }, 
    checkBox = v27, 
    faceSliderTheme = v32, 
    faceSliderMaxValueTheme = v33, 
    faceDragBoxTheme = v34, 
    faceDragBoxMaxValueTheme = v35, 
    roundFrame = v36, 
    button = v37, 
    keyframe = {
        Default = {
            backgroundColor = l_StyleKey_0.DialogButtonTextDisabled, 
            borderColor = l_StyleKey_0.DimmedText, 
            selected = {
                backgroundColor = l_StyleKey_0.DialogButtonTextDisabled, 
                borderColor = l_StyleKey_0.DialogMainButton
            }
        }, 
        Primary = {
            backgroundColor = l_StyleKey_0.KeyframePrimaryBackgroundColor, 
            borderColor = l_StyleKey_0.Border, 
            selected = {
                backgroundColor = l_StyleKey_0.KeyframePrimaryBackgroundColorSelected, 
                borderColor = l_Colors_0.Blue
            }
        }, 
        Error = {
            backgroundColor = l_StyleKey_0.KeyframeErrorBackgroundColor, 
            borderColor = l_StyleKey_0.KeyframeErrorBorderColor, 
            selected = {
                backgroundColor = l_StyleKey_0.KeyframeErrorBackgroundColorSelected, 
                borderColor = l_StyleKey_0.KeyframeErrorBorderColorSelected
            }
        }, 
        PrimaryError = {
            backgroundColor = l_StyleKey_0.KeyframePrimaryErrorBackgroundColor, 
            borderColor = l_StyleKey_0.KeyframePrimaryErrorBorderColor, 
            selected = {
                backgroundColor = l_StyleKey_0.KeyframePrimaryErrorBackgroundColorSelected, 
                borderColor = l_StyleKey_0.KeyframePrimaryErrorBorderColorSelected
            }
        }, 
        Bounce = {
            backgroundColor = Color3.fromRGB(155, 198, 204), 
            borderColor = Color3.fromRGB(56, 56, 56), 
            selected = {
                backgroundColor = Color3.fromRGB(155, 198, 204), 
                borderColor = l_StyleKey_0.DialogMainButton
            }
        }, 
        Constant = {
            backgroundColor = Color3.fromRGB(156, 147, 226), 
            borderColor = Color3.fromRGB(56, 56, 56), 
            selected = {
                backgroundColor = Color3.fromRGB(156, 147, 226), 
                borderColor = l_StyleKey_0.DialogMainButton
            }
        }, 
        Cubic = {
            backgroundColor = Color3.fromRGB(254, 189, 81), 
            borderColor = Color3.fromRGB(56, 56, 56), 
            selected = {
                backgroundColor = Color3.fromRGB(254, 189, 81), 
                borderColor = l_StyleKey_0.DialogMainButton
            }
        }, 
        Elastic = {
            backgroundColor = Color3.fromRGB(137, 187, 77), 
            borderColor = Color3.fromRGB(56, 56, 56), 
            selected = {
                backgroundColor = Color3.fromRGB(137, 187, 77), 
                borderColor = l_StyleKey_0.DialogMainButton
            }
        }
    }, 
    scrubberTheme = {
        backgroundColor = l_StyleKey_0.DialogMainButton, 
        image = "rbxasset://textures/AnimationEditor/img_scrubberhead.png"
    }, 
    faceCaptureTheme = {
        faceCaptureDefaultButtonIconColor = l_StyleKey_0.FaceCaptureDefaultButtonIconColor, 
        stopRecordingButtonImage = l_StyleKey_0.StopRecordingButtonImage, 
        errorIcon = "rbxasset://textures/AnimationEditor/icon_error.png", 
        warningIcon = "rbxasset://textures/AnimationEditor/icon_warning.png"
    }, 
    curveTheme = {
        default = l_StyleKey_0.MainText, 
        positionX = l_StyleKey_0.CurvePositionX, 
        positionY = l_StyleKey_0.CurvePositionY, 
        positionZ = l_StyleKey_0.CurvePositionZ, 
        rotationX = l_StyleKey_0.CurveRotationX, 
        rotationY = l_StyleKey_0.CurveRotationY, 
        rotationZ = l_StyleKey_0.CurveRotationZ, 
        selected = l_StyleKey_0.DialogMainButton, 
        xAxis = l_StyleKey_0.BrightText, 
        curveEditorButton = l_StyleKey_0.CurveEditorButton, 
        dopesheetButton = l_StyleKey_0.DopeSheetButton, 
        tangentControlColor = l_StyleKey_0.BrightText, 
        tangentAutoButton = "rbxasset://textures/AnimationEditor/TangentHandle_Automatic_9x9.png", 
        tangentDefinedButton = "rbxasset://textures/AnimationEditor/TangentHandle_SelfDefined_9x9.png"
    }, 
    progressBarTheme = {
        backgroundColor = l_Colors_0.Blue
    }, 
    [l_ComponentSymbols_0.Button] = v39, 
    radioButton = {
        font = Enum.Font.SourceSans, 
        textColor = l_StyleKey_0.MainText, 
        textSize = 15, 
        buttonHeight = 20, 
        radioButtonBackground = "rbxasset://textures/GameSettings/RadioButton.png", 
        radioButtonSelected = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png", 
        contentPadding = 16, 
        buttonPadding = 6
    }
};
return function(v43)
    return ((if not v43 then l_StudioTheme_0.new(v19, v18) else l_StudioTheme_0.mock(v19, v18)):extend(v42));
end;
