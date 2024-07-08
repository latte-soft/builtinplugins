local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushMode_0 = v2.BrushMode;
local l_BrushShape_0 = v2.BrushShape;
local l_FlattenMode_0 = v2.FlattenMode;
local l_ToolId_0 = v2.ToolId;
local v7 = require(l_Parent_0.Src.Util.applyPivot);
local v8 = require(script.Parent.OperationHelper);
local v9 = require(script.Parent.DEPRECATED_smartLargeSculptBrush);
local v10 = require(script.Parent.DEPRECATED_smartColumnSculptBrush);
local v11 = require(script.Parent.SculptOperations);
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_TerrainSmoothToolFix_0 = game:GetFastFlag("TerrainSmoothToolFix");
return function(v16, v17)
    local v18 = v17.cursorHeight * v1.VOXEL_RESOLUTION;
    local l_cursorSize_0 = v17.cursorSize;
    local v20 = l_cursorSize_0 * v1.VOXEL_RESOLUTION;
    local v21 = v7(v17.pivot, v17.centerPoint, v18);
    local l_autoMaterial_0 = v17.autoMaterial;
    local l_brushMode_0 = v17.brushMode;
    local l_brushShape_0 = v17.brushShape;
    local l_ignoreWater_0 = v17.ignoreWater;
    local l_material_0 = v17.material;
    local v27 = v20 * 0.5;
    local l_replaceMaterial_0 = v17.replaceMaterial;
    local l_source_0 = v17.source;
    local l_target_0 = v17.target;
    local l_currentTool_0 = v17.currentTool;
    assert(v16 ~= nil, "performTerrainBrushOperation requires a terrain instance");
    local v32 = false;
    if l_currentTool_0 ~= nil then
        v32 = type(l_currentTool_0) == "string";
    end;
    assert(v32, "performTerrainBrushOperation requires a currentTool parameter");
    local v33 = Vector3.new(v8.clampDownToVoxel(v21.x - v27), v8.clampDownToVoxel(v21.y - v18 * 0.5), v8.clampDownToVoxel(v21.z - v27));
    v32 = Vector3.new(v8.clampUpToVoxel(v21.x + v27), v8.clampUpToVoxel(v21.y + v18 * 0.5), v8.clampUpToVoxel(v21.z + v27));
    if not l_TerrainEditorOverhaul_0 then
        if l_currentTool_0 == l_ToolId_0.Add then
            v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditAddTool;
        elseif not (l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Paint) or not l_replaceMaterial_0 then
            if not l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Replace then
                v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
            end;
        else
            v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
        end;
        if not (l_currentTool_0 ~= l_ToolId_0.Add and (not (l_currentTool_0 == l_ToolId_0.Subtract) or l_ignoreWater_0) or l_autoMaterial_0) then
            if l_currentTool_0 == l_ToolId_0.Subtract then
                l_material_0 = l_Air_0;
            end;
            if l_brushShape_0 == l_BrushShape_0.Sphere then
                v16:FillBall(v21, v27, l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cube then
                v16:FillBlock(CFrame.new(v21), Vector3.new(v20, v18, v20), l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cylinder then
                if (v32 - v33).x <= 2 * v1.VOXEL_RESOLUTION then
                    v16:FillBall(v21, v27, l_material_0);
                    return ;
                else
                    v16:FillCylinder(CFrame.new(v21), v18, v27, l_material_0);
                    return ;
                end;
            else
                assert(false, "Invalid brush shape in performTerrainBrushOperation quick path");
                return ;
            end;
        end;
    else
        if l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Add then
            v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditAddTool;
        elseif not (l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Paint) or not l_replaceMaterial_0 then
            if not l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Replace then
                v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
            end;
        else
            v16.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
        end;
        if not ((not (l_currentTool_0 == l_ToolId_0.Draw) or l_brushMode_0 ~= l_BrushMode_0.Add and (not (l_brushMode_0 == l_BrushMode_0.Subtract) or l_ignoreWater_0)) or l_autoMaterial_0) then
            local v34 = -1;
            if l_brushMode_0 == l_BrushMode_0.Subtract then
                l_material_0 = l_Air_0;
                v34 = 0;
            end;
            if l_brushShape_0 == l_BrushShape_0.Sphere then
                v16:FillBall(v21, v27 + v34, l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cube then
                v16:FillBlock(CFrame.new(v21), Vector3.new(v20 + v34, v18 + v34, v20 + v34), l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cylinder then
                if (v32 - v33).x <= 2 * v1.VOXEL_RESOLUTION then
                    v16:FillBall(v21, v27 + v34, l_material_0);
                    return ;
                else
                    v16:FillCylinder(CFrame.new(v21), v18 + v34, v27 + v34, l_material_0);
                    return ;
                end;
            else
                assert(false, "Invalid brush shape in performTerrainBrushOperation quick path");
                return ;
            end;
        end;
    end;
    local l_strength_0 = v17.strength;
    local v36 = Region3.new(v33, v32);
    local v37, v38 = v16:ReadVoxels(v36, v1.VOXEL_RESOLUTION);
    local v39 = nil;
    local v40 = nil;
    if not (l_currentTool_0 == l_ToolId_0.Smooth) or not l_TerrainSmoothToolFix_0 then
        local v41, v42 = v16:ReadVoxels(v36, v1.VOXEL_RESOLUTION);
        v39 = v41;
        v40 = v42;
    else
        local v43, v44 = v16:SmoothRegion(v36, v1.VOXEL_RESOLUTION, l_strength_0);
        v39 = v43;
        v40 = v44;
    end;
    local v45;
    if not l_TerrainEditorOverhaul_0 then
        v45 = true;
        if l_currentTool_0 ~= l_ToolId_0.Grow then
            v45 = true;
            if l_currentTool_0 ~= l_ToolId_0.Erode then
                v45 = true;
                if l_currentTool_0 ~= l_ToolId_0.Flatten then
                    v45 = l_ToolId_0.Smooth and not l_TerrainSmoothToolFix_0;
                end;
            end;
        end;
    else
        v45 = true;
        if l_currentTool_0 ~= l_ToolId_0.Sculpt then
            v45 = true;
            if l_currentTool_0 ~= l_ToolId_0.Flatten then
                v45 = l_ToolId_0.Smooth and not l_TerrainSmoothToolFix_0;
            end;
        end;
    end;
    if l_currentTool_0 == l_ToolId_0.Flatten then
        v10(v17, v33, v32, v37, v38, v39, v40);
        v16:WriteVoxels(v36, v1.VOXEL_RESOLUTION, v39, v40);
        return ;
    elseif not (l_cursorSize_0 > 32) or not v45 then
        local l_flattenMode_0 = v17.flattenMode;
        local l_x_0 = v21.x;
        local l_y_0 = v21.y;
        local l_z_0 = v21.z;
        local l_x_1 = v33.x;
        local l_y_1 = v33.y;
        local l_z_1 = v33.z;
        local l_x_2 = v32.x;
        local l_l_Air_0_0 = l_Air_0;
        local v55 = 0;
        if l_ignoreWater_0 then
            local v56, v57 = v8.getWaterHeightAndAirFillerMaterial(v37);
            v55 = v56;
            l_l_Air_0_0 = v57;
        end;
        local v58 = #v38;
        local v59 = #v38[1];
        local v60 = #v38[1][1];
        local v61 = (l_x_2 - l_x_1) * 0.5;
        local l_planeNormal_0 = v17.planeNormal;
        local l_x_3 = l_planeNormal_0.x;
        local l_y_2 = l_planeNormal_0.y;
        local l_z_2 = l_planeNormal_0.z;
        local l_planePoint_0 = v17.planePoint;
        local l_x_4 = l_planePoint_0.x;
        local l_y_3 = l_planePoint_0.y;
        local l_z_3 = l_planePoint_0.z;
        local v70 = {
            readMaterials = v37, 
            readOccupancies = v38, 
            writeMaterials = v39, 
            writeOccupancies = v40, 
            sizeX = v58, 
            sizeY = v59, 
            sizeZ = v60, 
            strength = l_strength_0, 
            ignoreWater = l_ignoreWater_0, 
            desiredMaterial = l_material_0, 
            autoMaterial = l_autoMaterial_0, 
            filterSize = 1, 
            maxOccupancy = 1
        };
        l_cursorSize_0 = l_cursorSize_0 + ((l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Subtract) and 0 or -1);
        v61 = v61 + ((l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Subtract) and 0 or -1);
        for v71, v72 in ipairs(v38) do
            local v73 = l_x_1 + (v71 - 0.5) * v1.VOXEL_RESOLUTION;
            local v74 = v73 - l_x_0;
            local v75 = (v73 - l_x_4) * l_x_3;
            for v76, v77 in ipairs(v72) do
                local v78 = l_y_1 + (v76 - 0.5) * v1.VOXEL_RESOLUTION;
                local v79 = v78 - l_y_0;
                local v80 = v75 + (v78 - l_y_3) * l_y_2;
                for v81, v82 in ipairs(v77) do
                    local v83 = l_z_1 + (v81 - 0.5) * v1.VOXEL_RESOLUTION;
                    local v84 = v83 - l_z_0;
                    local v85 = v80 + (v83 - l_z_3) * l_z_2;
                    local v86, v87 = v8.calculateBrushPowerForCell(v74, v79, v84, l_cursorSize_0, l_brushShape_0, v61, not (l_currentTool_0 == l_ToolId_0.Smooth));
                    local l_v82_0 = v82;
                    local v89 = v37[v71][v76][v81];
                    if l_ignoreWater_0 and v89 == l_Water_0 then
                        v89 = l_Air_0;
                        l_v82_0 = 0;
                    end;
                    l_l_Air_0_0 = v76 <= v55 and l_l_Air_0_0 or l_Air_0;
                    v70.x = v71;
                    v70.y = v76;
                    v70.z = v81;
                    v70.brushOccupancy = v86;
                    v70.magnitudePercent = v87;
                    v70.cellOccupancy = l_v82_0;
                    v70.cellMaterial = v89;
                    v70.airFillerMaterial = l_l_Air_0_0;
                    if not l_TerrainEditorOverhaul_0 then
                        if l_currentTool_0 == l_ToolId_0.Add then
                            if l_v82_0 < v86 then
                                v40[v71][v76][v81] = v86;
                            end;
                            if v86 >= 0.5 and v89 == l_Air_0 then
                                local l_l_material_0_0 = l_material_0;
                                if l_autoMaterial_0 then
                                    l_l_material_0_0 = v8.DEPRECATED_getMaterialForAutoMaterial(v37, v71, v76, v81, v58, v59, v60, v89);
                                end;
                                v39[v71][v76][v81] = l_l_material_0_0;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Subtract then
                            if v89 ~= l_Air_0 then
                                local v91 = 1 - v86;
                                if v91 < l_v82_0 then
                                    if v91 <= v8.one256th then
                                        v40[v71][v76][v81] = l_l_Air_0_0 == l_Water_0 and 1 or 0;
                                        v39[v71][v76][v81] = l_l_Air_0_0;
                                    else
                                        v40[v71][v76][v81] = v91;
                                    end;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Grow then
                            v11.grow(v70);
                        elseif l_currentTool_0 == l_ToolId_0.Erode then
                            v11.erode(v70);
                        elseif l_currentTool_0 == l_ToolId_0.Flatten then
                            v70.maxOccupancy = math.abs(v85);
                            if v1.FLATTEN_PLANE_TOLERANCE < v85 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                                v11.erode(v70);
                            elseif v85 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                                v11.grow(v70);
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Paint then
                            if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
                                if v86 > 0 and l_v82_0 > 0 then
                                    v39[v71][v76][v81] = l_material_0;
                                end;
                            else
                                local v92 = v37[v71][v76][v81];
                                if v86 > 0 and v92 == l_source_0 then
                                    v39[v71][v76][v81] = l_target_0;
                                    if v92 == l_Air_0 then
                                        v40[v71][v76][v81] = v86;
                                    end;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Replace then
                            local v93 = v37[v71][v76][v81];
                            if v86 > 0 and v93 == l_source_0 then
                                v39[v71][v76][v81] = l_target_0;
                                if v93 == l_Air_0 then
                                    v40[v71][v76][v81] = v86;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Smooth then
                            if l_TerrainSmoothToolFix_0 then
                                v70.smoothVoxelsUpgraded = v16.SmoothVoxelsUpgraded;
                                v11.smooth(v70);
                            else
                                v11.smooth(v70);
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Draw then
                        if l_brushMode_0 == l_BrushMode_0.Add then
                            if l_v82_0 < v86 then
                                v40[v71][v76][v81] = v86;
                            end;
                            if v86 >= 0.5 and v89 == l_Air_0 then
                                local l_l_material_0_1 = l_material_0;
                                if l_autoMaterial_0 then
                                    l_l_material_0_1 = v8.DEPRECATED_getMaterialForAutoMaterial(v37, v71, v76, v81, v58, v59, v60, v89);
                                end;
                                v39[v71][v76][v81] = l_l_material_0_1;
                            end;
                        elseif l_brushMode_0 == l_BrushMode_0.Subtract and v89 ~= l_Air_0 then
                            local v95 = 1 - v86;
                            if v95 < l_v82_0 then
                                if v95 <= v8.one256th then
                                    v40[v71][v76][v81] = l_l_Air_0_0 == l_Water_0 and 1 or 0;
                                    v39[v71][v76][v81] = l_l_Air_0_0;
                                else
                                    v40[v71][v76][v81] = v95;
                                end;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Sculpt then
                        if l_brushMode_0 == l_BrushMode_0.Add then
                            v11.grow(v70);
                        elseif l_brushMode_0 == l_BrushMode_0.Subtract then
                            v11.erode(v70);
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Flatten then
                        v70.maxOccupancy = math.abs(v85);
                        if v1.FLATTEN_PLANE_TOLERANCE < v85 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                            v11.erode(v70);
                        elseif v85 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                            v11.grow(v70);
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Paint then
                        if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
                            if v86 > 0 and l_v82_0 > 0 then
                                v39[v71][v76][v81] = l_material_0;
                            end;
                        else
                            local v96 = v37[v71][v76][v81];
                            if v86 > 0 and v96 == l_source_0 then
                                v39[v71][v76][v81] = l_target_0;
                                if v96 == l_Air_0 then
                                    v40[v71][v76][v81] = v86;
                                end;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Replace then
                        local v97 = v37[v71][v76][v81];
                        if v86 > 0 and v97 == l_source_0 then
                            v39[v71][v76][v81] = l_target_0;
                            if v97 == l_Air_0 then
                                v40[v71][v76][v81] = v86;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Smooth then
                        if l_TerrainSmoothToolFix_0 then
                            v70.smoothVoxelsUpgraded = v16.SmoothVoxelsUpgraded;
                            v11.smooth(v70);
                        else
                            v11.smooth(v70);
                        end;
                    end;
                end;
            end;
        end;
        v16:WriteVoxels(v36, v1.VOXEL_RESOLUTION, v39, v40);
        return ;
    else
        v9(v17, v33, v32, v37, v38, v39, v40);
        v16:WriteVoxels(v36, v1.VOXEL_RESOLUTION, v39, v40);
        return ;
    end;
end;
