local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseStamp);
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v3.BuildSettings;
local l_Category_0 = v3.Category;
local l_TerrainType_0 = v3.TerrainType;
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainGenerationFixLakeNoiseRatio);
local v8 = if not v7() then {
    BOTTOM_AMPLITUDE = 0.5, 
    BOTTOM_FREQUENCY = 50, 
    SHAPE_AMPLITUDE = 0.3, 
    SHAPE_FREQUENCY = 10, 
    SIDE_AMPLITUDE = 0.1, 
    SIDE_FREQUENCY = 100
} else {
    BOTTOM_AMPLITUDE = 0.5, 
    BOTTOM_FREQUENCY = 0.125, 
    SHAPE_AMPLITUDE = 0.15, 
    SHAPE_FREQUENCY = 0.025, 
    SIDE_AMPLITUDE = 0.1, 
    SIDE_FREQUENCY = 0.25
};
local v9 = Vector2.new(0.5, 0.5);
local v10 = v1:new(l_TerrainType_0.Lake);
v10.init = function(v11, v12, v13)
    v1.init(v11, v12, v13);
    return v11;
end;
v10.getLakeHeight = function(v14, v15, v16, v17)
    local l_width_0 = v16.width;
    local l_bankSize_0 = v16.bankSize;
    local l_slope_0 = v16.slope;
    local l_regionSize_0 = v16.regionSize;
    local l_amplitude_0 = v17.amplitude;
    local l_frequency_0 = v17.frequency;
    local l_offset_0 = v17.offset;
    local v25 = v17.seed or 12345;
    local v26 = v25 * 1.5 + 17;
    local v27 = Vector2.new(v15.X / v14._sliceX, v15.Y / v14._sliceZ);
    local v28 = if not v7() then v27 + l_offset_0 else Vector2.new(v15.X * l_VoxelResolution_0 + l_VoxelResolution_0 / 2, v15.Y * l_VoxelResolution_0 + l_VoxelResolution_0 / 2) + l_offset_0;
    local l_magnitude_0 = (v27 - v9).magnitude;
    l_width_0 = math.min(l_width_0, 0.45);
    local v30 = l_magnitude_0 + (math.clamp(math.noise((l_frequency_0 * v8.SHAPE_FREQUENCY) * v28.X, (l_frequency_0 * v8.SHAPE_FREQUENCY) * v28.Y, v25), -1, 1) * l_amplitude_0) * v8.SHAPE_AMPLITUDE;
    if v30 > 0.5 then
        return 0;
    else
        local v31 = math.tan((l_slope_0 * 3.141592653589793) / 180) * (math.min(l_regionSize_0.X, l_regionSize_0.Z) / l_regionSize_0.Y);
        local v32 = -v31 * (v30 - l_width_0);
        local v33 = (l_bankSize_0 * v31) * l_width_0;
        if v33 < v32 then
            v32 = (-v31 * 4) * (v30 - (-(v33 / v31) + l_width_0)) + v33;
            if v32 > 1 then
                return 1 - (math.noise((l_frequency_0 * v8.BOTTOM_FREQUENCY) * v28.X, (l_frequency_0 * v8.BOTTOM_FREQUENCY) * v28.Y, v26) * l_amplitude_0) * v8.BOTTOM_AMPLITUDE;
            else
                v32 = v32 + (math.noise((l_frequency_0 * v8.SIDE_FREQUENCY) * v28.X, (l_frequency_0 * v8.SIDE_FREQUENCY) * v28.Y, v26) * l_amplitude_0) * v8.SIDE_AMPLITUDE;
            end;
        end;
        return v32;
    end;
end;
v10.generateNoiseMap = function(v34)
    local v35 = v34._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v36 = v34._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v37 = v34._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v38 = v34._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    local v39 = v34._payload[l_Category_0.BuildSettings][l_BuildSettings_0.BankSize];
    if v39 then
        v34._noiseMap = table.create(v34._rotatedSliceX * v34._rotatedSliceZ, 0);
        for v40 = 1, v34._sliceX do
            for v41 = 1, v34._sliceZ do
                local v42 = v34:getRotatedIndexWithOffset(v40, v41);
                if not ((v40 ~= 1 and v40 ~= v34._sliceX) and v41 ~= 1) or v41 == v34._sliceZ then
                    v34._noiseMap[v42] = 0;
                else
                    v34._noiseMap[v42] = v34:getLakeHeight(Vector2.new(v40, v41), {
                        bankSize = v39, 
                        regionSize = v34._region.Size, 
                        slope = 22, 
                        width = 0.45
                    }, {
                        frequency = v35, 
                        amplitude = v36, 
                        offset = v37, 
                        seed = v38
                    });
                end;
            end;
        end;
        return ;
    else
        warn("BankSize not provided");
        return ;
    end;
end;
v10.getHeightFromNoise = function(v43, v44)
    return (math.clamp(v43._sliceY * (1 - math.clamp(v44, -1, 1)), 1, v43._sliceY));
end;
v10.generateHeightMap = function(v45)
    v45:createHeightMapWithNoise();
end;
v10.blendHeightMap = function(v46)
    for v47 = 1, #v46._heightMap do
        local v48 = v46._heightMap[v47];
        local v49 = v46._heightmapCache[v47];
        if v48 < v49 then
            v49 = v48;
            v46._heightmapCache[v47] = v48;
            v46._blendingFactorMap[v47] = 0;
        end;
        if v46._addBlending then
            local v50 = v46._blendingFactorMap[v47];
            v46._heightMap[v47] = (1 - v50) * v48 + v50 * v49;
        end;
    end;
end;
v10.postProcessing = function(v51)
    local v52 = v51._payload[l_Category_0.BuildSettings][l_BuildSettings_0.WaterLevel];
    if v52 and v52 > 0 then
        for v53 = 1, v51._sliceY do
            if v53 / v51._sliceY < v52 then
                for v54 = 1, v51._sliceX do
                    for v55 = 1, v51._sliceZ do
                        local v56 = v51:getIndex(v54, v55);
                        local v57 = true;
                        if v51._materialMap[v54][v53][v55] ~= Enum.Material.Air then
                            v57 = v51._occupancyMap[v54][v53][v55] == 0;
                        end;
                        if not (not (v51._blendingFactorMap[v56] <= 0) or not v57) then
                            v51._materialMap[v54][v53][v55] = Enum.Material.Water;
                            v51._occupancyMap[v54][v53][v55] = 1;
                        end;
                    end;
                end;
            else
                break;
            end;
        end;
    end;
end;
return v10;
