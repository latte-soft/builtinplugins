local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Flags.getFFlagTerrainEditorGenerationFeature);
return {
    BrushSize = require(script.BrushSize), 
    Button = require(script.Button), 
    ConfirmGeneration = if not v0() then nil else require(script.ConfirmGeneration), 
    DelayedSlider = if not v0() then nil else require(script.DelayedSlider), 
    Label = require(script.Label), 
    Image = require(script.Image), 
    Material = require(script.Material), 
    MaterialRanges = if not v0() then nil else require(script.MaterialRanges), 
    MultiSelection = require(script.MultiSelection), 
    PlaneLock = require(script.PlaneLock), 
    TerrainType = require(script.TerrainType), 
    Upgrade = require(script.Upgrade)
};
