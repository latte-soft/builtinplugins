local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.OperationHelper);
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
local l_TerrainSmoothToolFix_0 = game:GetFastFlag("TerrainSmoothToolFix");
local v5 = require(l_Parent_0.Src.Flags.getFFlagTerrainEditorUseTerrainChannels)();
return {
    grow = if not v5 then function(v6)
        local l_readMaterials_0 = v6.readMaterials;
        local l_readOccupancies_0 = v6.readOccupancies;
        local l_writeMaterials_0 = v6.writeMaterials;
        local l_writeOccupancies_0 = v6.writeOccupancies;
        local l_x_0 = v6.x;
        local l_y_0 = v6.y;
        local l_z_0 = v6.z;
        local l_sizeX_0 = v6.sizeX;
        local l_sizeY_0 = v6.sizeY;
        local l_sizeZ_0 = v6.sizeZ;
        local l_brushOccupancy_0 = v6.brushOccupancy;
        local l_magnitudePercent_0 = v6.magnitudePercent;
        local l_cellOccupancy_0 = v6.cellOccupancy;
        local l_strength_0 = v6.strength;
        local l_ignoreWater_0 = v6.ignoreWater;
        local l_cellMaterial_0 = v6.cellMaterial;
        local l_desiredMaterial_0 = v6.desiredMaterial;
        local l_maxOccupancy_0 = v6.maxOccupancy;
        local l_autoMaterial_0 = v6.autoMaterial;
        if not (l_cellOccupancy_0 ~= 1) or l_brushOccupancy_0 < 0.5 then
            return ;
        else
            local l_l_cellOccupancy_0_0 = l_cellOccupancy_0;
            local v27 = false;
            local v28 = 0;
            local v29 = 0;
            for v30 = 1, 6 do
                local v31 = l_x_0 + v1.xOffset[v30];
                local v32 = l_y_0 + v1.yOffset[v30];
                local v33 = l_z_0 + v1.zOffset[v30];
                if ((((v31 > 0 and v31 <= l_sizeX_0) and v32 > 0) and v32 <= l_sizeY_0) and v33 > 0) and v33 <= l_sizeZ_0 then
                    local v34 = l_readOccupancies_0[v31][v32][v33];
                    local v35 = l_readMaterials_0[v31][v32][v33];
                    if l_ignoreWater_0 and v35 == l_Water_0 then
                        v34 = 0;
                    end;
                    if v34 >= 1 then
                        v27 = true;
                    end;
                    v28 = v28 + 1;
                    v29 = v29 + v34;
                end;
            end;
            if not (l_cellOccupancy_0 <= 0 and not v27) then
                l_l_cellOccupancy_0_0 = l_l_cellOccupancy_0_0 + ((((v28 == 0 and 0 or v29 / v28) * (l_strength_0 + 0.1)) * 0.25) * l_brushOccupancy_0) * l_magnitudePercent_0;
            end;
            l_l_cellOccupancy_0_0 = math.min(l_l_cellOccupancy_0_0, l_maxOccupancy_0);
            if l_cellMaterial_0 == l_Air_0 and l_l_cellOccupancy_0_0 > 0 then
                local l_l_desiredMaterial_0_0 = l_desiredMaterial_0;
                if l_autoMaterial_0 then
                    l_l_desiredMaterial_0_0 = v1.DEPRECATED_getMaterialForAutoMaterial(l_readMaterials_0, l_x_0, l_y_0, l_z_0, l_sizeX_0, l_sizeY_0, l_sizeZ_0, l_cellMaterial_0);
                end;
                l_writeMaterials_0[l_x_0][l_y_0][l_z_0] = l_l_desiredMaterial_0_0;
            end;
            if l_l_cellOccupancy_0_0 ~= l_cellOccupancy_0 then
                l_writeOccupancies_0[l_x_0][l_y_0][l_z_0] = l_l_cellOccupancy_0_0;
            end;
            return ;
        end;
    end else function(v37)
        local l_readMaterials_1 = v37.readMaterials;
        local l_readOccupancies_1 = v37.readOccupancies;
        local l_writeMaterials_1 = v37.writeMaterials;
        local l_writeOccupancies_1 = v37.writeOccupancies;
        local v42 = nil;
        local v43 = nil;
        if v5 then
            v42 = v37.readWaterOccupancies;
            v43 = v37.writeWaterOccupancies;
        end;
        local l_x_1 = v37.x;
        local l_y_1 = v37.y;
        local l_z_1 = v37.z;
        local l_sizeX_1 = v37.sizeX;
        local l_sizeY_1 = v37.sizeY;
        local l_sizeZ_1 = v37.sizeZ;
        local l_brushOccupancy_1 = v37.brushOccupancy;
        local l_magnitudePercent_1 = v37.magnitudePercent;
        local l_cellOccupancy_1 = v37.cellOccupancy;
        local l_cellWaterOccupancy_0 = v37.cellWaterOccupancy;
        local l_strength_1 = v37.strength;
        local l_ignoreWater_1 = v37.ignoreWater;
        local l_cellMaterial_1 = v37.cellMaterial;
        local l_desiredMaterial_1 = v37.desiredMaterial;
        local l_maxOccupancy_1 = v37.maxOccupancy;
        local l_autoMaterial_1 = v37.autoMaterial;
        local l_l_desiredMaterial_1_0 = l_desiredMaterial_1;
        if l_autoMaterial_1 then
            l_l_desiredMaterial_1_0 = v1.getMaterialForAutoMaterial(l_readMaterials_1, v42, l_x_1, l_y_1, l_z_1, l_sizeX_1, l_sizeY_1, l_sizeZ_1, l_cellMaterial_1);
        end;
        if not (not (not (l_cellOccupancy_1 ~= 1) or l_brushOccupancy_1 < 0.5) or l_ignoreWater_1) and (not (l_cellWaterOccupancy_0 ~= 1) or l_brushOccupancy_1 < 0.5) then
            return ;
        else
            local v61 = if (not (l_l_desiredMaterial_1_0 ~= l_Air_0) or l_l_desiredMaterial_1_0 == l_Water_0) and l_cellOccupancy_1 < l_cellWaterOccupancy_0 then l_cellWaterOccupancy_0 else l_cellOccupancy_1;
            local l_l_cellWaterOccupancy_0_0 = l_cellWaterOccupancy_0;
            local v63 = false;
            local v64 = false;
            local v65 = 0;
            local v66 = 0;
            local v67 = 0;
            for v68 = 1, 6 do
                local v69 = l_x_1 + v1.xOffset[v68];
                local v70 = l_y_1 + v1.yOffset[v68];
                local v71 = l_z_1 + v1.zOffset[v68];
                if ((((v69 > 0 and v69 <= l_sizeX_1) and v70 > 0) and v70 <= l_sizeY_1) and v71 > 0) and v71 <= l_sizeZ_1 then
                    local v72 = l_readMaterials_1[v69][v70][v71];
                    local v73 = if v72 == l_Air_0 then v42[v69][v70][v71] else l_readOccupancies_1[v69][v70][v71];
                    local v74 = v42[v69][v70][v71];
                    if l_ignoreWater_1 and v72 == l_Air_0 then
                        v73 = 0;
                    end;
                    if v73 >= 1 then
                        v63 = true;
                    end;
                    if v74 >= 1 then
                        v64 = true;
                    end;
                    v65 = v65 + 1;
                    v66 = v66 + v73;
                    v67 = v67 + v74;
                end;
            end;
            if not (l_cellOccupancy_1 <= 0 and not v63) then
                v61 = v61 + ((((v65 == 0 and 0 or v66 / v65) * (l_strength_1 + 0.1)) * 0.25) * l_brushOccupancy_1) * l_magnitudePercent_1;
            end;
            if not (l_cellWaterOccupancy_0 <= 0 and not v64) then
                l_l_cellWaterOccupancy_0_0 = l_l_cellWaterOccupancy_0_0 + ((((v65 == 0 and 0 or v67 / v65) * (l_strength_1 + 0.1)) * 0.25) * l_brushOccupancy_1) * l_magnitudePercent_1;
            end;
            v61 = math.min(v61, l_maxOccupancy_1);
            l_l_cellWaterOccupancy_0_0 = math.min(l_l_cellWaterOccupancy_0_0, l_maxOccupancy_1);
            if l_cellMaterial_1 == l_Air_0 and v61 > 0 then
                if l_l_desiredMaterial_1_0 == l_Water_0 then
                    v43[l_x_1][l_y_1][l_z_1] = v61;
                    return ;
                else
                    l_writeMaterials_1[l_x_1][l_y_1][l_z_1] = l_l_desiredMaterial_1_0;
                end;
            end;
            if v61 ~= l_cellOccupancy_1 then
                l_writeOccupancies_1[l_x_1][l_y_1][l_z_1] = v61;
            end;
            if not l_ignoreWater_1 and l_l_cellWaterOccupancy_0_0 ~= l_cellWaterOccupancy_0 then
                v43[l_x_1][l_y_1][l_z_1] = l_l_cellWaterOccupancy_0_0;
            end;
            return ;
        end;
    end, 
    erode = if not v5 then function(v75)
        local l_readMaterials_2 = v75.readMaterials;
        local l_readOccupancies_2 = v75.readOccupancies;
        local l_writeMaterials_2 = v75.writeMaterials;
        local l_writeOccupancies_2 = v75.writeOccupancies;
        local l_x_2 = v75.x;
        local l_y_2 = v75.y;
        local l_z_2 = v75.z;
        local l_sizeX_2 = v75.sizeX;
        local l_sizeY_2 = v75.sizeY;
        local l_sizeZ_2 = v75.sizeZ;
        local l_brushOccupancy_2 = v75.brushOccupancy;
        local l_magnitudePercent_2 = v75.magnitudePercent;
        local l_cellOccupancy_2 = v75.cellOccupancy;
        local l_strength_2 = v75.strength;
        local l_ignoreWater_2 = v75.ignoreWater;
        local l_airFillerMaterial_0 = v75.airFillerMaterial;
        local l_maxOccupancy_2 = v75.maxOccupancy;
        if not (l_cellOccupancy_2 ~= 0) or l_brushOccupancy_2 <= 0.5 then
            return ;
        else
            local l_l_cellOccupancy_2_0 = l_cellOccupancy_2;
            local v94 = false;
            local v95 = 6;
            for v96 = 1, 6 do
                local v97 = l_x_2 + v1.xOffset[v96];
                local v98 = l_y_2 + v1.yOffset[v96];
                local v99 = l_z_2 + v1.zOffset[v96];
                if ((((v97 > 0 and v97 <= l_sizeX_2) and v98 > 0) and v98 <= l_sizeY_2) and v99 > 0) and v99 <= l_sizeZ_2 then
                    local v100 = l_readOccupancies_2[v97][v98][v99];
                    local v101 = l_readMaterials_2[v97][v98][v99];
                    if l_ignoreWater_2 and v101 == l_Water_0 then
                        v100 = 0;
                    end;
                    if v100 <= 0 then
                        v94 = true;
                    end;
                    v95 = v95 - v100;
                end;
            end;
            if not (l_cellOccupancy_2 >= 1 and not v94) then
                l_l_cellOccupancy_2_0 = l_l_cellOccupancy_2_0 - ((((v95 / 6) * (l_strength_2 + 0.1)) * 0.25) * l_brushOccupancy_2) * l_magnitudePercent_2;
            end;
            l_l_cellOccupancy_2_0 = math.min(l_l_cellOccupancy_2_0, l_maxOccupancy_2);
            if l_l_cellOccupancy_2_0 <= v1.one256th then
                l_writeOccupancies_2[l_x_2][l_y_2][l_z_2] = l_airFillerMaterial_0 == l_Water_0 and 1 or 0;
                l_writeMaterials_2[l_x_2][l_y_2][l_z_2] = l_airFillerMaterial_0;
                return ;
            else
                l_writeOccupancies_2[l_x_2][l_y_2][l_z_2] = l_l_cellOccupancy_2_0;
                return ;
            end;
        end;
    end else function(v102)
        local l_readMaterials_3 = v102.readMaterials;
        local l_readOccupancies_3 = v102.readOccupancies;
        local l_writeMaterials_3 = v102.writeMaterials;
        local l_writeOccupancies_3 = v102.writeOccupancies;
        local v107 = nil;
        local v108 = nil;
        if v5 then
            v107 = v102.readWaterOccupancies;
            v108 = v102.writeWaterOccupancies;
        end;
        local l_x_3 = v102.x;
        local l_y_3 = v102.y;
        local l_z_3 = v102.z;
        local l_sizeX_3 = v102.sizeX;
        local l_sizeY_3 = v102.sizeY;
        local l_sizeZ_3 = v102.sizeZ;
        local l_brushOccupancy_3 = v102.brushOccupancy;
        local l_magnitudePercent_3 = v102.magnitudePercent;
        local l_cellOccupancy_3 = v102.cellOccupancy;
        local l_cellWaterOccupancy_1 = v102.cellWaterOccupancy;
        local l_strength_3 = v102.strength;
        local l_ignoreWater_3 = v102.ignoreWater;
        local l_airFillerMaterial_1 = v102.airFillerMaterial;
        local l_maxOccupancy_3 = v102.maxOccupancy;
        if not (not (not (l_cellOccupancy_3 ~= 0) or l_brushOccupancy_3 <= 0.5) or l_ignoreWater_3) and (not (l_cellWaterOccupancy_1 ~= 0) or l_brushOccupancy_3 <= 0.5) then
            return ;
        else
            local l_l_cellOccupancy_3_0 = l_cellOccupancy_3;
            local l_l_cellWaterOccupancy_1_0 = l_cellWaterOccupancy_1;
            local v125 = false;
            local v126 = false;
            local v127 = 6;
            local v128 = 6;
            for v129 = 1, 6 do
                local v130 = l_x_3 + v1.xOffset[v129];
                local v131 = l_y_3 + v1.yOffset[v129];
                local v132 = l_z_3 + v1.zOffset[v129];
                if ((((v130 > 0 and v130 <= l_sizeX_3) and v131 > 0) and v131 <= l_sizeY_3) and v132 > 0) and v132 <= l_sizeZ_3 then
                    local v133 = l_readMaterials_3[v130][v131][v132];
                    local v134 = if v133 == l_Air_0 then v107[v130][v131][v132] else l_readOccupancies_3[v130][v131][v132];
                    local v135 = v107[v130][v131][v132];
                    local v136 = false;
                    if v133 == l_Air_0 then
                        v136 = v135 > 0;
                    end;
                    if not (not l_ignoreWater_3 or not v136) then
                        v134 = 0;
                    end;
                    if v135 <= 0 then
                        v126 = true;
                    end;
                    if v134 <= 0 then
                        v125 = true;
                    end;
                    v127 = v127 - v134;
                    v128 = v128 - v135;
                end;
            end;
            if not (l_cellOccupancy_3 >= 1 and not v125) then
                l_l_cellOccupancy_3_0 = l_l_cellOccupancy_3_0 - ((((v127 / 6) * (l_strength_3 + 0.1)) * 0.25) * l_brushOccupancy_3) * l_magnitudePercent_3;
            end;
            if not (l_cellWaterOccupancy_1 >= 1 and not v126) then
                l_l_cellWaterOccupancy_1_0 = l_l_cellWaterOccupancy_1_0 - ((((v128 / 6) * (l_strength_3 + 0.1)) * 0.25) * l_brushOccupancy_3) * l_magnitudePercent_3;
            end;
            l_l_cellOccupancy_3_0 = math.min(l_l_cellOccupancy_3_0, l_maxOccupancy_3);
            l_l_cellWaterOccupancy_1_0 = math.min(l_l_cellWaterOccupancy_1_0, l_maxOccupancy_3);
            if l_l_cellOccupancy_3_0 <= v1.one256th then
                l_writeOccupancies_3[l_x_3][l_y_3][l_z_3] = l_airFillerMaterial_1 == l_Water_0 and 1 or 0;
                l_writeMaterials_3[l_x_3][l_y_3][l_z_3] = l_airFillerMaterial_1;
            else
                l_writeOccupancies_3[l_x_3][l_y_3][l_z_3] = l_l_cellOccupancy_3_0;
            end;
            if not l_ignoreWater_3 and l_l_cellWaterOccupancy_1_0 ~= l_cellWaterOccupancy_1 then
                v108[l_x_3][l_y_3][l_z_3] = l_l_cellWaterOccupancy_1_0;
            end;
            return ;
        end;
    end, 
    smooth = if not l_TerrainSmoothToolFix_0 then function(v137)
        local l_readMaterials_4 = v137.readMaterials;
        local l_readOccupancies_4 = v137.readOccupancies;
        local l_writeMaterials_4 = v137.writeMaterials;
        local l_writeOccupancies_4 = v137.writeOccupancies;
        local l_x_4 = v137.x;
        local l_y_4 = v137.y;
        local l_z_4 = v137.z;
        local l_sizeX_4 = v137.sizeX;
        local l_sizeY_4 = v137.sizeY;
        local l_sizeZ_4 = v137.sizeZ;
        local l_brushOccupancy_4 = v137.brushOccupancy;
        local l_magnitudePercent_4 = v137.magnitudePercent;
        local l_cellOccupancy_4 = v137.cellOccupancy;
        local l_cellMaterial_2 = v137.cellMaterial;
        local l_strength_4 = v137.strength;
        local l_filterSize_0 = v137.filterSize;
        local l_airFillerMaterial_2 = v137.airFillerMaterial;
        local l_ignoreWater_4 = v137.ignoreWater;
        if not (l_sizeX_4 > 2 and l_sizeZ_4 > 2) or l_sizeY_4 <= 2 then
            return ;
        elseif l_brushOccupancy_4 < 0.5 then
            return ;
        else
            local v156 = 0;
            local v157 = 0;
            local v158 = false;
            local v159 = false;
            local v160 = l_readMaterials_4[l_x_4][l_y_4][l_z_4];
            local v161 = true;
            if v160 ~= l_Air_0 then
                v161 = l_cellOccupancy_4 <= 0;
            end;
            for v162 = -l_filterSize_0, l_filterSize_0, l_filterSize_0 do
                for v163 = -l_filterSize_0, l_filterSize_0, l_filterSize_0 do
                    for v164 = -l_filterSize_0, l_filterSize_0, l_filterSize_0 do
                        local v165 = l_x_4 + v162;
                        local v166 = l_y_4 + v163;
                        local v167 = l_z_4 + v164;
                        if ((((v165 > 0 and v165 <= l_sizeX_4) and v166 > 0) and v166 <= l_sizeY_4) and v167 > 0) and v167 <= l_sizeZ_4 then
                            local v168 = l_readOccupancies_4[v165][v166][v167];
                            local v169 = 1 - math.sqrt((v162 * v162 + v163 * v163) + v164 * v164) / (l_filterSize_0 * 2);
                            local v170 = l_readMaterials_4[v165][v166][v167];
                            if l_ignoreWater_4 and v170 == l_Water_0 then
                                v168 = 0;
                            end;
                            if v168 >= 1 then
                                v158 = true;
                            end;
                            if v168 <= 0 then
                                v159 = true;
                            end;
                            v168 = v168 * 1.5 - 0.25;
                            v157 = v157 + 1 * v169;
                            v156 = v156 + v168 * v169;
                        end;
                    end;
                end;
            end;
            local v171 = ((((v156 / (v157 > 0 and v157 or l_cellOccupancy_4 * 1.5 - 0.25) - l_cellOccupancy_4) * (l_strength_4 + 0.1)) * 0.5) * l_brushOccupancy_4) * l_magnitudePercent_4;
            if not v158 and v171 > 0 then
                v171 = 0;
            elseif not v159 and v171 < 0 then
                v171 = 0;
            end;
            local v172 = math.max(0, (math.min(1, l_cellOccupancy_4 + v171)));
            if v172 ~= l_cellOccupancy_4 then
                if v161 and v172 > 0 then
                    l_writeMaterials_4[l_x_4][l_y_4][l_z_4] = v1.DEPRECATED_getMaterialForAutoMaterial(l_readMaterials_4, l_x_4, l_y_4, l_z_4, l_sizeX_4, l_sizeY_4, l_sizeZ_4, l_cellMaterial_2);
                elseif v172 <= 0 then
                    l_writeMaterials_4[l_x_4][l_y_4][l_z_4] = l_airFillerMaterial_2;
                end;
                l_writeOccupancies_4[l_x_4][l_y_4][l_z_4] = v172;
            end;
            return ;
        end;
    end else function(v173)
        local l_readMaterials_5 = v173.readMaterials;
        local l_readOccupancies_5 = v173.readOccupancies;
        local l_writeMaterials_5 = v173.writeMaterials;
        local l_writeOccupancies_5 = v173.writeOccupancies;
        local l_x_5 = v173.x;
        local l_y_5 = v173.y;
        local l_z_5 = v173.z;
        local _ = v173.sizeX;
        local _ = v173.sizeY;
        local _ = v173.sizeZ;
        local l_brushOccupancy_5 = v173.brushOccupancy;
        local l_magnitudePercent_5 = v173.magnitudePercent;
        local _ = v173.cellOccupancy;
        local _ = v173.cellMaterial;
        local l_strength_5 = v173.strength;
        local _ = v173.filterSize;
        local l_airFillerMaterial_3 = v173.airFillerMaterial;
        local l_ignoreWater_5 = v173.ignoreWater;
        local v192 = if not v173.smoothVoxelsUpgraded then v1.one256th else v1.one16th;
        if l_ignoreWater_5 and l_readMaterials_5[l_x_5][l_y_5][l_z_5] == Enum.Material.Water then
            l_writeOccupancies_5[l_x_5][l_y_5][l_z_5] = l_readOccupancies_5[l_x_5][l_y_5][l_z_5];
            l_writeMaterials_5[l_x_5][l_y_5][l_z_5] = l_readMaterials_5[l_x_5][l_y_5][l_z_5];
            return ;
        else
            local v193 = l_writeMaterials_5[l_x_5][l_y_5][l_z_5];
            local v194 = true;
            if v193 ~= l_Air_0 then
                v194 = l_writeOccupancies_5[l_x_5][l_y_5][l_z_5] <= 0;
            end;
            local v195 = math.max(0, (math.min(1, l_readOccupancies_5[l_x_5][l_y_5][l_z_5] + (((l_writeOccupancies_5[l_x_5][l_y_5][l_z_5] - l_readOccupancies_5[l_x_5][l_y_5][l_z_5]) * l_strength_5) * l_brushOccupancy_5) * l_magnitudePercent_5)));
            if v195 ~= l_writeOccupancies_5[l_x_5][l_y_5][l_z_5] then
                if v194 and v192 <= v195 then
                    l_writeMaterials_5[l_x_5][l_y_5][l_z_5] = l_readMaterials_5[l_x_5][l_y_5][l_z_5];
                elseif v195 <= 0 then
                    l_writeMaterials_5[l_x_5][l_y_5][l_z_5] = l_airFillerMaterial_3;
                end;
                l_writeOccupancies_5[l_x_5][l_y_5][l_z_5] = v195;
            end;
            return ;
        end;
    end
};
