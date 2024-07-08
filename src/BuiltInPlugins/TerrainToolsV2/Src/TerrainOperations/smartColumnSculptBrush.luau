local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_FlattenMode_0 = v2.FlattenMode;
local l_ToolId_0 = v2.ToolId;
local v5 = require(l_Parent_0.Src.Util.applyPivot);
local v6 = require(script.Parent.OperationHelper);
local v7 = require(script.Parent.SculptOperations);
local l_Air_0 = Enum.Material.Air;
return function(v9, v10, v11, v12, v13, v14, v15, v16, v17)
    local l_currentTool_0 = v9.currentTool;
    local l_brushShape_0 = v9.brushShape;
    local l_cursorSize_0 = v9.cursorSize;
    local v21 = v5(v9.pivot, v9.centerPoint, v9.cursorHeight * v1.VOXEL_RESOLUTION);
    local l_autoMaterial_0 = v9.autoMaterial;
    local l_material_0 = v9.material;
    local l_flattenMode_0 = v9.flattenMode;
    local l_ignoreWater_0 = v9.ignoreWater;
    local l_strength_0 = v9.strength;
    local l_x_0 = v21.x;
    local l_y_0 = v21.y;
    local l_z_0 = v21.z;
    local l_x_1 = v10.x;
    local l_y_1 = v10.y;
    local l_z_1 = v10.z;
    local l_x_2 = v11.x;
    local l_l_Air_0_0 = l_Air_0;
    local v35 = 0;
    if l_ignoreWater_0 then
        local v36, v37 = v6.getWaterHeightAndAirFillerMaterial(v12);
        v35 = v36;
        l_l_Air_0_0 = v37;
    end;
    local v38 = (l_x_2 - l_x_1) * 0.5;
    local v39 = #v13;
    local v40 = #v13[1];
    local v41 = #v13[1][1];
    local l_planeNormal_0 = v9.planeNormal;
    local l_planePoint_0 = v9.planePoint;
    local v44 = {
        readMaterials = v12, 
        readOccupancies = v13, 
        readWaterOccupancies = v14, 
        writeMaterials = v15, 
        writeOccupancies = v16, 
        writeWaterOccupancies = v17, 
        sizeX = v39, 
        sizeY = v40, 
        sizeZ = v41, 
        strength = l_strength_0, 
        ignoreWater = l_ignoreWater_0, 
        desiredMaterial = l_material_0, 
        autoMaterial = l_autoMaterial_0, 
        filterSize = 1, 
        maxOccupancy = 1
    };
    for v45 = 1, v39 do
        local v46 = (l_x_1 + (v45 - 0.5) * v1.VOXEL_RESOLUTION) - l_x_0;
        for v47 = 1, v41 do
            local v48 = (l_z_1 + (v47 - 0.5) * v1.VOXEL_RESOLUTION) - l_z_0;
            if l_currentTool_0 == l_ToolId_0.Flatten then
                local v49, v50 = v6.getDesiredOccupancy(l_planePoint_0, l_planeNormal_0, v45, v47, l_y_1);
                local v51 = true;
                v44.x = v45;
                v44.z = v47;
                if v49 < 1 then
                    v49 = 1;
                    v51 = false;
                end;
                if v40 < v49 then
                    v49 = v40;
                    v51 = false;
                end;
                if not (l_flattenMode_0 ~= l_FlattenMode_0.Erode) or l_flattenMode_0 == l_FlattenMode_0.Both then
                    for v52 = v49 + 1, v40 do
                        local v53 = 0;
                        local l_l_Air_0_1 = l_Air_0;
                        local v55 = 0;
                        local v56 = false;
                        local v57, v58 = v6.calculateBrushPowerForCell(v46, (l_y_1 + (v52 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v48, l_cursorSize_0, l_brushShape_0, v38, true);
                        if v57 ~= 0 then
                            if v52 ~= v40 then
                                v53 = v13[v45][v52 + 1][v47];
                                l_l_Air_0_1 = v12[v45][v52 + 1][v47];
                                v55 = v14[v45][v52 + 1][v47];
                                local v59;
                                if l_ignoreWater_0 then
                                    v59 = true;
                                    if not (l_l_Air_0_1 ~= l_Air_0) then
                                        goto label0;
                                    end;
                                end;
                                v59 = not l_ignoreWater_0;
                                if v59 then
                                    v59 = false;
                                    if v55 == 0 then
                                        v59 = l_l_Air_0_1 == l_Air_0;
                                    end;
                                end;
                                ::label0::;
                                v56 = v59;
                            end;
                            if v56 then
                                v53 = v13[v45][v52][v47];
                                l_l_Air_0_1 = v12[v45][v52][v47];
                                v55 = v14[v45][v52][v47];
                                l_l_Air_0_0 = v52 <= v35 and l_l_Air_0_0 or l_Air_0;
                                v44.y = v52;
                                v44.brushOccupancy = v57;
                                v44.magnitudePercent = v58;
                                v44.cellOccupancy = v53;
                                v44.cellMaterial = l_l_Air_0_1;
                                v44.cellWaterOccupancy = v55;
                                v44.airFillerMaterial = l_l_Air_0_0;
                                v7.erode(v44);
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                if not (l_flattenMode_0 ~= l_FlattenMode_0.Grow) or l_flattenMode_0 == l_FlattenMode_0.Both then
                    for v60 = v49 - 1, 1, -1 do
                        local v61 = 0;
                        local l_l_Air_0_2 = l_Air_0;
                        local v63 = 0;
                        local v64 = false;
                        local v65, v66 = v6.calculateBrushPowerForCell(v46, (l_y_1 + (v60 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v48, l_cursorSize_0, l_brushShape_0, v38, true);
                        if v65 ~= 0 then
                            if v60 > 1 then
                                v61 = v13[v45][v60 - 1][v47];
                                l_l_Air_0_2 = v12[v45][v60 - 1][v47];
                                v63 = v14[v45][v60 - 1][v47];
                                local v67 = false;
                                if v61 == 1 then
                                    local v68 = false;
                                    if l_l_Air_0_2 == l_Air_0 then
                                        v68 = v63 > 0;
                                    end;
                                    v67 = not v68;
                                end;
                                v67 = v67;
                                if not v67 then
                                    v67 = not l_ignoreWater_0;
                                    if v67 then
                                        v67 = false;
                                        if l_l_Air_0_2 == l_Air_0 then
                                            v67 = v63 > 0;
                                        end;
                                    end;
                                end;
                                v64 = v67;
                            end;
                            if v64 then
                                v61 = v13[v45][v60][v47];
                                l_l_Air_0_2 = v12[v45][v60][v47];
                                v63 = v14[v45][v60][v47];
                                l_l_Air_0_0 = v60 <= v35 and l_l_Air_0_0 or l_Air_0;
                                v44.y = v60;
                                v44.brushOccupancy = v65;
                                v44.magnitudePercent = v66;
                                v44.cellOccupancy = v61;
                                v44.cellMaterial = l_l_Air_0_2;
                                v44.cellWaterOccupancy = v63;
                                v44.airFillerMaterial = l_l_Air_0_0;
                                v7.grow(v44);
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                local l_v49_0 = v49;
                if v51 then
                    local v70 = v13[v45][v49][v47];
                    local v71 = v12[v45][v49][v47];
                    local v72 = v14[v45][v49][v47];
                    local v73, v74 = v6.calculateBrushPowerForCell(v46, (l_y_1 + (v49 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v48, l_cursorSize_0, l_brushShape_0, v38, true);
                    v44.y = l_v49_0;
                    v44.brushOccupancy = v73;
                    v44.magnitudePercent = v74;
                    v44.cellOccupancy = v70;
                    v44.cellMaterial = v71;
                    v44.airFillerMaterial = l_l_Air_0_0;
                    local v75 = true;
                    if l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                        v75 = v70 < 1;
                    end;
                    if not (not (l_v49_0 + 1 <= v40) or v75) then
                        local v76 = v13[v45][l_v49_0 + 1][v47];
                        local v77 = v12[v45][l_v49_0 + 1][v47];
                        local v78 = v14[v45][l_v49_0 + 1][v47];
                        local v79 = false;
                        if v77 == l_Air_0 then
                            v79 = v78 > 0;
                        end;
                        local v80 = true;
                        if v76 ~= 0 then
                            v80 = l_ignoreWater_0 and v79;
                        end;
                        v75 = v80;
                    end;
                    local v81 = true;
                    if l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                        v81 = v70 > 0;
                    end;
                    if not (not (l_v49_0 - 1 >= 1) or v81) then
                        local v82 = v13[v45][l_v49_0 - 1][v47];
                        local v83 = v12[v45][l_v49_0 - 1][v47];
                        local v84 = v14[v45][l_v49_0 - 1][v47];
                        local v85 = false;
                        if v83 == l_Air_0 then
                            v85 = v84 > 0;
                        end;
                        v81 = v82 == 1 and not v85 or not l_ignoreWater_0 and v85;
                    end;
                    if not (not v81 or not v75) then
                        if (not (l_flattenMode_0 ~= l_FlattenMode_0.Erode) or l_flattenMode_0 == l_FlattenMode_0.Both) and v50 < v70 then
                            v16[v45][l_v49_0][v47] = math.max(v70 - ((l_strength_0 * 0.25) * v73) * v74, v50);
                            if not l_ignoreWater_0 and v50 < v72 then
                                v17[v45][l_v49_0][v47] = math.max(v72 - ((l_strength_0 * 0.25) * v73) * v74, v50);
                            end;
                        end;
                        if (not (l_flattenMode_0 ~= l_FlattenMode_0.Grow) or l_flattenMode_0 == l_FlattenMode_0.Both) and v70 < v50 then
                            v16[v45][l_v49_0][v47] = math.min(v70 + ((l_strength_0 * 0.25) * v73) * v74, v50);
                            if (not l_ignoreWater_0 and v72 ~= 0) and v72 < v50 then
                                v17[v45][l_v49_0][v47] = math.min(v72 + ((l_strength_0 * 0.25) * v73) * v74, v50);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
