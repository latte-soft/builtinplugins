local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = require(l_Parent_0.Src.Util.Constants);
local l_Biome_0 = require(l_Parent_0.Src.Util.TerrainEnums).Biome;
local v4 = require(l_Parent_0.Src.Util.quickWait);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Material_0 = Enum.Material;
local v7 = {
    l_Material_0.Rock, 
    l_Material_0.Mud, 
    l_Material_0.Sand, 
    l_Material_0.Sand, 
    l_Material_0.Sandstone, 
    l_Material_0.Sandstone, 
    l_Material_0.Sandstone, 
    l_Material_0.Sandstone, 
    l_Material_0.Sandstone, 
    l_Material_0.Sandstone
};
local l_Grass_0 = l_Material_0.Grass;
local l_Rock_0 = l_Material_0.Rock;
local v10 = nil;
math.randomseed(6180339);
v10 = {};
for _ = 1, 999 do
    table.insert(v10, math.random());
end;
local function v18(v12)
    local v13 = tostring(v12);
    local v14 = 0;
    for v15 = 1, #v13 do
        local v16 = v13:sub(v15, v15);
        local v17 = tonumber(v16);
        v14 = if not v17 then (v14 + 7) * (v16:byte() + 3) else (v14 + 6) * (v17 + 5) % 61803;
    end;
    return v14;
end;
local function _(v19, v20, v21)
    if v19 <= v20 then
        return 0;
    elseif v20 + v21 <= v19 then
        return 1;
    else
        return (v19 - v20) / v21;
    end;
end;
local function _(v23)
    return v23 < 0.5 and v23 * 2 or 2 - v23 * 2;
end;
local function _(v25)
    return v25 < 0.5 and 1 - v25 * 2 or v25 * 2 - 1;
end;
local function v39(v27, v28, v29, v30, v31, v32, v33, v34)
    v31 = v31 or 3;
    v32 = v32 or 0.5;
    v33 = v33 or 0;
    v34 = v34 or 1;
    local v35 = 0;
    local v36 = 0;
    for v37 = 1, v31 do
        local v38 = v32 ^ (v37 - 1);
        v36 = v36 + v38;
        v35 = v35 + (v33 + v34 * v27(v28, v29, v30, v37)) * v38;
    end;
    return v35 / v36;
end;
local function _(v40, v41, v42, v43)
    if v40 == l_Biome_0.Arctic then
        return (v41 > 0.2 and 1 or 0) * v42;
    elseif v40 == l_Biome_0.Canyons then
        return (v41 > 0.7 and 1 or 0) * v42;
    elseif v40 == l_Biome_0.Mountains then
        local v44 = v41 ^ 3;
        return v43 * (1 - v44) + v42 * v44;
    else
        return v43 * (1 - v41) + v42 * v41;
    end;
end;
return function(v46, v47, v48)
    assert(v46, "makeTerrainGenerator requires a terrain instance");
    assert(v47 and type(v47) == "table", "makeTerrainGenerator requires a generate settings table");
    local l_position_0 = v47.position;
    local l_size_0 = v47.size;
    local l_biomeSelection_0 = v47.biomeSelection;
    local l_biomeSize_0 = v47.biomeSize;
    local l_haveCaves_0 = v47.haveCaves;
    local l_seed_0 = v47.seed;
    local v55 = v18(l_seed_0);
    local v56 = 0.5 / (l_size_0.Y / v2.VOXEL_RESOLUTION);
    local v57 = {};
    for v58, v59 in pairs(l_biomeSelection_0) do
        if v59 then
            table.insert(v57, v58);
        end;
    end;
    if #v57 == 0 then
        table.insert(v57, l_Biome_0.Hills);
    end;
    local v60 = #v57;
    local v61 = l_size_0 / 2;
    local v62 = Region3.new(l_position_0 - v61, l_position_0 + v61):ExpandToGrid(v2.VOXEL_RESOLUTION);
    local v63 = v62.Size / v2.VOXEL_RESOLUTION;
    local v64 = v63 / 2;
    l_position_0 = v62.CFrame.Position;
    local v65 = l_position_0 / v2.VOXEL_RESOLUTION;
    local v66 = v65.x - v63.x / 2;
    local v67 = v65.z - v63.z / 2;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    v68 = function(v72, v73, v74, v75, v76, v77)
        v75 = v75 or 0;
        v76 = v76 or 1;
        local v78 = math.noise((v72 / v76 + v75 * 17) + v55, v73 / v76 - v55, v74 / v76 - v75 * v75);
        if v77 then
            return v78;
        else
            return v78 * 0.5 + 0.5;
        end;
    end;
    v69 = function(v79, v80, v81, v82)
        v79 = v79 or 0;
        v80 = v80 or 0;
        v81 = v81 or 0;
        v82 = v82 or 7;
        return v10[math.floor(((((((v79 + v80) + v81) + v82) + v55) + (v55 - v79) * (v82 + v81)) + (v82 - v80) * (v55 + v81)) % #v10) + 1];
    end;
    local function v88(v83, v84, v85, v86)
        local v87 = v68(v83, v84, v85, 100 + v86, (1 / v86) * 160);
        return v87 < 0.5 and v87 * 2 or 2 - v87 * 2;
    end;
    local l_v88_0 = v88 --[[ copy: 24 -> 38 ]];
    v70 = {
        [l_Biome_0.Water] = function(v90, v91, v92, v93)
            return 0.36 + v68(v90, v91, v92, 2, 50) * 0.08, 1 - v93 < 0.44 and l_Material_0.Slate or l_Material_0.Sand, l_Material_0.Rock;
        end, 
        [l_Biome_0.Marsh] = function(v94, v95, v96, v97)
            local v98 = v68((v94 + v68(v94, 0, v96, 5, 7, true) * 10) + v68(v94, 0, v96, 6, 30, true) * 50, 0, (v96 + v68(v94, 0, v96, 9, 7, true) * 10) + v68(v94, 0, v96, 10, 30, true) * 50, 2, 70);
            local v99 = v98 <= 0.65 and 0 or (v98 >= 0.65 and 1 or (v98 - 0.65) / 0);
            return ((0.44 + (v98 * v99) * 0.025) + v68(v94, v95, v96, 4, 100) * 0.035) + v68(v94, v95, v96, 3, 20) * 0.025, ((v99 >= 1 and l_Material_0.Grass or 1 - v97 < 0.47 and l_Material_0.Mud) or 1 - v97 < 0.49 and l_Material_0.Ground) or l_Material_0.Grass, l_Material_0.Slate;
        end, 
        [l_Biome_0.Plains] = function(v100, v101, v102, v103)
            local v104 = v68(v100 + v68(v100, v101, v102, 17, 40) * 25, 0, v102 + v68(v100, v101, v102, 19, 40) * 25, 2, 200);
            local v105 = v104 < 0.5 and 1 - v104 * 2 or v104 * 2 - 1;
            v104 = v105 <= 0.01 and 0 or (v105 >= 0.01 and 1 or (v105 - 0.01) / 0);
            local v106 = v68(v100, 0, v102, 101, 7);
            local v107 = v106 < 0.5 and 1 - v106 * 2 or v106 * 2 - 1;
            local v108 = v107 <= 0.3 and 0 or (v107 >= 1 and 1 or (v107 - 0.3) / 0.7);
            v106 = v68(v100, 0, v102, 102, 50);
            local v109 = v108 * (v106 <= 0.6 and 0 or (v106 >= 0.65 and 1 or (v106 - 0.6) / 0.05));
            v108 = (((0.5 + v68(v100, v101, v102, 2, 100) * 0.02) + v105 * 0.05) + v109 * 0.05) + v104 * 0.005;
            v106 = (1 - (v101 - 1) / (v56 - 1)) * 0.5 + v108 * 0.5;
            local v110 = false;
            if v106 > 0.4928 then
                v110 = v106 < 0.5072;
            end;
            return v108, (((v109 > 0 and l_Material_0.Rock or not v110 and l_Material_0.Mud) or (v110 and v104 <= 0) and l_Material_0.Water) or 1 - v103 < 0.47 and l_Material_0.Sand) or l_Material_0.Grass, v109 > 0 and l_Material_0.Rock or l_Material_0.Sandstone;
        end, 
        [l_Biome_0.Canyons] = function(v111, v112, v113, v114)
            local v115 = v68(v111, 0, v113, 2, 200);
            local v116 = v115 < 0.5 and 1 - v115 * 2 or v115 * 2 - 1;
            local v117 = v68(v111 + v68(v111, 0, v113, 5, 20, true) * 20, 0, v113 + v68(v111, 0, v113, 9, 20, true) * 20, 2, 200);
            v115 = v117 < 0.5 and 1 - v117 * 2 or v117 * 2 - 1;
            v117 = v115 <= 0 and 0 or (v115 >= 0.05 and 1 or (v115 - 0) / 0.05);
            return ((((((((((0.42 + v68(v111, v112, v113, 2, 70) * 0.05) + v116 * 0.05) + v117 * 0.04) + (v115 <= 0.05 and 0 or (v115 >= 0.05 and 1 or (v115 - 0.05) / 0)) * 0.08) + (v115 <= 0.05 and 0 or (v115 >= 0.125 and 1 or (v115 - 0.05) / 0.075)) * 0.04) + (v115 <= 0.125 and 0 or (v115 >= 0.125 and 1 or (v115 - 0.125) / 0)) * 0.01) + (v115 <= 0.0575 and 0 or (v115 >= 0.33 and 1 or (v115 - 0.0575) / 0.2725)) * 0.01) + (v116 <= 0.33 and 0 or (v116 >= 0.45 and 1 or (v116 - 0.33) / 0.12)) * 0.06) + (v115 <= 0.45 and 0 or (v115 >= 0.45 and 1 or (v115 - 0.45) / 0)) * 0.14) + (v115 <= 0.45 and 0 or (v115 >= 0.49 and 1 or (v115 - 0.45) / 0.04)) * 0.025) + (v115 <= 0.49 and 0 or (v115 >= 0.49 and 1 or (v115 - 0.49) / 0)) * 0.02, (1 - v114 < 0.495 and l_Material_0.Sand or (v117 > 0 and v117 < 1) and l_Material_0.Sand) or l_Material_0.Sandstone, v7[math.ceil((1 - v69(1, v112, 2)) * 10)];
        end, 
        [l_Biome_0.Hills] = function(v118, v119, v120, v121)
            local v122 = v68(v118 + v68(v118, v119, v120, 17, 20) * 20, 0, v120 + v68(v118, v119, v120, 19, 20) * 20, 2, 200);
            local v123 = (v122 < 0.5 and 1 - v122 * 2 or v122 * 2 - 1) ^ 0.5;
            local v124 = v68(v118, v119, v120, 3, 60);
            v122 = (0.48 + v124 * 0.05) + ((0.05 + v124 * 0.1) + v68(v118, v119, v120, 4, 25) * 0.125) * v123;
            local v125 = (1 - v121) * 0.9 + v123 * 0.1;
            return v122, (v125 < 0.46499999999999997 and l_Material_0.Mud or v125 < 0.48 and l_Material_0.Ground) or l_Material_0.Grass, l_Material_0.Slate;
        end, 
        [l_Biome_0.Dunes] = function(v126, _, v128, _)
            local v130 = v68(v126, 0, v128, 227, 20) * 24;
            local v131 = v68(v126, 0, v128, 201, 40);
            local v132 = v131 < 0.5 and v131 * 2 or 2 - v131 * 2;
            local v133 = v68(v126 / 10 + v130, 0, v128 + v130, 200, 48);
            return 0.4 + 0.1 * (v132 + (v133 < 0.5 and v133 * 2 or 2 - v133 * 2)), l_Material_0.Sand, l_Material_0.Sandstone;
        end, 
        [l_Biome_0.Mountains] = function(v134, v135, v136, v137)
            local v138 = v68(v134 + v68(v134, v135, v136, 17, 20) * 20, 0, v136 + v68(v134, v135, v136, 19, 20) * 20, 2, 200);
            return (-0.4 + v39(l_v88_0, v134, v135 / 20, v136, 8, 0.65) * 1.2) + (v138 < 0.5 and 1 - v138 * 2 or v138 * 2 - 1) * 0.2, (((((v137 < 0.275 and l_Material_0.Snow or v137 < 0.35 and l_Material_0.Rock) or v137 < 0.4 and l_Material_0.Ground) or 1 - v137 < 0.48 and l_Material_0.Rock) or 1 - v137 < 0.49 and l_Material_0.Mud) or 1 - v137 < 0.495 and l_Material_0.Ground) or l_Material_0.Grass, l_Material_0.Rock;
        end, 
        [l_Biome_0.Lavascape] = function(v139, v140, v141, v142)
            local v143 = v139 + v68(v139, v140 * 0.25, v141, 21, 8, true) * 5;
            local v144 = v140 + v68(v139, v140 * 0.25, v141, 22, 8, true) * 5;
            local v145 = v141 + v68(v139, v140 * 0.25, v141, 23, 8, true) * 5;
            local v146 = v68(v143 + v68(v139, v140, v141, 22, 30, true) * 30, v144, v145 + v68(v139, v140, v141, 24, 30, true) * 30, 2, 120);
            local v147 = v146 < 0.5 and v146 * 2 or 2 - v146 * 2;
            local v148 = v68(v143, v144, v145, 3, 40);
            v146 = (v148 < 0.5 and v148 * 2 or 2 - v148 * 2) * (v147 * 0.25 + 0.75);
            local v149 = v68(v143, v144, v145, 4, 20);
            local v150 = (v149 < 0.5 and v149 * 2 or 2 - v149 * 2) * (v146 * 0.25 + 0.75);
            local v151 = v68(v139, v140, v141, 9, 40);
            v148 = (v151 <= 0.25 and 0 or (v151 >= 0.75 and 1 or (v151 - 0.25) / 0.5)) * v68(v139, v140, v141, 10, 60);
            v149 = math.max(0, ((1 - (v147 <= 0.975 and 0 or (v147 >= 0.975 and 1 or (v147 - 0.975) / 0))) - (v146 <= 0.925 and 0 or (v146 >= 0.925 and 1 or (v146 - 0.925) / 0))) - (v150 <= 0.9 and 0 or (v150 >= 0.9 and 1 or (v150 - 0.9) / 0)));
            v151 = CFrame.Angles(0.7, 0.7, 0) * Vector3.new(v143, v144, v145);
            local v152 = v68(v151.x / 40, v151.y / 300, v151.z / 30, 123, 1);
            local v153 = v152 <= 0.6 and 0 or (v152 >= 1 and 1 or (v152 - 0.6) / 0.4);
            v152 = (((0.5 + (v149 * (0.5 + v148 * 0.5)) * 0.02) + v148 * 0.05) + v153 * 0.3) + ((not (1 - v142 <= 0.49) or v153 > 0) and 0.04 or 0);
            local v154 = (v153 > 0 and l_Material_0.Rock or v149 < 1 and l_Material_0.CrackedLava) or l_Material_0.Basalt;
            return v152, (v154 == l_Material_0.CrackedLava and 1 - v142 < 0.48) and l_Material_0.Basalt or v154, v154;
        end, 
        [l_Biome_0.Arctic] = function(v155, v156, v157, v158)
            local v159 = v68(v155 + v68(v155, 0, v157, 5, 8, true) * 5, v156 / 8, v157 + v68(v155, 0, v157, 9, 8, true) * 5, 2, 20);
            local v160 = v159 < 0.5 and v159 * 2 or 2 - v159 * 2;
            local v161 = v68(v155, v156 / 4, v157, 436, 2);
            local v162 = v160 <= 0.8 and 0 or (v160 >= 0.9 and 1 or (v160 - 0.8) / 0.1);
            local v163 = v68(v155, 0, v157, 6, 74) - 0.5;
            local _ = nil;
            return ((0.55 + (v160 * 0.05) * v163) + if v163 < 0 then 1 + v163 * 0.5 < v160 and -0.17 or 0 else ((v162 * 0.1) * v161) * v163) + v68(v155, 0, v157, 123, 25) * 0.025, (1 - v158 < 0.38 and l_Material_0.Glacier or ((v162 > 0.6 and v163 > 0.1) and v161 > 0.5) and l_Material_0.Glacier) or l_Material_0.Snow, l_Material_0.Glacier;
        end
    };
    v71 = function(_, v166, _, v168, v169, v170, v171, v172)
        local v173 = 1 - (v166 - 1) / (v168 - 1);
        local v174 = v173 * 0.9 + 0.1 * v68(v169, v166, v170, 107, 15);
        local v175 = 0;
        local l_CrackedLava_0 = l_Material_0.CrackedLava;
        local l_Rock_1 = l_Material_0.Rock;
        if not (v173 <= 0.65) or v173 < 0.1 then
            v175 = 0.5;
        elseif #v57 == 1 then
            local v178 = v70[v57[1]];
            if not v178 then
                v175 = 0.5;
                l_CrackedLava_0 = l_Grass_0;
                l_Rock_1 = l_Rock_0;
            else
                local v179, v180, v181 = v178(v169, v166, v170, v174);
                v175 = v179;
                l_CrackedLava_0 = v180;
                l_Rock_1 = v181;
            end;
        else
            local v182 = 0;
            for v183, v184 in pairs(v171) do
                local v185 = v70[v183];
                if not v185 then
                    v184.biomeValue = 0.5;
                    v184.biomeSurface = l_Grass_0;
                    v184.biomeFill = l_Rock_0;
                else
                    local v186, v187, v188 = v185(v169, v166, v170, v174);
                    v184.biomeValue = v186;
                    v184.biomeSurface = v187;
                    v184.biomeFill = v188;
                end;
                v182 = v182 + v184.biomeValue * v184.weight;
            end;
            for v189, v190 in pairs(v171) do
                local l_weight_0 = v190.weight;
                local l_biomeValue_0 = v190.biomeValue;
                local l_v182_0 = v182;
                local v194;
                if v189 == l_Biome_0.Arctic then
                    v194 = (l_weight_0 > 0.2 and 1 or 0) * l_biomeValue_0;
                elseif v189 == l_Biome_0.Canyons then
                    v194 = (l_weight_0 > 0.7 and 1 or 0) * l_biomeValue_0;
                elseif v189 == l_Biome_0.Mountains then
                    local v195 = l_weight_0 ^ 3;
                    v194 = l_v182_0 * (1 - v195) + l_biomeValue_0 * v195;
                else
                    v194 = l_v182_0 * (1 - l_weight_0) + l_biomeValue_0 * l_weight_0;
                end;
                if v175 < v194 then
                    v175 = v194;
                    l_CrackedLava_0 = v190.biomeSurface;
                    l_Rock_1 = v190.biomeFill;
                end;
            end;
        end;
        local v196 = v173 * 0.5 + v175 * 0.5;
        local v197 = false;
        if v196 > 0.482 then
            v197 = v196 < 0.518;
        end;
        local v198 = 0;
        if ((l_haveCaves_0 and (not v172 or v173 > 0.65)) and (not v197 or 1 - v173 >= 0.485)) and (not v197 or 1 - v173 <= 1.06) then
            local v199 = v68(v169, v166, v170, 4, 30);
            local v200 = v199 < 0.5 and v199 * 2 or 2 - v199 * 2;
            v199 = v200 <= 0.84 and 0 or (v200 >= 0.85 and 1 or (v200 - 0.84) / 0.01);
            local v201 = v68(v169, v166, v170, 5, 30);
            local v202 = v201 < 0.5 and v201 * 2 or 2 - v201 * 2;
            v201 = v202 <= 0.84 and 0 or (v202 >= 0.85 and 1 or (v202 - 0.84) / 0.01);
            local v203 = v68(v169, v166, v170, 6, 30);
            local v204 = v203 < 0.5 and v203 * 2 or 2 - v203 * 2;
            v203 = v204 <= 0.84 and 0 or (v204 >= 0.85 and 1 or (v204 - 0.84) / 0.01);
            local v205;
            if v197 then
                local v206 = v68(v169, 0, v170, 143, 62);
                v205 = v206 <= 0.35 and 0 or (v206 >= 0.35 and 1 or (v206 - 0.35) / 0);
                if v205 then
                    goto label0;
                end;
            end;
            v205 = 0;
            ::label0::;
            v198 = (v199 * v201) * v203 - v205;
            v198 = v198 < 0 and 0 or (v198 > 1 and 1 or v198);
        end;
        local v207 = v196 - v198;
        local l_v56_0 = v56;
        local v209 = v207 <= 0.5 and 0 or (0.5 + l_v56_0 <= v207 and 1 or (v207 - 0.5) / l_v56_0);
        if (1 - v173 < 0.48 and v196 <= 0.5) and v209 <= 0 then
            v209 = 1;
            l_CrackedLava_0 = l_Material_0.Water;
            l_Rock_1 = l_Material_0.Water;
            v197 = true;
        end;
        l_v56_0 = v166 == 1 and 1 or v209;
        local v210 = ((v166 == 1 and l_Material_0.CrackedLava or v209 <= 0 and l_Material_0.Air) or v197 and l_CrackedLava_0) or l_Rock_1;
        local l_v197_0 = v197;
        if l_v197_0 then
            l_v197_0 = true;
            if l_v56_0 > 0 then
                l_v197_0 = v210 == l_Material_0.Air;
            end;
        end;
        return v210, l_v56_0, l_v197_0;
    end;
    v88 = 0;
    local v212 = l_Signal_0.new();
    local v213 = nil;
    local v214 = false;
    local v215 = l_Signal_0.new();
    local v216 = nil;
    local v217 = nil;
    local v218 = false;
    local v219 = l_Signal_0.new();
    local v220 = nil;
    local v221 = false;
    local v222 = nil;
    local v223 = 0;
    v213 = function(v224)
        v88 = v224;
        v212:Fire(v88);
    end;
    v220 = function()
        if not v218 then
            l_ChangeHistoryService_0:SetWaypoint("Terrain Generation");
            v218 = true;
            v219:Fire();
            return ;
        else
            warn("makeTerrainGenerator().finish() Already finished");
            return ;
        end;
    end;
    v216 = function()
        if not v214 then
            v214 = true;
            v215:Fire(v214);
        end;
    end;
    v217 = function()
        if v214 then
            v214 = false;
            v215:Fire(v214);
        end;
    end;
    v222 = function()
        v221 = true;
    end;
    local v225 = false;
    return {
        start = function()
            if not v225 then
                v225 = true;
                local v226 = tostring((v63.X * v63.Y) * v63.Z);
                if v48 then
                    v48:report("generateTerrain", v226, l_biomeSize_0, l_seed_0);
                end;
                local v227 = table.create(9);
                for v228 = 1, 9 do
                    v227[v228] = {
                        x = 0, 
                        z = 0, 
                        distSquared = 0, 
                        biomeNoise = 0
                    };
                end;
                local v229 = Region3.new(Vector3.new(-v64.X - 1, -v64.Y, -v64.Z) * v2.VOXEL_RESOLUTION + l_position_0, Vector3.new(-v64.X, v64.Y, v64.Z) * v2.VOXEL_RESOLUTION + l_position_0):ExpandToGrid(v2.VOXEL_RESOLUTION);
                local v230 = v229.Size.Y / v2.VOXEL_RESOLUTION;
                local v231 = v229.Size.Z / v2.VOXEL_RESOLUTION;
                local v232 = table.create(1);
                local v233 = table.create(1);
                for v234 = 1, 1 do
                    v232[v234] = table.create(v230);
                    v233[v234] = table.create(v230);
                    for v235 = 1, v230 do
                        v232[v234][v235] = table.create(v231, 0);
                        v233[v234][v235] = table.create(v231, l_Material_0.Air);
                    end;
                end;
                local v236 = table.create(v231, 0);
                for v237 = 1, v63.X do
                    local v238 = v237 - v64.X;
                    v229 = Region3.new(Vector3.new(v238 - 1, -v64.Y, -v64.Z) * v2.VOXEL_RESOLUTION + l_position_0, Vector3.new(v238, v64.Y, v64.Z) * v2.VOXEL_RESOLUTION + l_position_0):ExpandToGrid(v2.VOXEL_RESOLUTION);
                    local v239 = (v66 + v237) - 1;
                    for v240 = 1, v231 do
                        local v241 = (v67 + v240) - 1;
                        local v242 = (v239 / l_biomeSize_0 + v68(v239, 0, v241, 233, l_biomeSize_0 * 0.3) * 0.25) + v68(v239, 0, v241, 235, l_biomeSize_0 * 0.05) * 0.075;
                        local v243 = (v241 / l_biomeSize_0 + v68(v239, 0, v241, 234, l_biomeSize_0 * 0.3) * 0.25) + v68(v239, 0, v241, 236, l_biomeSize_0 * 0.05) * 0.075;
                        local v244 = 10000000;
                        local v245 = false;
                        local v246 = 0;
                        for v247 = -1, 1 do
                            for v248 = -1, 1 do
                                local v249 = math.floor((v242 + v247) + 0.5);
                                local v250 = math.floor((v243 + v248) + 0.5);
                                local v251 = v249 + (v69(v249, v250, 53) - 0.5) * 0.75;
                                local v252 = v250 + (v69(v249, v250, 73) - 0.5) * 0.75;
                                local v253 = (v251 - v242) ^ 2 + (v252 - v243) ^ 2;
                                if v253 < v244 then
                                    v244 = v253;
                                end;
                                local v254 = v227[((v247 + 1) + 3 * (v248 + 1)) + 1];
                                v254.x = v251;
                                v254.z = v252;
                                v254.distSquared = v253;
                                v254.biomeNoise = v69(v249, v250);
                            end;
                        end;
                        local v255 = table.create(v60);
                        for _, v257 in ipairs(v227) do
                            local v258 = v257.distSquared == v244 and 1 or (math.sqrt(v244) / math.sqrt(v257.distSquared) - 0.75) / 0.25;
                            if v258 > 0 then
                                v258 = v258 ^ 2.1;
                                v246 = v246 + v258;
                                local v259 = v57[math.ceil(v60 * (1 - v257.biomeNoise))];
                                local v260 = v255[v259] or {
                                    weight = 0
                                };
                                v260.weight = v260.weight + v258;
                                v255[v259] = v260;
                            end;
                        end;
                        for v261, v262 in pairs(v255) do
                            v262.weight = v262.weight / v246;
                            if v261 == l_Biome_0.Arctic then
                                v245 = true;
                            end;
                        end;
                        local v263 = v236[v240] or v230;
                        local v264 = false;
                        local v265 = 0;
                        for v266 = 1, v230 do
                            if not v264 then
                                local v267, v268, v269 = v71(v237, v266, v240, v230, v239, v241, v255, v245);
                                v233[1][v266][v240] = v267;
                                v232[1][v266][v240] = v268;
                                v265 = v266;
                                v264 = v269;
                            end;
                            if v264 then
                                v232[1][v266][v240] = 0;
                                v233[1][v266][v240] = l_Material_0.Air;
                                if not (v263 >= v266) then
                                    break;
                                end;
                            end;
                        end;
                        v236[v240] = v265;
                    end;
                    local l_status_0, l_result_0 = pcall(function()
                        v46.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.Generate;
                        v46:WriteVoxels(v229, v2.VOXEL_RESOLUTION, v233, v232);
                    end);
                    if not l_status_0 then
                        v221 = true;
                        warn(l_result_0);
                    end;
                    v213(v237 / v63.x);
                    local v272 = tick();
                    v4();
                    while not (not v214 or v221) do
                        v4();
                    end;
                    v223 = v223 + (tick() - v272);
                    if v221 or v218 then
                        break;
                    end;
                end;
                v220();
                return ;
            else
                warn(false, "makeTerrainGenerator().start() already started");
                return ;
            end;
        end, 
        pause = v216, 
        resume = v217, 
        cancel = v222, 
        progressSignal = v212, 
        getProgress = function()
            return v88;
        end, 
        pauseSignal = v215, 
        isPaused = function()
            return v214;
        end, 
        finishSignal = v219, 
        isFinished = function()
            return v218;
        end, 
        getYieldTime = function()
            return v223;
        end
    };
end;
