local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_FlattenMode_0 = v2.FlattenMode;
local l_ToolId_0 = v2.ToolId;
local v5 = require(l_Parent_0.Src.Util.applyPivot);
local v6 = require(script.Parent.OperationHelper);
local v7 = require(script.Parent.SculptOperations);
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
return function(v10, v11, v12, v13, v14, v15, v16)
    local l_currentTool_0 = v10.currentTool;
    local l_brushShape_0 = v10.brushShape;
    local l_cursorSize_0 = v10.cursorSize;
    local v20 = v5(v10.pivot, v10.centerPoint, v10.cursorHeight * v1.VOXEL_RESOLUTION);
    local l_autoMaterial_0 = v10.autoMaterial;
    local l_material_0 = v10.material;
    local l_flattenMode_0 = v10.flattenMode;
    local l_ignoreWater_0 = v10.ignoreWater;
    local l_strength_0 = v10.strength;
    local l_x_0 = v20.x;
    local l_y_0 = v20.y;
    local l_z_0 = v20.z;
    local l_x_1 = v11.x;
    local l_y_1 = v11.y;
    local l_z_1 = v11.z;
    local l_x_2 = v12.x;
    local l_l_Air_0_0 = l_Air_0;
    local v34 = 0;
    if l_ignoreWater_0 then
        local v35, v36 = v6.getWaterHeightAndAirFillerMaterial(v13);
        v34 = v35;
        l_l_Air_0_0 = v36;
    end;
    local v37 = (l_x_2 - l_x_1) * 0.5;
    local v38 = #v14;
    local v39 = #v14[1];
    local v40 = #v14[1][1];
    local l_planeNormal_0 = v10.planeNormal;
    local l_planePoint_0 = v10.planePoint;
    local v43 = {
        readMaterials = v13, 
        readOccupancies = v14, 
        writeMaterials = v15, 
        writeOccupancies = v16, 
        sizeX = v38, 
        sizeY = v39, 
        sizeZ = v40, 
        strength = l_strength_0, 
        ignoreWater = l_ignoreWater_0, 
        desiredMaterial = l_material_0, 
        autoMaterial = l_autoMaterial_0, 
        filterSize = 1, 
        maxOccupancy = 1
    };
    for v44 = 1, v38 do
        local v45 = (l_x_1 + (v44 - 0.5) * v1.VOXEL_RESOLUTION) - l_x_0;
        for v46 = 1, v40 do
            local v47 = (l_z_1 + (v46 - 0.5) * v1.VOXEL_RESOLUTION) - l_z_0;
            if l_currentTool_0 == l_ToolId_0.Flatten then
                local v48, v49 = v6.getDesiredOccupancy(l_planePoint_0, l_planeNormal_0, v44, v46, l_y_1);
                local v50 = true;
                v43.x = v44;
                v43.z = v46;
                if v48 < 1 then
                    v48 = 1;
                    v50 = false;
                end;
                if v39 < v48 then
                    v48 = v39;
                    v50 = false;
                end;
                if not (l_flattenMode_0 ~= l_FlattenMode_0.Erode) or l_flattenMode_0 == l_FlattenMode_0.Both then
                    for v51 = v48 + 1, v39 do
                        local v52 = 0;
                        local l_l_Air_0_1 = l_Air_0;
                        local v54 = false;
                        local v55, v56 = v6.calculateBrushPowerForCell(v45, (l_y_1 + (v51 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v47, l_cursorSize_0, l_brushShape_0, v37, true);
                        if v55 ~= 0 then
                            if v51 ~= v39 then
                                v52 = v14[v44][v51 + 1][v46];
                                l_l_Air_0_1 = v13[v44][v51 + 1][v46];
                                local v57 = true;
                                if v52 ~= 0 then
                                    v57 = l_ignoreWater_0 and l_l_Air_0_1 == l_Water_0;
                                end;
                                v54 = v57;
                            end;
                            if v54 then
                                v52 = v14[v44][v51][v46];
                                l_l_Air_0_1 = v13[v44][v51][v46];
                                if l_ignoreWater_0 and l_l_Air_0_1 == l_Water_0 then
                                    l_l_Air_0_1 = l_Air_0;
                                    v52 = 0;
                                end;
                                l_l_Air_0_0 = v51 <= v34 and l_l_Air_0_0 or l_Air_0;
                                v43.y = v51;
                                v43.brushOccupancy = v55;
                                v43.magnitudePercent = v56;
                                v43.cellOccupancy = v52;
                                v43.cellMaterial = l_l_Air_0_1;
                                v43.airFillerMaterial = l_l_Air_0_0;
                                v7.erode(v43);
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                if not (l_flattenMode_0 ~= l_FlattenMode_0.Grow) or l_flattenMode_0 == l_FlattenMode_0.Both then
                    for v58 = v48 - 1, 1, -1 do
                        local v59 = 0;
                        local l_l_Air_0_2 = l_Air_0;
                        local v61 = false;
                        local v62, v63 = v6.calculateBrushPowerForCell(v45, (l_y_1 + (v58 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v47, l_cursorSize_0, l_brushShape_0, v37, true);
                        if v62 ~= 0 then
                            if v58 > 1 then
                                v59 = v14[v44][v58 - 1][v46];
                                l_l_Air_0_2 = v13[v44][v58 - 1][v46];
                                local v64 = false;
                                if v59 == 1 then
                                    v64 = l_l_Air_0_2 ~= l_Water_0;
                                end;
                                v61 = v64 or not l_ignoreWater_0 and l_l_Air_0_2 == l_Water_0;
                            end;
                            if v61 then
                                local v65 = v14[v44][v58][v46];
                                local v66 = v13[v44][v58][v46];
                                if l_ignoreWater_0 and v66 == l_Water_0 then
                                    v66 = l_Air_0;
                                    v65 = 0;
                                end;
                                l_l_Air_0_0 = v58 <= v34 and l_l_Air_0_0 or l_Air_0;
                                v43.y = v58;
                                v43.brushOccupancy = v62;
                                v43.magnitudePercent = v63;
                                v43.cellOccupancy = v65;
                                v43.cellMaterial = v66;
                                v43.airFillerMaterial = l_l_Air_0_0;
                                v7.grow(v43);
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                local l_v48_0 = v48;
                if v50 then
                    local v68 = v14[v44][v48][v46];
                    local v69 = v13[v44][v48][v46];
                    local v70, v71 = v6.calculateBrushPowerForCell(v45, (l_y_1 + (v48 - 0.5) * v1.VOXEL_RESOLUTION) - l_y_0, v47, l_cursorSize_0, l_brushShape_0, v37, true);
                    v43.y = l_v48_0;
                    v43.brushOccupancy = v70;
                    v43.magnitudePercent = v71;
                    v43.cellOccupancy = v68;
                    v43.cellMaterial = v69;
                    v43.airFillerMaterial = l_l_Air_0_0;
                    local v72 = true;
                    if l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                        v72 = v68 < 1;
                    end;
                    if not (not (l_v48_0 + 1 <= v39) or v72) then
                        local v73 = v14[v44][l_v48_0 + 1][v46];
                        local v74 = v13[v44][l_v48_0 + 1][v46];
                        local v75 = true;
                        if v73 ~= 0 then
                            v75 = l_ignoreWater_0 and v74 == l_Water_0;
                        end;
                        v72 = v75;
                    end;
                    local v76 = true;
                    if l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                        v76 = v68 > 0;
                    end;
                    if not (not (l_v48_0 - 1 >= 1) or v76) then
                        local v77 = v14[v44][l_v48_0 - 1][v46];
                        local v78 = v13[v44][l_v48_0 - 1][v46];
                        local v79;
                        if v77 == 1 then
                            v79 = true;
                            if not (v78 == l_Water_0) then
                                goto label0;
                            end;
                        end;
                        v79 = not l_ignoreWater_0 and v78 == l_Water_0;
                        ::label0::;
                        v76 = v79;
                    end;
                    if not (not v76 or not v72) then
                        if (not (l_flattenMode_0 ~= l_FlattenMode_0.Erode) or l_flattenMode_0 == l_FlattenMode_0.Both) and v49 < v68 then
                            v16[v44][l_v48_0][v46] = math.max(v68 - ((l_strength_0 * 0.25) * v70) * v71, v49);
                        end;
                        if (not (l_flattenMode_0 ~= l_FlattenMode_0.Grow) or l_flattenMode_0 == l_FlattenMode_0.Both) and v68 < v49 then
                            v16[v44][l_v48_0][v46] = math.min(v68 + ((l_strength_0 * 0.25) * v70) * v71, v49);
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
