local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local v2 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushMode_0 = v2.BrushMode;
local l_BrushShape_0 = v2.BrushShape;
local l_FlattenMode_0 = v2.FlattenMode;
local l_ToolId_0 = v2.ToolId;
local v7 = require(l_Parent_0.Src.Util.applyPivot);
local v8 = require(script.Parent.OperationHelper);
local v9 = require(script.Parent.smartLargeSculptBrush);
local v10 = require(script.Parent.smartColumnSculptBrush);
local v11 = require(script.Parent.SculptOperations);
local v12 = require(l_Parent_0.Src.Util.PruneWaterVoxels);
local l_Air_0 = Enum.Material.Air;
local l_Water_0 = Enum.Material.Water;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_TerrainSmoothToolFix_0 = game:GetFastFlag("TerrainSmoothToolFix");
local l_TerrainVoxelChannelNewApi_0 = game:GetFastFlag("TerrainVoxelChannelNewApi");
local l_TerrainToolsPaintToolFix_0 = game:GetFastFlag("TerrainToolsPaintToolFix");
local v19 = game:DefineFastFlag("TerrainToolsReplaceWithWaterFix", false);
return function(v20, v21)
    local v22 = v21.cursorHeight * v1.VOXEL_RESOLUTION;
    local l_cursorSize_0 = v21.cursorSize;
    local v24 = l_cursorSize_0 * v1.VOXEL_RESOLUTION;
    local v25 = v7(v21.pivot, v21.centerPoint, v22);
    local l_autoMaterial_0 = v21.autoMaterial;
    local l_brushMode_0 = v21.brushMode;
    local l_brushShape_0 = v21.brushShape;
    local l_ignoreWater_0 = v21.ignoreWater;
    local l_material_0 = v21.material;
    local v31 = v24 * 0.5;
    local l_replaceMaterial_0 = v21.replaceMaterial;
    local l_source_0 = v21.source;
    local l_target_0 = v21.target;
    local l_currentTool_0 = v21.currentTool;
    assert(v20 ~= nil, "performTerrainBrushOperation requires a terrain instance");
    local v36 = false;
    if l_currentTool_0 ~= nil then
        v36 = type(l_currentTool_0) == "string";
    end;
    assert(v36, "performTerrainBrushOperation requires a currentTool parameter");
    local v37 = Vector3.new(v8.clampDownToVoxel(v25.x - v31), v8.clampDownToVoxel(v25.y - v22 * 0.5), v8.clampDownToVoxel(v25.z - v31));
    v36 = Vector3.new(v8.clampUpToVoxel(v25.x + v31), v8.clampUpToVoxel(v25.y + v22 * 0.5), v8.clampUpToVoxel(v25.z + v31));
    if not l_TerrainEditorOverhaul_0 then
        if l_currentTool_0 == l_ToolId_0.Add then
            v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditAddTool;
        elseif not (l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Paint) or not l_replaceMaterial_0 then
            if not l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Replace then
                v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
            end;
        else
            v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
        end;
        if not (l_currentTool_0 ~= l_ToolId_0.Add and (not (l_currentTool_0 == l_ToolId_0.Subtract) or l_ignoreWater_0) or l_autoMaterial_0) then
            if l_currentTool_0 == l_ToolId_0.Subtract then
                l_material_0 = l_Air_0;
            end;
            if l_brushShape_0 == l_BrushShape_0.Sphere then
                v20:FillBall(v25, v31, l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cube then
                v20:FillBlock(CFrame.new(v25), Vector3.new(v24, v22, v24), l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cylinder then
                if (v36 - v37).x <= 2 * v1.VOXEL_RESOLUTION then
                    v20:FillBall(v25, v31, l_material_0);
                    return ;
                else
                    v20:FillCylinder(CFrame.new(v25), v22, v31, l_material_0);
                    return ;
                end;
            else
                assert(false, "Invalid brush shape in performTerrainBrushOperation quick path");
                return ;
            end;
        end;
    else
        if l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Add then
            v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditAddTool;
        elseif not (l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Paint) or not l_replaceMaterial_0 then
            if not l_TerrainEditorOverhaul_0 and l_currentTool_0 == l_ToolId_0.Replace then
                v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
            end;
        else
            v20.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
        end;
        if not ((not (l_currentTool_0 == l_ToolId_0.Draw) or l_brushMode_0 ~= l_BrushMode_0.Add and (not (l_brushMode_0 == l_BrushMode_0.Subtract) or l_ignoreWater_0)) or l_autoMaterial_0) then
            local v38 = -1;
            if l_brushMode_0 == l_BrushMode_0.Subtract then
                l_material_0 = l_Air_0;
                v38 = 0;
            end;
            if l_brushShape_0 == l_BrushShape_0.Sphere then
                v20:FillBall(v25, v31 + v38, l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cube then
                v20:FillBlock(CFrame.new(v25), Vector3.new(v24 + v38, v22 + v38, v24 + v38), l_material_0);
                return ;
            elseif l_brushShape_0 == l_BrushShape_0.Cylinder then
                if (v36 - v37).x <= 2 * v1.VOXEL_RESOLUTION then
                    v20:FillBall(v25, v31 + v38, l_material_0);
                    return ;
                else
                    v20:FillCylinder(CFrame.new(v25), v22 + v38, v31 + v38, l_material_0);
                    return ;
                end;
            else
                assert(false, "Invalid brush shape in performTerrainBrushOperation quick path");
                return ;
            end;
        end;
    end;
    local l_strength_0 = v21.strength;
    local v40 = Region3.new(v37, v36);
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    if not l_TerrainVoxelChannelNewApi_0 then
        local v44 = v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
            "Material", 
            "Occupancy", 
            "WaterOccupancy"
        });
        v41 = v44.Material;
        v42 = v44.Occupancy;
        v43 = v44.WaterOccupancy;
    else
        local v45 = v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
            "SolidMaterial", 
            "SolidOccupancy", 
            "LiquidOccupancy"
        });
        v41 = v45.SolidMaterial;
        v42 = v45.SolidOccupancy;
        v43 = v45.LiquidOccupancy;
    end;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    if not (l_currentTool_0 == l_ToolId_0.Smooth) or not l_TerrainSmoothToolFix_0 then
        if not l_TerrainVoxelChannelNewApi_0 then
            local v49 = v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                "Material", 
                "Occupancy", 
                "WaterOccupancy"
            });
            v46 = v49.Material;
            v47 = v49.Occupancy;
            v48 = v49.WaterOccupancy;
        else
            local v50 = v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                "SolidMaterial", 
                "SolidOccupancy", 
                "LiquidOccupancy"
            });
            v46 = v50.SolidMaterial;
            v47 = v50.SolidOccupancy;
            v48 = v50.LiquidOccupancy;
        end;
    else
        local v51, v52 = v20:SmoothRegion(v40, v1.VOXEL_RESOLUTION, l_strength_0);
        v46 = v51;
        v47 = v52;
        v48 = if not l_TerrainVoxelChannelNewApi_0 then v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
            "WaterOccupancy"
        }).WaterOccupancy else v20:ReadVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
            "LiquidOccupancy"
        }).LiquidOccupancy;
    end;
    local v53;
    if not l_TerrainEditorOverhaul_0 then
        v53 = true;
        if l_currentTool_0 ~= l_ToolId_0.Grow then
            v53 = true;
            if l_currentTool_0 ~= l_ToolId_0.Erode then
                v53 = true;
                if l_currentTool_0 ~= l_ToolId_0.Flatten then
                    v53 = l_ToolId_0.Smooth and not l_TerrainSmoothToolFix_0;
                end;
            end;
        end;
    else
        v53 = true;
        if l_currentTool_0 ~= l_ToolId_0.Sculpt then
            v53 = true;
            if l_currentTool_0 ~= l_ToolId_0.Flatten then
                v53 = l_ToolId_0.Smooth and not l_TerrainSmoothToolFix_0;
            end;
        end;
    end;
    if l_currentTool_0 == l_ToolId_0.Flatten then
        v10(v21, v37, v36, v41, v42, v43, v46, v47, v48);
        v12(v46, v47, v48);
        if not l_TerrainVoxelChannelNewApi_0 then
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                Material = v46, 
                Occupancy = v47, 
                WaterOccupancy = v48
            });
            return ;
        else
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                SolidMaterial = v46, 
                SolidOccupancy = v47, 
                LiquidOccupancy = v48
            });
            return ;
        end;
    elseif not (l_cursorSize_0 > 32) or not v53 then
        local l_flattenMode_0 = v21.flattenMode;
        local l_x_0 = v25.x;
        local l_y_0 = v25.y;
        local l_z_0 = v25.z;
        local l_x_1 = v37.x;
        local l_y_1 = v37.y;
        local l_z_1 = v37.z;
        local l_x_2 = v36.x;
        local l_l_Air_0_0 = l_Air_0;
        local v63 = 0;
        if l_ignoreWater_0 then
            local v64, v65 = v8.getWaterHeightAndAirFillerMaterial(v41);
            v63 = v64;
            l_l_Air_0_0 = v65;
        end;
        local v66 = #v42;
        local v67 = #v42[1];
        local v68 = #v42[1][1];
        local v69 = (l_x_2 - l_x_1) * 0.5;
        local l_planeNormal_0 = v21.planeNormal;
        local l_x_3 = l_planeNormal_0.x;
        local l_y_2 = l_planeNormal_0.y;
        local l_z_2 = l_planeNormal_0.z;
        local l_planePoint_0 = v21.planePoint;
        local l_x_4 = l_planePoint_0.x;
        local l_y_3 = l_planePoint_0.y;
        local l_z_3 = l_planePoint_0.z;
        local v78 = {
            readMaterials = v41, 
            readOccupancies = v42, 
            readWaterOccupancies = v43, 
            writeMaterials = v46, 
            writeOccupancies = v47, 
            writeWaterOccupancies = v48, 
            sizeX = v66, 
            sizeY = v67, 
            sizeZ = v68, 
            strength = l_strength_0, 
            ignoreWater = l_ignoreWater_0, 
            desiredMaterial = l_material_0, 
            autoMaterial = l_autoMaterial_0, 
            filterSize = 1, 
            maxOccupancy = 1
        };
        l_cursorSize_0 = l_cursorSize_0 + ((l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Subtract) and 0 or -1);
        v69 = v69 + ((l_currentTool_0 == l_ToolId_0.Draw and l_brushMode_0 == l_BrushMode_0.Subtract) and 0 or -1);
        for v79, v80 in ipairs(v42) do
            local v81 = l_x_1 + (v79 - 0.5) * v1.VOXEL_RESOLUTION;
            local v82 = v81 - l_x_0;
            local v83 = (v81 - l_x_4) * l_x_3;
            for v84, v85 in ipairs(v80) do
                local v86 = l_y_1 + (v84 - 0.5) * v1.VOXEL_RESOLUTION;
                local v87 = v86 - l_y_0;
                local v88 = v83 + (v86 - l_y_3) * l_y_2;
                for v89, v90 in ipairs(v85) do
                    local v91 = l_z_1 + (v89 - 0.5) * v1.VOXEL_RESOLUTION;
                    local v92 = v91 - l_z_0;
                    local v93 = v88 + (v91 - l_z_3) * l_z_2;
                    local v94, v95 = v8.calculateBrushPowerForCell(v82, v87, v92, l_cursorSize_0, l_brushShape_0, v69, not (l_currentTool_0 == l_ToolId_0.Smooth));
                    local v96 = v41[v79][v84][v89];
                    local v97 = v43[v79][v84][v89];
                    local v98 = false;
                    if v96 == l_Air_0 then
                        v98 = v97 > 0;
                    end;
                    l_l_Air_0_0 = v84 <= v63 and l_l_Air_0_0 or l_Air_0;
                    v78.x = v79;
                    v78.y = v84;
                    v78.z = v89;
                    v78.brushOccupancy = v94;
                    v78.magnitudePercent = v95;
                    v78.cellOccupancy = v90;
                    v78.cellMaterial = v96;
                    v78.cellWaterOccupancy = v97;
                    v78.airFillerMaterial = l_l_Air_0_0;
                    if not l_TerrainEditorOverhaul_0 then
                        if l_currentTool_0 == l_ToolId_0.Add then
                            if v90 < v94 then
                                v47[v79][v84][v89] = v94;
                            end;
                            if v94 >= 0.5 and v96 == l_Air_0 then
                                local l_l_material_0_0 = l_material_0;
                                if l_autoMaterial_0 then
                                    l_l_material_0_0 = v8.getMaterialForAutoMaterial(v41, v43, v79, v84, v89, v66, v67, v68, v96);
                                end;
                                v46[v79][v84][v89] = l_l_material_0_0;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Subtract then
                            if v96 ~= l_Air_0 then
                                local v100 = 1 - v94;
                                if v100 < v90 then
                                    if v100 <= v8.one256th then
                                        v47[v79][v84][v89] = l_l_Air_0_0 == l_Water_0 and 1 or 0;
                                        v46[v79][v84][v89] = l_l_Air_0_0;
                                    else
                                        v47[v79][v84][v89] = v100;
                                    end;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Grow then
                            v11.grow(v78);
                        elseif l_currentTool_0 == l_ToolId_0.Erode then
                            v11.erode(v78);
                        elseif l_currentTool_0 == l_ToolId_0.Flatten then
                            v78.maxOccupancy = math.abs(v93);
                            if v1.FLATTEN_PLANE_TOLERANCE < v93 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                                v11.erode(v78);
                            elseif v93 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                                v11.grow(v78);
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Paint then
                            if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
                                if v94 > 0 and v90 > 0 then
                                    v46[v79][v84][v89] = l_material_0;
                                end;
                            else
                                local v101 = v41[v79][v84][v89];
                                if v94 > 0 and v101 == l_source_0 then
                                    v46[v79][v84][v89] = l_target_0;
                                    if v101 == l_Air_0 then
                                        v47[v79][v84][v89] = v94;
                                    end;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Replace then
                            local v102 = v41[v79][v84][v89];
                            if v94 > 0 and v102 == l_source_0 then
                                v46[v79][v84][v89] = l_target_0;
                                if v102 == l_Air_0 then
                                    v47[v79][v84][v89] = v94;
                                end;
                            end;
                        elseif l_currentTool_0 == l_ToolId_0.Smooth then
                            if l_TerrainSmoothToolFix_0 then
                                v78.smoothVoxelsUpgraded = v20.SmoothVoxelsUpgraded;
                                v11.smooth(v78);
                            else
                                v11.smooth(v78);
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Draw then
                        if l_brushMode_0 == l_BrushMode_0.Add then
                            if v90 < v94 then
                                v47[v79][v84][v89] = v94;
                            end;
                            local l_l_material_0_1 = l_material_0;
                            local v104 = false;
                            if not (not ((not (v96 ~= l_Water_0) or v96 == l_Air_0) and v94 > 0) or not l_autoMaterial_0) then
                                local v105, v106 = v8.getMaterialForAutoMaterial(v41, v43, v79, v84, v89, v66, v67, v68, v96);
                                l_l_material_0_1 = v105;
                                v104 = v106;
                            end;
                            if v104 then
                                if v94 > 0 and l_l_material_0_1 == l_Water_0 then
                                    v48[v79][v84][v89] = v94;
                                    v47[v79][v84][v89] = v90;
                                    v46[v79][v84][v89] = l_Air_0;
                                end;
                                if v94 >= 0.5 and v96 == l_Air_0 then
                                    v46[v79][v84][v89] = l_l_material_0_1;
                                end;
                            end;
                        elseif l_brushMode_0 == l_BrushMode_0.Subtract and v96 ~= l_Air_0 then
                            local v107 = 1 - v94;
                            if v107 < v90 then
                                if v107 <= v8.one256th then
                                    v47[v79][v84][v89] = l_l_Air_0_0 == l_Water_0 and 1 or 0;
                                    v46[v79][v84][v89] = l_l_Air_0_0;
                                else
                                    v47[v79][v84][v89] = v107;
                                end;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Sculpt then
                        if l_brushMode_0 == l_BrushMode_0.Add then
                            v11.grow(v78);
                        elseif l_brushMode_0 == l_BrushMode_0.Subtract then
                            v11.erode(v78);
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Flatten then
                        v78.maxOccupancy = math.abs(v93);
                        if v1.FLATTEN_PLANE_TOLERANCE < v93 and l_flattenMode_0 ~= l_FlattenMode_0.Grow then
                            v11.erode(v78);
                        elseif v93 < -v1.FLATTEN_PLANE_TOLERANCE and l_flattenMode_0 ~= l_FlattenMode_0.Erode then
                            v11.grow(v78);
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Paint then
                        if not l_TerrainToolsPaintToolFix_0 then
                            if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
                                if v94 > 0 and l_material_0 == l_Water_0 then
                                    if v46[v79][v84][v89] ~= l_Air_0 then
                                        v46[v79][v84][v89] = l_Air_0;
                                        v48[v79][v84][v89] = v47[v79][v84][v89];
                                        v47[v79][v84][v89] = 0;
                                    end;
                                else
                                    if (v94 > 0 and v90 > 0) and v96 ~= l_Air_0 then
                                        v46[v79][v84][v89] = l_material_0;
                                    end;
                                    if not l_ignoreWater_0 then
                                        if v47[v79][v84][v89] < v48[v79][v84][v89] then
                                            v47[v79][v84][v89] = v48[v79][v84][v89];
                                        end;
                                        v48[v79][v84][v89] = 0;
                                    end;
                                end;
                            elseif v94 > 0 and v96 == l_source_0 then
                                if l_source_0 == l_Water_0 and v90 < v97 then
                                    v46[v79][v84][v89] = l_target_0;
                                    v48[v79][v84][v89] = 0;
                                    v47[v79][v84][v89] = v97;
                                else
                                    v46[v79][v84][v89] = l_target_0;
                                    if v96 == l_Air_0 then
                                        v47[v79][v84][v89] = v94;
                                    end;
                                end;
                            end;
                        elseif v94 > 0 then
                            if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
                                if l_material_0 == l_Water_0 then
                                    if v46[v79][v84][v89] ~= l_Air_0 then
                                        v46[v79][v84][v89] = l_Air_0;
                                        v48[v79][v84][v89] = math.max(v90, v97);
                                        v47[v79][v84][v89] = 0;
                                    end;
                                elseif not (v90 <= 0 and not v98) then
                                    v46[v79][v84][v89] = l_material_0;
                                    if not l_ignoreWater_0 then
                                        v47[v79][v84][v89] = math.max(v90, v97);
                                        v48[v79][v84][v89] = 0;
                                    end;
                                end;
                            elseif not (v96 ~= l_source_0 and (not (l_source_0 == l_Water_0) or not v98)) then
                                if l_source_0 == l_Water_0 then
                                    v48[v79][v84][v89] = 0;
                                end;
                                if l_source_0 == l_Water_0 and v90 < v97 then
                                    v46[v79][v84][v89] = l_target_0;
                                    v47[v79][v84][v89] = l_target_0 == l_Air_0 and 0 or v97;
                                elseif l_target_0 == l_Water_0 then
                                    v46[v79][v84][v89] = l_Air_0;
                                    v47[v79][v84][v89] = 0;
                                    if not v19 then
                                        v47[v79][v84][v89] = math.max(v90, v97);
                                    else
                                        v48[v79][v84][v89] = math.max(v90, v97);
                                    end;
                                else
                                    v46[v79][v84][v89] = l_target_0;
                                    if v96 == l_Air_0 then
                                        v47[v79][v84][v89] = v94;
                                    end;
                                end;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Replace then
                        local v108 = v41[v79][v84][v89];
                        if v94 > 0 and v108 == l_source_0 then
                            v46[v79][v84][v89] = l_target_0;
                            if v108 == l_Air_0 then
                                v47[v79][v84][v89] = v94;
                            end;
                        end;
                    elseif l_currentTool_0 == l_ToolId_0.Smooth then
                        if l_TerrainSmoothToolFix_0 then
                            v78.smoothVoxelsUpgraded = v20.SmoothVoxelsUpgraded;
                            v11.smooth(v78);
                        else
                            v11.smooth(v78);
                        end;
                    end;
                end;
            end;
        end;
        v12(v46, v47, v48);
        if not l_TerrainVoxelChannelNewApi_0 then
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                Material = v46, 
                Occupancy = v47, 
                WaterOccupancy = v48
            });
            return ;
        else
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                SolidMaterial = v46, 
                SolidOccupancy = v47, 
                LiquidOccupancy = v48
            });
            return ;
        end;
    else
        v9(v21, v37, v36, v41, v42, v43, v46, v47, v48);
        v12(v46, v47, v48);
        if not l_TerrainVoxelChannelNewApi_0 then
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                Material = v46, 
                Occupancy = v47, 
                WaterOccupancy = v48
            });
            return ;
        else
            v20:WriteVoxelChannels(v40, v1.VOXEL_RESOLUTION, {
                SolidMaterial = v46, 
                SolidOccupancy = v47, 
                LiquidOccupancy = v48
            });
            return ;
        end;
    end;
end;
