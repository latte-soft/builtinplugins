local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v8 = require(l_Generation_0.FractalNoise);
local v9 = require(l_Generation_0.Filter);
local v10 = v8(1, 1, 1);
local v11 = v1:new(l_TerrainType_0.Desert);
v11.init = function(v12, v13, v14)
    v1.init(v12, v13, v14);
    return v12;
end;
v11.generateNoiseMap = function(v15)
    local v16 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v17 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v18 = v15._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    v15._noiseMap = table.create(v15._rotatedSliceX * v15._rotatedSliceZ, 0);
    if v16 > 0 then
        local v19 = 50 / v16;
        for v20 = 1, v15._rotatedSliceX do
            for v21 = 1, v15._rotatedSliceZ do
                v15._noiseMap[v15:getSliceIndex(v20, v21)] = v9.Ridge(v10((v20 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v17.X, (v21 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v17.Y, v18, v19) * 0.5 + 0.5) / 2;
            end;
        end;
    end;
end;
v11.getHeightFromNoise = function(v22, v23, v24, v25)
    return (math.clamp(v25 + (v22._sliceY * v24) * v23, 1, v22._sliceY));
end;
v11.generateHeightMap = function(v26)
    local v27 = v26._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    v26:createHeightMapWithNoise(v27, v26._sliceY * (1 - v27));
end;
return v11;
