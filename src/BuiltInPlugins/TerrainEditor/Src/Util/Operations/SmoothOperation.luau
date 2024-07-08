local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v1.VoxelResolution;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.AnalyticsHelper);
local v5 = require(l_Util_0.Operations.BaseOperation);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.CalculateMagnitudePercent);
local v8 = require(l_Util_0.ClampVoxelBoundaries);
local v9 = require(l_Util_0.ConvertForPivot);
local v10 = require(l_Util_0.getDraggedPositions);
local v11 = require(l_Util_0.DEPRECATED_CalculateBrushPower);
local v12 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v12.BrushShape;
local l_BrushSettings_0 = v12.BrushSettings;
local l_Category_0 = v12.Category;
local v16 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
return function(v19, v20)
    return v5.new({
        Budget = 0.005, 
        OnFinish = function(_, _)
            v20.ChangeHistoryService:SetWaypoint("Smooth");
        end, 
        OnStart = function(v23, _)
            local v25 = v23.Payload[l_Category_0.BrushSettings];
            local v26 = v25[l_BrushSettings_0.BrushSize];
            v23.State = {
                Position = v9(v25[l_BrushSettings_0.PivotPosition], v25[l_BrushSettings_0.State].Position, if v25[l_BrushSettings_0.BrushShape] == l_BrushShape_0.Sphere then v26.Size else v26.Height * l_VoxelResolution_0)
            };
        end, 
        OnStep = if not v17() then function(v27, v28)
            assert(v27.State, "Tried to step without starting first.");
            local l_State_0 = v27.State;
            local v30 = v27.Payload[l_Category_0.BrushSettings];
            local v31 = v30[l_BrushSettings_0.BrushSize];
            local l_Height_0 = v31.Height;
            local l_Size_0 = v31.Size;
            local v34 = v30[l_BrushSettings_0.BrushShape];
            local v35 = v30[l_BrushSettings_0.State];
            local v36 = v30[l_BrushSettings_0.IgnoreWater];
            local v37 = v30[l_BrushSettings_0.Strength] or 1;
            local v38 = if v34 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0 * v1.VoxelResolution;
            local v39 = (l_Size_0 * v1.VoxelResolution) * 0.5;
            local v40 = v10(l_State_0.Position, v9(v30[l_BrushSettings_0.PivotPosition], v35.Position, v38), v39);
            l_State_0.Position = v40[#v40];
            for _, v42 in v40, nil, nil do
                local v43, v44 = v8(v42, v39, v38);
                local v45 = Region3.new(v43, v44);
                local v46 = (v44.X - v43.X) * 0.5;
                local v47, v48 = v20.Terrain:ReadVoxels(v45, v1.VoxelResolution);
                v47.Size = nil;
                v48.Size = nil;
                local v49, v50 = v20.Terrain:SmoothRegion(v45, v1.VoxelResolution, v37);
                local v51 = nil;
                if v18() then
                    v51 = os.clock();
                end;
                local function v59(v52, v53)
                    local v54, v55 = v11(v53, l_Size_0, v34, v46);
                    if v36 and v47[v52.X][v52.Y][v52.Z] == Enum.Material.Water then
                        v50[v52.X][v52.Y][v52.Z] = v48[v52.X][v52.Y][v52.Z];
                        v49[v52.X][v52.Y][v52.Z] = v47[v52.X][v52.Y][v52.Z];
                        return ;
                    else
                        local v56 = v49[v52.X][v52.Y][v52.Z];
                        local v57 = true;
                        if v56 ~= Enum.Material.Air then
                            v57 = v50[v52.X][v52.Y][v52.Z] <= 0;
                        end;
                        local v58 = math.clamp(v48[v52.X][v52.Y][v52.Z] + (((v50[v52.X][v52.Y][v52.Z] - v48[v52.X][v52.Y][v52.Z]) * v37) * v54) * v55, 0, 1);
                        if v58 ~= v50[v52.X][v52.Y][v52.Z] then
                            v50[v52.X][v52.Y][v52.Z] = v58;
                            if v57 and v1.MinimumSmooth <= v58 then
                                v49[v52.X][v52.Y][v52.Z] = v47[v52.X][v52.Y][v52.Z];
                                return ;
                            elseif v58 <= 0 then
                                v49[v52.X][v52.Y][v52.Z] = Enum.Material.Air;
                            end;
                        end;
                        return ;
                    end;
                end;
                v47.Size = nil;
                v48.Size = nil;
                for v60, v61 in v48, nil, nil do
                    local v62 = (v43.X + (v60 - 0.5) * v1.VoxelResolution) - v42.X;
                    for v63, v64 in v61, nil, nil do
                        local v65 = (v43.Y + (v63 - 0.5) * v1.VoxelResolution) - v42.Y;
                        for v66, _ in v64, nil, nil do
                            local v68 = Vector3.new(v60, v63, v66);
                            v59(v68, (Vector3.new(v62, v65, (v43.Z + (v68.Z - 0.5) * v1.VoxelResolution) - v42.Z)));
                        end;
                    end;
                end;
                if v18() then
                    v28:addTimeStatistic(v4.NormalizeBrushTimer(v51, l_Size_0, l_Height_0));
                end;
                v20.Terrain:WriteVoxels(v45, v1.VoxelResolution, v49, v50);
            end;
            return true, 0;
        end else function(v69, v70)
            assert(v69.State, "Tried to step without starting first.");
            if v16.ProfileTools() then
                debug.profilebegin("Smooth");
            end;
            local l_State_1 = v69.State;
            local v72 = v69.Payload[l_Category_0.BrushSettings];
            local v73 = v72[l_BrushSettings_0.BrushSize];
            local l_Height_1 = v73.Height;
            local l_Size_1 = v73.Size;
            local v76 = v72[l_BrushSettings_0.BrushShape];
            local v77 = v72[l_BrushSettings_0.State];
            local v78 = v72[l_BrushSettings_0.IgnoreWater];
            local v79 = v72[l_BrushSettings_0.Strength] or 1;
            local v80 = false;
            if v76 == l_BrushShape_0.Sphere then
                v80 = l_Size_1 > 2;
            end;
            local v81;
            if v76 == l_BrushShape_0.Cylinder then
                v81 = true;
                if not (l_Size_1 <= 2) then
                    goto label0;
                end;
            end;
            v81 = v80;
            ::label0::;
            local v82 = if v76 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1 * l_VoxelResolution_0;
            local v83 = (l_Size_1 * l_VoxelResolution_0) * 0.5;
            local v84 = v10(l_State_1.Position, v9(v72[l_BrushSettings_0.PivotPosition], v77.Position, v82), v83);
            l_State_1.Position = v84[#v84];
            for _, v86 in v84, nil, nil do
                local v87, v88 = v8(v86, v83, v82);
                local v89 = Region3.new(v87, v88);
                local v90 = (v88.X - v87.X) * 0.5;
                local v91 = (v87.X - l_VoxelResolution_0 * 0.5) - v86.X;
                local v92 = (v87.Y - l_VoxelResolution_0 * 0.5) - v86.Y;
                local v93 = (v87.Z - l_VoxelResolution_0 * 0.5) - v86.Z;
                local v94 = nil;
                local v95 = nil;
                local v96, v97 = v20.Terrain:ReadVoxels(v89, l_VoxelResolution_0);
                local v98, v99 = v20.Terrain:SmoothRegion(v89, l_VoxelResolution_0, v79);
                v96.Size = nil;
                v97.Size = nil;
                local v100 = nil;
                if v18() then
                    v100 = os.clock();
                end;
                for v101, v102 in v97, nil, nil do
                    v94 = if not v81 then nil else (v101 * l_VoxelResolution_0 + v91) ^ 2;
                    local v103 = v98[v101];
                    local v104 = v99[v101];
                    local v105 = v96[v101];
                    for v106, v107 in v102, nil, nil do
                        v95 = if not v80 then nil else v94 + (v106 * l_VoxelResolution_0 + v92) ^ 2;
                        local v108 = v103[v106];
                        local v109 = v104[v106];
                        local v110 = v105[v106];
                        for v111, v112 in v107, nil, nil do
                            local v113 = v110[v111];
                            local v114 = 1;
                            local v115 = 1;
                            if v81 then
                                local v116 = (v111 * l_VoxelResolution_0 + v93) ^ 2;
                                local v117 = if not v80 then math.sqrt(v94 + v116) else math.sqrt(v95 + v116);
                                v114 = v6(v117, v90);
                                v115 = v7(v117, v90);
                            end;
                            if v78 and v113 == Enum.Material.Water then
                                v104[v111] = v112;
                                v108[v111] = v113;
                                return ;
                            else
                                local v118 = v108[v111];
                                local v119 = true;
                                if v118 ~= Enum.Material.Air then
                                    v119 = v109[v111] <= 0;
                                end;
                                local v120 = math.clamp(v112 + (((v109[v111] - v112) * v79) * v114) * v115, 0, 1);
                                if v120 ~= v109[v111] then
                                    v109[v111] = v120;
                                    if v119 and v1.MinimumSmooth <= v120 then
                                        v108[v111] = v113;
                                    elseif v120 <= 0 then
                                        v108[v111] = Enum.Material.Air;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if v18() then
                    v70:addTimeStatistic(v4.NormalizeBrushTimer(v100, l_Size_1, l_Height_1));
                end;
                v20.Terrain:WriteVoxels(v89, l_VoxelResolution_0, v98, v99);
            end;
            if v16.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        end, 
        Name = v19
    });
end;
