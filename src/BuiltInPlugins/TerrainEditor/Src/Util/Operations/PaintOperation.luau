local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v1.VoxelResolution;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.AnalyticsHelper);
local v5 = require(l_Util_0.Operations.BaseOperation);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.ClampVoxelBoundaries);
local v8 = require(l_Util_0.ConvertForPivot);
local v9 = require(l_Util_0.getDraggedPositions);
local v10 = require(l_Util_0.DEPRECATED_CalculateBrushPower);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v11.BrushShape;
local l_BrushSettings_0 = v11.BrushSettings;
local l_Category_0 = v11.Category;
local l_MaterialMode_0 = v11.MaterialMode;
local l_MaterialSettings_0 = v11.MaterialSettings;
local v17 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
return function(v20, v21)
    return v5.new({
        Budget = 0.005, 
        OnFinish = function(_, _)
            v21.ChangeHistoryService:SetWaypoint("Paint");
        end, 
        OnStart = function(v24, _)
            local v26 = v24.Payload[l_Category_0.BrushSettings];
            local v27 = v26[l_BrushSettings_0.BrushSize];
            v24.State = {
                Position = v8(v26[l_BrushSettings_0.PivotPosition], v26[l_BrushSettings_0.State].Position, if v26[l_BrushSettings_0.BrushShape] == l_BrushShape_0.Sphere then v27.Size else v27.Height * v1.VoxelResolution)
            };
        end, 
        OnStep = if not v18() then function(v28, v29)
            assert(v28.State, "Tried to step without starting first.");
            local l_State_0 = v28.State;
            local v31 = v28.Payload[l_Category_0.BrushSettings];
            local v32 = v31[l_BrushSettings_0.BrushSize];
            local l_Height_0 = v32.Height;
            local l_Size_0 = v32.Size;
            local v35 = v31[l_BrushSettings_0.BrushShape];
            local v36 = v31[l_BrushSettings_0.State];
            local v37 = v31[l_BrushSettings_0.IgnoreWater];
            local v38 = v28.Payload[l_Category_0.MaterialSettings];
            local v39 = v38[l_MaterialSettings_0.MaterialMode];
            local v40 = v38[l_MaterialSettings_0.SourceMaterial];
            local v41 = v38[l_MaterialSettings_0.TargetMaterial];
            local v42 = if v35 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0 * v1.VoxelResolution;
            local v43 = (l_Size_0 * v1.VoxelResolution) * 0.5;
            local v44 = v9(l_State_0.Position, v8(v31[l_BrushSettings_0.PivotPosition], v36.Position, v42), v43);
            l_State_0.Position = v44[#v44];
            for _, v46 in v44, nil, nil do
                local v47, v48 = v7(v46, v43, v42);
                local v49 = Region3.new(v47, v48);
                local v50 = (v48.X - v47.X) * 0.5;
                local v51, v52 = v21.Terrain:ReadVoxels(v49, v1.VoxelResolution);
                local v53 = nil;
                if v19() then
                    v53 = os.clock();
                end;
                v51.Size = nil;
                v52.Size = nil;
                local v54 = {};
                local v55 = {};
                local v56 = {};
                local v57 = {};
                for v58, v59 in v52, nil, nil do
                    local v60 = (v47.X + (v58 - 0.5) * v1.VoxelResolution) - v46.X;
                    v54[v58] = {};
                    v55[v58] = {};
                    v56[v58] = {};
                    v57[v58] = {};
                    for v61, v62 in v59, nil, nil do
                        local v63 = (v47.Y + (v61 - 0.5) * v1.VoxelResolution) - v46.Y;
                        v54[v58][v61] = {};
                        v55[v58][v61] = {};
                        v56[v58][v61] = {};
                        v57[v58][v61] = {};
                        for v64, v65 in v62, nil, nil do
                            local _ = Vector3.new(v58, v61, v64);
                            local v67 = v51[v58][v61][v64];
                            local v68, v69 = v10(Vector3.new(v60, v63, (v47.Z + (v64 - 0.5) * v1.VoxelResolution) - v46.Z), l_Size_0, v35, v50);
                            if l_Size_0 > 20 then
                                v69 = v69 * ((l_Size_0 - 20) / 5);
                            end;
                            v56[v58][v61][v64] = Enum.Material.Air;
                            v57[v58][v61][v64] = 0;
                            if v68 > 0 and (not v37 or v67 ~= Enum.Material.Water) then
                                if v39 == l_MaterialMode_0.Paint then
                                    v55[v58][v61][v64] = v65;
                                    v54[v58][v61][v64] = v40;
                                elseif v39 == l_MaterialMode_0.Replace then
                                    v55[v58][v61][v64] = v40 == Enum.Material.Air and 1 or v65;
                                    v54[v58][v61][v64] = if v40 == v67 then v41 else v67;
                                end;
                            else
                                v55[v58][v61][v64] = v65;
                                v54[v58][v61][v64] = v67;
                            end;
                        end;
                    end;
                end;
                if v19() then
                    v29:addTimeStatistic(v4.NormalizeBrushTimer(v53, l_Size_0, l_Height_0));
                end;
                if not (v40 ~= Enum.Material.Water) or v41 == Enum.Material.Water then
                    v21.Terrain:WriteVoxels(v49, v1.VoxelResolution, v56, v57);
                end;
                v21.Terrain:WriteVoxels(v49, v1.VoxelResolution, v54, v55);
            end;
            return true, 0;
        end else function(v70, v71)
            assert(v70.State, "Tried to step without starting first.");
            if v17.ProfileTools() then
                debug.profilebegin("Paint Operation");
            end;
            local _ = os.clock();
            local l_State_1 = v70.State;
            local v74 = v70.Payload[l_Category_0.BrushSettings];
            local v75 = v74[l_BrushSettings_0.BrushSize];
            local l_Height_1 = v75.Height;
            local l_Size_1 = v75.Size;
            local v78 = v74[l_BrushSettings_0.BrushShape];
            local v79 = v74[l_BrushSettings_0.State];
            local v80 = v74[l_BrushSettings_0.IgnoreWater];
            local v81 = v70.Payload[l_Category_0.MaterialSettings];
            local v82 = v81[l_MaterialSettings_0.MaterialMode];
            local v83 = v81[l_MaterialSettings_0.SourceMaterial];
            local v84 = v81[l_MaterialSettings_0.TargetMaterial];
            local v85 = if v78 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1 * l_VoxelResolution_0;
            local v86 = (l_Size_1 * l_VoxelResolution_0) * 0.5;
            local v87 = v9(l_State_1.Position, v8(v74[l_BrushSettings_0.PivotPosition], v79.Position, v85), v86);
            l_State_1.Position = v87[#v87];
            local v88 = v82 == l_MaterialMode_0.Paint;
            local v89 = v82 == l_MaterialMode_0.Replace;
            for _, v91 in v87, nil, nil do
                if v91 == l_State_1.LastPosition then
                    v71:skipBudget();
                    if v17.ProfileTools() then
                        debug.profileend();
                    end;
                    return true, 0;
                else
                    l_State_1.LastPosition = v91;
                    local v92, v93 = v7(v91, v86, v85);
                    local v94 = Region3.new(v92, v93);
                    if not (v78 == l_BrushShape_0.Cube) or not v89 then
                        local v95 = (v93.X - v92.X) * 0.5;
                        local v96, v97 = v21.Terrain:ReadVoxels(v94, l_VoxelResolution_0);
                        v96.Size = nil;
                        v97.Size = nil;
                        local l_l_VoxelResolution_0_0 = l_VoxelResolution_0;
                        local v99 = v83 == Enum.Material.Air;
                        local v100 = false;
                        if v78 == l_BrushShape_0.Sphere then
                            v100 = l_Size_1 > 2;
                        end;
                        local v101;
                        if v78 == l_BrushShape_0.Cylinder then
                            v101 = true;
                            if not (l_Size_1 <= 2) then
                                goto label0;
                            end;
                        end;
                        v101 = v100;
                        ::label0::;
                        local v102 = (v92.X - l_l_VoxelResolution_0_0 * 0.5) - v91.X;
                        local v103 = (v92.Y - l_l_VoxelResolution_0_0 * 0.5) - v91.Y;
                        local v104 = (v92.Z - l_l_VoxelResolution_0_0 * 0.5) - v91.Z;
                        local v105 = nil;
                        local v106 = nil;
                        local v107 = nil;
                        if v19() then
                            v107 = os.clock();
                        end;
                        for v108, v109 in v97, nil, nil do
                            v105 = if not v101 then nil else (v108 * l_l_VoxelResolution_0_0 + v102) ^ 2;
                            local v110 = v96[v108];
                            for v111, v112 in v109, nil, nil do
                                v106 = if not v100 then nil else v105 + (v111 * l_l_VoxelResolution_0_0 + v103) ^ 2;
                                local v113 = v110[v111];
                                for v114, v115 in v112, nil, nil do
                                    local v116 = v113[v114];
                                    local v117 = 1;
                                    if v101 then
                                        local v118 = (v114 * l_l_VoxelResolution_0_0 + v104) ^ 2;
                                        v117 = v6(if not v100 then math.sqrt(v105 + v118) else math.sqrt(v106 + v118), v95);
                                    end;
                                    if v117 > 0 and (not v80 or v116 ~= Enum.Material.Water) then
                                        if not v88 then
                                            if v89 then
                                                v112[v114] = if not v99 then v115 else 1;
                                                v113[v114] = if v83 == v116 then v84 else v116;
                                            end;
                                        else
                                            v112[v114] = v115;
                                            v113[v114] = v83;
                                        end;
                                    else
                                        v112[v114] = v115;
                                        v113[v114] = v116;
                                    end;
                                end;
                            end;
                        end;
                        if v19() then
                            v71:addTimeStatistic(v4.NormalizeBrushTimer(v107, l_Size_1, l_Height_1));
                        end;
                        if not (v83 ~= Enum.Material.Water) or v84 == Enum.Material.Water then
                            v21.Terrain:FillRegion(v94, v1.VoxelResolution, Enum.Material.Air);
                        end;
                        v21.Terrain:WriteVoxels(v94, v1.VoxelResolution, v96, v97);
                    else
                        v21.Terrain:ReplaceMaterial(v94, l_VoxelResolution_0, v83, v84);
                    end;
                end;
            end;
            if v17.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        end, 
        Name = v20
    });
end;
