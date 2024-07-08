local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_Gizmo_0 = v2.Gizmo;
return (v1:new(v2.TerrainType.Desert, v2.Tab.None, {
    {
        Defaults = {
            [l_BuildSettings_0.AdvancedNoise] = {
                Children = {
                    [l_BuildSettings_0.Offset] = Vector2.new(0, 0), 
                    [l_BuildSettings_0.Rotation] = 0, 
                    [l_BuildSettings_0.Seed] = 0.123
                }
            }, 
            [l_BuildSettings_0.NoiseStrength] = 0.5, 
            [l_BuildSettings_0.BlendingEdge] = 0, 
            [l_BuildSettings_0.NoiseScale] = 0.7, 
            [l_BuildSettings_0.Material] = {
                FallbackMaterial = Enum.Material.Sand, 
                Unit = v2.MaterialUnit.Percentage, 
                Min = 0, 
                Max = 1, 
                MaterialIndex = 1, 
                MaterialList = {
                    {
                        Material = Enum.Material.Sand, 
                        MinHeight = 0, 
                        MaxHeight = 1, 
                        MinSlope = 0, 
                        MaxSlope = 90, 
                        Priority = 0
                    }
                }
            }, 
            [l_BuildSettings_0.PlacementMode] = true, 
            [l_BuildSettings_0.Size] = Vector3.new(512, 64, 512), 
            [l_BuildSettings_0.SnapToVoxels] = true, 
            [l_BuildSettings_0.Transform] = CFrame.new()
        }, 
        Id = l_Category_0.BuildSettings
    }
}, {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }, 
    {
        Id = l_Gizmo_0.Placement, 
        Schema = {
            Type = l_Gizmo_0.Placement
        }
    }
}));
