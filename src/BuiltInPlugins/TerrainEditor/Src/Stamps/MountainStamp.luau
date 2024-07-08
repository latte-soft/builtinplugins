local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.MountainBaseStamp);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_TerrainType_0 = v2.TerrainType;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Generation.GetBlendingFactorMap);
local v7 = v1:new(l_TerrainType_0.Mountain);
v7.init = function(v8, v9, v10)
    v1.init(v8, v9, v10);
    return v8;
end;
v7.generateNoiseMap = function(v11)
    local v12 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v13 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v14 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
    local v15 = v11._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed];
    local v16 = {
        hillWidth = 0.2, 
        hillHeight = 0.85
    };
    local v17 = {
        frequency = v12 / 5, 
        amplitude = (v13 * 0.16) * 2, 
        offset = v14, 
        seed = v15
    };
    local v18 = v12 > 0 and v13 > 0;
    local v19 = if not v18 then nil else table.create(v11._rotatedSliceX * v11._rotatedSliceZ, 0);
    v11._noiseMap = table.create(v11._rotatedSliceX * v11._rotatedSliceZ, 0);
    for v20 = 1, v11._rotatedSliceX do
        local v21 = v20 - v11._rotatedXOffset;
        for v22 = 1, v11._rotatedSliceZ do
            local v23 = v22 - v11._rotatedZOffset;
            local v24 = v11:getGaussianHillHeight(v21, v23, v16, nil);
            local v25 = v11:getSliceIndex(v20, v22);
            v11._noiseMap[v25] = v24;
            if v18 then
                v19[v25] = v11:getGaussianHillHeight(v21, v23, v16, v17) - v24;
            end;
        end;
    end;
    if v18 then
        v11:addErosion();
        for v26 = 1, #v11._noiseMap do
            local l__noiseMap_0 = v11._noiseMap;
            l__noiseMap_0[v26] = l__noiseMap_0[v26] + v19[v26];
        end;
        return ;
    else
        return ;
    end;
end;
v7.getHeightFromNoise = function(v28, v29)
    return (math.clamp(v28._sliceY * math.clamp(v29, -1, 1), 0, v28._sliceY));
end;
v7.generateHeightMap = function(v30)
    v30:createHeightMapWithNoise();
end;
v7.updateBlendingFactorMap = function(v31, v32)
    v31._blendingFactorMap = table.create(v31._sliceX * v31._sliceZ, 0);
    if v32 > 0 then
        v31._blendingFactorMap = v6(Vector2.new(v31._sliceX, v31._sliceZ), {
            CurveWidth = 1, 
            Distance = (1 - v32) * 0.9, 
            PreserveDistance = 0.5 - v32 / 5, 
            PreserveRatio = 0, 
            RoundCorner = 1
        });
    end;
end;
return v7;
