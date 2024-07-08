local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Resources.Constants);
return function(v1, v2)
    local v3 = v1 / (v2 * v0.VoxelResolution);
    return (Vector3.new(math.round(v3.X), math.round(v3.Y), (math.round(v3.Z))) * v2) * v0.VoxelResolution;
end;
