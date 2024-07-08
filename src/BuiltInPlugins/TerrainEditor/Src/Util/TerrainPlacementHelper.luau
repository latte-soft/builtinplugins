local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local v3 = {};
v3.Place = function(v4, v5, v6, v7)
    if not (v7 ~= v2.TerrainType.Volcano and v7 ~= v2.TerrainType.Mountain) or v7 == v2.TerrainType.Mesa then
        return v3.EmptyThreshold(v4, v5);
    elseif not (v7 ~= v2.TerrainType.Crater) or v7 == v2.TerrainType.Lake then
        return v3.OccupiedThreshold(v4, v5);
    else
        return v3.SurfaceThreshold(v4, v5, v6);
    end;
end;
v3.EmptyThreshold = function(v8, v9)
    local v10 = Region3.new((v8.Position - v9 / 2) - Vector3.new(0, v1.PlacementSnap * v1.VoxelResolution, 0), v8.Position + Vector3.new(v9.X, -v9.Y, v9.Z) / 2);
    local l_Terrain_0 = game:GetService("Workspace").Terrain;
    assert(l_Terrain_0, "Terrain should exist");
    local v12, v13 = l_Terrain_0:ReadVoxels(v10, 4);
    local v14 = #v12;
    local v15 = #v12[1];
    local v16 = #v12[1][1];
    for v17 = v15, 1, -1 do
        local v18 = false;
        for v19 = 1, v14 do
            for v20 = 1, v16 do
                if v13[v19][v17][v20] == 0 and v12[v19][v17][v20] == Enum.Material.Air then
                    v18 = true;
                end;
            end;
        end;
        if not v18 then
            return v8 + Vector3.new(0, v15 - v17, 0) * v1.VoxelResolution;
        end;
    end;
    return v8;
end;
v3.OccupiedThreshold = function(v21, v22)
    local v23 = Region3.new(v21.Position + Vector3.new(-v22.X, v22.Y, -v22.Z) / 2, (v21.Position + v22 / 2) + Vector3.new(0, v1.PlacementSnap * v1.VoxelResolution, 0));
    local l_Terrain_1 = game:GetService("Workspace").Terrain;
    assert(l_Terrain_1, "Terrain should exist");
    local v25, v26 = l_Terrain_1:ReadVoxels(v23, 4);
    local v27 = #v25;
    local v28 = #v25[1];
    local v29 = #v25[1][1];
    for v30 = 1, v28 do
        local v31 = false;
        for v32 = 1, v27 do
            for v33 = 1, v29 do
                if v26[v32][v30][v33] ~= 0 and v25[v32][v30][v33] ~= Enum.Material.Air then
                    v31 = true;
                end;
            end;
        end;
        if not v31 then
            return v21 + Vector3.new(0, v30 - 1, 0) * v1.VoxelResolution;
        end;
    end;
    return v21;
end;
v3.SurfaceThreshold = function(v34, v35, v36)
    return v34 + Vector3.new(0, -(v35.Y / 2) + math.floor(((v35.Y * v36) * 0.5) / v1.VoxelResolution) * v1.VoxelResolution, 0);
end;
return v3;
