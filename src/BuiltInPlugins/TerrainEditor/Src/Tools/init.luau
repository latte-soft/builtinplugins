return {
    if not require(script:FindFirstAncestor("TerrainEditor").Src.Flags.getFFlagTerrainEditorGenerationFeature)() then nil else require(script.RegionBuild), 
    require(script.RegionImport), 
    require(script.RegionGenerate), 
    require(script.Clear), 
    require(script.RegionSelect), 
    require(script.RegionTransform), 
    require(script.RegionFill), 
    require(script.RegionSeaLevel), 
    require(script.BrushDraw), 
    require(script.BrushSculpt), 
    require(script.BrushSmooth), 
    require(script.BrushPaint), 
    require(script.BrushFlatten), 
    require(script.Empty)
};
