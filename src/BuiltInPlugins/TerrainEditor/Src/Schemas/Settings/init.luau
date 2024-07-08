local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local l_Category_0 = require(l_script_FirstAncestor_0.Src.Types).Category;
return {
    [l_Category_0.BiomeSettings] = require(script.Biome), 
    [l_Category_0.BrushSettings] = require(script.Brush), 
    [l_Category_0.BuildSettings] = if not v1() then nil else require(script.Build), 
    [l_Category_0.ClearSettings] = require(script.Clear), 
    [l_Category_0.HeightmapSettings] = require(script.Heightmap), 
    [l_Category_0.MaterialSettings] = require(script.Material), 
    [l_Category_0.SeaLevelSettings] = require(script.SeaLevel), 
    [l_Category_0.SelectionSettings] = require(script.Selection), 
    [l_Category_0.TransformSettings] = require(script.Transform), 
    [l_Category_0.UpgradeSettings] = require(script.Upgrade)
};
