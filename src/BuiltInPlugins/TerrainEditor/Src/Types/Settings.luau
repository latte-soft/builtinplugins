local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types.Generation);
local _ = require(l_script_FirstAncestor_0.Src.Types.PublicEnums);
local _ = require(l_script_FirstAncestor_0.Src.Types.PrivateEnums);
local _ = require(l_script_FirstAncestor_0.Src.Types.Tools);
local v5 = {};
local v6 = {};
v5.Category = v6;
v5.BiomeSettings = {
    Biomes = "Biomes", 
    BiomeBlending = "BiomeBlending", 
    BiomeSize = "BiomeSize", 
    Caves = "Caves", 
    Seed = "Seed", 
    Generate = "Generate"
};
v6.BiomeSettings = "BiomeSettings";
v5.BrushSettings = {
    BrushMode = "BrushMode", 
    BrushSize = "BrushSize", 
    BrushShape = "BrushShape", 
    FixedYPlane = "FixedYPlane", 
    FixedYPlanePosition = "FixedYPlanePosition", 
    FlattenMode = "FlattenMode", 
    FlattenPlane = "FlattenPlane", 
    IgnoreParts = "IgnoreParts", 
    IgnoreWater = "IgnoreWater", 
    ManualPlaneLock = "ManualPlaneLock", 
    PivotPosition = "PivotPosition", 
    PlaneLock = "PlaneLock", 
    PlanePosition = "PlanePosition", 
    PlaneRotation = "PlaneRotation", 
    PlaneTransform = "PlaneTransform", 
    PullTerrain = "PullTerrain", 
    Snapping = "Snapping", 
    State = "State", 
    Strength = "Strength", 
    TemporarySmooth = "TemporarySmooth", 
    WaterAutofill = "WaterAutofill"
};
v6.BrushSettings = "BrushSettings";
v5.ElevationSettings = {
    Unit = "Unit", 
    Elevation = "Elevation", 
    Material = "Material", 
    Slope = "Slope", 
    FillMaterial = "FillMaterial"
};
v6.ElevationSettings = "ElevationSettings";
v5.AdditionalSettings = {
    FallbackMaterial = "FallbackMaterial"
};
v6.AdditionalSettings = "AdditionalSettings";
v5.BuildSettings = {
    AdvancedNoise = "AdvancedNoise", 
    BankSize = "BankSize", 
    BlendingEdge = "BlendingEdge", 
    CliffSlope = "CliffSlope", 
    Confirm = "Confirm", 
    CraterDepth = "CraterDepth", 
    CraterRadius = "CraterRadius", 
    FillBottom = "FillBottom", 
    Material = "Material", 
    MaterialLUT = "MaterialLUT", 
    NoiseScale = "NoiseScale", 
    NoiseStrength = "NoiseStrength", 
    Offset = "Offset", 
    OperationSource = "OperationSource", 
    PlacementMode = "PlacementMode", 
    Position = "Position", 
    RimHeight = "RimHeight", 
    Rotation = "Rotation", 
    Seed = "Seed", 
    Size = "Size", 
    SnapToVoxels = "SnapToVoxels", 
    TerrainType = "TerrainType", 
    TopRadius = "TopRadius", 
    Transform = "Transform", 
    WaterLevel = "WaterLevel"
};
v6.BuildSettings = "BuildSettings";
v5.ClearSettings = {
    Clear = "Clear"
};
v6.ClearSettings = "ClearSettings";
v5.HeightmapSettings = {
    Heightmap = "Heightmap", 
    Colormap = "Colormap", 
    DefaultMaterial = "DefaultMaterial", 
    Import = "Import"
};
v6.HeightmapSettings = "HeightmapSettings";
v5.MaterialSettings = {
    Apply = "Apply", 
    AutoMaterial = "AutoMaterial", 
    FillMode = "FillMode", 
    MaterialMode = "MaterialMode", 
    SourceMaterial = "SourceMaterial", 
    TargetMaterial = "TargetMaterial"
};
v6.MaterialSettings = "MaterialSettings";
v5.SeaLevelSettings = {
    Create = "Create", 
    Evaporate = "Evaporate", 
    OperationSource = "OperationSource", 
    Position = "Position", 
    Size = "Size", 
    SnapToVoxels = "SnapToVoxels", 
    Transform = "Transform"
};
v6.SeaLevelSettings = "SeaLevelSettings";
v5.SelectionSettings = {
    OperationSource = "OperationSource", 
    Position = "Position", 
    Rotation = "Rotation", 
    Size = "Size", 
    SnapToVoxels = "SnapToVoxels", 
    Transform = "Transform", 
    TransformMode = "TransformMode"
};
v6.SelectionSettings = "SelectionSettings";
v5.TransformSettings = {
    Apply = "Apply", 
    ForcePreview = "ForcePreview", 
    LiveEdit = "LiveEdit", 
    MergeEmpty = "MergeEmpty", 
    OperationSource = "OperationSource", 
    Position = "Position", 
    Rotation = "Rotation", 
    Size = "Size", 
    SnapToVoxels = "SnapToVoxels", 
    TerrainRegion = "TerrainRegion", 
    TerrainRegionSize = "TerrainRegionSize", 
    TerrainRegionTransform = "TerrainRegionTransform", 
    TerrainRegionBuffer = "TerrainRegionBuffer", 
    TerrainRegionBufferSize = "TerrainRegionBufferSize", 
    TerrainRegionBufferTransform = "TerrainRegionBufferTransform", 
    Transform = "Transform", 
    TransformMode = "TransformMode"
};
v6.TransformSettings = "TransformSettings";
v5.UpgradeSettings = {
    Shorelines = "Shorelines"
};
v6.UpgradeSettings = "UpgradeSettings";
v5.Gizmo = {
    Brush = "Brush", 
    Note = "Note", 
    Placement = "Placement", 
    Plane = "Plane", 
    Region = "Region"
};
v5.Note = {
    Transform = "Transform"
};
v5.Storage = {
    Global = "Global", 
    LocalPersistent = "LocalPersistent", 
    LocalSession = "LocalSession"
};
return v5;
