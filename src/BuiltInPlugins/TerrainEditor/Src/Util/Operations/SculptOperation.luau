local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v2 = require(l_Util_0.AnalyticsHelper);
local v3 = require(l_Util_0.CalculateAutoMaterial);
local v4 = require(l_Util_0.CalculateBrushOccupancy);
local v5 = require(l_Util_0.CalculateMagnitudePercent);
local v6 = require(l_Util_0.CalculateWaterLevel);
local v7 = require(l_Util_0.ClampVoxelBoundaries);
local v8 = require(l_Util_0.ConvertForPivot);
local v9 = require(l_Util_0.getDraggedPositions);
local v10 = require(l_Util_0.DEPRECATED_CalculateAutoMaterial);
local v11 = require(l_Util_0.DEPRECATED_CalculateBrushPower);
local v12 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v12.VoxelResolution;
local v14 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local v16 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v16.BrushMode;
local l_BrushSettings_0 = v16.BrushSettings;
local l_BrushShape_0 = v16.BrushShape;
local l_Category_0 = v16.Category;
local l_MaterialSettings_0 = v16.MaterialSettings;
local v22 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorWaterAutofill);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v26 = v24();
local v27 = {
    Vector3.new(-1, 0, 0), 
    Vector3.new(1, 0, 0), 
    Vector3.new(0, -1, 0), 
    Vector3.new(0, 1, 0), 
    Vector3.new(0, 0, -1), 
    (Vector3.new(0, 0, 1))
};
return function(v28, v29)
    return v15.new({
        Name = v28, 
        OnFinish = function(v30, _)
            v29.ChangeHistoryService:SetWaypoint("Sculpt");
            assert(v30.State, "Tried to step without starting first.");
            if v30.State.Smooth then
                v30.State.Smooth:cancel();
            end;
        end, 
        OnStart = function(v32, _)
            local v34 = v32.Payload[l_Category_0.BrushSettings];
            local v35 = v34[l_BrushSettings_0.BrushSize];
            v32.State = {
                Position = v8(v34[l_BrushSettings_0.PivotPosition], v34[l_BrushSettings_0.State].Position, if v34[l_BrushSettings_0.BrushShape] == l_BrushShape_0.Sphere then v35.Size else v35.Height * l_VoxelResolution_0)
            };
        end, 
        OnStep = function(v36, v37)
            assert(v36.State, "Tried to step without starting first.");
            if not (not v26 or not v22.ProfileTools()) then
                debug.profilebegin("Sculpt");
            end;
            local l_State_0 = v36.State;
            local v39 = v36.Payload[l_Category_0.BrushSettings];
            local v40 = v39[l_BrushSettings_0.BrushSize];
            local l_Height_0 = v40.Height;
            local l_Size_0 = v40.Size;
            local v43 = v39[l_BrushSettings_0.BrushMode];
            local v44 = v39[l_BrushSettings_0.BrushShape];
            local v45 = v39[l_BrushSettings_0.IgnoreWater];
            local v46 = v39[l_BrushSettings_0.Strength];
            local v47 = if not v23() then nil else v39[l_BrushSettings_0.WaterAutofill];
            local v48 = v39[l_BrushSettings_0.State];
            local v49 = v39[l_BrushSettings_0.TemporarySmooth];
            local v50 = false;
            if v44 == l_BrushShape_0.Sphere then
                v50 = l_Size_0 > 2;
            end;
            local v51;
            if v44 == l_BrushShape_0.Cylinder then
                v51 = true;
                if not (l_Size_0 <= 2) then
                    goto label0;
                end;
            end;
            v51 = v50;
            ::label0::;
            if not v49 then
                if l_State_0.Smooth then
                    l_State_0.Smooth:cancel();
                    l_State_0.Smooth = nil;
                    l_State_0.Position = v48.Position;
                end;
                local v52 = v36.Payload[l_Category_0.MaterialSettings];
                local v53 = v52[l_MaterialSettings_0.AutoMaterial];
                local v54 = v52[l_MaterialSettings_0.SourceMaterial];
                local v55 = if v44 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0 * l_VoxelResolution_0;
                local v56 = (l_Size_0 * l_VoxelResolution_0) * 0.5;
                local v57 = Vector3.new(1, 0, 1);
                local v58 = v9(l_State_0.Position, v8(v39[l_BrushSettings_0.PivotPosition], v48.Position, v55), v56);
                l_State_0.Position = v58[#v58];
                for _, v60 in v58, nil, nil do
                    local v61, v62 = v7(v60, v56, v55);
                    local v63 = Region3.new(v61, v62);
                    local v64 = (v62.X - v61.X) * 0.5;
                    local v65 = {};
                    local v66, v67 = v29.Terrain:ReadVoxels(v63, l_VoxelResolution_0);
                    local v68, v69 = v29.Terrain:ReadVoxels(v63, l_VoxelResolution_0);
                    local v70 = nil;
                    local v71 = nil;
                    if v47 then
                        local v72, v73 = v29.Terrain:ReadVoxels(v63, l_VoxelResolution_0);
                        v70 = v72;
                        v71 = v73;
                    end;
                    local v74 = nil;
                    if v25() then
                        v74 = os.clock();
                    end;
                    v66.Size = nil;
                    v67.Size = nil;
                    local v75 = #v66;
                    local v76 = #v66[1];
                    local v77 = #v66[1][1];
                    local v78 = if not v26 then {} else table.create((v75 * v76) * v77, false);
                    local v79 = 0;
                    local v80 = Vector3.new(v75, v76, v77);
                    local v81 = nil;
                    local v82 = nil;
                    if v47 and v43 == l_BrushMode_0.Subtract then
                        local v83, v84 = v6(v66, v67);
                        v81 = v83;
                        v82 = v84;
                    end;
                    local v85 = Vector3.new(math.round((v60.X - v61.X) / l_VoxelResolution_0), math.round((v60.Y - v61.Y) / l_VoxelResolution_0), (math.round((v60.Z - v61.Z) / l_VoxelResolution_0)));
                    for v86 = -1, 1 do
                        for v87 = -1, 1 do
                            for v88 = -1, 1 do
                                local v89 = v85 + Vector3.new(v86, v87, v88);
                                local v90 = false;
                                if v89.X > 0 then
                                    v90 = v89.X <= v80.X;
                                end;
                                local v91 = false;
                                if v89.Y > 0 then
                                    v91 = v89.Y <= v80.Y;
                                end;
                                local v92 = false;
                                if v89.Z > 0 then
                                    v92 = v89.Z <= v80.Z;
                                end;
                                if not ((not v90 or not v91) or not v92) then
                                    v78[v89.X + v80.X * (v89.Y + v80.X * v89.Z)] = true;
                                    v79 = v79 + 1;
                                    table.insert(v65, v89);
                                end;
                            end;
                        end;
                    end;
                    do
                        local l_v70_0, l_v71_0, l_v79_0, l_v81_0, l_v82_0 = v70, v71, v79, v81, v82;
                        local function v120(v98, v99, v100, v101)
                            local v102 = 1;
                            local v103 = 1;
                            if not v26 then
                                local v104, v105 = v11(v99, l_Size_0, v44, v64);
                                v102 = v104;
                                v103 = v105;
                            elseif v51 then
                                local _ = if not v50 then (v99 * v57).Magnitude else v99.Magnitude;
                                v102 = v4(v99.Magnitude, v64);
                                v103 = v5(v99.Magnitude, v64);
                            end;
                            if not (v100 ~= 0) or v102 <= 0.5 then
                                return ;
                            else
                                local v107 = false;
                                local v108 = #v27;
                                for _, v110 in v27, nil, nil do
                                    local v111 = v98 + v110;
                                    local v112 = false;
                                    if v111.X > 0 then
                                        v112 = v111.X <= v80.X;
                                    end;
                                    local v113 = false;
                                    if v111.Y > 0 then
                                        v113 = v111.Y <= v80.Y;
                                    end;
                                    local v114 = false;
                                    if v111.Z > 0 then
                                        v114 = v111.Z <= v80.Z;
                                    end;
                                    if not ((not v112 or not v113) or not v114) then
                                        local v115 = v67[v111.X][v111.Y][v111.Z];
                                        local v116 = v66[v111.X][v111.Y][v111.Z];
                                        if v45 and v116 == Enum.Material.Water then
                                            v115 = 0;
                                        end;
                                        if v115 <= 0 then
                                            v107 = true;
                                        end;
                                        v108 = v108 - v115;
                                    end;
                                end;
                                local v117 = nil;
                                v117 = if not v26 then math.min(if not (v100 >= 1) or v107 then v100 - ((((v108 / #v27) * (v46 + 0.05)) * 0.05) * v102) * v103 else v100, v12.MaximumOccupancy) else math.min(if not (v100 >= 1) or v107 then v100 - ((((v108 / #v27) * (v46 + 0.05)) * (l_Size_0 / 256 + 0.01)) * v102) * v103 else v100, v12.MaximumOccupancy);
                                local v118 = if not not l_v81_0 and v98.Y <= l_v81_0 then Enum.Material.Water else Enum.Material.Air;
                                local v119 = if v98.Y == l_v81_0 then l_v82_0 else 1;
                                if v117 <= v12.MinimumOccupancy then
                                    if l_v81_0 and v98.Y <= l_v81_0 then
                                        l_v71_0[v98.X][v98.Y][v98.Z] = 0;
                                        l_v70_0[v98.X][v98.Y][v98.Z] = Enum.Material.Air;
                                    end;
                                    v69[v98.X][v98.Y][v98.Z] = v118 == Enum.Material.Water and v119 or 0;
                                    v68[v98.X][v98.Y][v98.Z] = v118;
                                    return ;
                                elseif l_v81_0 and v98.Y <= l_v81_0 then
                                    l_v71_0[v98.X][v98.Y][v98.Z] = v117;
                                    l_v70_0[v98.X][v98.Y][v98.Z] = v101;
                                    v69[v98.X][v98.Y][v98.Z] = v119;
                                    v68[v98.X][v98.Y][v98.Z] = v118;
                                    return ;
                                else
                                    v69[v98.X][v98.Y][v98.Z] = v117;
                                    return ;
                                end;
                            end;
                        end;
                        local function v143(v121, v122, v123, v124)
                            local v125 = 1;
                            local v126 = 1;
                            if not v26 then
                                local v127, v128 = v11(v122, l_Size_0, v44, v64);
                                v125 = v127;
                                v126 = v128;
                            elseif v51 then
                                local _ = if not v50 then (v122 * v57).Magnitude else v122.Magnitude;
                                v125 = v4(v122.Magnitude, v64);
                                v126 = v5(v122.Magnitude, v64);
                            end;
                            if not (v123 ~= 1) or v125 < 0.5 then
                                return ;
                            else
                                local v130 = false;
                                local v131 = #v27;
                                local v132 = 0;
                                for _, v134 in v27, nil, nil do
                                    local v135 = v121 + v134;
                                    local v136 = false;
                                    if v135.X > 0 then
                                        v136 = v135.X < v80.X;
                                    end;
                                    local v137 = false;
                                    if v135.Y > 0 then
                                        v137 = v135.Y < v80.Y;
                                    end;
                                    local v138 = false;
                                    if v135.Z > 0 then
                                        v138 = v135.Z < v80.Z;
                                    end;
                                    if not ((not v136 or not v137) or not v138) then
                                        local v139 = v67[v135.X][v135.Y][v135.Z];
                                        local v140 = v66[v135.X][v135.Y][v135.Z];
                                        if v45 and v140 == Enum.Material.Water then
                                            v139 = 0;
                                        end;
                                        if v139 >= 1 then
                                            v130 = true;
                                        end;
                                        v132 = v132 + 1;
                                        v131 = v131 + v139;
                                    end;
                                end;
                                v131 = v132 == 0 and 0 or v131 / v132;
                                local v141 = nil;
                                v141 = math.min(if not v26 then if not (v123 <= 0) or v130 then v123 + (((v131 * (v46 + 0.05)) * 0.05) * v125) * v126 else v123 else if not (v123 <= 0) or v130 then v123 + (((v131 * (v46 + 0.05)) * (l_Size_0 / 256 + 0.01)) * v125) * v126 else v123, v12.MaximumOccupancy);
                                if v124 == Enum.Material.Air and v141 > 0 then
                                    if not v26 then
                                        v68[v121.X][v121.Y][v121.Z] = if not v53 then v54 else v10(v66, v121, v80, v45);
                                    else
                                        local v142 = if not v53 then v54 else v3(v121.X, v121.Y, v121.Z, v66, v80);
                                        if v45 and v142 == Enum.Material.Water then
                                            v142 = Enum.Material.Air;
                                        end;
                                        v68[v121.X][v121.Y][v121.Z] = v142;
                                    end;
                                end;
                                if v141 ~= v123 then
                                    v69[v121.X][v121.Y][v121.Z] = v141;
                                end;
                                return ;
                            end;
                        end;
                        local function v158(v144)
                            local v145 = true;
                            local v146 = true;
                            local v147 = true;
                            for v148 = -1, 1 do
                                for v149 = -1, 1 do
                                    for v150 = -1, 1 do
                                        local v151 = v144 + Vector3.new(v148, v149, v150);
                                        local v152 = false;
                                        if v151.X > 0 then
                                            v152 = v151.X <= v80.X;
                                        end;
                                        local v153 = false;
                                        if v151.Y > 0 then
                                            v153 = v151.Y <= v80.Y;
                                        end;
                                        local v154 = false;
                                        if v151.Z > 0 then
                                            v154 = v151.Z <= v80.Z;
                                        end;
                                        if not ((not v152 or not v153) or not v154) and (not (v148 == 0 and v149 == 0) or v150 ~= 0) then
                                            local v155 = v66[v151.X][v151.Y][v151.Z];
                                            local v156 = v67[v151.X][v151.Y][v151.Z];
                                            local v157 = v66[v151.X][v151.Y][v151.Z] == Enum.Material.Water;
                                            if not (not v45 or not v157) then
                                                v156 = 0;
                                            end;
                                            if v156 > 0 then
                                                v145 = false;
                                            end;
                                            if v156 < 1 then
                                                v146 = false;
                                            end;
                                            if v155 ~= Enum.Material.Water then
                                                v147 = true;
                                            end;
                                            if not ((v146 or v145) or l_v81_0 and not v147) then
                                                return false, false;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            return v145, v146, v147;
                        end;
                        local function v179(v159, v160)
                            local v161, v162, v163 = v158(v159);
                            local v164 = v67[v159.X][v159.Y][v159.Z];
                            local v165;
                            if v43 == l_BrushMode_0.Add then
                                v165 = v162 or (not (v164 ~= 0) or v160) and v161;
                            else
                                v165 = v161;
                                if not v165 then
                                    v165 = false;
                                    if v164 == 1 then
                                        v165 = not v160 and v162;
                                    end;
                                end;
                            end;
                            local v166 = false;
                            if v43 == l_BrushMode_0.Subtract then
                                v166 = l_v81_0 and v163;
                            end;
                            if not (v165 and not v166) then
                                for v167 = -1, 1 do
                                    for v168 = -1, 1 do
                                        for v169 = -1, 1 do
                                            local v170 = v159 + Vector3.new(v167, v168, v169);
                                            local v171 = false;
                                            if v170.X > 0 then
                                                v171 = v170.X <= v80.X;
                                            end;
                                            local v172 = false;
                                            if v170.Y > 0 then
                                                v172 = v170.Y <= v80.Y;
                                            end;
                                            local v173 = false;
                                            if v170.Z > 0 then
                                                v173 = v170.Z <= v80.Z;
                                            end;
                                            if not ((not v171 or not v172) or not v173) and (not (v167 == 0 and v168 == 0) or v169 ~= 0) then
                                                local v174 = v67[v170.X][v170.Y][v170.Z];
                                                local v175 = v66[v170.X][v170.Y][v170.Z];
                                                if if not v26 then v45 and v66[v170.X][v170.Y][v170.Z] == Enum.Material.Water else v45 and v175 == Enum.Material.Water then
                                                    v174 = 0;
                                                end;
                                                local v176 = false;
                                                local v177 = false;
                                                local v178 = if not v26 then l_v81_0 and v66[v170.X][v170.Y][v170.Z] == Enum.Material.Water else l_v81_0 and v175 == Enum.Material.Water;
                                                if v43 == l_BrushMode_0.Add then
                                                    v177 = v174 < 1;
                                                    if not (v164 ~= 0 and not v160) and v174 == 0 then
                                                        v177 = false;
                                                    end;
                                                elseif v43 == l_BrushMode_0.Subtract then
                                                    v176 = v174 > 0;
                                                    if not (not (v164 == 1) or v160) and v174 == 1 then
                                                        v176 = false;
                                                    end;
                                                end;
                                                if not (not (v177 or v176) and not v178 or v78[v170.X + v80.X * (v170.Y + v80.X * v170.Z)]) then
                                                    v78[v170.X + v80.X * (v170.Y + v80.X * v170.Z)] = true;
                                                    l_v79_0 = l_v79_0 + 1;
                                                    table.insert(v65, v170);
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        while #v65 > 0 do
                            local v180 = table.remove(v65);
                            local v181 = v67[v180.X][v180.Y][v180.Z];
                            local v182 = v66[v180.X][v180.Y][v180.Z];
                            local v183;
                            if v45 then
                                v183 = true;
                                if not (v182 ~= Enum.Material.Water) then
                                    goto label1;
                                end;
                            end;
                            v183 = v182 == Enum.Material.Air;
                            ::label1::;
                            local v184 = (v61 + (v180 - Vector3.new(0.5, 0.5, 0.5)) * l_VoxelResolution_0) - v60;
                            if l_v81_0 and v182 == Enum.Material.Water then
                                v179(v180, v183);
                            else
                                if not (v43 == l_BrushMode_0.Subtract and v181 > 0) or v183 then
                                    if not (not (v43 == l_BrushMode_0.Add) or v181 >= 1 and not v183) then
                                        if v45 and v182 == Enum.Material.Water then
                                            v182 = Enum.Material.Air;
                                            v181 = 0;
                                        end;
                                        v143(v180, v184, v181, v182);
                                    end;
                                else
                                    if v45 and v182 == Enum.Material.Water then
                                        v181 = 0;
                                    end;
                                    v120(v180, v184, v181, v182);
                                end;
                                v179(v180, v183);
                            end;
                        end;
                        if v25() then
                            v37:addTimeStatistic(v2.NormalizeDepthFirstSearch(v74, l_v79_0));
                        end;
                        if l_v81_0 then
                            v29.Terrain:WriteVoxels(v63, l_VoxelResolution_0, l_v70_0, l_v71_0);
                        end;
                        v29.Terrain:WriteVoxels(v63, l_VoxelResolution_0, v68, v69);
                    end;
                end;
                if not (not v26 or not v22.ProfileTools()) then
                    debug.profileend();
                end;
                return true, 0;
            else
                if l_State_0.Smooth then
                    l_State_0.Smooth:updatePayload(v36.Payload);
                else
                    local v185 = v14("Smooth", v29);
                    v185:start({
                        Payload = v36.Payload
                    });
                    l_State_0.Smooth = v185;
                end;
                return true, 0;
            end;
        end
    });
end;
