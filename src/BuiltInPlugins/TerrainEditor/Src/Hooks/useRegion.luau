local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Src.Schemas.Region);
local v8 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v9 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v10 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v11 = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
local v12 = require(l_script_FirstAncestor_0.Src.Util.getVoxelAlignedRegion);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useHistory);
local v14 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v15 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v15.BuildSettings;
local l_Category_0 = v15.Category;
local l_OperationSource_0 = v15.OperationSource;
local l_SeaLevelSettings_0 = v15.SeaLevelSettings;
local l_SelectionSettings_0 = v15.SelectionSettings;
local l_Tool_0 = v15.Tool;
local l_TransformMode_0 = v15.TransformMode;
local l_TransformSettings_0 = v15.TransformSettings;
local v24 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v27 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorCopyPasteFix);
local l_StudioService_0 = game:GetService("StudioService");
local v29 = {
    [l_Tool_0.Build] = if not v25() then nil else l_Category_0.BuildSettings, 
    [l_Tool_0.Transform] = l_Category_0.TransformSettings, 
    [l_Tool_0.Select] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Generate] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Fill] = l_Category_0.SelectionSettings, 
    [l_Tool_0.Import] = l_Category_0.SelectionSettings, 
    [l_Tool_0.SeaLevel] = l_Category_0.SeaLevelSettings, 
    [l_Tool_0.Mock] = l_Category_0.SelectionSettings
};
local v30 = {
    [l_Tool_0.Build] = if not v25() then nil else l_BuildSettings_0, 
    [l_Tool_0.Transform] = l_TransformSettings_0, 
    [l_Tool_0.Select] = l_SelectionSettings_0, 
    [l_Tool_0.Generate] = l_SelectionSettings_0, 
    [l_Tool_0.Fill] = l_SelectionSettings_0, 
    [l_Tool_0.Import] = l_SelectionSettings_0, 
    [l_Tool_0.SeaLevel] = l_SeaLevelSettings_0, 
    [l_Tool_0.Mock] = l_SelectionSettings_0
};
return function(v31, v32, v33, v34)
    local v35 = v24:use();
    local v36, v37 = l_useState_0({
        Size = v32[v29[v31]][v30[v31].Size], 
        Transform = v32[v29[v31]][v30[v31].Transform]
    });
    local v38, v39 = l_useState_0((Vector3.new(1, 1, 1)));
    local v40 = l_useMemo_0(function()
        return v7.Selection.new(v36.Transform, v36.Size);
    end, {
        v31
    });
    local v41, v42 = l_useState_0(nil);
    local v47 = l_useCallback_0(function(v43, v44)
        v33({
            [v29[v31]] = {
                [v30[v31].OperationSource] = v44, 
                [v30[v31].Size] = v43.Size, 
                [v30[v31].Transform] = v43.Transform
            }
        });
        v37(v43);
        if v31 == l_Tool_0.Transform then
            local v45 = v32[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            local v46 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
            if v46 == l_TransformMode_0.Paste then
                v45 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize];
            elseif not (v46 ~= l_TransformMode_0.Import) or v46 == l_TransformMode_0.Duplicate then
                v45 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize];
            elseif v46 == l_TransformMode_0.Move then
                v45 = v32[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            end;
            v39(v43.Size / v45);
            return ;
        else
            if v31 == l_Tool_0.Select then
                v39(Vector3.one);
            end;
            return ;
        end;
    end, {
        v33, 
        v31, 
        v32
    });
    local v49 = v13(v36, function(v48)
        v47(v48, l_OperationSource_0.History);
        v40:SetRegionSignal(v48);
    end, {
        v31
    });
    local v51 = l_useCallback_0(function(v50)
        v49(v50, v36);
    end, {
        v49, 
        v36
    });
    local v55 = l_useCallback_0(function(_, v53)
        if not v32[v29[v31]][v30[v31].SnapToVoxels] then
            return v53;
        else
            local v54 = math.round(l_StudioService_0.GridSize / 4) * 4;
            if v54 <= 0 then
                v54 = 4;
            end;
            if math.abs(v54 - 0.01) < 0.001 then
                return v53;
            else
                return math.round(v53 / v54) * v54;
            end;
        end;
    end, {
        v32[v29[v31]][v30[v31].SnapToVoxels]
    });
    local v59 = l_useCallback_0(function(v56, v57)
        local v58 = {
            Size = v57, 
            Transform = v56
        };
        v40:SetRegion(v58);
        v47(v58, l_OperationSource_0.Gizmo);
    end, {
        v47
    });
    local v61 = l_useCallback_0(function(v60)
        v40:SetRegion(v60);
        v47(v60, l_OperationSource_0.Gizmo);
    end, {
        v47
    });
    local v64 = l_useMemo_0(function()
        local v62 = if not v35:isMocking() then v8.new(l_script_FirstAncestor_0.Parent, game, settings(), v40) else {
            Mock = true
        };
        v62.snapToGridSize = v55;
        v62.endSelectionOnDrag = function()
            v62.selectionOnDragPoint = nil;
        end;
        v62.updateRegion = v59;
        v62.updateSelectionOnDrag = v61;
        v62.addWaypoint = if not v25() or v31 ~= l_Tool_0.Build then v51 else function()
        end;
        v62.shouldExtendSelection = function()
            return true;
        end;
        local v63 = {
            v11.new(v62, {
                ShowBoundingBox = false, 
                Summonable = false
            }, if not not v25() and v31 == l_Tool_0.Build then v7.ExtrudeHandlesImplementation.new(v62, {
                Max = Vector3.one * v14.MaxBuildRegion, 
                UseVolume = true
            }) else if not (v31 ~= l_Tool_0.Import) or v26() and v31 == l_Tool_0.Generate then v7.ExtrudeHandlesImplementation.new(v62, {
                Max = Vector3.new(256 * v14.VoxelResolution, 4096 * v14.VoxelResolution, 4096 * v14.VoxelResolution), 
                UseVolume = true
            }) else v7.ExtrudeHandlesImplementation.new(v62)), 
            v9.new(v62, {
                ShowBoundingBox = false, 
                Summonable = false, 
                Outset = 1
            }, v7.TransformHandlesImplementation.new(v62))
        };
        if v34 then
            table.insert(v63, v10.new(v62, {
                ShowBoundingBox = false, 
                Summonable = false, 
                Outset = 1
            }, v7.TransformHandlesImplementation.new(v62)));
        end;
        return {
            Mouse = l_script_FirstAncestor_0.Parent:GetMouse(), 
            DraggerContext = v62, 
            DraggerSchema = v7, 
            DraggerSettings = {
                AnalyticsName = "TerrainEditorRegion", 
                AllowDragSelect = true, 
                AllowFreeformDrag = false, 
                ShowDragSelect = false, 
                ShowLocalSpaceIndicator = true, 
                ShowPivotIndicator = true, 
                HandlesList = v63
            }
        };
    end, {
        v31
    });
    l_useEffect_0(function()
        v64.DraggerContext.addWaypoint = if not v25() or v31 ~= l_Tool_0.Build then v51 else function()
        end;
        v64.DraggerContext.updateRegion = v59;
        v64.DraggerContext.updateSelectionOnDrag = v61;
    end, {
        v36, 
        v47, 
        v49
    });
    l_useEffect_0(function()
        v64.DraggerContext.snapToGridSize = v55;
    end, {
        v55
    });
    l_useEffect_0(function()
        local v65 = {
            Size = v32[v29[v31]][v30[v31].Size], 
            Transform = v32[v29[v31]][v30[v31].Transform]
        };
        if not (v65.Size == v36.Size) or v65.Transform ~= v36.Transform then
            v40:SetRegionSignal(v65);
            v47(v65, l_OperationSource_0.Gizmo);
        end;
    end, {
        v31, 
        v32[v29[v31]][v30[v31].Size], 
        v32[v29[v31]][v30[v31].Transform]
    });
    l_useEffect_0(function()
        local v66 = {
            Size = v32[v29[v31]][v30[v31].Size], 
            Transform = v32[v29[v31]][v30[v31].Transform]
        };
        if v32[v29[v31]][v30[v31].SnapToVoxels] and (not (v32[v29[v31]][v30[v31].SnapToVoxels] == v41 and v66.Size == v36.Size) or v66.Transform ~= v36.Transform) then
            local v67 = math.floor(l_StudioService_0.GridSize / 4 + 0.5) * 4;
            if v67 <= 0 then
                v67 = 4;
            end;
            local v68, v69 = v12(v32[v29[v31]][v30[v31].Transform], v32[v29[v31]][v30[v31].Size], v67);
            local v70 = {
                Size = v69, 
                Transform = v68
            };
            if not (v70.Size == v66.Size) or v70.Transform ~= v66.Transform then
                v40:SetRegionSignal(v70);
                v47(v70, l_OperationSource_0.Gizmo);
            end;
        end;
        v42(v32[v29[v31]][v30[v31].SnapToVoxels]);
    end, {
        v32[v29[v31]][v30[v31].SnapToVoxels], 
        v32[v29[v31]][v30[v31].Size], 
        v32[v29[v31]][v30[v31].Transform]
    });
    l_useEffect_0(function()
        if v27() then
            if v31 == l_Tool_0.Transform then
                local v71 = v32[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
                local v72 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
                if v72 == l_TransformMode_0.Paste then
                    v71 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize];
                elseif not (v72 ~= l_TransformMode_0.Import) or v72 == l_TransformMode_0.Duplicate then
                    v71 = v32[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize];
                elseif v72 == l_TransformMode_0.Move then
                    v71 = v32[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
                end;
                v39(v32[l_Category_0.TransformSettings][l_TransformSettings_0.Size] / v71);
                return ;
            else
                if v31 == l_Tool_0.Select then
                    v39(Vector3.one);
                end;
                return ;
            end;
        else
            return ;
        end;
    end, {
        v31
    });
    return v64, v36, v38;
end;
