local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_Util_0.CreateSubregions);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v6.Category;
local l_SelectionSettings_0 = v6.SelectionSettings;
local l_TransformMode_0 = v6.TransformMode;
local l_TransformSettings_0 = v6.TransformSettings;
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
return function(v12, v13, v14)
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v13, 
        Name = v12, 
        OnCancel = function(v15, _)
            assert(v15.State, "Tried to cancel without starting first.");
            local l_State_0 = v15.State;
            v14.Terrain:PasteRegion(l_State_0.BackupTerrainRegion, l_State_0.BackupRegion.Min, true);
        end, 
        OnFinish = function(v18, v19)
            if v11() then
                v19:addTimeStatistic(v3.NormalizeRegionTimer(v18.State.StartTime, v18.Payload[l_Category_0.TransformSettings][l_SelectionSettings_0.Size]));
            end;
            v14.ChangeHistoryService:SetWaypoint("TransformAction");
        end, 
        OnStart = function(v20, _)
            local l_Terrain_0 = v14.Terrain;
            local v23 = v20.Payload[l_Category_0.SelectionSettings];
            local v24 = v20.Payload[l_Category_0.TransformSettings];
            local v25 = v23[l_SelectionSettings_0.Transform];
            local v26 = v23[l_SelectionSettings_0.Size];
            local v27 = nil;
            local v28 = nil;
            if v24[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Move then
                v27 = v5(v25, v26);
                v28 = 1;
            end;
            local v29 = v24[l_TransformSettings_0.Transform];
            local v30 = v24[l_TransformSettings_0.Size];
            local v31, v32 = v5(v29, v30);
            local v33 = nil;
            v33 = if v24[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Paste then v24[l_TransformSettings_0.TerrainRegionBuffer] else v24[l_TransformSettings_0.TerrainRegion];
            local v34 = v4(v29, v30);
            v20.State = {
                BackupRegion = v34, 
                BackupTerrainRegion = l_Terrain_0:CopyRegion(v34), 
                SourceCurrentIndex = v28, 
                SourceRegions = v27, 
                SourceTerrainRegion = v33, 
                StartTime = os.clock(), 
                TargetCurrentIndex = 1, 
                TargetOrigins = v32, 
                TargetRegions = v31
            };
        end, 
        OnStep = function(v35, _)
            assert(v35.State, "Tried to step without starting first.");
            local l_State_1 = v35.State;
            local v38 = v35.Payload[l_Category_0.SelectionSettings];
            local v39 = v35.Payload[l_Category_0.TransformSettings];
            local l_SourceTerrainRegion_0 = l_State_1.SourceTerrainRegion;
            local l_Terrain_1 = v14.Terrain;
            local v42 = l_State_1.TargetOrigins[l_State_1.TargetCurrentIndex];
            local v43 = l_State_1.TargetRegions[l_State_1.TargetCurrentIndex];
            local v44 = v39[l_TransformSettings_0.Size];
            local v45 = v39[l_TransformSettings_0.Transform];
            if not ((not (v39[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Move) or not l_State_1.SourceRegions) or not l_State_1.SourceCurrentIndex) then
                l_Terrain_1:SetMaterialInTransformSubregion(v38[l_SelectionSettings_0.Transform], v38[l_SelectionSettings_0.Size], Enum.Material.Air, l_State_1.SourceRegions[l_State_1.SourceCurrentIndex]);
                if l_State_1.SourceCurrentIndex ~= #l_State_1.SourceRegions then
                    l_State_1.SourceCurrentIndex = l_State_1.SourceCurrentIndex + 1;
                    return true, l_State_1.SourceCurrentIndex / (#l_State_1.SourceRegions + #l_State_1.TargetRegions);
                end;
            end;
            if v39[l_TransformSettings_0.MergeEmpty] then
                l_Terrain_1:SetMaterialInTransformSubregion(v45, v44, Enum.Material.Air, v43);
            end;
            l_Terrain_1:PasteRegion(l_SourceTerrainRegion_0:ApplyTransformSubregion(v45.Rotation, v44, v43), v42, false);
            if l_State_1.TargetCurrentIndex == #l_State_1.TargetRegions then
                return false, 0;
            else
                l_State_1.TargetCurrentIndex = l_State_1.TargetCurrentIndex + 1;
                return true, (l_State_1.TargetCurrentIndex + (l_State_1.SourceCurrentIndex or 0)) / (#l_State_1.TargetRegions + (not l_State_1.SourceRegions and 0 or #l_State_1.SourceRegions));
            end;
        end
    });
end;
