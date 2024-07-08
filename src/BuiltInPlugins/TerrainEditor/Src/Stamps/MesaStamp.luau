local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Generation.GetBlendingFactorMap);
local v7 = v1:new(l_TerrainType_0.Mesa);
v7.init = function(v8, v9, v10)
    v1.init(v8, v9, v10);
    return v8;
end;
v7.generateNoiseMap = function(v11)
    local v12 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v13 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v14 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v15 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    local v16 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CliffSlope];
    local v17 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.TopRadius];
    local v18 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.RimHeight];
    v11._noiseMap = table.create(v11._sliceX * v11._sliceZ, 0);
    if v17 and v18 then
        local v19 = {
            center2d = Vector2.new(0.5, 0.5), 
            hillWidth = 0.2, 
            hillHeight = 1 + v17 * 1.2
        };
        local v20 = {
            frequency = v12 / 5, 
            amplitude = (v13 * 0.16) * 3, 
            offset = v14, 
            seed = v15
        };
        local v21 = v12 > 0 and v13 > 0;
        local v22 = if not v21 then nil else table.create(v11._rotatedSliceX * v11._rotatedSliceZ, 0);
        v11._noiseMap = table.create(v11._rotatedSliceX * v11._rotatedSliceZ, 0);
        for v23 = 1, v11._rotatedSliceX do
            local v24 = v23 - v11._rotatedXOffset;
            for v25 = 1, v11._rotatedSliceZ do
                local v26 = v25 - v11._rotatedZOffset;
                local v27 = v11:getGaussianHillHeight(v24, v26, v19, nil);
                local v28 = v11:getSliceIndex(v23, v25);
                v11._noiseMap[v28] = v27;
                if v21 then
                    v22[v28] = v11:getGaussianHillHeight(v24, v26, v19, v20) - v27;
                end;
            end;
        end;
        if v21 then
            v11:addErosion();
            for v29 = 1, #v11._noiseMap do
                local l__noiseMap_0 = v11._noiseMap;
                l__noiseMap_0[v29] = l__noiseMap_0[v29] + v22[v29] * v11._noiseMap[v29];
            end;
        end;
        local v31 = false;
        if v17 > 0 then
            v31 = v18 > 0;
        end;
        if v31 then
            for v32 = 1, v11._rotatedSliceX do
                for v33 = 1, v11._rotatedSliceZ do
                    local v34 = v11:getSliceIndex(v32, v33);
                    if v11._noiseMap[v34] < 1 then
                        if v16 == 90 then
                            local l__noiseMap_1 = v11._noiseMap;
                            l__noiseMap_1[v34] = l__noiseMap_1[v34] - v18 * v11._noiseMap[v34];
                        elseif v16 == 0 then
                            v11._noiseMap[v34] = 1;
                        else
                            local v36 = 1 - v18;
                            local v37 = math.tan((v16 * 3.141592653589793) / 180);
                            local v38 = v37 * (v11._noiseMap[v34] - 1) + 1;
                            if v36 <= v38 then
                                v11._noiseMap[v34] = v38;
                            else
                                v11._noiseMap[v34] = (v36 / ((v36 - 1) / v37 + 1)) * v11._noiseMap[v34];
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return ;
    else
        warn("Missing parameters");
        return ;
    end;
end;
v7.getHeightFromNoise = function(v39, v40)
    return (math.clamp(v39._sliceY * math.clamp(v40, -1, 1), 0, v39._sliceY));
end;
v7.generateHeightMap = function(v41)
    v41:createHeightMapWithNoise();
end;
v7.updateBlendingFactorMap = function(v42, v43)
    v42._blendingFactorMap = table.create(v42._sliceX * v42._sliceZ, 0);
    if v43 > 0 then
        v42._blendingFactorMap = v6(Vector2.new(v42._sliceX, v42._sliceZ), {
            CurveWidth = 1, 
            Distance = (1 - v43) * 0.9, 
            PreserveDistance = 0.5 - v43 / 5, 
            PreserveRatio = 0, 
            RoundCorner = 1
        });
    end;
end;
return v7;
