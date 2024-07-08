local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local v2 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local v6 = require(l_Parent_0.Src.Util.getTerrain);
local v7 = false;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local _ = Color3.fromRGB(72, 145, 212);
local _ = Color3.fromRGB(238, 238, 238);
local v16 = {
    [Enum.NormalId.Top] = Vector3.new(0, 1, 0), 
    [Enum.NormalId.Bottom] = Vector3.new(0, -1, 0), 
    [Enum.NormalId.Left] = Vector3.new(-1, 0, 0), 
    [Enum.NormalId.Right] = Vector3.new(1, 0, 0), 
    [Enum.NormalId.Front] = Vector3.new(0, 0, -1), 
    [Enum.NormalId.Back] = Vector3.new(0, 0, 1)
};
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = Vector3.new(0, 0, 0);
local v24 = nil;
local v25 = true;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = "X";
local l_Air_0 = Enum.Material.Air;
local _ = Enum.Material.Water;
local l_floor_0 = math.floor;
local l_ceil_0 = math.ceil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local function v46()
    if not v7 or not v17 then
        l_Selection_0:ClearTerrainSelectionHack();
        return ;
    else
        l_Selection_0:SetTerrainSelectionHack((((v17 + v18) - Vector3.new(1, 1, 1)) * 0.5) * 4, ((v18 - v17) + Vector3.new(1, 1, 1)) * 4 + Vector3.new(0.21, 0.21, 0.21));
        return ;
    end;
end;
local function _()
    if not (v35 and v35.Parent) then
        v35 = Instance.new("ScreenGui");
        v35.Name = "TerrainRegionEditor";
        v35.Parent = l_CoreGui_0;
    end;
    return v35;
end;
local function v57(v48, v49)
    local v50 = v48 or Vector3.new(1, 1, 1);
    local v51 = {};
    for v52 = 1, v50.x do
        local v53 = {};
        for v54 = 1, v50.y do
            local v55 = {};
            for v56 = 1, v50.z do
                v55[v56] = v49;
            end;
            v53[v54] = v55;
        end;
        v51[v52] = v53;
    end;
    return v51;
end;
v43 = function(_)
    lockInMap();
    renderSelection();
end;
lockInMap = function()
    if not (not v17 or not v18) then
        local v59 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
        v28 = v59;
        local v60, v61 = v12:ReadVoxels(v59, 4);
        v26 = v60;
        v27 = v61;
    end;
end;
renderSelection = function(v62, v63, v64)
    local v65 = v62 or v17;
    local v66 = v63 or v18;
    local v67 = false;
    if not ((not v65 or not v66) or not v19) then
        v67 = true;
        local v68 = ((v66 - v65) + Vector3.new(1, 1, 1)) * 4 + Vector3.new(0.2, 0.2, 0.2);
        if v64 then
            local v69 = v64 * v68;
            v68 = Vector3.new(math.abs(v69.x), math.abs(v69.y), (math.abs(v69.z)));
        end;
        v19.Size = v68;
        v19.CFrame = CFrame.new((((v65 + v66) - Vector3.new(1, 1, 1)) * 0.5) * 4) * (v64 or CFrame.new(0, 0, 0));
    end;
    if v20 then
        v20.Visible = v67;
        v20.Color = BrickColor.new(v39 == l_ToolId_0.Select and "Toothpaste" or "Institutional white");
        v20.SurfaceColor = BrickColor.new(v39 == l_ToolId_0.Select and "Toothpaste" or "Institutional white");
    end;
    if v21 then
        local l_v21_0 = v21;
        local l_v67_0 = v67;
        if l_v67_0 then
            l_v67_0 = true;
            if v40 ~= l_ToolId_0.Move then
                l_v67_0 = v40 == l_ToolId_0.Resize;
            end;
        end;
        l_v21_0.Visible = l_v67_0;
        v21.Color = BrickColor.new(v39 == l_ToolId_0.Select and "Cyan" or "Light stone grey");
        v21.Style = v40 == l_ToolId_0.Move and Enum.HandlesStyle.Movement or Enum.HandlesStyle.Resize;
    end;
    if v13 then
        v13.Visible = v67 and v40 == l_ToolId_0.Rotate;
        v13.Color = BrickColor.new(v39 == l_ToolId_0.Select and "Cyan" or "Light stone grey");
    end;
end;
local function _(v72)
    return (v72 + 0.5) - (v72 + 0.5) % 1;
end;
FirstTimeSetup = function()
    local function _(v74)
        return (Vector3.new(l_ceil_0(v74.x / 4), l_ceil_0(v74.y / 4), (l_ceil_0(v74.z / 4))));
    end;
    local function v85(v76, v77)
        local v78 = v76 or Vector3.new(1, 1, 1);
        local v79 = {};
        for v80 = 1, v78.x do
            local v81 = {};
            for v82 = 1, v78.y do
                local v83 = {};
                for v84 = 1, v78.z do
                    v83[v84] = v77;
                end;
                v81[v82] = v83;
            end;
            v79[v80] = v81;
        end;
        return v79;
    end;
    local function _(v86, v87, v88)
        return v86 + (v87 - v86) * v88;
    end;
    local function _(v90, v91)
        return (v90 - 0.5) * v91 + 0.5;
    end;
    local function _(v93, v94, v95, v96)
        local v97 = ((v93 + (v94 - v93) * v95) - 0.5) * v96 + 0.5;
        if v97 < 0 then
            return 0;
        elseif v97 > 1 then
            return 1;
        else
            return v97;
        end;
    end;
    v42 = function()
        local v99 = v24 or Vector3.new(0, 0, 0);
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        if v40 == l_ToolId_0.Resize then
            if not v25 then
                l_v18_0 = Vector3.new(math.max(math.min(l_v18_0.x + v99.x, l_v17_0.x + 125), l_v17_0.x), math.max(math.min(l_v18_0.y + v99.y, l_v17_0.y + 125), l_v17_0.y), (math.max(math.min(l_v18_0.z + v99.z, l_v17_0.z + 125), l_v17_0.z)));
            else
                l_v17_0 = Vector3.new(math.min(math.max(l_v17_0.x + v99.x, l_v18_0.x - 125), l_v18_0.x), math.min(math.max(l_v17_0.y + v99.y, l_v18_0.y - 125), l_v18_0.y), (math.min(math.max(l_v17_0.z + v99.z, l_v18_0.z - 125), l_v18_0.z)));
            end;
            if v39 == "Edit" then
                local v102 = Region3.new((l_v17_0 - Vector3.new(1, 1, 1)) * 4, l_v18_0 * 4);
                if not v29 then
                    if not (not v17 or not v18) then
                        local v103 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
                        local v104 = v103.Size / 4;
                        v12:WriteVoxels(v103, 4, v85(v104, l_Air_0), (v85(v104, 0)));
                    end;
                else
                    v12:WriteVoxels(v29.region, 4, v29.materials, v29.occupancies);
                end;
                v29 = {};
                v29.region = v102;
                local l_v29_0 = v29;
                local l_v29_1 = v29;
                local v107, v108 = v12:ReadVoxels(v102, 4);
                l_v29_0.materials = v107;
                l_v29_1.occupancies = v108;
                l_v29_0 = v29.materials;
                l_v29_1 = v29.occupancies;
                v107 = #v26 - 1;
                v108 = #v26[1] - 1;
                local v109 = #v26[1][1] - 1;
                local v110 = (Vector3.new(1, 1, 1) + l_v18_0) - l_v17_0;
                local l_x_0 = v110.x;
                local l_y_0 = v110.y;
                local l_z_0 = v110.z;
                local v114 = {};
                local v115 = {};
                for v116 = 1, l_x_0 do
                    local v117 = ((v116 - 1) / (l_x_0 - 1)) * v107;
                    if v117 ~= v117 then
                        v117 = 0;
                    end;
                    local v118 = l_floor_0(v117) + 1;
                    local v119 = v118 + 1;
                    local v120 = (v117 - v118) + 1;
                    if v107 < v118 then
                        v119 = v118;
                    end;
                    local v121 = {};
                    local v122 = {};
                    for v123 = 1, l_y_0 do
                        local v124 = ((v123 - 1) / (l_y_0 - 1)) * v108;
                        if v124 ~= v124 then
                            v124 = 0;
                        end;
                        local v125 = l_floor_0(v124) + 1;
                        local v126 = v125 + 1;
                        local v127 = (v124 - v125) + 1;
                        if v108 < v125 then
                            v126 = v125;
                        end;
                        local v128 = {};
                        local v129 = {};
                        for v130 = 1, l_z_0 do
                            local v131 = l_v29_0[v116][v123][v130];
                            local v132 = l_v29_1[v116][v123][v130];
                            if not (v11 and v131 ~= l_Air_0) or v132 == 0 then
                                local v133 = ((v130 - 1) / (l_z_0 - 1)) * v109;
                                if v133 ~= v133 then
                                    v133 = 0;
                                end;
                                local v134 = l_floor_0(v133) + 1;
                                local v135 = v134 + 1;
                                local v136 = (v133 - v134) + 1;
                                if v109 < v134 then
                                    v135 = v134;
                                end;
                                local v137 = l_x_0 / (v107 + 1);
                                local v138 = l_y_0 / (v108 + 1);
                                local v139 = l_z_0 / (v109 + 1);
                                local v140 = v27[v118][v125][v134];
                                local v141 = ((v140 + (v27[v118][v125][v135] - v140) * v136) - 0.5) * v139 + 0.5;
                                local v142 = v141 < 0 and 0 or (v141 > 1 and 1 or v141);
                                local v143 = v27[v118][v126][v134];
                                local v144 = ((v143 + (v27[v118][v126][v135] - v143) * v136) - 0.5) * v139 + 0.5;
                                v140 = v144 < 0 and 0 or (v144 > 1 and 1 or v144);
                                v141 = v27[v119][v125][v134];
                                local v145 = ((v141 + (v27[v119][v125][v135] - v141) * v136) - 0.5) * v139 + 0.5;
                                v143 = v145 < 0 and 0 or (v145 > 1 and 1 or v145);
                                v144 = v27[v119][v126][v134];
                                local v146 = ((v144 + (v27[v119][v126][v135] - v144) * v136) - 0.5) * v139 + 0.5;
                                v141 = v146 < 0 and 0 or (v146 > 1 and 1 or v146);
                                v145 = ((v142 + (v140 - v142) * v127) - 0.5) * v138 + 0.5;
                                v144 = v145 < 0 and 0 or (v145 > 1 and 1 or v145);
                                v146 = ((v143 + (v141 - v143) * v127) - 0.5) * v138 + 0.5;
                                local v147 = ((v144 + ((v146 < 0 and 0 or (v146 > 1 and 1 or v146)) - v144) * v120) - 0.5) * v137 + 0.5;
                                v146 = v147 < 0 and 0 or (v147 > 1 and 1 or v147);
                                local l_v26_0 = v26;
                                local l_v117_0 = v117;
                                local v150 = l_v26_0[((l_v117_0 + 0.5) - (l_v117_0 + 0.5) % 1) + 1];
                                local l_v124_0 = v124;
                                local v152 = v150[((l_v124_0 + 0.5) - (l_v124_0 + 0.5) % 1) + 1];
                                local l_v133_0 = v133;
                                v128[v130] = v152[((l_v133_0 + 0.5) - (l_v133_0 + 0.5) % 1) + 1];
                                v129[v130] = v146;
                            else
                                v128[v130] = v131;
                                v129[v130] = v132;
                            end;
                        end;
                        v121[v123] = v128;
                        v122[v123] = v129;
                    end;
                    v114[v116] = v121;
                    v115[v116] = v122;
                end;
                v12:WriteVoxels(v102, 4, v114, v115);
            else
                v29 = nil;
            end;
        elseif v40 == l_ToolId_0.Move then
            l_v17_0 = l_v17_0 + v99;
            l_v18_0 = l_v18_0 + v99;
            if v39 == "Edit" then
                local v154 = Region3.new((l_v17_0 - Vector3.new(1, 1, 1)) * 4, l_v18_0 * 4);
                if not v29 then
                    if not (not v17 or not v18) then
                        local v155 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
                        local v156 = v155.Size / 4;
                        v12:WriteVoxels(v155, 4, v85(v156, l_Air_0), (v85(v156, 0)));
                    end;
                else
                    v12:WriteVoxels(v29.region, 4, v29.materials, v29.occupancies);
                end;
                v29 = {};
                v29.region = v154;
                local l_v29_2 = v29;
                local l_v29_3 = v29;
                local v159, v160 = v12:ReadVoxels(v154, 4);
                l_v29_2.materials = v159;
                l_v29_3.occupancies = v160;
                l_v29_2 = v29.materials;
                l_v29_3 = v29.occupancies;
                if v11 then
                    v159 = {};
                    v160 = {};
                    for v161, v162 in ipairs(v26) do
                        local v163 = {};
                        local v164 = {};
                        for v165, v166 in ipairs(v162) do
                            local v167 = {};
                            local v168 = {};
                            for v169, _ in ipairs(v166) do
                                local v171 = l_v29_2[v161][v165][v169];
                                local v172 = l_v29_3[v161][v165][v169];
                                if not (v171 ~= l_Air_0) or v172 == 0 then
                                    v167[v169] = v26[v161][v165][v169];
                                    v168[v169] = v27[v161][v165][v169];
                                else
                                    v167[v169] = v171;
                                    v168[v169] = v172;
                                end;
                            end;
                            v163[v165] = v167;
                            v164[v165] = v168;
                        end;
                        v159[v161] = v163;
                        v160[v161] = v164;
                    end;
                    v12:WriteVoxels(v154, 4, v159, v160);
                else
                    v12:WriteVoxels(v154, 4, v26, v27);
                end;
            end;
        end;
        renderSelection(l_v17_0, l_v18_0);
    end;
    local function _(v173, v174, v175, v176, v177)
        if v177 == 1 then
            return (v175 + 1) - v176, v174;
        elseif v177 == 2 then
            return (v173 + 1) - v174, (v175 + 1) - v176;
        elseif v177 == 3 then
            return v176, (v173 + 1) - v174;
        else
            return v174, v176;
        end;
    end;
    v41 = function()
        local v179 = v44 or 0;
        local v180 = CFrame.Angles(v30 ~= "X" and 0 or v179 * 1.5707963267948966, v30 ~= "Y" and 0 or v179 * 1.5707963267948966, v30 ~= "Z" and 0 or v179 * 1.5707963267948966);
        local v181 = (Vector3.new(1, 1, 1) + v18) - v17;
        local v182 = Vector3.new(l_ceil_0(v181.x * 0.5), l_ceil_0(v181.y * 0.5), (l_ceil_0(v181.z * 0.5)));
        v181 = v180 * v181;
        local v183 = math.abs(v181.x);
        local v184 = (v183 + 0.5) - (v183 + 0.5) % 1;
        local v185 = math.abs(v181.y);
        v183 = (v185 + 0.5) - (v185 + 0.5) % 1;
        local v186 = math.abs(v181.z);
        v185 = (v186 + 0.5) - (v186 + 0.5) % 1;
        v182 = v182 - Vector3.new(l_ceil_0(v184 * 0.5), l_ceil_0(v183 * 0.5), (l_ceil_0(v185 * 0.5)));
        v186 = ((v17 + v182) + Vector3.new(v184, v183, v185)) - Vector3.new(1, 1, 1);
        local v187 = v17 + v182;
        if v39 == "Edit" then
            local v188 = Region3.new((v187 - Vector3.new(1, 1, 1)) * 4, v186 * 4);
            if not v29 then
                if not (not v17 or not v18) then
                    local v189 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
                    local v190 = v189.Size / 4;
                    v12:WriteVoxels(v189, 4, v85(v190, l_Air_0), (v85(v190, 0)));
                end;
            else
                v12:WriteVoxels(v29.region, 4, v29.materials, v29.occupancies);
            end;
            v29 = {};
            v29.region = v188;
            local l_v29_4 = v29;
            local l_v29_5 = v29;
            local v193, v194 = v12:ReadVoxels(v188, 4);
            l_v29_4.materials = v193;
            l_v29_5.occupancies = v194;
            l_v29_4 = {};
            l_v29_5 = {};
            for v195 = 1, v184 do
                local v196 = {};
                local v197 = {};
                for v198 = 1, v183 do
                    local v199 = {};
                    local v200 = {};
                    for v201 = 1, v185 do
                        local v202 = v29.materials[v195][v198][v201];
                        local v203 = v29.occupancies[v195][v198][v201];
                        if not (v11 and v202 ~= l_Air_0) or v203 == 0 then
                            local l_v195_0 = v195;
                            local l_v198_0 = v198;
                            local l_v201_0 = v201;
                            if v30 == "Y" then
                                local v207, v208;
                                if v179 == 1 then
                                    v207 = (v185 + 1) - v201;
                                    v208 = v195;
                                elseif v179 == 2 then
                                    v207 = (v184 + 1) - v195;
                                    v208 = (v185 + 1) - v201;
                                elseif v179 == 3 then
                                    v207 = v201;
                                    v208 = (v184 + 1) - v195;
                                else
                                    v207 = v195;
                                    v208 = v201;
                                end;
                                l_v195_0 = v207;
                                l_v201_0 = v208;
                            elseif v30 == "X" then
                                local v209, v210;
                                if v179 == 1 then
                                    v209 = (v183 + 1) - v198;
                                    v210 = v201;
                                elseif v179 == 2 then
                                    v209 = (v185 + 1) - v201;
                                    v210 = (v183 + 1) - v198;
                                elseif v179 == 3 then
                                    v209 = v198;
                                    v210 = (v185 + 1) - v201;
                                else
                                    v209 = v201;
                                    v210 = v198;
                                end;
                                l_v201_0 = v209;
                                l_v198_0 = v210;
                            elseif v30 == "Z" then
                                local v211, v212;
                                if v179 == 1 then
                                    v211 = (v184 + 1) - v195;
                                    v212 = v198;
                                elseif v179 == 2 then
                                    v211 = (v183 + 1) - v198;
                                    v212 = (v184 + 1) - v195;
                                elseif v179 == 3 then
                                    v211 = v195;
                                    v212 = (v183 + 1) - v198;
                                else
                                    v211 = v198;
                                    v212 = v195;
                                end;
                                l_v198_0 = v211;
                                l_v195_0 = v212;
                            end;
                            v199[v201] = v26[l_v195_0][l_v198_0][l_v201_0];
                            v200[v201] = v27[l_v195_0][l_v198_0][l_v201_0];
                        else
                            v199[v201] = v202;
                            v200[v201] = v203;
                        end;
                    end;
                    v196[v198] = v199;
                    v197[v198] = v200;
                end;
                l_v29_4[v195] = v196;
                l_v29_5[v195] = v197;
            end;
            v12:WriteVoxels(v188, 4, l_v29_4, l_v29_5);
        end;
        renderSelection(v187, v186, v180);
    end;
    v36 = function(v213, v214, v215, v216, v217, v218)
        local v219 = v213 or v17;
        local v220 = v214 or v18;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Name = "EffectPart";
        l_Part_0.Transparency = 1;
        l_Part_0.TopSurface = "Smooth";
        l_Part_0.BottomSurface = "Smooth";
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        if not (v35 and v35.Parent) then
            v35 = Instance.new("ScreenGui");
            v35.Name = "TerrainRegionEditor";
            v35.Parent = l_CoreGui_0;
        end;
        l_Part_0.Parent = v35;
        local l_SelectionBox_0 = Instance.new("SelectionBox");
        l_SelectionBox_0.Name = "SelectionObject";
        l_SelectionBox_0.Transparency = 1;
        l_SelectionBox_0.SurfaceTransparency = 0.75;
        l_SelectionBox_0.SurfaceColor = BrickColor.new(v215);
        l_SelectionBox_0.Adornee = l_Part_0;
        l_SelectionBox_0.Parent = l_Part_0;
        l_SelectionBox_0.StudioSelectionBox = true;
        local v223 = ((v220 - v219) + Vector3.new(1, 1, 1)) * 4 + Vector3.new(0.21, 0.21, 0.21);
        l_Part_0.CFrame = CFrame.new((((v219 + v220) - Vector3.new(1, 1, 1)) * 0.5) * 4);
        l_Part_0.Size = v223 * v216;
        local v224 = tick() + v218;
        while tick() < v224 do
            local v225 = 1 - (v224 - tick()) / v218;
            l_SelectionBox_0.SurfaceTransparency = 0.75 + v225 * 0.25;
            l_Part_0.Size = v223 * (v216 + (v217 - v216) * v225);
            wait();
        end;
        l_Part_0:Destroy();
    end;
    v8.Button1Down:connect(function()
        if v7 and v39 == l_ToolId_0.Select then
            v45 = true;
            v29 = nil;
            local v226 = v8.Hit.p + v8.UnitRay.Direction * 0.05;
            if v8.Target == nil then
                v226 = game.Workspace.CurrentCamera.CoordinateFrame.p + v8.UnitRay.Direction * 100;
            end;
            local l_v226_0 = v226;
            v23 = Vector3.new(l_ceil_0(l_v226_0.x / 4), l_ceil_0(l_v226_0.y / 4), (l_ceil_0(l_v226_0.z / 4)));
            local v228 = {};
            v22 = v228;
            while not ((not (v228 == v22) or not v45) or not v7) and v39 == "Select" do
                l_v226_0 = v8.Hit.p + v8.UnitRay.Direction * 0.05;
                if v8.Target == nil then
                    l_v226_0 = game.Workspace.CurrentCamera.CoordinateFrame.p + v8.UnitRay.Direction * 100;
                end;
                local l_l_v226_0_0 = l_v226_0;
                local v230 = Vector3.new(l_ceil_0(l_l_v226_0_0.x / 4), l_ceil_0(l_l_v226_0_0.y / 4), (l_ceil_0(l_l_v226_0_0.z / 4)));
                v230 = Vector3.new(math.max(math.min(v230.x, v23.x + 125), v23.x - 125), math.max(math.min(v230.y, v23.y + 125), v23.y - 125), (math.max(math.min(v230.z, v23.z + 125), v23.z - 125)));
                v17 = Vector3.new(math.min(v23.x, v230.x), math.min(v23.y, v230.y), (math.min(v23.z, v230.z)));
                v18 = Vector3.new(math.max(v23.x, v230.x), math.max(v23.y, v230.y), (math.max(v23.z, v230.z)));
                v46();
                renderSelection();
                game:GetService("RunService").RenderStepped:wait();
            end;
        end;
    end);
    v8.Button1Up:connect(function()
        v45 = false;
        if v24 and v24.magnitude > 0 then
            if v40 == l_ToolId_0.Resize then
                if not v25 then
                    v18 = Vector3.new(math.max(math.min(v18.x + v24.x, v17.x + 125), v17.x), math.max(math.min(v18.y + v24.y, v17.y + 125), v17.y), (math.max(math.min(v18.z + v24.z, v17.z + 125), v17.z)));
                else
                    v17 = Vector3.new(math.min(math.max(v17.x + v24.x, v18.x - 125), v18.x), math.min(math.max(v17.y + v24.y, v18.y - 125), v18.y), (math.min(math.max(v17.z + v24.z, v18.z - 125), v18.z)));
                end;
            elseif v40 == l_ToolId_0.Move then
                v17 = v17 + v24;
                v18 = v18 + v24;
            end;
            v46();
            l_ChangeHistoryService_0:SetWaypoint("Terrain " .. v9);
        end;
        if v44 and v44 ~= 0 then
            local v231 = CFrame.Angles(v30 ~= "X" and 0 or v44 * 1.5707963267948966, v30 ~= "Y" and 0 or v44 * 1.5707963267948966, v30 ~= "Z" and 0 or v44 * 1.5707963267948966);
            local v232 = (Vector3.new(1, 1, 1) + v18) - v17;
            local v233 = Vector3.new(l_ceil_0(v232.x * 0.5), l_ceil_0(v232.y * 0.5), (l_ceil_0(v232.z * 0.5)));
            v232 = v231 * v232;
            local v234 = math.abs(v232.x);
            local v235 = (v234 + 0.5) - (v234 + 0.5) % 1;
            local v236 = math.abs(v232.y);
            v234 = (v236 + 0.5) - (v236 + 0.5) % 1;
            local v237 = math.abs(v232.z);
            v236 = (v237 + 0.5) - (v237 + 0.5) % 1;
            v233 = v233 - Vector3.new(l_ceil_0(v235 * 0.5), l_ceil_0(v234 * 0.5), (l_ceil_0(v236 * 0.5)));
            v18 = ((v17 + v233) + Vector3.new(v235, v234, v236)) - Vector3.new(1, 1, 1);
            v17 = v17 + v233;
            v46();
            lockInMap();
            l_ChangeHistoryService_0:SetWaypoint("Terrain " .. v9);
        end;
        v24 = nil;
        v44 = nil;
        renderSelection();
    end);
    local function v238()
        v17 = nil;
        v18 = nil;
        v46();
        v26 = nil;
        v27 = nil;
        v43(l_ToolId_0.Select);
    end;
    l_ChangeHistoryService_0.OnUndo:connect(v238);
    l_ChangeHistoryService_0.OnRedo:connect(v238);
end;
createSelectionPart = function()
    if not v19 then
        v19 = Instance.new("Part");
        v19.Name = "SelectionPart";
        v19.Transparency = 1;
        v19.TopSurface = "Smooth";
        v19.BottomSurface = "Smooth";
        v19.Anchored = true;
        v19.CanCollide = false;
        local l_v19_0 = v19;
        if not (v35 and v35.Parent) then
            v35 = Instance.new("ScreenGui");
            v35.Name = "TerrainRegionEditor";
            v35.Parent = l_CoreGui_0;
        end;
        l_v19_0.Parent = v35;
    end;
    if not v20 then
        v20 = Instance.new("SelectionBox");
        v20.Name = "SelectionObject";
        v20.Color = BrickColor.new(v9 == "Select" and "Toothpaste" or "Institutional white");
        v20.SurfaceTransparency = 0.85;
        v20.SurfaceColor = BrickColor.new(v9 == "Select" and "Toothpaste" or "Institutional white");
        v20.Adornee = v19;
        v20.Visible = false;
        v20.Parent = v19;
    end;
    if not v21 then
        v21 = Instance.new("Handles");
        v21.Name = "SelectionHandles";
        v21.Color = BrickColor.new(v9 == "Select" and "Toothpaste" or "Light stone grey");
        v21.Adornee = v19;
        v21.Visible = false;
        v21.Parent = v20;
        v21.MouseDrag:connect(function(v240, v241)
            local v242 = v16[v240];
            local v243 = v242 * l_floor_0((v241 + 0.5) / 4);
            local v244 = true;
            if v242.x >= 0 then
                v244 = true;
                if v242.y >= 0 then
                    v244 = v242.z < 0;
                end;
            end;
            v25 = v244;
            if v243 ~= v24 then
                v24 = v243;
                v42();
            end;
        end);
    end;
    if not v13 then
        v13 = Instance.new("ArcHandles");
        v13.Name = "SelectionArcHandles";
        v13.Color = BrickColor.new(v9 == "Select" and "Toothpaste" or "Light stone grey");
        v13.Adornee = v19;
        v13.Visible = false;
        v13.Parent = v21;
        v13.MouseDrag:connect(function(v245, v246, _)
            v30 = v245.Name;
            local v248 = v246 / 1.5707963267948966;
            local v249 = ((v248 + 0.5) - (v248 + 0.5) % 1) % 4;
            if v249 ~= v44 then
                v44 = v249;
                v41();
            end;
        end);
    end;
end;
clearSelection = function()
    if v13 then
        v13:Destroy();
        v13 = nil;
    end;
    if v21 then
        v21:Destroy();
        v21 = nil;
    end;
    if v20 then
        v20:Destroy();
        v20 = nil;
    end;
    if v19 then
        v19:Destroy();
        v19 = nil;
    end;
    if v35 then
        v35:Destroy();
        v35 = nil;
    end;
end;
v38 = {
    [l_ToolId_0.Select] = function()
        v43(l_ToolId_0.Select);
    end, 
    [l_ToolId_0.Move] = function()
        v43(l_ToolId_0.Move);
    end, 
    [l_ToolId_0.Resize] = function()
        v43(l_ToolId_0.Resize);
    end, 
    [l_ToolId_0.Rotate] = function()
        v43(l_ToolId_0.Rotate);
    end, 
    [l_ToolId_0.Delete] = function()
        if not (not v17 or not v18) then
            local v250 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
            local v251 = v250.Size / 4;
            local v252 = v57(v251, l_Air_0);
            local v253 = v57(v251, 0);
            if not v29 then
                if not (not v17 or not v18) then
                    v12:WriteVoxels(v250, 4, v252, v253);
                end;
            else
                v12:WriteVoxels(v29.region, 4, v29.materials, v29.occupancies);
            end;
            v29 = {};
            v29.region = v250;
            local l_v29_6 = v29;
            local l_v29_7 = v29;
            local v256, v257 = v12:ReadVoxels(v250, 4);
            l_v29_6.materials = v256;
            l_v29_7.occupancies = v257;
            l_v29_6 = v17;
            l_v29_7 = v18;
            v43(l_ToolId_0.Select);
            l_ChangeHistoryService_0:SetWaypoint("Terrain Delete");
            v36(l_v29_6, l_v29_7, "Really red", 1, 1.2, 0.5);
        end;
    end, 
    [l_ToolId_0.Paste] = function()
        if v37 then
            v18 = (v17 + v37.SizeInCells) - Vector3.new(1, 1, 1);
            local v258 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
            v29 = {};
            v29.region = v258;
            local l_v29_8 = v29;
            local l_v29_9 = v29;
            local v261, v262 = v12:ReadVoxels(v258, 4);
            l_v29_8.materials = v261;
            l_v29_9.occupancies = v262;
            v12.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.RegionPasteTool;
            v12:PasteRegion(v37, Vector3int16.new(v17.x - 1, v17.y - 1, v17.z - 1), true);
            v43(l_ToolId_0.Move);
            l_ChangeHistoryService_0:SetWaypoint("Terrain Paste");
            v36(nil, nil, "Lime green", 1.2, 1, 0.5);
        end;
    end, 
    [l_ToolId_0.Copy] = function()
        if not (not v17 or not v18) then
            v37 = v12:CopyRegion((Region3int16.new(Vector3int16.new(v17.x - 1, v17.y - 1, v17.z - 1), (Vector3int16.new(v18.x - 1, v18.y - 1, v18.z - 1)))));
            v36(nil, nil, "New Yeller", 1, 1.2, 0.5);
        end;
    end, 
    [l_ToolId_0.Fill] = function()
        v43(l_ToolId_0.Fill);
    end
};
v2.Init = function(v263, v264)
    v12 = v6();
    v8 = v264;
    v9 = v263;
    if v263 == l_ToolId_0.Select then
        v39 = "Select";
        v40 = l_ToolId_0.Resize;
    elseif not (v263 ~= l_ToolId_0.Move and v263 ~= l_ToolId_0.Resize) or v263 == l_ToolId_0.Rotate then
        v39 = "Edit";
        v40 = v263;
    end;
    FirstTimeSetup();
    v7 = true;
    if not (v35 and v35.Parent) then
        v35 = Instance.new("ScreenGui");
        v35.Name = "TerrainRegionEditor";
        v35.Parent = l_CoreGui_0;
    end;
    createSelectionPart();
    renderSelection();
    if v12 or v9 == l_ToolId_0.Select then
        v38[v9]();
    end;
    v46();
end;
v2.ChangeProperties = function(v265)
    v10 = v265.material;
    v11 = v265.mergeEmpty;
    if ((not (v40 ~= l_ToolId_0.Move) or v40 == l_ToolId_0.Resize) and v39 == "Edit") and v17 ~= nil then
        v42();
    end;
end;
v2.OnButtonClick = function()
    if not ((not (v9 == l_ToolId_0.Fill) or not v17) or not v18) then
        local v266 = Region3.new((v17 - Vector3.new(1, 1, 1)) * 4, v18 * 4);
        local v267 = v266.Size / 4;
        local v268 = v57(v267, l_Air_0);
        local v269 = v57(v267, 0);
        local v270, v271 = v12:ReadVoxels(v266, 4);
        local v272 = {};
        local v273 = {};
        for v274 = 1, v267.x do
            local v275 = {};
            local v276 = {};
            for v277 = 1, v267.y do
                local v278 = {};
                local v279 = {};
                for v280 = 1, v267.z do
                    local v281 = v270[v274][v277][v280];
                    if (v281 ~= l_Air_0 and v271[v274][v277][v280] ~= 0) and v11 then
                        v278[v280] = v281;
                    else
                        v278[v280] = v10;
                    end;
                    v279[v280] = 1;
                end;
                v275[v277] = v278;
                v276[v277] = v279;
            end;
            v272[v274] = v275;
            v273[v274] = v276;
        end;
        v12.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.RegionFillTool;
        v12:WriteVoxels(v266, 4, v272, v273);
        v29 = {};
        v29.region = v266;
        local l_v29_10 = v29;
        local l_v29_11 = v29;
        l_v29_10.materials = v268;
        l_v29_11.occupancies = v269;
        lockInMap();
        l_ChangeHistoryService_0:SetWaypoint("Terrain Fill");
        v36(nil, nil, "Lime green", 1.2, 1, 0.5);
    end;
end;
v2.Close = function()
    clearSelection();
    v29 = nil;
    v7 = false;
    v9 = nil;
    v8 = nil;
    v40 = nil;
    v39 = "Select";
    v46();
end;
return v2;
