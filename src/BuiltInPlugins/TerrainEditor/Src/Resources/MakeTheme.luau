local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v4.BrushSettings;
local l_BrushShape_0 = v4.BrushShape;
local l_FlattenMode_0 = v4.FlattenMode;
local l_Style_0 = v2.Style;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_Theme_0 = v3.Resources.Theme;
local v13 = require(script.Parent.Theme);
local function _(v14)
    return {
        [l_BrushShape_0.Sphere] = ("%*TerrainBrushTypeSphere.png"):format(v14), 
        [l_BrushShape_0.Cube] = ("%*TerrainBrushTypeCube.png"):format(v14), 
        [l_BrushShape_0.Cylinder] = ("%*TerrainBrushTypeCylinder.png"):format(v14)
    };
end;
local function _(v16)
    return {
        [l_FlattenMode_0.Both] = ("%*FlattenModeRemoveAboveFillBelow.png"):format(v16), 
        [l_FlattenMode_0.Erode] = ("%*FlattenModeRemoveAbove.png"):format(v16), 
        [l_FlattenMode_0.Grow] = ("%*FlattenModeFillBelow.png"):format(v16)
    };
end;
local l_join_0 = v1.join;
local l_l_DarkTheme_0_0 = l_DarkTheme_0;
local v20 = {
    [l_StyleKey_0.StudioTheme] = "Dark"
};
local l_BrushShape_1 = l_BrushSettings_0.BrushShape;
local v22 = "rbxasset://studio_svg_textures/Lua/Terrain/Dark/" .. "Large/";
v20[l_BrushShape_1] = {
    [l_BrushShape_0.Sphere] = ("%*TerrainBrushTypeSphere.png"):format(v22), 
    [l_BrushShape_0.Cube] = ("%*TerrainBrushTypeCube.png"):format(v22), 
    [l_BrushShape_0.Cylinder] = ("%*TerrainBrushTypeCylinder.png"):format(v22)
};
l_BrushShape_1 = l_BrushSettings_0.FlattenMode;
v22 = "rbxasset://studio_svg_textures/Lua/Terrain/Dark/" .. "Large/";
v20[l_BrushShape_1] = {
    [l_FlattenMode_0.Both] = ("%*FlattenModeRemoveAboveFillBelow.png"):format(v22), 
    [l_FlattenMode_0.Erode] = ("%*FlattenModeRemoveAbove.png"):format(v22), 
    [l_FlattenMode_0.Grow] = ("%*FlattenModeFillBelow.png"):format(v22)
};
v20[l_StyleKey_0.Locked] = ("%*Standard/Locked.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/");
v20[l_StyleKey_0.Reset] = ("%*Standard/Reset.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/");
v20[l_StyleKey_0.Unlocked] = ("%*Standard/Unlocked.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Dark/");
l_join_0 = l_join_0(l_l_DarkTheme_0_0, v20);
l_l_DarkTheme_0_0 = v1.join;
v20 = l_LightTheme_0;
l_BrushShape_1 = {
    [l_StyleKey_0.StudioTheme] = "Light"
};
local l_BrushShape_2 = l_BrushSettings_0.BrushShape;
local v24 = "rbxasset://studio_svg_textures/Lua/Terrain/Light/" .. "Large/";
l_BrushShape_1[l_BrushShape_2] = {
    [l_BrushShape_0.Sphere] = ("%*TerrainBrushTypeSphere.png"):format(v24), 
    [l_BrushShape_0.Cube] = ("%*TerrainBrushTypeCube.png"):format(v24), 
    [l_BrushShape_0.Cylinder] = ("%*TerrainBrushTypeCylinder.png"):format(v24)
};
l_BrushShape_2 = l_BrushSettings_0.FlattenMode;
v24 = "rbxasset://studio_svg_textures/Lua/Terrain/Light/" .. "Large/";
l_BrushShape_1[l_BrushShape_2] = {
    [l_FlattenMode_0.Both] = ("%*FlattenModeRemoveAboveFillBelow.png"):format(v24), 
    [l_FlattenMode_0.Erode] = ("%*FlattenModeRemoveAbove.png"):format(v24), 
    [l_FlattenMode_0.Grow] = ("%*FlattenModeFillBelow.png"):format(v24)
};
l_BrushShape_1[l_StyleKey_0.Locked] = ("%*Standard/Locked.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Light/");
l_BrushShape_1[l_StyleKey_0.Reset] = ("%*Standard/Reset.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Light/");
l_BrushShape_1[l_StyleKey_0.Unlocked] = ("%*Standard/Unlocked.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/Light/");
l_l_DarkTheme_0_0 = l_l_DarkTheme_0_0(v20, l_BrushShape_1);
return function(v25)
    local _ = nil;
    return (if not v25 then l_Theme_0.new(l_join_0, l_l_DarkTheme_0_0) else l_Theme_0.mock(l_join_0, l_l_DarkTheme_0_0)):extend(v13);
end;
