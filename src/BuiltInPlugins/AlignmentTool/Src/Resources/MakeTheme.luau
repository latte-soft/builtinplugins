local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Style_0 = v2.Style;
local l_Colors_0 = l_Style_0.Colors;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v10 = require(l_Parent_0.Src.Utility.AlignmentMode);
local l_join_0 = v1.join;
local v12 = string.format("rbxasset://studio_svg_textures/Lua/AlignTool/%s/Large/", "Light");
local v13 = string.format("rbxasset://studio_svg_textures/Lua/AlignTool/%s/Large/", "Dark");
local v14 = string.format("rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/", "Light");
local v15 = {
    [l_StyleKey_0.HelpIconColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.SelectableButtonBorderColor] = l_Colors_0.Gray, 
    [l_StyleKey_0.SelectableButtonSelectedColor] = l_Colors_0.Gray_Mid, 
    [l_StyleKey_0.ModeButtonMin] = v13 .. "AlignMin.png", 
    [l_StyleKey_0.ModeButtonCenter] = v13 .. "AlignCenter.png", 
    [l_StyleKey_0.ModeButtonMax] = v13 .. "AlignMax.png", 
    [l_StyleKey_0.Help] = string.format("rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/", "Dark") .. "Help.png"
};
local v16 = {
    [l_StyleKey_0.HelpIconColor] = Color3.fromRGB(184, 184, 184), 
    [l_StyleKey_0.SelectableButtonBorderColor] = l_Colors_0.Gray_Light, 
    [l_StyleKey_0.SelectableButtonSelectedColor] = l_Colors_0.Gray_Lighter, 
    [l_StyleKey_0.ModeButtonMin] = v12 .. "AlignMin.png", 
    [l_StyleKey_0.ModeButtonCenter] = v12 .. "AlignCenter.png", 
    [l_StyleKey_0.ModeButtonMax] = v12 .. "AlignMax.png", 
    [l_StyleKey_0.Help] = v14 .. "Help.png"
};
local v17 = {
    SectionPadding = UDim.new(0, 15), 
    SectionContentPadding = UDim.new(0, 10), 
    SectionContentPaddingCompact = UDim.new(0, 6), 
    ModeButtons = {
        [1] = {
            Image = l_StyleKey_0.ModeButtonMin, 
            Mode = v10.Min
        }, 
        [2] = {
            Image = l_StyleKey_0.ModeButtonCenter, 
            Mode = v10.Center
        }, 
        [3] = {
            Image = l_StyleKey_0.ModeButtonMax, 
            Mode = v10.Max
        }
    }, 
    InfoLabel = {
        ErrorTextColor = l_StyleKey_0.ErrorText, 
        WarningTextColor = l_StyleKey_0.WarningText, 
        InfoTextColor = l_StyleKey_0.MainText
    }, 
    MainView = {
        ListItemPadding = UDim.new(0, 10), 
        Padding = 10, 
        PrimaryButtonSize = UDim2.new(0, 160, 0, 32)
    }, 
    RelativeToSetting = {
        HelpIconPadding = UDim.new(0, 2)
    }, 
    LabeledElementList = {
        ItemContentPadding = UDim.new(0, 10), 
        ItemPaddingHorizontal = UDim.new(0, 15), 
        ItemPaddingVertical = UDim.new(0, 8), 
        MaximumLabelWidth = 100, 
        SectionPadding = UDim.new(0, 15)
    }, 
    [l_ComponentSymbols_0.Button] = l_join_0(l_getRawComponentStyle_0("Button"), {
        ["&Selectable"] = {
            BackgroundStyle = {
                BorderSize = 1, 
                Transparency = 1
            }, 
            [l_StyleModifier_0.Hover] = {
                BackgroundStyle = {
                    BorderColor = l_StyleKey_0.SelectableButtonBorderColor, 
                    BorderSize = 1, 
                    Color = l_StyleKey_0.ButtonHover, 
                    Transparency = 0
                }
            }, 
            [l_StyleModifier_0.Selected] = {
                BackgroundStyle = {
                    BorderColor = l_StyleKey_0.SelectableButtonBorderColor, 
                    BorderSize = 1, 
                    Color = l_StyleKey_0.SelectableButtonSelectedColor, 
                    Transparency = 0
                }
            }
        }
    }), 
    [l_ComponentSymbols_0.Image] = l_join_0(l_getRawComponentStyle_0("Image"), {
        ["&HelpIcon"] = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Color = l_StyleKey_0.HelpIconColor, 
            Image = l_StyleKey_0.Help, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.fromOffset(14, 14), 
            [l_StyleModifier_0.Disabled] = {
                Transparency = 0.5
            }
        }
    })
};
return function(v18)
    local _ = nil;
    return (if not v18 then l_StudioTheme_0.new(v15, v16) else l_StudioTheme_0.mock()):extend(v17);
end;
