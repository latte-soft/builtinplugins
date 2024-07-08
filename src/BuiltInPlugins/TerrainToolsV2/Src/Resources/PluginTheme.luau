local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_DEPRECATED_Theme_0 = l_Parent_0.Src.DEPRECATED_Theme;
local v4 = require(l_DEPRECATED_Theme_0.StudioTheme);
local v5 = require(l_DEPRECATED_Theme_0.StudioStyle);
local l_deepJoin_0 = v1.Util.deepJoin;
local v7 = require(l_Parent_0.Src.Util.DebugFlags);
local v8 = string.format("rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/", "Light");
local v9 = string.format("rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/", "Dark");
local v10 = {};
local v11 = {
    buttonColor = Color3.fromRGB(0, 162, 255), 
    buttonHover = Color3.fromRGB(50, 181, 255), 
    buttonPressed = Color3.fromRGB(0, 116, 189), 
    buttonColorDisabled = Color3.fromRGB(153, 218, 255), 
    buttonColorDisabled_Dark = Color3.fromRGB(60, 60, 60), 
    buttonTextColor = Color3.fromRGB(255, 255, 255), 
    buttonTextDisabled_Dark = Color3.fromRGB(102, 102, 102), 
    borderColor_dark = Color3.fromRGB(26, 26, 26), 
    errorColor = Color3.fromRGB(216, 104, 104), 
    panelColor = Color3.fromRGB(240, 240, 240), 
    panelColor_dark = Color3.fromRGB(53, 53, 53), 
    textBox_dark = Color3.fromRGB(37, 37, 37), 
    singleSelectButtonSelected = Color3.fromRGB(219, 219, 219), 
    singleSelectButtonSelected_dark = Color3.fromRGB(85, 85, 85), 
    singleSelectButtonHovered = Color3.fromRGB(228, 238, 253), 
    singleSelectButtonHovered_dark = Color3.fromRGB(63, 63, 63), 
    propertyLockPaperclipColor = Color3.fromRGB(151, 151, 151), 
    propertyLockIconBackgroundHover = Color3.fromRGB(228, 238, 254), 
    propertyLockIconBackgroundHover_dark = Color3.fromRGB(163, 162, 165), 
    propertyLockIconBorderHover = Color3.fromRGB(219, 219, 219), 
    propertyLockIconBorderHover_dark = Color3.fromRGB(227, 227, 227)
};
local function _()
    if not v7.RunningUnderCLI() then
        return settings().Studio.Theme;
    else
        return {
            Name = "Light"
        };
    end;
end;
v10.createValues = function(v13, v14, v15)
    local v16 = if not v7.RunningUnderCLI() then settings().Studio.Theme else {
        Name = "Light"
    };
    local function _(v17, v18)
        local v19 = v18 and v18[v16.Name];
        if not v19 then
            return v17;
        else
            return v2.Dictionary.join(v17, v19);
        end;
    end;
    local v21 = v5.new(v13, v14, v15);
    local v22 = Rect.new(3, 3, 13, 13);
    local v23 = {
        toggleOnImage = "rbxasset://textures/RoactStudioWidgets/toggle_on_light.png", 
        toggleOffImage = "rbxasset://textures/RoactStudioWidgets/toggle_off_light.png", 
        toggleLockModeOnImage = "rbxasset://textures/RoactStudioWidgets/toggle_on_disable_light.png", 
        toggleLockModeOffImage = "rbxasset://textures/RoactStudioWidgets/toggle_disable_light.png"
    };
    local v24 = {
        Dark = {
            toggleOnImage = "rbxasset://textures/RoactStudioWidgets/toggle_on_dark.png", 
            toggleOffImage = "rbxasset://textures/RoactStudioWidgets/toggle_off_dark.png", 
            toggleLockModeOnImage = "rbxasset://textures/RoactStudioWidgets/toggle_on_disable_dark.png", 
            toggleLockModeOffImage = "rbxasset://textures/RoactStudioWidgets/toggle_disable_dark.png"
        }
    };
    local v25 = v24 and v24[v16.Name];
    local v26 = if not v25 then v23 else v2.Dictionary.join(v23, v25);
    v24 = {
        sphereBrushImage = "rbxasset://textures/TerrainTools/icon_shape_sphere.png", 
        cubeBrushImage = "rbxasset://textures/TerrainTools/icon_shape_cube.png", 
        cylinderBrushImage = "rbxasset://textures/TerrainTools/icon_shape_cylinder.png", 
        flattenBothImage = "rbxasset://textures/TerrainTools/icon_flatten_both.png", 
        flattenErodeImage = "rbxasset://textures/TerrainTools/icon_flatten_erode.png", 
        flattenGrowImage = "rbxasset://textures/TerrainTools/icon_flatten_grow.png", 
        pickHeightEnableImage = "rbxasset://textures/TerrainTools/icon_picker_enable.png", 
        pickHeightDisableImage = "rbxasset://textures/TerrainTools/icon_picker_disable.png"
    };
    v25 = {
        Dark = {
            pickHeightDisableImage = "rbxasset://textures/TerrainTools/icon_picker_disable_dark.png"
        }
    };
    local v27 = v25 and v25[v16.Name];
    v23 = if not v27 then v24 else v2.Dictionary.join(v24, v27);
    v25 = {
        sphereBrushImage = v8 .. "TerrainBrushTypeSphere.png", 
        cubeBrushImage = v8 .. "TerrainBrushTypeCube.png", 
        cylinderBrushImage = v8 .. "TerrainBrushTypeCylinder.png", 
        flattenBothImage = v8 .. "FlattenModeRemoveAboveFillBelow.png", 
        flattenErodeImage = v8 .. "FlattenModeRemoveAbove.png", 
        flattenGrowImage = v8 .. "FlattenModeFillBelow.png", 
        pickHeightEnableImage = "rbxasset://textures/TerrainTools/icon_picker_enable.png", 
        pickHeightDisableImage = "rbxasset://textures/TerrainTools/icon_picker_disable.png"
    };
    v27 = {
        Dark = {
            sphereBrushImage = v9 .. "TerrainBrushTypeSphere.png", 
            cubeBrushImage = v9 .. "TerrainBrushTypeCube.png", 
            cylinderBrushImage = v9 .. "TerrainBrushTypeCylinder.png", 
            flattenBothImage = v9 .. "FlattenModeRemoveAboveFillBelow.png", 
            flattenErodeImage = v9 .. "FlattenModeRemoveAbove.png", 
            flattenGrowImage = v9 .. "FlattenModeFillBelow.png", 
            pickHeightDisableImage = "rbxasset://textures/TerrainTools/icon_picker_disable_dark.png"
        }
    };
    local v28 = v27 and v27[v16.Name];
    v24 = if not v28 then v25 else v2.Dictionary.join(v25, v28);
    v27 = {
        closeIcon = "rbxasset://textures/TerrainTools/button_arrow.png", 
        openIcon = "rbxasset://textures/TerrainTools/button_arrow_down.png", 
        panelColor = v11.panelColor, 
        font = Enum.Font.SourceSansBold, 
        textSize = 18
    };
    v28 = {
        Dark = {
            panelColor = v11.panelColor_dark
        }
    };
    local v29 = v28 and v28[v16.Name];
    v25 = if not v29 then v27 else v2.Dictionary.join(v27, v29);
    v28 = {
        styleSheet = {
            ButtonColor = v11.buttonColor, 
            ButtonColor_Hover = v11.buttonHover, 
            ButtonColor_Disabled = v11.buttonColorDisabled, 
            TextColor = v11.buttonTextColor, 
            TextColor_Disabled = v11.buttonTextColor, 
            BorderColor = v21.borderColor
        }, 
        textSize = 16, 
        textBoxColor = v21.backgroundColor
    };
    v29 = {
        Dark = {
            styleSheet = {
                ButtonColor = v11.buttonColor, 
                ButtonColor_Hover = v11.buttonHover, 
                ButtonColor_Disabled = v11.buttonColorDisabled_Dark, 
                TextColor = v11.buttonTextColor, 
                TextColor_Disabled = v11.buttonTextDisabled_Dark, 
                BorderColor = v11.borderColor_dark
            }, 
            textBoxColor = v11.textBox_dark
        }
    };
    local v30 = v29 and v29[v16.Name];
    v27 = if not v30 then v28 else v2.Dictionary.join(v28, v30);
    v29 = {
        styleSheet = {
            ButtonColor = Color3.fromRGB(255, 255, 255), 
            ButtonColor_Hover = Color3.fromRGB(228, 238, 253), 
            TextColor = v11.textBox_dark, 
            BorderColor = v21.borderColor
        }, 
        styleSheetNotToggled = {
            ButtonColor = Color3.fromRGB(219, 219, 219), 
            ButtonColor_Hover = Color3.fromRGB(239, 239, 239), 
            TextColor = v11.textBox_dark, 
            BorderColor = v21.borderColor
        }, 
        textSize = 14, 
        textBoxColor = v21.backgroundColor
    };
    v30 = {
        Dark = {
            styleSheet = {
                ButtonColor = Color3.fromRGB(85, 85, 85), 
                ButtonColor_Hover = Color3.fromRGB(55, 55, 55), 
                TextColor = v11.buttonTextColor, 
                BorderColor = v21.borderColor
            }, 
            styleSheetNotToggled = {
                ButtonColor = Color3.fromRGB(35, 35, 35), 
                ButtonColor_Hover = Color3.fromRGB(45, 45, 45), 
                TextColor = v11.buttonTextColor, 
                BorderColor = v21.borderColor
            }, 
            textBoxColor = v21.backgroundColor
        }
    };
    local v31 = v30 and v30[v16.Name];
    v28 = if not v31 then v29 else v2.Dictionary.join(v29, v31);
    v30 = {
        roundedBorderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
        roundedBackgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
        roundedElementSlice = v22, 
        buttonSelectedColor = v11.singleSelectButtonSelected, 
        buttonHoveredColor = v11.singleSelectButtonHovered
    };
    v31 = {
        Dark = {
            buttonSelectedColor = v11.singleSelectButtonSelected_dark, 
            buttonHoveredColor = v11.singleSelectButtonHovered_dark
        }
    };
    local v32 = v31 and v31[v16.Name];
    v29 = if not v32 then v30 else v2.Dictionary.join(v30, v32);
    v31 = {
        lockedIcon = "rbxasset://textures/TerrainTools/locked.png", 
        unlockedIcon = "rbxasset://textures/TerrainTools/unlocked.png", 
        paperclipColor = v11.propertyLockPaperclipColor, 
        iconBackgroundHover = v11.propertyLockIconBackgroundHover, 
        iconBorderHover = v11.propertyLockIconBorderHover, 
        iconBackgroundHoverTransparency = 0
    };
    v32 = {
        Dark = {
            iconBackgroundHover = v11.propertyLockIconBackgroundHover_dark, 
            iconBorderHover = v11.propertyLockIconBorderHover_dark, 
            iconBackgroundHoverTransparency = 0.5
        }
    };
    local v33 = v32 and v32[v16.Name];
    v30 = if not v33 then v31 else v2.Dictionary.join(v31, v33);
    v31 = {
        scrollTopImage = "rbxasset://textures/StudioToolbox/ScrollBarTop.png", 
        scrollMidImage = "rbxasset://textures/StudioToolbox/ScrollBarMiddle.png", 
        scrollBotImage = "rbxasset://textures/StudioToolbox/ScrollBarBottom.png", 
        verticalScrollBarInset = Enum.ScrollBarInset.None
    };
    v32 = {
        currentTabSize = UDim2.new(1, -4, 1, -2), 
        currentTabOffset = UDim2.new(0, 2, 0, 2), 
        otherTabSize = UDim2.new(1, 0, 1, -2), 
        otherTabOffset = UDim2.new(0, 0, 0, 0)
    };
    local v34 = {
        expandIcon = "rbxasset://textures/StudioSharedUI/preview_expand.png", 
        clearIcon = "rbxasset://textures/StudioSharedUI/preview_clear.png", 
        importIcon = "rbxasset://textures/StudioSharedUI/import@2x.png", 
        previewBackgroundColor = v13(v14.RibbonButton), 
        previewHoveredBackgroundColor = v13(v14.RibbonButton, v15.Hover), 
        previewBorderColor = v13(v14.Border), 
        buttonIconColor = Color3.fromRGB(167, 167, 167), 
        buttonIconHoveredColor = Color3.fromRGB(254, 254, 254), 
        toolbarTransparency = 0.4, 
        toolbarBackgroundColor = Color3.fromRGB(0, 0, 0), 
        toolbarButtonBackgroundColor = Color3.fromRGB(39, 39, 39)
    };
    local v35 = {
        Dark = {
            buttonIconColor = Color3.fromRGB(167, 167, 167), 
            buttonIconHoveredColor = Color3.fromRGB(254, 254, 254), 
            toolbarBackgroundColor = Color3.fromRGB(0, 0, 0), 
            toolbarButtonBackgroundColor = Color3.fromRGB(39, 39, 39)
        }
    };
    local v36 = v35 and v35[v16.Name];
    v33 = if not v36 then v34 else v2.Dictionary.join(v34, v36);
    v34 = {
        backgroundColor = Color3.fromRGB(182, 182, 182), 
        titleColor = v13(v14.MainText, v15.Default), 
        backgroundImage = "rbxasset://textures/GameSettings/UncheckedBox.png", 
        selectedImage = "rbxasset://textures/GameSettings/CheckedBoxLight.png"
    };
    v35 = {
        slice = Rect.new(3, 3, 13, 13), 
        backgroundImage = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
        borderImage = "rbxasset://textures/StudioToolbox/RoundedBorder.png"
    };
    v36 = {
        font = Enum.Font.SourceSans
    };
    local v37 = {
        resetIcon = "rbxasset://textures/StudioToolbox/AssetConfig/restore.png", 
        buttonIconColor = Color3.fromRGB(128, 128, 128)
    };
    local v38 = {
        Dark = {
            buttonIconColor = Color3.fromRGB(204, 204, 204)
        }
    };
    local v39 = v38 and v38[v16.Name];
    return (l_deepJoin_0(v21, {
        textSize = 16, 
        padding = 4, 
        font = Enum.Font.SourceSans, 
        errorColor = Color3.fromRGB(216, 104, 104), 
        warningColor = Color3.fromRGB(255, 128, 0), 
        selectionBorderColor = Color3.fromRGB(0, 162, 255), 
        tabTheme = v32, 
        toggleTheme = v26, 
        toolRenderTheme = v31, 
        brushSettingsTheme = v24, 
        panelTheme = v25, 
        roundTextButtonTheme = v27, 
        roundToggleTextButtonTheme = v28, 
        singleSelectButtonGroupTheme = v29, 
        propertyLockTheme = v30, 
        promptSelectorWithPreviewTheme = v33, 
        checkBox = v34, 
        roundFrame = v35, 
        textButton = v36, 
        iconButton = if not v39 then v37 else v2.Dictionary.join(v37, v39), 
        button = {
            Default = {
                font = v21.font, 
                isRound = true, 
                backgroundColor = v21.itemColor, 
                textColor = v21.textColor, 
                borderColor = v21.borderColor, 
                hovered = {
                    backgroundColor = v21.hoveredItemColor, 
                    textColor = v21.hoveredTextColor, 
                    borderColor = v21.borderColor
                }
            }, 
            Primary = {
                font = v21.font, 
                isRound = true, 
                backgroundColor = v21.primaryItemColor, 
                textColor = v21.primaryTextColor, 
                borderColor = v21.primaryBorderColor, 
                hovered = {
                    backgroundColor = v21.primaryHoveredItemColor, 
                    textColor = v21.primaryHoveredTextColor, 
                    borderColor = v21.primaryHoveredBorderColor
                }
            }
        }
    }, {
        Dark = {
            borderColor = Color3.fromRGB(26, 26, 26)
        }
    }));
end;
v10.new = function()
    return v4.new(v10.createValues);
end;
v10.mock = function()
    return v4.newDummyTheme(v10.createValues);
end;
return v10;
