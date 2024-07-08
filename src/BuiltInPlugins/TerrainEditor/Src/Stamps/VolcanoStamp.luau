local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Generation.GetBlendingFactorMap);
local v7 = v1:new(l_TerrainType_0.Volcano);
v7.init = function(v8, v9, v10)
    v1.init(v8, v9, v10);
    return v8;
end;
v7.generateNoiseMap = function(v11)
    local v12 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v13 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v14 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CraterDepth];
    local v15 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.CraterRadius];
    if v14 and v15 then
        local v16 = {
            hillWidth = 0.2, 
            hillHeight = 1 + v15 * 0.5
        };
        v11._noiseMap = table.create(v11._rotatedSliceX * v11._rotatedSliceZ, 0);
        v11._fillBottomPositions = table.create(v11._sliceX * v11._sliceZ, false);
        for v17 = 1, v11._rotatedSliceX do
            local v18 = v17 - v11._rotatedXOffset;
            for v19 = 1, v11._rotatedSliceZ do
                v11._noiseMap[v11:getSliceIndex(v17, v19)] = v11:getGaussianHillHeight(v18, v19 - v11._rotatedZOffset, v16, nil);
            end;
        end;
        if v12 > 0 and v13 > 0 then
            v11:addErosion();
        end;
        if v15 <= 0 then
            return ;
        else
            local v20 = Vector3.new(0.5, 0, 0.5);
            local v21 = 0;
            for v22 = 1, v11._sliceX do
                for v23 = 1, v11._sliceZ do
                    if v11._noiseMap[v11:getRotatedIndexWithOffset(v22, v23)] > 1 then
                        local l_magnitude_0 = (Vector3.new(v22 / v11._sliceX, 0, v23 / v11._sliceZ) - v20).magnitude;
                        if v21 < l_magnitude_0 then
                            v21 = l_magnitude_0;
                        end;
                    end;
                end;
            end;
            for v25 = 1, v11._sliceX do
                for v26 = 1, v11._sliceZ do
                    local l_magnitude_1 = (Vector3.new(v25 / v11._sliceX, 0, v26 / v11._sliceZ) - v20).magnitude;
                    if l_magnitude_1 < v21 then
                        local v28 = 1 - ((1 - (1 - (v21 - l_magnitude_1) / v21) ^ 4) * v14) / 2;
                        local v29 = v11:getRotatedIndexWithOffset(v25, v26);
                        local v30 = v11._noiseMap[v29];
                        if not (v30 <= 1) or v28 < v30 then
                            v11._noiseMap[v29] = v28;
                            v11._fillBottomPositions[v11:getIndex(v25, v26)] = true;
                        else
                            v11._noiseMap[v29] = (v30 + v28) / 2;
                        end;
                    end;
                end;
            end;
            return ;
        end;
    else
        warn("Missing parameters");
        return ;
    end;
end;
v7.getHeightFromNoise = function(v31, v32)
    return (math.clamp(v31._sliceY * math.clamp(v32, -1, 1), 0, v31._sliceY));
end;
v7.generateHeightMap = function(v33)
    v33:createHeightMapWithNoise();
end;
v7.updateBlendingFactorMap = function(v34, v35)
    v34._blendingFactorMap = table.create(v34._sliceX * v34._sliceZ, 0);
    if v35 > 0 then
        v34._blendingFactorMap = v6(Vector2.new(v34._sliceX, v34._sliceZ), {
            CurveWidth = 1, 
            Distance = (1 - v35) * 0.9, 
            PreserveDistance = 0.5 - v35 / 5, 
            PreserveRatio = 0, 
            RoundCorner = 1
        });
    end;
end;
return v7;
