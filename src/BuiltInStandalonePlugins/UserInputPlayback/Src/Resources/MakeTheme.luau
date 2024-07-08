local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_getRawComponentStyle_0 = v0.Style.getRawComponentStyle;
local l_Style_0 = v0.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_Util_0 = v0.Util;
local l_Cryo_0 = l_Util_0.Cryo;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local v12 = l_Cryo_0.Dictionary.join(l_DarkTheme_0, {
    [l_StyleKey_0.SelectedTabColor] = Color3.fromRGB(64, 64, 64), 
    [l_StyleKey_0.UIGroupColor] = Color3.fromRGB(77, 77, 77)
});
local v13 = l_Cryo_0.Dictionary.join(l_LightTheme_0, {
    [l_StyleKey_0.SelectedTabColor] = Color3.fromRGB(253, 253, 253), 
    [l_StyleKey_0.UIGroupColor] = Color3.fromRGB(246, 247, 248)
});
local function v16()
    for _, v15 in ipairs({
        "SelectedTabColor", 
        "UIGroupColor"
    }) do
        l_StyleKey_0[v15] = v13[l_StyleKey_0[v15]];
    end;
end;
l_ComponentSymbols_0:add("TabbedView");
l_ComponentSymbols_0:add("PlaybackTabView");
l_ComponentSymbols_0:add("FileSelectorUIGroup");
l_ComponentSymbols_0:add("PlaybackInfoUIGroup");
l_ComponentSymbols_0:add("FilterSettingsUIGroup");
l_ComponentSymbols_0:add("LabeledToggleButton");
l_ComponentSymbols_0:add("UIKeyValueTextLabel");
l_ComponentSymbols_0:add("ChooseRecordingNamePopUp");
l_ComponentSymbols_0:add("InputVisualizer");
l_ComponentSymbols_0:add("KeyBarTile");
local v17 = l_getRawComponentStyle_0("Button");
local v18 = v17["&RoundPrimary"];
local v19 = l_getRawComponentStyle_0("TextLabel");
local v20 = l_getRawComponentStyle_0("RoundBox");
local v21 = l_getRawComponentStyle_0("SelectInput");
local v22 = l_getRawComponentStyle_0("Pane");
local v23 = l_deepCopy_0(v20);
local function v24()
    return {
        PrimaryButtonSize = UDim2.new(0, 160, 0, 32), 
        UIGroupWidthPx = 340, 
        PaddingPx = 10, 
        [l_ComponentSymbols_0.Button] = l_Cryo_0.Dictionary.join(v17, {
            ["&RoundPrimaryRecordButton"] = l_Cryo_0.Dictionary.join(v18, {
                [l_StyleModifier_0.Selected] = {
                    BackgroundStyle = l_Cryo_0.Dictionary.join(v23, {
                        Color = Color3.fromRGB(255, 211, 16)
                    }), 
                    TextColor = Color3.fromRGB(0, 0, 0)
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundStyle = l_Cryo_0.Dictionary.join(v23, {
                        Color = Color3.fromRGB(255, 25, 25)
                    }), 
                    TextColor = Color3.fromRGB(255, 255, 255)
                }
            }), 
            ["&RoundPrimaryPlayButton"] = l_Cryo_0.Dictionary.join(v18, {
                [l_StyleModifier_0.Selected] = {
                    BackgroundStyle = l_Cryo_0.Dictionary.join(v23, {
                        Color = Color3.fromRGB(255, 211, 16)
                    }), 
                    TextColor = Color3.fromRGB(0, 0, 0)
                }, 
                [l_StyleModifier_0.Pressed] = {
                    BackgroundStyle = l_Cryo_0.Dictionary.join(v23, {
                        Color = Color3.fromRGB(0, 219, 26)
                    }), 
                    TextColor = Color3.fromRGB(255, 255, 255)
                }
            })
        }), 
        [l_ComponentSymbols_0.Pane] = l_Cryo_0.Dictionary.join(v22, {
            ["&CornerBox"] = {
                CornerRadius = UDim.new(0, 8), 
                Background = l_StyleKey_0.UIGroupColor
            }, 
            ["&KeyTileBox"] = {
                CornerRadius = UDim.new(0, 8), 
                Background = Color3.new(0, 0, 0)
            }
        }), 
        [l_ComponentSymbols_0.TabbedView] = {
            TabBarHeightPx = 30, 
            ForegroundTabColor = l_StyleKey_0.SelectedTabColor, 
            TabBarBackgroundColor = l_StyleKey_0.SubBackground
        }, 
        [l_ComponentSymbols_0.PlaybackTabView] = {
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.FileSelectorUIGroup] = {
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.TextLabel] = l_Cryo_0.Dictionary.join(v19, {
            ["&StatusTextLabel"] = {
                TextSize = 16, 
                TextColor = l_StyleKey_0.MainText, 
                TextWrapped = true
            }
        }), 
        [l_ComponentSymbols_0.LabeledToggleButton] = {
            ComponentSize = UDim2.new(0, 150, 0, 30), 
            ToggleSize = UDim2.fromOffset(40, 24), 
            LeftInsetPx = 12, 
            PaddingPx = 10
        }, 
        [l_ComponentSymbols_0.UIKeyValueTextLabel] = {
            PaddingPx = 10, 
            HeightPx = 25, 
            KeyWidthPx = 150
        }, 
        [l_ComponentSymbols_0.FileSelectorUIGroup] = {
            PaddingPx = 10, 
            ProgressBarWidth = 250
        }, 
        [l_ComponentSymbols_0.FilterSettingsUIGroup] = {
            GridAreaHeightPx = 100, 
            PaddingPx = 10, 
            GridLayoutCellSize = UDim2.fromOffset(150, 30), 
            GridCellPaddingYPx = 2
        }, 
        [l_ComponentSymbols_0.PlaybackInfoUIGroup] = {
            PaddingPx = 10
        }, 
        PlaybackSelectInput = l_Cryo_0.Dictionary.join(v21, {
            Size = UDim2.new(0, 240, 0, 32)
        }), 
        [l_ComponentSymbols_0.ChooseRecordingNamePopUp] = {
            ContentSize = Vector2.new(300, 60), 
            PanelSize = UDim2.fromOffset(250, 60), 
            PanelPosition = UDim2.fromOffset(20, -10), 
            DialogMessageSize = UDim2.new(1, 0, 0, 40), 
            TextInputSize = UDim2.fromOffset(250, 30), 
            PaddingPx = 1
        }, 
        [l_ComponentSymbols_0.InputVisualizer] = {
            KeyBarRowSpacingPx = 2, 
            KeyBarSize = UDim2.fromOffset(200, 100)
        }, 
        [l_ComponentSymbols_0.KeyBarTile] = {
            TextColor = Color3.new(1, 1, 1), 
            BackgroundColor = Color3.new(0, 0, 0)
        }
    };
end;
return function(v25)
    local v26 = nil;
    if not v25 then
        v26 = l_StudioTheme_0.new(v12, v13);
    else
        v16();
        v26 = l_StudioTheme_0.mock(v12, v13);
    end;
    return v26:extend((v24()));
end;
