local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.BiomeGenerators);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Generation.FindBiomeTransitionValue);
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v4 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.NoisySeed);
local _ = require(l_Generation_0.Perlin);
local v7 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v9, v10, v11)
    local v12 = v1(v9, v10, v11);
    return function(v13, v14, v15)
        local l_Y_0 = v13.Y;
        local l_X_0 = v14.X;
        local l_Y_1 = v14.Y;
        local l_Z_0 = v14.Z;
        local l_Biomes_0 = v11.Biomes;
        local l_DefaultBiomeFill_0 = v11.DefaultBiomeFill;
        local l_DefaultBiomeSurface_0 = v11.DefaultBiomeSurface;
        local l_DefaultBiomeValue_0 = v11.DefaultBiomeValue;
        local l_HasCaves_0 = v11.HasCaves;
        local l_MapHeight_0 = v11.MapHeight;
        local l_SurfaceThickness_0 = v11.SurfaceThickness;
        local l_WaterLevel_0 = v11.WaterLevel;
        local v28 = Vector3.new(l_X_0, l_Y_0, l_Z_0);
        local v29 = 1 - (l_Y_0 - 1) / (l_Y_1 - 1);
        local v30 = v29 * 0.9 + 0.1 * v7(v9(v28, 107, 15));
        local v31 = 0;
        local l_CrackedLava_0 = Enum.Material.CrackedLava;
        local l_Rock_0 = Enum.Material.Rock;
        if not (v29 <= 0.65) or v29 < 0.1 then
            v31 = 0.5;
        elseif #l_Biomes_0 == 1 then
            local v34 = v12[l_Biomes_0[1]];
            if not v34 then
                v31 = l_DefaultBiomeValue_0;
                l_CrackedLava_0 = l_DefaultBiomeSurface_0;
                l_Rock_0 = l_DefaultBiomeFill_0;
            else
                local v35, v36, v37 = v34(v28, v30);
                v31 = v35;
                l_CrackedLava_0 = v36;
                l_Rock_0 = v37;
            end;
        else
            local v38 = 0;
            for v39, v40 in v15.WeightPoints, nil, nil do
                local v41 = v12[v39];
                if not v41 then
                    v40.BiomeValue = l_DefaultBiomeValue_0;
                    v40.BiomeSurface = l_DefaultBiomeSurface_0;
                    v40.BiomeFill = l_DefaultBiomeFill_0;
                else
                    local v42, v43, v44 = v41(v28, v30);
                    v40.BiomeValue = v42;
                    v40.BiomeSurface = v43;
                    v40.BiomeFill = v44;
                end;
                v38 = v38 + v40.BiomeValue * v40.Weight;
            end;
            for v45, v46 in v15.WeightPoints, nil, nil do
                local v47 = v2(v45, v46.Weight, v46.BiomeValue, v38);
                if v31 < v47 then
                    v31 = v47;
                    l_CrackedLava_0 = v46.BiomeSurface;
                    l_Rock_0 = v46.BiomeFill;
                end;
            end;
        end;
        local v48 = v29 * 0.5 + v31 * 0.5;
        local v49 = false;
        if 0.5 - l_SurfaceThickness_0 < v48 then
            v49 = v48 < 0.5 + l_SurfaceThickness_0;
        end;
        local v50 = 0;
        local v51 = v15.HasCaves or v29 > 0.65;
        local v52 = not (v49 and 1 - v29 < l_WaterLevel_0 + 0.005);
        local v53 = not (v49 and l_WaterLevel_0 + 0.58 < 1 - v29);
        if not (((not l_HasCaves_0 or not v51) or not v52) or not v53) then
            v50 = math.clamp((v4.Threshold(v4.Ridge(v7(v9(v28, 4, 30))), 0.84, 0.01) * v4.Threshold(v4.Ridge(v7(v9(v28, 5, 30))), 0.84, 0.01)) * v4.Threshold(v4.Ridge(v7(v9(v28, 6, 30))), 0.84, 0.01) - if v49 then v4.Threshold(v7(v9(v28 * Vector3.new(1, 0, 1), 143, 62)), 0.35, 0) else 0, 0, 1);
        end;
        local v54 = v4.Threshold(v48 - v50, 0.5, l_MapHeight_0);
        local v55 = 1 - v29 < l_WaterLevel_0;
        local v56 = v48 <= 0.5;
        local v57 = v54 <= 0;
        if not ((not v55 or not v56) or not v57) then
            v54 = 1;
            l_CrackedLava_0 = Enum.Material.Water;
            l_Rock_0 = Enum.Material.Water;
            v49 = true;
        end;
        local v58 = l_Y_0 == 1 and 1 or v54;
        local v59 = if l_Y_0 == 1 then Enum.Material.CrackedLava else if v54 <= 0 then Enum.Material.Air else if v49 then l_CrackedLava_0 else l_Rock_0;
        local l_v49_0 = v49;
        if l_v49_0 then
            l_v49_0 = true;
            if v58 > 0 then
                l_v49_0 = v59 == Enum.Material.Air;
            end;
        end;
        return v59, v58, l_v49_0;
    end;
end;
