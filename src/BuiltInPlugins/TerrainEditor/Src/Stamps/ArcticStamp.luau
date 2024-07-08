local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local v7 = require(l_script_FirstAncestor_0.Src.Util.Generation.FractalNoise)(4, 3, 0.35);
local v8 = v1:new(l_TerrainType_0.Arctic);
v8.init = function(v9, v10, v11)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.generateNoiseMap = function(v12)
    local v13 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v14 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v15 = v12._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    v12._noiseMap = table.create(v12._rotatedSliceX * v12._rotatedSliceZ, 0);
    if v13 > 0 then
        local v16 = 50 / v13;
        for v17 = 1, v12._rotatedSliceX do
            for v18 = 1, v12._rotatedSliceZ do
                local v19 = v12:getSliceIndex(v17, v18);
                local v20 = v7((v17 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v14.X, (v18 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v14.Y, v15, v16);
                v12._noiseMap[v19] = v20 * v20;
            end;
        end;
    end;
end;
v8.getHeightFromNoise = function(v21, v22, v23, v24)
    return (math.clamp(v24 + (v21._sliceY * v23) * v22, 1, v21._sliceY));
end;
v8.generateHeightMap = function(v25)
    local v26 = v25._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    v25:createHeightMapWithNoise(v26, v25._sliceY * (1 - v26));
end;
return v8;
