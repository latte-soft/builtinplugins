local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local l_Style_0 = v1.Style;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local _ = v1.Util.StyleModifier;
local l_ToolId_0 = v3.ToolId;
local v13 = {
    [l_ToolId_0.Generate] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Generate.png", 
    [l_ToolId_0.ImportLocal] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Import.png", 
    [l_ToolId_0.SeaLevel] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_SeaLevel.png", 
    [l_ToolId_0.Replace] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Replace.png", 
    [l_ToolId_0.Clear] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Clear.png", 
    [l_ToolId_0.Select] = "rbxasset://studio_svg_textures/Shared/DraggerTools/%s/Large/" .. "Select.png", 
    [l_ToolId_0.Material] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Fill.png", 
    [l_ToolId_0.Transform] = "rbxasset://studio_svg_textures/Shared/DraggerTools/%s/Large/" .. "Move.png", 
    [l_ToolId_0.Move] = "rbxasset://studio_svg_textures/Shared/DraggerTools/%s/Large/" .. "Move.png", 
    [l_ToolId_0.Resize] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Resize.png", 
    [l_ToolId_0.Rotate] = "rbxasset://studio_svg_textures/Shared/DraggerTools/%s/Large/" .. "Rotate.png", 
    [l_ToolId_0.Copy] = "rbxasset://studio_svg_textures/Shared/Clipboard/%s/Large/" .. "Copy.png", 
    [l_ToolId_0.Paste] = "rbxasset://studio_svg_textures/Shared/Clipboard/%s/Large/" .. "Paste.png", 
    [l_ToolId_0.Delete] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Delete.png", 
    [l_ToolId_0.Fill] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Fill.png", 
    [l_ToolId_0.Add] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Add.png", 
    [l_ToolId_0.Draw] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Add.png", 
    [l_ToolId_0.Subtract] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Subtract.png", 
    [l_ToolId_0.Grow] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Grow.png", 
    [l_ToolId_0.Sculpt] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Grow.png", 
    [l_ToolId_0.Erode] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Erode.png", 
    [l_ToolId_0.Smooth] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Smooth.png", 
    [l_ToolId_0.Flatten] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Flatten.png", 
    [l_ToolId_0.Paint] = "rbxasset://studio_svg_textures/Lua/Terrain/%s/Large/" .. "Terrain_Paint.png"
};
local function _(v14)
    return (("Tool_%*"):format(v14));
end;
local function v18()
    local v16 = {
        ToolIcons = {}
    };
    for v17 in v13, nil, nil do
        v16.ToolIcons[v17] = l_StyleKey_0[("Tool_%*"):format(v17)];
    end;
    return {
        [l_ComponentSymbols_0.LoadingBar] = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.LoadingBar], {
            ForegroundStyle = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.LoadingBar].ForegroundStyle, {
                Color = l_StyleKey_0.DialogMainButton, 
                BorderTransparency = 1
            })
        }), 
        [l_ComponentSymbols_0.Tooltip] = v2.Dictionary.join(l_BaseTheme_0[l_ComponentSymbols_0.Tooltip], {
            MaxWidth = 1000
        }), 
        Spinner = {
            TimeBetweenBlocks = 0.05, 
            Colors = {
                Color3.fromRGB(172, 172, 172), 
                Color3.fromRGB(172, 172, 172), 
                Color3.fromRGB(159, 159, 159), 
                Color3.fromRGB(140, 140, 140), 
                Color3.fromRGB(122, 122, 122), 
                Color3.fromRGB(103, 103, 103), 
                Color3.fromRGB(84, 84, 84), 
                Color3.fromRGB(65, 65, 65)
            }, 
            BlockWidth = 2, 
            InnerRadius = 7
        }, 
        VolumeDragger = {
            SelectColor = Color3.new(1, 1, 1), 
            TransformColor = l_StyleKey_0.DialogMainButtonHover, 
            LineThickness = 0.3, 
            Transparency = 0.9
        }, 
        ApplyTransformNote = {
            Background = l_StyleKey_0.MainBackground, 
            KeyBackground = l_StyleKey_0.DimmedText, 
            EdgePadding = 2, 
            FramePadding = 3, 
            TextMargin = 2
        }, 
        ToolButton = v16
    };
end;
local function v23(v19)
    local v20 = {};
    for v21, v22 in v13, nil, nil do
        v20[l_StyleKey_0[("Tool_%*"):format(v21)]] = v22:format(v19);
    end;
    return v20;
end;
local function v24()
    return v2.Dictionary.join(l_DarkTheme_0, {
        [l_StyleKey_0.TerrainTools_DisabledColor] = Color3.fromRGB(60, 60, 60)
    }, (v23("Dark"))), (v2.Dictionary.join(l_LightTheme_0, {
        [l_StyleKey_0.TerrainTools_DisabledColor] = Color3.fromRGB(153, 218, 255)
    }, (v23("Light"))));
end;
return function(v25)
    return (not not (v25 or false) and l_StudioTheme_0.mock(v24()) or l_StudioTheme_0.new(v24())):extend((v18()));
end;
