local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.ComputeMasterSeed);
local v3 = require(l_Generation_0.NoisySeed);
local v4 = require(l_Generation_0.Perlin);
local v5 = require(l_Generation_0.ProcessVoxel);
local v6 = require(l_Generation_0.ProcessPerlin);
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v7.VoxelResolution;
local l_RegionNormalization_0 = v7.RegionNormalization;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.AnalyticsHelper);
local v12 = require(l_Util_0.Operations.BaseOperation);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_Biome_0 = v13.Biome;
local l_BiomeSettings_0 = v13.BiomeSettings;
local l_Category_0 = v13.Category;
local l_SelectionSettings_0 = v13.SelectionSettings;
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorIndexingBugFix);
return function(v21, v22, v23)
    local v24 = 0;
    local v25 = 0;
    return v12.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v22, 
        Name = v21, 
        OnFinish = function(v26, v27)
            if v18() then
                local v28 = v26.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
                if (l_RegionNormalization_0 <= v28.X and l_RegionNormalization_0 <= v28.Y) and l_RegionNormalization_0 <= v28.Z then
                    v27:addTimeStatistic(v11.NormalizeRegionTimer(v26.State.StartTime, v28));
                end;
            end;
            v23.ChangeHistoryService:SetWaypoint("GenerateAction");
        end, 
        OnStart = function(v29, _)
            local v31 = v2((tostring(v29.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Seed])));
            local v32 = v4(v31);
            local v33 = v3(v31);
            local l_Position_0 = v29.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform].Position;
            local v35 = v29.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            local v36 = v35 / 2;
            local v37 = Region3.new(l_Position_0 - v36, l_Position_0 + v36):ExpandToGrid(l_VoxelResolution_0);
            l_Position_0 = v37.CFrame.Position;
            local v38 = v37.Size / l_VoxelResolution_0;
            local v39 = v38 / 2;
            local v40 = l_Position_0 / l_VoxelResolution_0;
            local v41 = Region3.new((-v39 + Vector3.new(-1, 0, 0)) * l_VoxelResolution_0 + l_Position_0, (v39 * Vector3.new(-1, 1, 1)) * l_VoxelResolution_0 + l_Position_0):ExpandToGrid(l_VoxelResolution_0);
            local v42 = v41.Size.Y / l_VoxelResolution_0;
            local v43 = v41.Size.Z / l_VoxelResolution_0;
            local v44 = if not v19() then nil else math.floor(65536 / v42);
            local v45 = {
                table.create(v42)
            };
            local v46 = {
                table.create(v42)
            };
            if not v20() then
                for v47 = 1, v42 do
                    v45[1][v47] = table.create(if not v19() then v43 else v44, 0);
                    v46[1][v47] = table.create(if not v19() then v43 else v44, Enum.Material.Air);
                end;
            else
                for v48 = 1, v42 do
                    local v49 = if v43 < v44 then v43 else v44;
                    v45[1][v48] = table.create(v49, 0);
                    v46[1][v48] = table.create(v49, Enum.Material.Air);
                end;
            end;
            local v50 = table.create(9);
            for v51 = 1, 9 do
                v50[v51] = {
                    DistSquared = 0, 
                    BiomeNoise = 0
                };
            end;
            local v52 = v29.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.BiomeBlending];
            local v53 = {};
            for v54, v55 in v29.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Biomes], nil, nil do
                if v55 then
                    table.insert(v53, v54);
                end;
            end;
            v29.State = {
                Biomes = v53, 
                BiomePoints = v50, 
                BiomeBlending = v52, 
                BiomeBlendingInverse = 1 - v52, 
                BiomeSize = v29.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.BiomeSize], 
                GetPerlin = v32, 
                GetNoise = v33, 
                MaterialMap = v46, 
                MaxWidth = v44, 
                OccupancyMap = v45, 
                Position = l_Position_0, 
                PreviousColumnHeights = {}, 
                ProcessVoxel = v5(v32, v33, {
                    Biomes = v53, 
                    DefaultBiomeFill = Enum.Material.Rock, 
                    DefaultBiomeSurface = Enum.Material.Grass, 
                    DefaultBiomeValue = 0.5, 
                    HasCaves = v29.Payload[l_Category_0.BiomeSettings][l_BiomeSettings_0.Caves], 
                    MapHeight = 0.5 / (v35.Y / l_VoxelResolution_0), 
                    SurfaceThickness = 0.018, 
                    WaterLevel = 0.48
                }), 
                SliceY = v42, 
                SliceZ = v43, 
                StartTime = os.clock(), 
                VoxelCorner = v40 - v38 / 2, 
                VoxelExtents = v39, 
                VoxelSize = v38, 
                X = 1
            };
        end, 
        OnStep = if not v19() then function(v56, _)
            local l_State_0 = v56.State;
            local l_Biomes_0 = l_State_0.Biomes;
            local l_BiomePoints_0 = l_State_0.BiomePoints;
            local l_BiomeSize_0 = l_State_0.BiomeSize;
            local l_BiomeBlending_0 = l_State_0.BiomeBlending;
            local l_BiomeBlendingInverse_0 = l_State_0.BiomeBlendingInverse;
            local l_GetPerlin_0 = l_State_0.GetPerlin;
            local l_GetNoise_0 = l_State_0.GetNoise;
            local l_MaterialMap_0 = l_State_0.MaterialMap;
            local l_OccupancyMap_0 = l_State_0.OccupancyMap;
            local l_Position_1 = l_State_0.Position;
            local l_PreviousColumnHeights_0 = l_State_0.PreviousColumnHeights;
            local l_ProcessVoxel_0 = l_State_0.ProcessVoxel;
            local l_SliceY_0 = l_State_0.SliceY;
            local l_SliceZ_0 = l_State_0.SliceZ;
            local l_VoxelCorner_0 = l_State_0.VoxelCorner;
            local l_VoxelExtents_0 = l_State_0.VoxelExtents;
            local l_VoxelSize_0 = l_State_0.VoxelSize;
            local l_X_0 = l_State_0.X;
            local v77 = l_X_0 - l_VoxelExtents_0.X;
            local v78 = Region3.new(Vector3.new(v77 - 1, -l_VoxelExtents_0.Y, -l_VoxelExtents_0.Z) * l_VoxelResolution_0 + l_Position_1, Vector3.new(v77, l_VoxelExtents_0.Y, l_VoxelExtents_0.Z) * l_VoxelResolution_0 + l_Position_1):ExpandToGrid(l_VoxelResolution_0);
            for v79 = 1, l_SliceZ_0 do
                local v80 = (l_VoxelCorner_0 * Vector3.new(1, 0, 1) + Vector3.new(l_X_0 - 1, 0, 0)) + Vector3.new(0, 0, v79 - 1);
                local v81 = (v80.X / l_BiomeSize_0 + v6(l_GetPerlin_0(v80, 233, l_BiomeSize_0 * 0.3)) * 0.25) + v6(l_GetPerlin_0(v80, 235, l_BiomeSize_0 * 0.05)) * 0.075;
                local v82 = (v80.Z / l_BiomeSize_0 + v6(l_GetPerlin_0(v80, 234, l_BiomeSize_0 * 0.3)) * 0.25) + v6(l_GetPerlin_0(v80, 236, l_BiomeSize_0 * 0.05)) * 0.075;
                local v83 = 10000000;
                local v84 = false;
                local v85 = 0;
                for v86 = -1, 1 do
                    for v87 = -1, 1 do
                        local v88 = math.floor((v81 + v86) + 0.5);
                        local v89 = math.floor((v82 + v87) + 0.5);
                        local v90 = ((v88 + (l_GetNoise_0((Vector3.new(v88, v89, 53))) - 0.5) * 0.75) - v81) ^ 2 + ((v89 + (l_GetNoise_0((Vector3.new(v88, v89, 73))) - 0.5) * 0.75) - v82) ^ 2;
                        if v90 < v83 then
                            v83 = v90;
                        end;
                        local v91 = l_BiomePoints_0[((v86 + 1) + 3 * (v87 + 1)) + 1];
                        v91.DistSquared = v90;
                        v91.BiomeNoise = l_GetNoise_0((Vector3.new(v88, v89, 0)));
                    end;
                end;
                local v92 = table.create(#l_Biomes_0);
                for _, v94 in l_BiomePoints_0, nil, nil do
                    local v95 = v94.DistSquared == v83 and 1 or (math.sqrt(v83) / math.sqrt(v94.DistSquared) - l_BiomeBlendingInverse_0) / l_BiomeBlending_0;
                    if v95 > 0 then
                        v95 = v95 ^ 2.1;
                        v85 = v85 + v95;
                        local v96 = l_Biomes_0[math.ceil(#l_Biomes_0 * (1 - v94.BiomeNoise))];
                        local v97 = v92[v96] or {
                            Weight = 0
                        };
                        v97.Weight = v97.Weight + v95;
                        v92[v96] = v97;
                    end;
                end;
                for v98, v99 in pairs(v92) do
                    v99.Weight = v99.Weight / v85;
                    if v98 == l_Biome_0.Arctic then
                        v84 = true;
                    end;
                end;
                local v100 = l_PreviousColumnHeights_0[v79] or l_SliceY_0;
                local v101 = false;
                local v102 = 0;
                for v103 = 1, l_SliceY_0 do
                    if not v101 then
                        local v104, v105, v106 = l_ProcessVoxel_0(Vector3.new(l_X_0, v103, v79), Vector3.new(v80.X, l_SliceY_0, v80.Z), {
                            WeightPoints = v92, 
                            HasCaves = not v84
                        });
                        v24 = v24 + 1;
                        l_MaterialMap_0[1][v103][v79] = v104;
                        l_OccupancyMap_0[1][v103][v79] = v105;
                        v102 = v103;
                        v101 = v106;
                    end;
                    if v101 then
                        v25 = v25 + 1;
                        l_OccupancyMap_0[1][v103][v79] = 0;
                        l_MaterialMap_0[1][v103][v79] = Enum.Material.Air;
                        if not (v100 >= v103) then
                            break;
                        end;
                    end;
                end;
                l_PreviousColumnHeights_0[v79] = v102;
            end;
            v23.Terrain.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.Generate;
            v23.Terrain:WriteVoxels(v78, l_VoxelResolution_0, l_MaterialMap_0, l_OccupancyMap_0);
            local l_State_1 = v56.State;
            l_State_1.X = l_State_1.X + 1;
            l_State_1 = l_X_0 / l_VoxelSize_0.x;
            return l_State_1 < 1, l_State_1;
        end else function(v108, _)
            local l_State_2 = v108.State;
            local l_Biomes_1 = l_State_2.Biomes;
            local l_BiomePoints_1 = l_State_2.BiomePoints;
            local l_BiomeSize_1 = l_State_2.BiomeSize;
            local l_BiomeBlending_1 = l_State_2.BiomeBlending;
            local l_BiomeBlendingInverse_1 = l_State_2.BiomeBlendingInverse;
            local l_GetPerlin_1 = l_State_2.GetPerlin;
            local l_GetNoise_1 = l_State_2.GetNoise;
            local l_MaterialMap_1 = l_State_2.MaterialMap;
            local l_MaxWidth_0 = l_State_2.MaxWidth;
            local l_OccupancyMap_1 = l_State_2.OccupancyMap;
            local l_Position_2 = l_State_2.Position;
            local l_PreviousColumnHeights_1 = l_State_2.PreviousColumnHeights;
            local l_ProcessVoxel_1 = l_State_2.ProcessVoxel;
            local l_SliceY_1 = l_State_2.SliceY;
            local l_SliceZ_1 = l_State_2.SliceZ;
            local l_VoxelCorner_1 = l_State_2.VoxelCorner;
            local l_VoxelExtents_1 = l_State_2.VoxelExtents;
            local l_VoxelSize_1 = l_State_2.VoxelSize;
            local l_X_1 = l_State_2.X;
            local v130 = l_X_1 - l_VoxelExtents_1.X;
            local l_l_SliceZ_1_0 = l_SliceZ_1;
            local v132 = -l_VoxelExtents_1.Z;
            local v133 = {};
            if not v20() then
                while l_l_SliceZ_1_0 > 0 do
                    table.insert(v133, Region3.new(Vector3.new(v130 - 1, -l_VoxelExtents_1.Y, v132) * l_VoxelResolution_0 + l_Position_2, Vector3.new(v130, l_VoxelExtents_1.Y, v132 + l_MaxWidth_0) * l_VoxelResolution_0 + l_Position_2):ExpandToGrid(l_VoxelResolution_0));
                    l_l_SliceZ_1_0 = l_l_SliceZ_1_0 - l_MaxWidth_0;
                    v132 = v132 + l_MaxWidth_0;
                end;
            else
                while l_l_SliceZ_1_0 > 0 do
                    table.insert(v133, Region3.new(Vector3.new(v130 - 1, -l_VoxelExtents_1.Y, v132) * l_VoxelResolution_0 + l_Position_2, Vector3.new(v130, l_VoxelExtents_1.Y, v132 + if l_l_SliceZ_1_0 < l_MaxWidth_0 then l_l_SliceZ_1_0 else l_MaxWidth_0) * l_VoxelResolution_0 + l_Position_2):ExpandToGrid(l_VoxelResolution_0));
                    l_l_SliceZ_1_0 = l_l_SliceZ_1_0 - l_MaxWidth_0;
                    v132 = v132 + l_MaxWidth_0;
                end;
                if #v133 == 0 then
                    return false, 1;
                end;
            end;
            local v134 = 1;
            for v135 = 1, l_SliceZ_1 do
                local v136 = math.floor((v135 - 1) / l_MaxWidth_0) + 1;
                if v136 ~= v134 then
                    v23.Terrain:WriteVoxels(v133[v134], l_VoxelResolution_0, l_MaterialMap_1, l_OccupancyMap_1);
                    if v136 == #v133 then
                        l_OccupancyMap_1 = {
                            table.create(l_SliceY_1)
                        };
                        l_MaterialMap_1 = {
                            table.create(l_SliceY_1)
                        };
                        for v137 = 1, l_SliceY_1 do
                            l_OccupancyMap_1[1][v137] = table.create(l_MaxWidth_0, 0);
                            l_MaterialMap_1[1][v137] = table.create(l_MaxWidth_0, Enum.Material.Air);
                        end;
                    end;
                    v134 = v136;
                end;
                local v138 = v135 - (v134 - 1) * l_MaxWidth_0;
                local v139 = (l_VoxelCorner_1 * Vector3.new(1, 0, 1) + Vector3.new(l_X_1 - 1, 0, 0)) + Vector3.new(0, 0, v135 - 1);
                local v140 = (v139.X / l_BiomeSize_1 + v6(l_GetPerlin_1(v139, 233, l_BiomeSize_1 * 0.3)) * 0.25) + v6(l_GetPerlin_1(v139, 235, l_BiomeSize_1 * 0.05)) * 0.075;
                local v141 = (v139.Z / l_BiomeSize_1 + v6(l_GetPerlin_1(v139, 234, l_BiomeSize_1 * 0.3)) * 0.25) + v6(l_GetPerlin_1(v139, 236, l_BiomeSize_1 * 0.05)) * 0.075;
                local v142 = 10000000;
                local v143 = false;
                local v144 = 0;
                for v145 = -1, 1 do
                    for v146 = -1, 1 do
                        local v147 = math.floor((v140 + v145) + 0.5);
                        local v148 = math.floor((v141 + v146) + 0.5);
                        local v149 = ((v147 + (l_GetNoise_1((Vector3.new(v147, v148, 53))) - 0.5) * 0.75) - v140) ^ 2 + ((v148 + (l_GetNoise_1((Vector3.new(v147, v148, 73))) - 0.5) * 0.75) - v141) ^ 2;
                        if v149 < v142 then
                            v142 = v149;
                        end;
                        local v150 = l_BiomePoints_1[((v145 + 1) + 3 * (v146 + 1)) + 1];
                        v150.DistSquared = v149;
                        v150.BiomeNoise = l_GetNoise_1((Vector3.new(v147, v148, 0)));
                    end;
                end;
                local v151 = table.create(#l_Biomes_1);
                for _, v153 in l_BiomePoints_1, nil, nil do
                    local v154 = v153.DistSquared == v142 and 1 or (math.sqrt(v142) / math.sqrt(v153.DistSquared) - l_BiomeBlendingInverse_1) / l_BiomeBlending_1;
                    if v154 > 0 then
                        v154 = v154 ^ 2.1;
                        v144 = v144 + v154;
                        local v155 = l_Biomes_1[math.ceil(#l_Biomes_1 * (1 - v153.BiomeNoise))];
                        local v156 = v151[v155] or {
                            Weight = 0
                        };
                        v156.Weight = v156.Weight + v154;
                        v151[v155] = v156;
                    end;
                end;
                for v157, v158 in pairs(v151) do
                    v158.Weight = v158.Weight / v144;
                    if v157 == l_Biome_0.Arctic then
                        v143 = true;
                    end;
                end;
                local v159 = l_PreviousColumnHeights_1[v135] or l_SliceY_1;
                local v160 = false;
                local v161 = 0;
                for v162 = 1, l_SliceY_1 do
                    if not v160 then
                        local v163, v164, v165 = l_ProcessVoxel_1(Vector3.new(l_X_1, v162, v135), Vector3.new(v139.X, l_SliceY_1, v139.Z), {
                            WeightPoints = v151, 
                            HasCaves = not v143
                        });
                        v24 = v24 + 1;
                        l_MaterialMap_1[1][v162][v138] = v163;
                        l_OccupancyMap_1[1][v162][v138] = v164;
                        v161 = v162;
                        v160 = v165;
                    end;
                    if v160 then
                        v25 = v25 + 1;
                        l_OccupancyMap_1[1][v162][v138] = 0;
                        l_MaterialMap_1[1][v162][v138] = Enum.Material.Air;
                        if not (v159 >= v162) then
                            break;
                        end;
                    end;
                end;
                l_PreviousColumnHeights_1[v135] = v161;
            end;
            v23.Terrain.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.Generate;
            v23.Terrain:WriteVoxels(v133[v134], l_VoxelResolution_0, l_MaterialMap_1, l_OccupancyMap_1);
            local l_State_3 = v108.State;
            l_State_3.X = l_State_3.X + 1;
            l_State_3 = l_X_1 / l_VoxelSize_1.x;
            return l_State_3 < 1, l_State_3;
        end
    });
end;
