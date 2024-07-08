local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local v7 = Vector2.new(0.5, 0.5);
local v8 = v1:new(l_TerrainType_0.None);
v8.init = function(v9, v10, v11)
    v1.init(v9, v10, v11);
    return v9;
end;
v8.getGaussianHillHeight = function(v12, v13, v14, v15, v16)
    local v17 = v15.centerPosPercent or v7;
    local l_hillHeight_0 = v15.hillHeight;
    local l_hillWidth_0 = v15.hillWidth;
    local l_magnitude_0 = (Vector2.new(v13 / v12._sliceX, v14 / v12._sliceZ) - v17).magnitude;
    local v21 = 0;
    if v16 then
        local l_frequency_0 = v16.frequency;
        local l_amplitude_0 = v16.amplitude;
        local l_offset_0 = v16.offset;
        v21 = l_amplitude_0 * math.noise(l_frequency_0 * (v13 + l_offset_0.X), l_frequency_0 * (v14 + l_offset_0.Y), v16.seed or 12345);
    end;
    local v25 = l_magnitude_0 + v21;
    return l_hillHeight_0 * math.exp(-(v25 * v25) / ((2 * l_hillWidth_0) * l_hillWidth_0));
end;
v8.getHeightGradient = function(v26, v27, v28, v29)
    return (v29[v26:getSliceIndex(v27, v28)] - v29[v26:getSliceIndex(math.clamp(v27 - 1, 1, v26._rotatedSliceX), v28)]) / l_VoxelResolution_0, (v29[v26:getSliceIndex(v27, v28)] - v29[v26:getSliceIndex(v27, (math.clamp(v28 - 1, 1, v26._rotatedSliceZ)))]) / l_VoxelResolution_0;
end;
v8.addErosion = function(v30)
    local v31 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v32 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v33 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v34 = v30._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    local v35 = {
        0.003, 
        0.008, 
        0.016, 
        0.04
    };
    local v36 = {
        0.1, 
        0.05, 
        0.02, 
        0.0125
    };
    local v37 = v31 * 10;
    local l_Noise_0 = Instance.new("Noise");
    l_Noise_0.NoiseType = Enum.NoiseType.SimplexGabor;
    l_Noise_0.Seed = v34;
    local v39 = table.create(#v30._noiseMap, 0);
    for v40 = 1, 4 do
        for v41 = 1, #v39 do
            v39[v41] = v30._noiseMap[v41];
        end;
        for v42 = 1, v30._rotatedSliceX do
            for v43 = 1, v30._rotatedSliceZ do
                local v44 = (Vector3.new((v42 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v33.X, v34, (v43 * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + v33.Y) * v35[v40]) * v37;
                local v45, v46 = v30:getHeightGradient(v42, v43, v39);
                local v47 = l_Noise_0:SampleDirectional(v44, Vector3.new(-v46, 0, v45) * 2000) * (v36[v40] * v32);
                local v48 = v30:getSliceIndex(v42, v43);
                local l__noiseMap_0 = v30._noiseMap;
                l__noiseMap_0[v48] = l__noiseMap_0[v48] + v47;
            end;
        end;
    end;
end;
return v8;
