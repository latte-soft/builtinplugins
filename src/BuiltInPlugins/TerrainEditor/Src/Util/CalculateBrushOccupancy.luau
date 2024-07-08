local l_VoxelResolution_0 = require(script:FindFirstAncestor("TerrainEditor").Src.Resources.Constants).VoxelResolution;
return function(v1, v2)
    return (math.clamp((v2 - v1) / l_VoxelResolution_0, 0, 1));
end;
