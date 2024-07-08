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
return function(v12, v13, v14, v15, v16, v17, v18)
    local l_currentTool_0 = v12.currentTool;
    local l_brushMode_0 = v12.brushMode;
    local l_brushShape_0 = v12.brushShape;
    local l_cursorSize_0 = v12.cursorSize;
    local v23 = v6(v12.pivot, v12.centerPoint, v12.cursorHeight * v1.VOXEL_RESOLUTION);
    local l_autoMaterial_0 = v12.autoMaterial;
    local l_material_0 = v12.material;
    local l_flattenMode_0 = v12.flattenMode;
    local l_ignoreWater_0 = v12.ignoreWater;
    local l_strength_0 = v12.strength;
    local l_x_0 = v23.x;
    local l_y_0 = v23.y;
    local l_z_0 = v23.z;
    local l_x_1 = v13.x;
    local l_y_1 = v13.y;
    local l_z_1 = v13.z;
    local l_x_2 = v14.x;
    local l_l_Air_0_0 = l_Air_0;
    local v37 = 0;
    if l_ignoreWater_0 then
        local v38, v39 = v7.getWaterHeightAndAirFillerMaterial(v15);
        v37 = v38;
        l_l_Air_0_0 = v39;
    end;
    local v40 = (l_x_2 - l_x_1) * 0.5;
    local v41 = #v16;
    local v42 = #v16[1];
    local v43 = #v16[1][1];
    local v44 = {};
    local v45 = {};
    local v46 = math.floor((v23.x - l_x_1) / v1.VOXEL_RESOLUTION + 0.5);
    local v47 = math.floor((v23.y - l_y_1) / v1.VOXEL_RESOLUTION + 0.5);
    local v48 = math.floor((v23.z - l_z_1) / v1.VOXEL_RESOLUTION + 0.5);
    for v49 = -1, 1 do
        for v50 = -1, 1 do
            for v51 = -1, 1 do
                local v52 = v46 + v49;
                local v53 = v47 + v50;
                local v54 = v48 + v51;
                if ((((v52 > 0 and v52 <= v41) and v53 > 0) and v53 <= v42) and v54 > 0) and v54 <= v43 then
                    v44[v52 + v41 * (v53 + v41 * v54)] = true;
                    table.insert(v45, {
                        v52, 
                        v53, 
                        v54
                    });
                end;
            end;
        end;
    end;
    local v55;
    if not l_TerrainEditorOverhaul_0 then
        v55 = true;
        if not (l_currentTool_0 ~= l_ToolId_0.Erode) then
            goto label0;
        end;
    end;
    if l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Sculpt then
        v55 = true;
        if not (l_brushMode_0 ~= l_BrushMode_0.Subtract) then
            goto label0;
        end;
    end;
    v55 = l_currentTool_0 == l_ToolId_0.Flatten;
    ::label0::;
    local v56;
    if not l_TerrainEditorOverhaul_0 then
        v56 = true;
        if not (l_currentTool_0 ~= l_ToolId_0.Grow) then
            goto label1;
        end;
    end;
    if l_currentTool_0 == l_ToolId_0.Sculpt then
        v56 = true;
        if not (l_brushMode_0 ~= l_BrushMode_0.Add) then
            goto label1;
        end;
    end;
    v56 = l_currentTool_0 == l_ToolId_0.Flatten;
    ::label1::;
    local v57 = l_currentTool_0 == l_ToolId_0.Smooth;
    local l_planeNormal_0 = v12.planeNormal;
    local l_x_3 = l_planeNormal_0.x;
    local l_y_2 = l_planeNormal_0.y;
    local l_z_2 = l_planeNormal_0.z;
    local l_planePoint_0 = v12.planePoint;
    local l_x_4 = l_planePoint_0.x;
    local l_y_3 = l_planePoint_0.y;
    local l_z_3 = l_planePoint_0.z;
    local v66 = {
        readMaterials = v15, 
        readOccupancies = v16, 
        writeMaterials = v17, 
        writeOccupancies = v18, 
        sizeX = v41, 
        sizeY = v42, 
        sizeZ = v43, 
        strength = l_strength_0, 
        ignoreWater = l_ignoreWater_0, 
        desiredMaterial = l_material_0, 
        autoMaterial = l_autoMaterial_0, 
        filterSize = 1, 
        maxOccupancy = 1
    };
    while #v45 > 0 do
        local v67 = table.remove(v45);
        local v68 = v67[1];
        local v69 = v67[2];
        local v70 = v67[3];
        local v71 = v16[v68][v69][v70];
        local v72 = v15[v68][v69][v70];
        local v73 = l_ignoreWater_0 and v72 == l_Water_0;
        local v74 = l_x_1 + (v68 - 0.5) * v1.VOXEL_RESOLUTION;
        local v75 = v74 - l_x_0;
        local v76 = (v74 - l_x_4) * l_x_3;
        local v77 = l_y_1 + (v69 - 0.5) * v1.VOXEL_RESOLUTION;
        local v78 = v77 - l_y_0;
        local v79 = v76 + (v77 - l_y_3) * l_y_2;
        local v80 = l_z_1 + (v70 - 0.5) * v1.VOXEL_RESOLUTION;
        local v81 = v80 - l_z_0;
        local v82 = v79 + (v80 - l_z_3) * l_z_2;
        local v83;
        if not l_TerrainEditorOverhaul_0 then
            v83 = true;
            if not (l_currentTool_0 ~= l_ToolId_0.Erode) then
                goto label2;
            end;
        end;
        v83 = l_TerrainEditorOverhaul_0;
        if v83 then
            v83 = false;
            if l_currentTool_0 == l_ToolId_0.Sculpt then
                v83 = l_brushMode_0 == l_BrushMode_0.Subtract;
            end;
        end;
        ::label2::;
        local v84;
        if not l_TerrainEditorOverhaul_0 then
            v84 = true;
            if not (l_currentTool_0 ~= l_ToolId_0.Grow) then
                goto label3;
            end;
        end;
        v84 = l_TerrainEditorOverhaul_0;
        if v84 then
            v84 = false;
            if l_currentTool_0 == l_ToolId_0.Sculpt then
                v84 = l_brushMode_0 == l_BrushMode_0.Add;
            end;
        end;
        ::label3::;
        local v85 = l_currentTool_0 == l_ToolId_0.Smooth;
        if l_currentTool_0 == l_ToolId_0.Flatten then
            v66.maxOccupancy = math.abs(v82);
            if v1.FLATTEN_PLANE_TOLERANCE < v82 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                v83 = true;
            elseif v82 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                v84 = true;
            end;
        end;
        l_l_Air_0_0 = v69 <= v37 and l_l_Air_0_0 or l_Air_0;
        v66.airFillerMaterial = l_l_Air_0_0;
        if not (not (v83 and v71 > 0) or v73) then
            local l_v71_0 = v71;
            local v87, v88 = v7.calculateBrushPowerForCell(v75, v78, v81, l_cursorSize_0, l_brushShape_0, v40, true);
            if l_ignoreWater_0 and v72 == l_Water_0 then
                l_v71_0 = 0;
            end;
            v66.x = v68;
            v66.y = v69;
            v66.z = v70;
            v66.brushOccupancy = v87;
            v66.magnitudePercent = v88;
            v66.cellOccupancy = l_v71_0;
            v66.cellMaterial = v72;
            v8.erode(v66);
        end;
        if not (not v84 or v71 >= 1 and not v73) then
            local l_v71_1 = v71;
            local l_v72_0 = v72;
            local v91, v92 = v7.calculateBrushPowerForCell(v75, v78, v81, l_cursorSize_0, l_brushShape_0, v40, true);
            if l_ignoreWater_0 and l_v72_0 == l_Water_0 then
                l_v72_0 = l_Air_0;
                l_v71_1 = 0;
            end;
            v66.x = v68;
            v66.y = v69;
            v66.z = v70;
            v66.brushOccupancy = v91;
            v66.magnitudePercent = v92;
            v66.cellOccupancy = l_v71_1;
            v66.cellMaterial = l_v72_0;
            v66.desiredMaterial = l_material_0;
            v8.grow(v66);
        end;
        if v85 then
            local l_v71_2 = v71;
            local v94, v95 = v7.calculateBrushPowerForCell(v75, v78, v81, l_cursorSize_0, l_brushShape_0, v40, false);
            if v94 >= 0.5 then
                if l_ignoreWater_0 and v72 == l_Water_0 then
                    l_v71_2 = 0;
                end;
                v66.x = v68;
                v66.y = v69;
                v66.z = v70;
                v66.brushOccupancy = v94;
                v66.magnitudePercent = v95;
                v66.cellOccupancy = l_v71_2;
                v66.cellMaterial = v72;
                v8.smooth(v66);
            end;
        end;
        v83 = true;
        v84 = true;
        v85 = false;
        for v96 = -1, 1 do
            for v97 = -1, 1 do
                for v98 = -1, 1 do
                    local v99 = v68 + v96;
                    local v100 = v69 + v97;
                    local v101 = v70 + v98;
                    if (((((v99 > 0 and v99 <= v41) and v100 > 0) and v100 <= v42) and v101 > 0) and v101 <= v43) and (not (v96 == 0 and v97 == 0) or v98 ~= 0) then
                        local v102 = v16[v99][v100][v101];
                        if l_ignoreWater_0 and v15[v99][v100][v101] == l_Water_0 then
                            v102 = 0;
                        end;
                        if v102 > 0 then
                            v83 = false;
                        end;
                        if v102 < 1 then
                            v84 = false;
                        end;
                        if not (v83 or v84) then
                            v85 = true;
                            break;
                        end;
                    end;
                end;
                if v85 then
                    break;
                end;
            end;
            if v85 then
                break;
            end;
        end;
        v85 = true;
        if not l_TerrainEditorOverhaul_0 then
            if not (l_currentTool_0 ~= l_ToolId_0.Erode) or l_currentTool_0 == l_ToolId_0.Flatten and v1.FLATTEN_PLANE_TOLERANCE < v82 then
                local l_v83_0 = v83;
                if not l_v83_0 then
                    l_v83_0 = false;
                    if v71 == 1 then
                        l_v83_0 = not v73 and v84;
                    end;
                end;
                v85 = l_v83_0;
            elseif not (l_currentTool_0 ~= l_ToolId_0.Grow) or l_currentTool_0 == l_ToolId_0.Flatten and v82 < -v1.FLATTEN_PLANE_TOLERANCE then
                v85 = v84 or (not (v71 ~= 0) or v73) and v83;
            elseif (l_currentTool_0 == l_ToolId_0.Flatten and -v1.FLATTEN_PLANE_TOLERANCE < v82) and v82 < v1.FLATTEN_PLANE_TOLERANCE then
                v85 = false;
            elseif l_currentTool_0 == l_ToolId_0.Smooth then
                v85 = (v71 == 0 and v83) and true or v71 == 1 and (v84 and true or false);
            end;
        elseif l_currentTool_0 == l_ToolId_0.Sculpt then
            if not (l_brushMode_0 ~= l_BrushMode_0.Subtract) or l_currentTool_0 == l_ToolId_0.Flatten and v1.FLATTEN_PLANE_TOLERANCE < v82 then
                local l_v83_1 = v83;
                if not l_v83_1 then
                    l_v83_1 = false;
                    if v71 == 1 then
                        l_v83_1 = not v73 and v84;
                    end;
                end;
                v85 = l_v83_1;
            elseif not (l_brushMode_0 ~= l_BrushMode_0.Add) or l_currentTool_0 == l_ToolId_0.Flatten and v82 < -v1.FLATTEN_PLANE_TOLERANCE then
                v85 = v84 or (not (v71 ~= 0) or v73) and v83;
            end;
        elseif (l_currentTool_0 == l_ToolId_0.Flatten and -v1.FLATTEN_PLANE_TOLERANCE < v82) and v82 < v1.FLATTEN_PLANE_TOLERANCE then
            v85 = false;
        elseif l_currentTool_0 == l_ToolId_0.Smooth then
            v85 = (v71 == 0 and v83) and true or v71 == 1 and (v84 and true or false);
        end;
        if not v85 then
            for v105 = -1, 1 do
                for v106 = -1, 1 do
                    for v107 = -1, 1 do
                        local v108 = v68 + v105;
                        local v109 = v69 + v106;
                        local v110 = v70 + v107;
                        if (((((v108 > 0 and v108 <= v41) and v109 > 0) and v109 <= v42) and v110 > 0) and v110 <= v43) and (not (v105 == 0 and v106 == 0) or v107 ~= 0) then
                            local v111 = v16[v108][v109][v110];
                            if l_ignoreWater_0 and v15[v108][v109][v110] == l_Water_0 then
                                v111 = 0;
                            end;
                            local v112 = false;
                            local v113 = false;
                            if v55 then
                                v112 = v111 > 0;
                                if not (not (v71 == 1) or v73) and v111 == 1 then
                                    v112 = false;
                                end;
                            end;
                            if v56 then
                                v113 = v111 < 1;
                                if not (v71 ~= 0 and not v73) and v111 == 0 then
                                    v113 = false;
                                end;
                            end;
                            if not (not (v112 or v113) and not v57 or v44[v108 + v41 * (v109 + v41 * v110)]) then
                                v44[v108 + v41 * (v109 + v41 * v110)] = true;
                                table.insert(v45, {
                                    v108, 
                                    v109, 
                                    v110
                                });
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
