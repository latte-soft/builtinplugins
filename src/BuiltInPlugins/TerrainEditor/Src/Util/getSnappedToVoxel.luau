local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Resources.Constants);
return function(v1)
    local v2 = v1 / v0.VoxelResolution;
    return Vector3.new(math.round(v2.X), math.round(v2.Y), (math.round(v2.Z))) * v0.VoxelResolution;
end;
