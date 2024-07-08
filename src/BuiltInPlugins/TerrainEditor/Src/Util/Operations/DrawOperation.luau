local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.Operations.BaseOperation);
local v5 = require(l_Util_0.CalculateAutoMaterial);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.CalculateWaterLevel);
local v8 = require(l_Util_0.ClampVoxelBoundaries);
local v9 = require(l_Util_0.ConvertForPivot);
local v10 = require(l_Util_0.getDraggedPositions);
local v11 = require(l_Util_0.DEPRECATED_CalculateBrushPower);
local v12 = require(l_Util_0.DEPRECATED_CalculateAutoMaterial);
local _ = require(l_script_FirstAncestor_0.Src.Util.Operations.SculptOperation);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v15 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v15.BrushMode;
local l_BrushShape_0 = v15.BrushShape;
local l_BrushSettings_0 = v15.BrushSettings;
local l_Category_0 = v15.Category;
local l_MaterialSettings_0 = v15.MaterialSettings;
local v21 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorWaterAutofill);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
return function(v25, v26)
    return v4.new({
        Budget = 0.005, 
        Name = v25, 
        OnFinish = function(v27, _)
            assert(v27.State, "Tried to finish without starting first.");
            local l_State_0 = v27.State;
            v26.ChangeHistoryService:SetWaypoint("Draw");
            if l_State_0.Smooth then
                l_State_0.Smooth:cancel();
            end;
        end, 
        OnStart = function(v30, _)
            local v32 = v30.Payload[l_Category_0.BrushSettings];
            local v33 = v32[l_BrushSettings_0.BrushSize];
            v30.State = {
                Position = v9(v32[l_BrushSettings_0.PivotPosition], v32[l_BrushSettings_0.State].Position, if v32[l_BrushSettings_0.BrushShape] == l_BrushShape_0.Sphere then v33.Size else v33.Height * v1.VoxelResolution)
            };
        end, 
        OnStep = if not v23() then function(v34, v35)
            assert(v34.State, "Tried to step without starting first.");
            local l_State_1 = v34.State;
            local v37 = v34.Payload[l_Category_0.BrushSettings];
            local v38 = v37[l_BrushSettings_0.BrushSize];
            local l_Height_0 = v38.Height;
            local l_Size_0 = v38.Size;
            local v41 = v37[l_BrushSettings_0.BrushMode];
            local v42 = v37[l_BrushSettings_0.BrushShape];
            local v43 = v37[l_BrushSettings_0.State];
            local v44 = v37[l_BrushSettings_0.IgnoreWater];
            local v45 = if not v22() then nil else v37[l_BrushSettings_0.WaterAutofill];
            if not v37[l_BrushSettings_0.TemporarySmooth] then
                if l_State_1.Smooth then
                    l_State_1.Smooth:cancel();
                    l_State_1.Smooth = nil;
                    l_State_1.Position = v43.Position;
                end;
                local v46 = v34.Payload[l_Category_0.MaterialSettings];
                local v47 = v46[l_MaterialSettings_0.AutoMaterial];
                local v48 = v46[l_MaterialSettings_0.SourceMaterial];
                local v49 = if v42 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0 * v1.VoxelResolution;
                local v50 = l_Size_0 * v1.VoxelResolution;
                local v51 = v50 * 0.5;
                if v41 == l_BrushMode_0.Add then
                    l_Size_0 = l_Size_0 - 1;
                    v49 = v49 - 2;
                    v50 = v50 - 2;
                    v51 = v51 - 1;
                else
                    v48 = Enum.Material.Air;
                end;
                local v52 = v10(l_State_1.Position, v9(v37[l_BrushSettings_0.PivotPosition], v43.Position, v49), v51);
                l_State_1.Position = v52[#v52];
                for _, v54 in v52, nil, nil do
                    local v55 = nil;
                    if v24() then
                        v55 = os.clock();
                    end;
                    local v56, v57 = v8(v54, v51, v49);
                    local v58;
                    if v41 ~= l_BrushMode_0.Add then
                        v58 = false;
                        if v41 == l_BrushMode_0.Subtract then
                            v58 = not v45;
                            if not v58 then
                                goto label0;
                            end;
                        else
                            goto label0;
                        end;
                    end;
                    v58 = not v47 and not v44;
                    ::label0::;
                    if not v58 then
                        local v59 = Region3.new(v56, v57);
                        local v60 = (v57.X - v56.X) * 0.5;
                        local v61 = (v57 - v56) / v1.VoxelResolution;
                        local v62, v63 = v26.Terrain:ReadVoxels(v59, v1.VoxelResolution);
                        v62.Size = nil;
                        v63.Size = nil;
                        local v64 = nil;
                        local v65 = nil;
                        if v41 == l_BrushMode_0.Subtract then
                            local v66, v67 = v7(v62, v63);
                            v64 = v66;
                            v65 = v67;
                        end;
                        local v68 = {};
                        local v69 = {};
                        local v70 = {};
                        local v71 = {};
                        for v72, v73 in v63, nil, nil do
                            local v74 = (v56.X + (v72 - 0.5) * v1.VoxelResolution) - v54.X;
                            v68[v72] = {};
                            v69[v72] = {};
                            v70[v72] = {};
                            v71[v72] = {};
                            for v75, v76 in v73, nil, nil do
                                local v77 = (v56.Y + (v75 - 0.5) * v1.VoxelResolution) - v54.Y;
                                v68[v72][v75] = {};
                                v69[v72][v75] = {};
                                v70[v72][v75] = {};
                                v71[v72][v75] = {};
                                for v78, v79 in v76, nil, nil do
                                    local v80 = Vector3.new(v72, v75, v78);
                                    local v81 = v62[v72][v75][v78];
                                    local v82 = Vector3.new(v74, v77, (v56.Z + (v78 - 0.5) * v1.VoxelResolution) - v54.Z);
                                    v70[v72][v75][v78] = v81;
                                    v71[v72][v75][v78] = v79;
                                    local v83, _ = v11(v82, l_Size_0, v42, v60);
                                    if v41 == l_BrushMode_0.Add and v79 < v83 then
                                        if v44 and v81 == Enum.Material.Water then
                                            v69[v72][v75][v78] = v79;
                                            v68[v72][v75][v78] = v81;
                                        elseif not v47 then
                                            v69[v72][v75][v78] = v83;
                                            v68[v72][v75][v78] = v48;
                                        else
                                            v69[v72][v75][v78] = v83;
                                            v68[v72][v75][v78] = if not v47 then v81 else v12(v62, v80, v61) or v81;
                                        end;
                                    elseif (not (v41 == l_BrushMode_0.Add and v83 > 0) or v47) or not v44 then
                                        if v41 == l_BrushMode_0.Subtract and (not v44 or v81 ~= Enum.Material.Water) then
                                            local v85 = if not not v45 and v75 <= v64 then Enum.Material.Water else Enum.Material.Air;
                                            if v1.MinimumOccupancy <= v83 then
                                                v69[v72][v75][v78] = v85 == Enum.Material.Air and 0 or if v75 == v64 then v65 else 1;
                                                v68[v72][v75][v78] = v85;
                                                if v83 == 1 then
                                                    v70[v72][v75][v78] = Enum.Material.Air;
                                                    v71[v72][v75][v78] = 0;
                                                end;
                                            else
                                                v69[v72][v75][v78] = v79;
                                                v68[v72][v75][v78] = v81;
                                            end;
                                        else
                                            v69[v72][v75][v78] = v79;
                                            v68[v72][v75][v78] = v81;
                                        end;
                                    elseif v81 == Enum.Material.Water then
                                        v69[v72][v75][v78] = v79;
                                        v68[v72][v75][v78] = v81;
                                    else
                                        v69[v72][v75][v78] = v83;
                                        v68[v72][v75][v78] = v48;
                                    end;
                                end;
                            end;
                        end;
                        if v24() then
                            v35:addTimeStatistic(v3.NormalizeBrushTimer(v55, l_Size_0, l_Height_0));
                        end;
                        if v41 == l_BrushMode_0.Subtract then
                            v26.Terrain:WriteVoxels(v59, v1.VoxelResolution, v70, v71);
                        end;
                        v26.Terrain:WriteVoxels(v59, v1.VoxelResolution, v68, v69);
                    else
                        if v42 == l_BrushShape_0.Sphere then
                            v26.Terrain:FillBall(v54, v51, v48);
                        elseif v42 == l_BrushShape_0.Cube then
                            v26.Terrain:FillBlock(CFrame.new(v54), Vector3.new(v50, v49, v50), v48);
                        elseif v42 == l_BrushShape_0.Cylinder then
                            if (v57 - v56).X <= 2 * v1.VoxelResolution then
                                v26.Terrain:FillBall(v54, v51, v48);
                            else
                                v26.Terrain:FillCylinder(CFrame.new(v54), v49, v51, v48);
                            end;
                        end;
                        if v24() then
                            v35:addTimeStatistic(v3.NormalizeBrushTimer(v55, l_Size_0, l_Height_0));
                        end;
                    end;
                end;
                return true, 0;
            else
                if l_State_1.Smooth then
                    l_State_1.Smooth:updatePayload(v34.Payload);
                else
                    local v86 = v14("Smooth", v26);
                    v86:start({
                        Payload = v34.Payload
                    });
                    l_State_1.Smooth = v86;
                end;
                return true, 0;
            end;
        end else function(v87, v88)
            assert(v87.State, "Tried to step without starting first.");
            if v21.ProfileTools() then
                debug.profilebegin("Draw");
            end;
            local l_State_2 = v87.State;
            local v90 = v87.Payload[l_Category_0.BrushSettings];
            local v91 = v90[l_BrushSettings_0.BrushSize];
            local l_Height_1 = v91.Height;
            local l_Size_1 = v91.Size;
            local v94 = v90[l_BrushSettings_0.BrushMode];
            local v95 = v90[l_BrushSettings_0.BrushShape];
            local v96 = v90[l_BrushSettings_0.State];
            local v97 = v90[l_BrushSettings_0.IgnoreWater];
            local v98 = if not v22() then nil else v90[l_BrushSettings_0.WaterAutofill];
            if not v90[l_BrushSettings_0.TemporarySmooth] then
                if l_State_2.Smooth then
                    l_State_2.Smooth:cancel();
                    l_State_2.Smooth = nil;
                    l_State_2.Position = v96.Position;
                end;
                local v99 = v87.Payload[l_Category_0.MaterialSettings];
                local v100 = v99[l_MaterialSettings_0.AutoMaterial];
                local v101 = v99[l_MaterialSettings_0.SourceMaterial];
                local v102 = if v95 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1 * v1.VoxelResolution;
                local v103 = l_Size_1 * v1.VoxelResolution;
                local v104 = v103 * 0.5;
                if v94 == l_BrushMode_0.Add then
                    l_Size_1 = l_Size_1 - 1;
                    v102 = v102 - 2;
                    v103 = v103 - 2;
                    v104 = v104 - 1;
                else
                    v101 = Enum.Material.Air;
                end;
                local v105 = v10(l_State_2.Position, v9(v90[l_BrushSettings_0.PivotPosition], v96.Position, v102), v104);
                l_State_2.Position = v105[#v105];
                for _, v107 in v105, nil, nil do
                    if not (v107 == l_State_2.LastPosition) or v100 then
                        l_State_2.LastPosition = v107;
                        local v108, v109 = v8(v107, v104, v102);
                        local v110 = nil;
                        if v24() then
                            v110 = os.clock();
                        end;
                        local v111;
                        if v94 ~= l_BrushMode_0.Add then
                            v111 = false;
                            if v94 == l_BrushMode_0.Subtract then
                                v111 = not v98;
                                if v111 then
                                    v111 = not v97;
                                    if not v111 then
                                        goto label1;
                                    end;
                                else
                                    goto label1;
                                end;
                            else
                                goto label1;
                            end;
                        end;
                        v111 = not v100;
                        ::label1::;
                        if not v111 then
                            local v112 = Region3.new(v108, v109);
                            local v113 = (v109.X - v108.X) * 0.5;
                            local v114 = (v109 - v108) / v1.VoxelResolution;
                            local v115, v116 = v26.Terrain:ReadVoxels(v112, v1.VoxelResolution);
                            v115.Size = nil;
                            v116.Size = nil;
                            local v117 = nil;
                            local v118 = nil;
                            if v94 == l_BrushMode_0.Subtract then
                                local v119, v120 = v7(v115, v116);
                                v117 = v119;
                                v118 = v120;
                            end;
                            local v121 = #v115;
                            local v122 = #v115[1];
                            local _ = #v115[1][1];
                            local v124 = table.create(v121);
                            local v125 = table.create(v121);
                            local v126 = table.create(v121);
                            local l_VoxelResolution_0 = v1.VoxelResolution;
                            local v128 = false;
                            if v95 == l_BrushShape_0.Sphere then
                                v128 = l_Size_1 > 2;
                            end;
                            local v129;
                            if v95 == l_BrushShape_0.Cylinder then
                                v129 = true;
                                if not (l_Size_1 <= 2) then
                                    goto label2;
                                end;
                            end;
                            v129 = v128;
                            ::label2::;
                            local v130 = (v108.X - l_VoxelResolution_0 * 0.5) - v107.X;
                            local v131 = (v108.Y - l_VoxelResolution_0 * 0.5) - v107.Y;
                            local v132 = (v108.Z - l_VoxelResolution_0 * 0.5) - v107.Z;
                            local v133 = nil;
                            local v134 = nil;
                            local v135 = v94 == l_BrushMode_0.Add;
                            local v136 = v94 == l_BrushMode_0.Subtract;
                            local v137 = nil;
                            if v24() then
                                v137 = os.clock();
                            end;
                            for v138, v139 in v116, nil, nil do
                                v133 = if not v129 then nil else (v138 * l_VoxelResolution_0 + v130) ^ 2;
                                local v140 = v115[v138];
                                local v141 = table.create(v122);
                                local v142 = table.create(v122);
                                local v143 = table.create(v122);
                                v124[v138] = v141;
                                v125[v138] = v142;
                                v126[v138] = v143;
                                for v144, v145 in v139, nil, nil do
                                    v134 = if not v128 then nil else v133 + (v144 * l_VoxelResolution_0 + v131) ^ 2;
                                    local v146 = v140[v144];
                                    local v147 = table.clone(v146);
                                    local v148 = table.clone(v146);
                                    local v149 = table.clone(v145);
                                    v141[v144] = v147;
                                    v142[v144] = v148;
                                    v143[v144] = v149;
                                    for v150, v151 in v145, nil, nil do
                                        local v152 = v146[v150];
                                        local v153 = 1;
                                        if v129 then
                                            local v154 = (v150 * l_VoxelResolution_0 + v132) ^ 2;
                                            v153 = v6(if not v128 then math.sqrt(v133 + v154) else math.sqrt(v134 + v154), v113);
                                        end;
                                        if v135 and v151 < v153 then
                                            v145[v150] = v153;
                                            if v100 then
                                                v147[v150] = v5(v138, v144, v150, v115, v114) or v152;
                                            else
                                                v147[v150] = v152;
                                            end;
                                        elseif v136 and (not v97 or v152 ~= Enum.Material.Water) then
                                            local v155 = if not not v98 and v144 <= v117 then Enum.Material.Water else Enum.Material.Air;
                                            if v1.MinimumOccupancy <= v153 then
                                                v145[v150] = v155 == Enum.Material.Air and 0 or if v144 == v117 then v118 else 1;
                                                v147[v150] = v155;
                                                if v153 == 1 then
                                                    v148[v150] = Enum.Material.Air;
                                                    v149[v150] = 0;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            if v24() then
                                v88:addTimeStatistic(v3.NormalizeBrushTimer(v137, v91.Size, v91.Height));
                            end;
                            if v94 == l_BrushMode_0.Subtract then
                                v26.Terrain:WriteVoxels(v112, v1.VoxelResolution, v125, v126);
                            end;
                            v26.Terrain:WriteVoxels(v112, v1.VoxelResolution, v124, v116);
                        else
                            if v95 == l_BrushShape_0.Sphere then
                                v26.Terrain:FillBall(v107, v104, v101);
                            elseif v95 == l_BrushShape_0.Cube then
                                v26.Terrain:FillBlock(CFrame.new(v107), Vector3.new(v103, v102, v103), v101);
                            elseif v95 == l_BrushShape_0.Cylinder then
                                if (v109 - v108).X <= 2 * v1.VoxelResolution then
                                    v26.Terrain:FillBall(v107, v104, v101);
                                else
                                    v26.Terrain:FillCylinder(CFrame.new(v107), v102, v104, v101);
                                end;
                            end;
                            if v24() then
                                v88:addTimeStatistic(v3.NormalizeBrushTimer(v110, v91.Size, v91.Height));
                            end;
                        end;
                    else
                        v88:skipBudget();
                        if v21.ProfileTools() then
                            debug.profileend();
                        end;
                        return true, 0;
                    end;
                end;
                if v21.ProfileTools() then
                    debug.profileend();
                end;
                return true, 0;
            else
                if l_State_2.Smooth then
                    l_State_2.Smooth:updatePayload(v87.Payload);
                else
                    local v156 = v14("Smooth", v26);
                    v156:start({
                        Payload = v87.Payload
                    });
                    l_State_2.Smooth = v156;
                end;
                if v21.ProfileTools() then
                    debug.profileend();
                end;
                return true, 0;
            end;
        end
    });
end;
