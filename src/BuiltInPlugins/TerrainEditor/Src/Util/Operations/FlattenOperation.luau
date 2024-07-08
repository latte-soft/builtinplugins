local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.Operations.BaseOperation);
local _ = require(l_Util_0.CalculateAutoMaterial);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.CalculateMagnitudePercent);
local v8 = require(l_Util_0.CalculateWaterLevel);
local v9 = require(l_Util_0.ClampVoxelBoundaries);
local v10 = require(l_Util_0.ConvertForPivot);
local v11 = require(l_Util_0.DebugFlags);
local v12 = require(l_Util_0.getDraggedPositions);
local v13 = require(l_Util_0.getPlaneIntersection);
local v14 = require(l_Util_0.DEPRECATED_CalculateAutoMaterial);
local v15 = require(l_Util_0.DEPRECATED_CalculateBrushPower);
local v16 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v16.BrushShape;
local l_BrushSettings_0 = v16.BrushSettings;
local l_Category_0 = v16.Category;
local l_FlattenMode_0 = v16.FlattenMode;
local l_FlattenPlane_0 = v16.FlattenPlane;
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorWaterAutofill);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local _ = v24();
local v26 = v1.VoxelResolution * 0.5;
local l_VoxelResolution_0 = v1.VoxelResolution;
return function(v28, v29)
    return v4.new({
        Budget = 0.005, 
        Name = v28, 
        OnFinish = function()
            v29.ChangeHistoryService:SetWaypoint("Flatten");
        end, 
        OnStart = function(v30, _)
            local v32 = v30.Payload[l_Category_0.BrushSettings];
            local v33 = v32[l_BrushSettings_0.BrushSize];
            local v34 = if v32[l_BrushSettings_0.FlattenPlane] == l_FlattenPlane_0.Auto then v10(v32[l_BrushSettings_0.PivotPosition], v32[l_BrushSettings_0.State].Position, if v32[l_BrushSettings_0.BrushShape] == l_BrushShape_0.Sphere then v33.Size else v33.Height * v1.VoxelResolution) else Vector3.new(0, v32[l_BrushSettings_0.FixedYPlane], 0);
            v30.State = {
                Plane = Vector3.yAxis, 
                PlanePosition = v34, 
                Position = v34
            };
        end, 
        OnStep = if not v24() then function(v35, v36)
            assert(v35.State, "Tried to step without starting first.");
            local l_State_0 = v35.State;
            local v38 = v35.Payload[l_Category_0.BrushSettings];
            local v39 = v38[l_BrushSettings_0.BrushSize];
            local l_Height_0 = v39.Height;
            local l_Size_0 = v39.Size;
            local v42 = v38[l_BrushSettings_0.BrushShape];
            local v43 = v38[l_BrushSettings_0.FlattenMode];
            local v44 = v38[l_BrushSettings_0.IgnoreWater];
            local v45 = v38[l_BrushSettings_0.PullTerrain];
            local v46 = v38[l_BrushSettings_0.Strength];
            local v47 = if not v22 then nil else v38[l_BrushSettings_0.WaterAutofill];
            local v48 = v38[l_BrushSettings_0.State];
            local v49 = true;
            if v43 ~= l_FlattenMode_0.Grow then
                v49 = v43 == l_FlattenMode_0.Both;
            end;
            local v50 = true;
            if v43 ~= l_FlattenMode_0.Erode then
                v50 = v43 == l_FlattenMode_0.Both;
            end;
            local v51 = if v42 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0 * v1.VoxelResolution;
            local v52 = (l_Size_0 * v1.VoxelResolution) * 0.5;
            local l_Plane_0 = l_State_0.Plane;
            local l_PlanePosition_0 = l_State_0.PlanePosition;
            local v55 = math.abs(l_Plane_0.X);
            local v56 = math.abs(l_Plane_0.Y);
            local v57 = math.abs(l_Plane_0.Z);
            local _ = v42 == l_BrushShape_0.Sphere;
            local _ = v42 == l_BrushShape_0.Cube;
            local v60 = if v57 <= v56 and v55 <= v56 then Vector3.new(0, l_Plane_0.Y > 0 and 1 or -1, 0) else if v56 <= v57 and v55 <= v57 then Vector3.new(0, 0, l_Plane_0.Z > 0 and 1 or -1) else Vector3.new(l_Plane_0.X > 0 and 1 or -1, 0, 0);
            local v61 = v10(v38[l_BrushSettings_0.PivotPosition], v48.Position, v51);
            local v62 = v12(l_State_0.Position, v61, v52);
            l_State_0.Position = v62[#v62];
            local v63, v64 = v9(v61, v52, v51);
            for _, v66 in v62, nil, nil do
                local v67 = Region3.new(v63, v64);
                local v68 = (v64.X - v63.X) * 0.5;
                local v69, v70 = v29.Terrain:ReadVoxels(v67, v1.VoxelResolution);
                v70.Size = nil;
                v69.Size = nil;
                local v71, v72 = v29.Terrain:ReadVoxels(v67, v1.VoxelResolution);
                local v73 = nil;
                if v23() then
                    v73 = os.clock();
                end;
                local v74 = #v69;
                local v75 = #v69[1];
                local v76 = #v69[1][1];
                local v77 = Vector3.new(v74, v75, v76);
                local v78 = nil;
                local v79 = nil;
                local v80 = {};
                local v81 = {};
                if v47 then
                    local v82, v83 = v8(v69, v70);
                    v78 = v82;
                    v79 = v83;
                    v82, v83 = v29.Terrain:ReadVoxels(v67, v1.VoxelResolution);
                    v80 = v82;
                    v81 = v83;
                end;
                local function v98(v84, v85, v86, v87, v88)
                    local v89, _ = v15(v85, l_Size_0, v42, v68);
                    local v91 = v69[v84.X][v84.Y][v84.Z];
                    local v92 = v70[v84.X][v84.Y][v84.Z];
                    if v89 > 0 and v92 > 0 then
                        v88 = true;
                    end;
                    if v88 then
                        if v89 > 0 then
                            if v26 < v87 and v92 < 1 then
                                local v93 = v92 + v86;
                                local v94 = v14(v69, v84, v77, v47) or v91;
                                v72[v84.X][v84.Y][v84.Z] = v94 == Enum.Material.Air and 0 or if v93 <= 1 then v93 else 1;
                                v71[v84.X][v84.Y][v84.Z] = v94 or v91;
                                v86 = v93 - 1;
                                if v86 > 0 then
                                    return v86, v88;
                                else
                                    return 0, v88;
                                end;
                            elseif v87 <= v26 and -v26 < v87 then
                                local v95 = (v87 + v26) / v1.VoxelResolution;
                                local v96 = v92 + v86;
                                local v97 = if v91 == Enum.Material.Air then v14(v69, v84, v77, v47) or v91 else v91;
                                v72[v84.X][v84.Y][v84.Z] = v97 == Enum.Material.Air and 0 or if v96 <= v95 then v96 else v95;
                                v71[v84.X][v84.Y][v84.Z] = v97 or v91;
                                return 0, v88, v92 < v72[v84.X][v84.Y][v84.Z];
                            end;
                        end;
                        return v86, v88;
                    else
                        return v86, v88;
                    end;
                end;
                do
                    local l_v78_0, l_v79_0, l_v80_0, l_v81_0 = v78, v79, v80, v81;
                    local function v115(v103, v104, v105, v106, v107)
                        local v108, _ = v15(v104, l_Size_0, v42, v68);
                        local v110 = v70[v103.X][v103.Y][v103.Z];
                        local v111 = v69[v103.X][v103.Y][v103.Z];
                        if v44 and v111 == Enum.Material.Water then
                            return v105, v107;
                        else
                            local v112;
                            if v108 > 0 then
                                v112 = true;
                                if v110 >= 1 then
                                    if v47 then
                                        v112 = true;
                                        if not (v111 ~= Enum.Material.Water) then
                                            goto label0;
                                        end;
                                    end;
                                else
                                    goto label0;
                                end;
                            end;
                            v112 = v107;
                            ::label0::;
                            v107 = v112;
                            if v107 then
                                if v108 > 0 then
                                    if ((v47 and v103.Y <= l_v78_0) and v110 == 0) and v26 < v106 then
                                        v72[v103.X][v103.Y][v103.Z] = if v103.Y == l_v78_0 then l_v79_0 else 1;
                                        v71[v103.X][v103.Y][v103.Z] = Enum.Material.Water;
                                    elseif (v26 < v106 and v110 > 0) and (not v47 or v111 ~= Enum.Material.Water) then
                                        v112 = v110 - v105;
                                        if v47 and v103.Y <= l_v78_0 then
                                            l_v81_0[v103.X][v103.Y][v103.Z] = if v112 >= 0 then v112 else 0;
                                            l_v80_0[v103.X][v103.Y][v103.Z] = if v112 <= 0 then Enum.Material.Air else v111;
                                            v72[v103.X][v103.Y][v103.Z] = if v103.Y == l_v78_0 then l_v79_0 else 1;
                                            v71[v103.X][v103.Y][v103.Z] = Enum.Material.Water;
                                        else
                                            v72[v103.X][v103.Y][v103.Z] = if v112 >= 0 then v112 else 0;
                                            v71[v103.X][v103.Y][v103.Z] = if v112 <= 0 then Enum.Material.Air else v111;
                                        end;
                                        v105 = v105 - v110;
                                        if v105 > 0 then
                                            return v105, v107;
                                        else
                                            return 0, v107;
                                        end;
                                    elseif (v106 <= v26 and -v26 < v106) and (not v47 or v111 ~= Enum.Material.Water) then
                                        v112 = 1 - (v106 + v26) / v1.VoxelResolution;
                                        local v113 = v110 - v105;
                                        if v47 and v103.Y <= l_v78_0 then
                                            if v112 <= v113 then
                                                v72[v103.X][v103.Y][v103.Z] = if v103.Y == l_v78_0 then l_v79_0 else 1;
                                                v71[v103.X][v103.Y][v103.Z] = Enum.Material.Water;
                                                l_v81_0[v103.X][v103.Y][v103.Z] = v113;
                                                l_v80_0[v103.X][v103.Y][v103.Z] = v111;
                                            else
                                                v72[v103.X][v103.Y][v103.Z] = if v103.Y == l_v78_0 then l_v79_0 else 1;
                                                v71[v103.X][v103.Y][v103.Z] = Enum.Material.Water;
                                                l_v81_0[v103.X][v103.Y][v103.Z] = v112;
                                                l_v80_0[v103.X][v103.Y][v103.Z] = v111;
                                            end;
                                        else
                                            local v114 = if v112 <= v113 then v113 else v112;
                                            v72[v103.X][v103.Y][v103.Z] = v114;
                                            v71[v103.X][v103.Y][v103.Z] = if v114 <= 0 then Enum.Material.Air else v111;
                                        end;
                                        return 0, v107;
                                    end;
                                end;
                                return v105, v107;
                            else
                                return v105, v107;
                            end;
                        end;
                    end;
                    local function _(v116, v117)
                        return v116 * v63 + v116 * (v117 * v1.VoxelResolution);
                    end;
                    local function v158(v119, v120, v121)
                        local l_Direction_0 = v119.Direction;
                        local v123 = v119.Increment or 1;
                        local l_Size_1 = v119.Size;
                        local l_Direction_1 = v120.Direction;
                        local l_Size_2 = v120.Size;
                        local l_Direction_2 = v121.Direction;
                        local l_Size_3 = v121.Size;
                        local v129 = if v123 < 0 then l_Size_1 else 1;
                        local v130 = v123 < 0 and 1 or l_Size_1;
                        local v131 = l_Direction_0 * v63 + l_Direction_0 * (v129 * v1.VoxelResolution);
                        local v132 = l_Direction_0 * v63 + l_Direction_0 * (v130 * v1.VoxelResolution);
                        local v133 = l_Plane_0 * Vector3.new(-1, -1, -1);
                        local v134 = l_Direction_0 * v123;
                        local v135 = v134 * Vector3.new(-1, -1, -1);
                        for v136 = 1, l_Size_2 do
                            local v137 = l_Direction_1 * v63 + l_Direction_1 * (v136 * v1.VoxelResolution);
                            local v138 = v136 * l_Direction_1;
                            for v139 = 1, l_Size_3 do
                                local v140 = (l_Direction_2 * v63 + l_Direction_2 * (v139 * v1.VoxelResolution)) + v137;
                                local v141 = v139 * l_Direction_2;
                                local l_v46_0 = v46;
                                local l_v46_1 = v46;
                                local v144 = not v45;
                                local v145 = not v45;
                                local _, v147 = v13(v131 + v140, v134, l_PlanePosition_0, v133);
                                local _, v149 = v13(v132 + v140, v135, l_PlanePosition_0, l_Plane_0);
                                v147 = math.round(v147 * 256) / 256;
                                v149 = math.round(v149 * 256) / 256;
                                local v150 = false;
                                for v151 = v129, v130, v123 do
                                    if (v49 and -v1.VoxelResolution / 2 < v147) and l_v46_0 ~= 0 then
                                        local v152, v153, v154 = v98((l_Direction_0 * v151 + v138) + v141, ((l_Direction_0 * v63 + l_Direction_0 * (v151 * v1.VoxelResolution)) + v140) - v66, l_v46_0, v147, v144);
                                        l_v46_0 = v152;
                                        v144 = v153;
                                        v150 = v154;
                                        v147 = v147 - v1.VoxelResolution;
                                    end;
                                end;
                                if not v150 then
                                    for v155 = v130, v129, -v123 do
                                        if (v50 and -v1.VoxelResolution / 2 < v149) and l_v46_1 ~= 0 then
                                            local v156, v157 = v115((l_Direction_0 * v155 + v138) + v141, ((l_Direction_0 * v63 + l_Direction_0 * (v155 * v1.VoxelResolution)) + v140) - v66, l_v46_1, v149, v145);
                                            l_v46_1 = v156;
                                            v145 = v157;
                                            v149 = v149 - v1.VoxelResolution;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v60.X ~= 0 then
                        v158({
                            Direction = Vector3.xAxis, 
                            Increment = v60.X, 
                            Size = v74
                        }, {
                            Direction = Vector3.yAxis, 
                            Size = v75
                        }, {
                            Direction = Vector3.zAxis, 
                            Size = v76
                        });
                    elseif v60.Y ~= 0 then
                        v158({
                            Direction = Vector3.yAxis, 
                            Increment = v60.Y, 
                            Size = v75
                        }, {
                            Direction = Vector3.xAxis, 
                            Size = v74
                        }, {
                            Direction = Vector3.zAxis, 
                            Size = v76
                        });
                    elseif v60.Z ~= 0 then
                        v158({
                            Direction = Vector3.zAxis, 
                            Increment = v60.Z, 
                            Size = v76
                        }, {
                            Direction = Vector3.xAxis, 
                            Size = v74
                        }, {
                            Direction = Vector3.yAxis, 
                            Size = v75
                        });
                    end;
                    if v23() then
                        v36:addTimeStatistic(v3.NormalizeBrushTimer(v73, l_Size_0, l_Height_0));
                    end;
                    if v47 then
                        v29.Terrain:WriteVoxels(v67, v1.VoxelResolution, l_v80_0, l_v81_0);
                    end;
                    v29.Terrain:WriteVoxels(v67, v1.VoxelResolution, v71, v72);
                end;
            end;
            return true, 0;
        end else function(v159, v160)
            assert(v159.State, "Tried to step without starting first.");
            if v11.ProfileTools() then
                debug.profilebegin("Flatten");
            end;
            local l_State_1 = v159.State;
            local v162 = v159.Payload[l_Category_0.BrushSettings];
            local v163 = v162[l_BrushSettings_0.BrushSize];
            local l_Height_1 = v163.Height;
            local l_Size_4 = v163.Size;
            local v166 = v162[l_BrushSettings_0.BrushShape];
            local v167 = v162[l_BrushSettings_0.FlattenMode];
            local v168 = v162[l_BrushSettings_0.IgnoreWater];
            local _ = v162[l_BrushSettings_0.PullTerrain];
            local v170 = v162[l_BrushSettings_0.Strength];
            local v171 = v162[l_BrushSettings_0.State];
            local v172 = true;
            if v167 ~= l_FlattenMode_0.Grow then
                v172 = v167 == l_FlattenMode_0.Both;
            end;
            local v173 = true;
            if v167 ~= l_FlattenMode_0.Erode then
                v173 = v167 == l_FlattenMode_0.Both;
            end;
            local v174 = if v166 == l_BrushShape_0.Sphere then l_Size_4 else l_Height_1 * v1.VoxelResolution;
            local v175 = (l_Size_4 * v1.VoxelResolution) * 0.5;
            local l_Plane_1 = l_State_1.Plane;
            local l_PlanePosition_1 = l_State_1.PlanePosition;
            local v178 = math.abs(l_Plane_1.X);
            local v179 = math.abs(l_Plane_1.Y);
            local v180 = math.abs(l_Plane_1.Z);
            local _ = v166 == l_BrushShape_0.Sphere;
            local _ = v166 == l_BrushShape_0.Cube;
            local _ = if v180 <= v179 and v178 <= v179 then Vector3.new(0, l_Plane_1.Y > 0 and 1 or -1, 0) else if v179 <= v180 and v178 <= v180 then Vector3.new(0, 0, l_Plane_1.Z > 0 and 1 or -1) else Vector3.new(l_Plane_1.X > 0 and 1 or -1, 0, 0);
            local v184 = v10(v162[l_BrushSettings_0.PivotPosition], v171.Position, v174);
            local v185 = v12(l_State_1.Position, v184, v175);
            l_State_1.Position = v185[#v185];
            local v186, v187 = v9(v184, v175, v174);
            for _, v189 in v185, nil, nil do
                local v190 = Region3.new(v186, v187);
                local v191 = (v187.X - v186.X) * 0.5;
                local v192, v193 = v29.Terrain:ReadVoxels(v190, v1.VoxelResolution);
                v193.Size = nil;
                v192.Size = nil;
                local v194, v195 = v29.Terrain:ReadVoxels(v190, v1.VoxelResolution);
                local v196 = #v192;
                local v197 = #v192[1];
                local v198 = #v192[1][1];
                local _ = Vector3.new(v196, v197, v198);
                local v200 = (l_PlanePosition_1.Y - v189.Y) / v1.VoxelResolution;
                local v201 = v189.Y / v1.VoxelResolution;
                local v202 = math.clamp(math.floor((v200 + v197 / 2) + (v201 - math.floor(v201))), 1, v197);
                local v203 = math.floor((((l_PlanePosition_1.Y + 2) % v1.VoxelResolution) / v1.VoxelResolution) * 256) / 256;
                local v204 = false;
                if v166 == l_BrushShape_0.Sphere then
                    v204 = l_Size_4 > 2;
                end;
                local v205;
                if v166 == l_BrushShape_0.Cylinder then
                    v205 = true;
                    if not (l_Size_4 <= 2) then
                        goto label1;
                    end;
                end;
                v205 = v204;
                ::label1::;
                local v206 = (v186.X - l_VoxelResolution_0 * 0.5) - v189.X;
                local v207 = (v186.Y - l_VoxelResolution_0 * 0.5) - v189.Y;
                local v208 = (v186.Z - l_VoxelResolution_0 * 0.5) - v189.Z;
                local v209 = nil;
                local v210 = nil;
                local v211 = nil;
                local v212 = nil;
                if v23() then
                    v212 = os.clock();
                end;
                for v213 = 1, v196 do
                    if v205 then
                        v209 = (v213 * v1.VoxelResolution + v206) ^ 2;
                    end;
                    local v214 = v193[v213];
                    local v215 = v192[v213];
                    local v216 = v195[v213];
                    local v217 = v194[v213];
                    for v218 = 1, v198 do
                        local v219 = 1;
                        if v205 then
                            v210 = (v218 * v1.VoxelResolution + v208) ^ 2;
                            v211 = math.sqrt(v209 + v210);
                            v219 = v7(v211, v191);
                        end;
                        local v220 = (v219 * v170) * 0.1;
                        local v221 = (v219 * v170) * 0.1;
                        local v222 = false;
                        local v223 = false;
                        if v172 then
                            for v224 = 1, v202 do
                                local v225 = v214[v224][v218];
                                local v226 = v215[v224][v218];
                                local v227 = 1;
                                if v205 then
                                    v227 = v6(if not v204 then v211 else math.sqrt((v209 + v210) + (v224 * v1.VoxelResolution + v207) ^ 2), v191);
                                end;
                                if v227 > 0 and (not (v225 == 0) or v223) then
                                    v223 = true;
                                    if v225 ~= 1 then
                                        local v228 = v225 + v220;
                                        if v228 > 1 then
                                            v220 = v228 - 1;
                                            v228 = 1;
                                        else
                                            v220 = 0;
                                        end;
                                        if v224 == v202 and v203 < v228 then
                                            v228 = v203;
                                        end;
                                        if v225 == 0 and v224 > 1 then
                                            v226 = v192[v213][v224 - 1][v218];
                                        end;
                                        if not (not (not v168 or v226 ~= Enum.Material.Water) or not v226) and v225 ~= v228 then
                                            v216[v224][v218] = v228;
                                            v217[v224][v218] = v226;
                                            v222 = true;
                                            if not (v220 ~= 0) then
                                                break;
                                            end;
                                        else
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        exitedTerrain = false;
                        if v173 then
                            for v229 = v197, v202, -1 do
                                local v230 = v214[v229][v218];
                                local v231 = v215[v229][v218];
                                local v232 = 1;
                                if v205 then
                                    v232 = v6(if not v204 then v211 else math.sqrt((v209 + v210) + (v229 * v1.VoxelResolution + v207) ^ 2), v191);
                                end;
                                if v232 > 0 and (not (v230 == 1) or exitedTerrain) then
                                    exitedTerrain = true;
                                    if v230 ~= 0 then
                                        local v233 = v230 - v221;
                                        if v233 < 0 then
                                            v221 = -v233;
                                            v233 = 0;
                                        else
                                            v221 = 0;
                                        end;
                                        if v229 == v202 and v233 < v203 then
                                            v233 = v203;
                                        end;
                                        if v233 == 0 then
                                            v231 = Enum.Material.Air;
                                        end;
                                        if not v168 or v231 ~= Enum.Material.Water then
                                            v216[v229][v218] = v233;
                                            v217[v229][v218] = v231;
                                            if not (v221 ~= 0) then
                                                break;
                                            end;
                                        else
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if v23() then
                    v160:addTimeStatistic(v3.NormalizeBrushTimer(v212, l_Size_4, l_Height_1));
                end;
                v29.Terrain:WriteVoxels(v190, v1.VoxelResolution, v194, v195);
            end;
            if v11.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        end
    });
end;
