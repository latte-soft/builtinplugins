local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local v5 = v1:new(v2.TerrainType.Crater);
v5.init = function(v6, v7, v8)
    v1.init(v6, v7, v8);
    return v6;
end;
v5.generateNoiseMap = function(v9)
    local v10 = v9._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v11 = v9._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v12 = v9._payload[l_Category_0.BuildSettings][l_BuildSettings_0.FillBottom];
    local v13 = v9._payload[l_Category_0.BuildSettings][l_BuildSettings_0.RimHeight];
    if v12 and v13 then
        local v14 = {
            center2d = Vector2.new(0.5, 0.5), 
            hillWidth = 0.2, 
            hillHeight = 1.7
        };
        v9._noiseMap = table.create(v9._rotatedSliceX * v9._rotatedSliceZ, 0);
        v9._fillBottomPositions = table.create(v9._sliceX * v9._sliceZ, false);
        for v15 = 1, v9._rotatedSliceX do
            local v16 = v15 - v9._rotatedXOffset;
            for v17 = 1, v9._rotatedSliceZ do
                v9._noiseMap[v9:getSliceIndex(v15, v17)] = v9:getGaussianHillHeight(v16, v17 - v9._rotatedZOffset, v14, nil);
            end;
        end;
        if v10 > 0 and v11 > 0 then
            v9:addErosion();
        end;
        local v18 = 1 - ((1 - v13) * 0.25 + 0.5);
        local v19 = 1 - v12;
        for v20 = 1, v9._sliceX do
            for v21 = 1, v9._sliceZ do
                local v22 = v9:getRotatedIndexWithOffset(v20, v21);
                local v23 = v9._noiseMap[v22];
                if v18 < v23 then
                    v9._noiseMap[v22] = v18 - (1 - (1 - math.clamp(if v19 > 0 then (v23 - v18) / v19 else 0, 0, 1)) ^ 4) * v19;
                    v9._fillBottomPositions[v9:getIndex(v20, v21)] = true;
                end;
            end;
        end;
        return ;
    else
        warn("Missing parameters");
        return ;
    end;
end;
v5.getHeightFromNoise = function(v24, v25, v26, v27)
    return (math.clamp(v24._sliceY * (v27 + math.clamp(v25, -1, v26)), 1, v24._sliceY));
end;
v5.generateHeightMap = function(v28)
    local v29 = v28._payload[l_Category_0.BuildSettings][l_BuildSettings_0.RimHeight] or 0;
    v28:createHeightMapWithNoise((1 + v29) * 0.25, (1 - v29) * 0.25 + 0.5);
end;
v5.blendHeightMap = function(v30)
    for v31 = 1, #v30._heightMap do
        local v32 = v30._heightMap[v31];
        local v33 = v30._heightmapCache[v31];
        if v32 < v33 then
            if not v30._fillBottomPositions[v31] then
                v32 = v33;
                v30._heightMap[v31] = v33;
                v30._blendingFactorMap[v31] = 1;
            else
                v33 = v32;
                v30._heightmapCache[v31] = v32;
                v30._blendingFactorMap[v31] = 0;
            end;
        end;
        if v30._addBlending then
            local v34 = v30._blendingFactorMap[v31];
            v30._heightMap[v31] = (1 - v34) * v32 + v34 * v33;
        end;
    end;
end;
return v5;
