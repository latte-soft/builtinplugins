local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushMode_0 = v2.BrushMode;
local l_FlattenMode_0 = v2.FlattenMode;
local l_ToolId_0 = v2.ToolId;
local v6 = require(l_Parent_0.Src.Util.applyPivot);
local v7 = require(script.Parent.OperationHelper);
local v8 = require(script.Parent.SculptOperations);
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
return function(v12, v13, v14, v15, v16, v17, v18, v19, v20)
    local l_currentTool_0 = v12.currentTool;
    local l_brushMode_0 = v12.brushMode;
    local l_brushShape_0 = v12.brushShape;
    local l_cursorSize_0 = v12.cursorSize;
    local v25 = v6(v12.pivot, v12.centerPoint, v12.cursorHeight * v1.VOXEL_RESOLUTION);
    local l_autoMaterial_0 = v12.autoMaterial;
    local l_material_0 = v12.material;
    local l_flattenMode_0 = v12.flattenMode;
    local l_ignoreWater_0 = v12.ignoreWater;
    local l_strength_0 = v12.strength;
    local l_x_0 = v25.x;
    local l_y_0 = v25.y;
    local l_z_0 = v25.z;
    local l_x_1 = v13.x;
    local l_y_1 = v13.y;
    local l_z_1 = v13.z;
    local l_x_2 = v14.x;
    local l_l_Air_0_0 = l_Air_0;
    local v39 = 0;
    if l_ignoreWater_0 then
        local v40, v41 = v7.getWaterHeightAndAirFillerMaterial(v15);
        v39 = v40;
        l_l_Air_0_0 = v41;
    end;
    local v42 = (l_x_2 - l_x_1) * 0.5;
    local v43 = #v16;
    local v44 = #v16[1];
    local v45 = #v16[1][1];
    local v46 = {};
    local v47 = {};
    local v48 = math.floor((v25.x - l_x_1) / v1.VOXEL_RESOLUTION + 0.5);
    local v49 = math.floor((v25.y - l_y_1) / v1.VOXEL_RESOLUTION + 0.5);
    local v50 = math.floor((v25.z - l_z_1) / v1.VOXEL_RESOLUTION + 0.5);
    for v51 = -1, 1 do
        for v52 = -1, 1 do
            for v53 = -1, 1 do
                local v54 = v48 + v51;
                local v55 = v49 + v52;
                local v56 = v50 + v53;
                if ((((v54 > 0 and v54 <= v43) and v55 > 0) and v55 <= v44) and v56 > 0) and v56 <= v45 then
                    v46[v54 + v43 * (v55 + v43 * v56)] = true;
                    table.insert(v47, {
                        v54, 
                        v55, 
                        v56
                    });
                end;
            end;
        end;
    end;
    local v57;
    if not l_TerrainEditorOverhaul_0 then
        v57 = true;
        if not (l_currentTool_0 ~= l_ToolId_0.Erode) then
            goto label0;
        end;
    end;
    if l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Sculpt then
        v57 = true;
        if not (l_brushMode_0 ~= l_BrushMode_0.Subtract) then
            goto label0;
        end;
    end;
    v57 = l_currentTool_0 == l_ToolId_0.Flatten;
    ::label0::;
    local v58;
    if not l_TerrainEditorOverhaul_0 then
        v58 = true;
        if not (l_currentTool_0 ~= l_ToolId_0.Grow) then
            goto label1;
        end;
    end;
    if l_currentTool_0 == l_ToolId_0.Sculpt then
        v58 = true;
        if not (l_brushMode_0 ~= l_BrushMode_0.Add) then
            goto label1;
        end;
    end;
    v58 = l_currentTool_0 == l_ToolId_0.Flatten;
    ::label1::;
    local v59 = l_currentTool_0 == l_ToolId_0.Smooth;
    local l_planeNormal_0 = v12.planeNormal;
    local l_x_3 = l_planeNormal_0.x;
    local l_y_2 = l_planeNormal_0.y;
    local l_z_2 = l_planeNormal_0.z;
    local l_planePoint_0 = v12.planePoint;
    local l_x_4 = l_planePoint_0.x;
    local l_y_3 = l_planePoint_0.y;
    local l_z_3 = l_planePoint_0.z;
    local v68 = {
        readMaterials = v15, 
        readOccupancies = v16, 
        readWaterOccupancies = v17, 
        writeMaterials = v18, 
        writeOccupancies = v19, 
        writeWaterOccupancies = v20, 
        sizeX = v43, 
        sizeY = v44, 
        sizeZ = v45, 
        strength = l_strength_0, 
        ignoreWater = l_ignoreWater_0, 
        desiredMaterial = l_material_0, 
        autoMaterial = l_autoMaterial_0, 
        filterSize = 1, 
        maxOccupancy = 1
    };
    while #v47 > 0 do
        local v69 = table.remove(v47);
        local v70 = v69[1];
        local v71 = v69[2];
        local v72 = v69[3];
        local v73 = v16[v70][v71][v72];
        local v74 = v15[v70][v71][v72];
        local v75 = v17[v70][v71][v72];
        local l_l_ignoreWater_0_0 = l_ignoreWater_0;
        if l_l_ignoreWater_0_0 then
            l_l_ignoreWater_0_0 = true;
            if v74 ~= l_Water_0 then
                l_l_ignoreWater_0_0 = false;
                if v15[v70][v71][v72] == l_Air_0 then
                    l_l_ignoreWater_0_0 = v17[v70][v71][v72] ~= 0;
                end;
            end;
        end;
        local v77 = l_x_1 + (v70 - 0.5) * v1.VOXEL_RESOLUTION;
        local v78 = v77 - l_x_0;
        local v79 = (v77 - l_x_4) * l_x_3;
        local v80 = l_y_1 + (v71 - 0.5) * v1.VOXEL_RESOLUTION;
        local v81 = v80 - l_y_0;
        local v82 = v79 + (v80 - l_y_3) * l_y_2;
        local v83 = l_z_1 + (v72 - 0.5) * v1.VOXEL_RESOLUTION;
        local v84 = v83 - l_z_0;
        local v85 = v82 + (v83 - l_z_3) * l_z_2;
        local v86;
        if not l_TerrainEditorOverhaul_0 then
            v86 = true;
            if not (l_currentTool_0 ~= l_ToolId_0.Erode) then
                goto label2;
            end;
        end;
        v86 = l_TerrainEditorOverhaul_0;
        if v86 then
            v86 = false;
            if l_currentTool_0 == l_ToolId_0.Sculpt then
                v86 = l_brushMode_0 == l_BrushMode_0.Subtract;
            end;
        end;
        ::label2::;
        local v87;
        if not l_TerrainEditorOverhaul_0 then
            v87 = true;
            if not (l_currentTool_0 ~= l_ToolId_0.Grow) then
                goto label3;
            end;
        end;
        v87 = l_TerrainEditorOverhaul_0;
        if v87 then
            v87 = false;
            if l_currentTool_0 == l_ToolId_0.Sculpt then
                v87 = l_brushMode_0 == l_BrushMode_0.Add;
            end;
        end;
        ::label3::;
        local v88 = l_currentTool_0 == l_ToolId_0.Smooth;
        if l_currentTool_0 == l_ToolId_0.Flatten then
            v68.maxOccupancy = math.abs(v85);
            if v1.FLATTEN_PLANE_TOLERANCE < v85 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                v86 = true;
            elseif v85 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                v87 = true;
            end;
        end;
        l_l_Air_0_0 = v71 <= v39 and l_l_Air_0_0 or l_Air_0;
        v68.airFillerMaterial = l_l_Air_0_0;
        if not (not (v86 and v73 > 0) or l_l_ignoreWater_0_0) then
            local l_v73_0 = v73;
            local v90, v91 = v7.calculateBrushPowerForCell(v78, v81, v84, l_cursorSize_0, l_brushShape_0, v42, true);
            if l_ignoreWater_0 and v74 == l_Water_0 then
                l_v73_0 = 0;
            end;
            v68.x = v70;
            v68.y = v71;
            v68.z = v72;
            v68.brushOccupancy = v90;
            v68.magnitudePercent = v91;
            v68.cellOccupancy = l_v73_0;
            v68.cellMaterial = v74;
            v68.cellWaterOccupancy = v75;
            v8.erode(v68);
        end;
        if not (not v87 or v73 >= 1 and not l_l_ignoreWater_0_0) then
            local l_v73_1 = v73;
            local l_v74_0 = v74;
            local v94, v95 = v7.calculateBrushPowerForCell(v78, v81, v84, l_cursorSize_0, l_brushShape_0, v42, true);
            if l_ignoreWater_0 and l_v74_0 == l_Water_0 then
                l_v74_0 = l_Air_0;
                l_v73_1 = 0;
            end;
            v68.x = v70;
            v68.y = v71;
            v68.z = v72;
            v68.brushOccupancy = v94;
            v68.magnitudePercent = v95;
            v68.cellOccupancy = l_v73_1;
            v68.cellMaterial = l_v74_0;
            v68.cellWaterOccupancy = v75;
            v68.desiredMaterial = l_material_0;
            v8.grow(v68);
        end;
        if v88 then
            local l_v73_2 = v73;
            local v97, v98 = v7.calculateBrushPowerForCell(v78, v81, v84, l_cursorSize_0, l_brushShape_0, v42, false);
            if v97 >= 0.5 then
                if l_ignoreWater_0 and v74 == l_Water_0 then
                    l_v73_2 = 0;
                end;
                v68.x = v70;
                v68.y = v71;
                v68.z = v72;
                v68.brushOccupancy = v97;
                v68.magnitudePercent = v98;
                v68.cellOccupancy = l_v73_2;
                v68.cellMaterial = v74;
                v8.smooth(v68);
            end;
        end;
        v86 = true;
        v87 = true;
        v88 = false;
        for v99 = -1, 1 do
            for v100 = -1, 1 do
                for v101 = -1, 1 do
                    local v102 = v70 + v99;
                    local v103 = v71 + v100;
                    local v104 = v72 + v101;
                    if (((((v102 > 0 and v102 <= v43) and v103 > 0) and v103 <= v44) and v104 > 0) and v104 <= v45) and (not (v99 == 0 and v100 == 0) or v101 ~= 0) then
                        local v105 = if not (v15[v102][v103][v104] == l_Air_0) or l_ignoreWater_0 then v16[v102][v103][v104] else v17[v102][v103][v104];
                        if l_ignoreWater_0 and (not (v15[v102][v103][v104] ~= l_Water_0) or v15[v102][v103][v104] == l_Air_0) then
                            v105 = 0;
                        end;
                        if v105 > 0 then
                            v86 = false;
                        end;
                        if v105 < 1 then
                            v87 = false;
                        end;
                        if not (v86 or v87) then
                            v88 = true;
                            break;
                        end;
                    end;
                end;
                if v88 then
                    break;
                end;
            end;
            if v88 then
                break;
            end;
        end;
        v88 = true;
        if not l_TerrainEditorOverhaul_0 then
            if not (l_currentTool_0 ~= l_ToolId_0.Erode) or l_currentTool_0 == l_ToolId_0.Flatten and v1.FLATTEN_PLANE_TOLERANCE < v85 then
                local l_v86_0 = v86;
                if not l_v86_0 then
                    l_v86_0 = false;
                    if v73 == 1 then
                        l_v86_0 = not l_l_ignoreWater_0_0 and v87;
                    end;
                end;
                v88 = l_v86_0;
            elseif not (l_currentTool_0 ~= l_ToolId_0.Grow) or l_currentTool_0 == l_ToolId_0.Flatten and v85 < -v1.FLATTEN_PLANE_TOLERANCE then
                v88 = v87 or (not (v73 ~= 0) or l_l_ignoreWater_0_0) and v86;
            elseif (l_currentTool_0 == l_ToolId_0.Flatten and -v1.FLATTEN_PLANE_TOLERANCE < v85) and v85 < v1.FLATTEN_PLANE_TOLERANCE then
                v88 = false;
            elseif l_currentTool_0 == l_ToolId_0.Smooth then
                v88 = (v73 == 0 and v86) and true or v73 == 1 and (v87 and true or false);
            end;
        else
            local v107 = if not (v74 == l_Air_0) or l_ignoreWater_0 then v73 else v75;
            if l_currentTool_0 == l_ToolId_0.Sculpt then
                if not (l_brushMode_0 ~= l_BrushMode_0.Subtract) or l_currentTool_0 == l_ToolId_0.Flatten and v1.FLATTEN_PLANE_TOLERANCE < v85 then
                    local l_v86_1 = v86;
                    if not l_v86_1 then
                        l_v86_1 = false;
                        if v107 == 1 then
                            l_v86_1 = not l_l_ignoreWater_0_0 and v87;
                        end;
                    end;
                    v88 = l_v86_1;
                elseif not (l_brushMode_0 ~= l_BrushMode_0.Add) or l_currentTool_0 == l_ToolId_0.Flatten and v85 < -v1.FLATTEN_PLANE_TOLERANCE then
                    v88 = v87 or (not (v107 ~= 0) or l_l_ignoreWater_0_0) and v86;
                end;
            elseif (l_currentTool_0 == l_ToolId_0.Flatten and -v1.FLATTEN_PLANE_TOLERANCE < v85) and v85 < v1.FLATTEN_PLANE_TOLERANCE then
                v88 = false;
            elseif l_currentTool_0 == l_ToolId_0.Smooth then
                v88 = (v107 == 0 and v86) and true or v107 == 1 and (v87 and true or false);
            end;
        end;
        if not v88 then
            for v109 = -1, 1 do
                for v110 = -1, 1 do
                    for v111 = -1, 1 do
                        local v112 = v70 + v109;
                        local v113 = v71 + v110;
                        local v114 = v72 + v111;
                        if (((((v112 > 0 and v112 <= v43) and v113 > 0) and v113 <= v44) and v114 > 0) and v114 <= v45) and (not (v109 == 0 and v110 == 0) or v111 ~= 0) then
                            local v115 = if not (v15[v112][v113][v114] == l_Air_0) or l_ignoreWater_0 then v16[v112][v113][v114] else v17[v112][v113][v114];
                            local v116 = if not (v74 == l_Air_0) or l_ignoreWater_0 then v73 else v75;
                            if l_ignoreWater_0 and (not (v15[v112][v113][v114] ~= l_Water_0) or v15[v112][v113][v114] == l_Air_0 and v17[v112][v113][v114] ~= 0) then
                                v115 = 0;
                            end;
                            local v117 = false;
                            local v118 = false;
                            if v57 then
                                v117 = v115 > 0;
                                if not (not (v116 == 1) or l_l_ignoreWater_0_0) and v115 == 1 then
                                    v117 = false;
                                end;
                            end;
                            if v58 then
                                v118 = v115 < 1;
                                if not (v116 ~= 0 and not l_l_ignoreWater_0_0) and v115 == 0 then
                                    v118 = false;
                                end;
                            end;
                            if not (not (v117 or v118) and not v59 or v46[v112 + v43 * (v113 + v43 * v114)]) then
                                v46[v112 + v43 * (v113 + v43 * v114)] = true;
                                table.insert(v47, {
                                    v112, 
                                    v113, 
                                    v114
                                });
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
