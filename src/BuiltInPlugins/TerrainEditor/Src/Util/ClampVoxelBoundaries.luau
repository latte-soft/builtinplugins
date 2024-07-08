local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Resources.Constants);
return function(v1, v2, v3)
    local v4 = Vector3.new(v2, v3 * 0.5, v2);
    local v5 = v1 - v4;
    local v6 = v1 + v4;
    return Vector3.new(math.floor(v5.X / v0.VoxelResolution), math.floor(v5.Y / v0.VoxelResolution), (math.floor(v5.Z / v0.VoxelResolution))) * v0.VoxelResolution, Vector3.new(math.ceil(v6.X / v0.VoxelResolution), math.ceil(v6.Y / v0.VoxelResolution), (math.ceil(v6.Z / v0.VoxelResolution))) * v0.VoxelResolution;
end;
