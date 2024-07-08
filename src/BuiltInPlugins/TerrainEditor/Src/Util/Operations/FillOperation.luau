local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_Util_0.CreateSubregions);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v6.Category;
local l_FillMode_0 = v6.FillMode;
local l_MaterialSettings_0 = v6.MaterialSettings;
local l_SelectionSettings_0 = v6.SelectionSettings;
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorIndexingBugFix);
return function(v13, v14, v15)
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v14, 
        Name = v13, 
        OnCancel = function(v16, _)
            assert(v16.State, "Tried to cancel without starting first.");
            local l_State_0 = v16.State;
            v15.Terrain:PasteRegion(l_State_0.BackupTerrainRegion, l_State_0.BackupRegion.Min, true);
        end, 
        OnFinish = function(v19, v20)
            if not ((not v11() or not v19.State) or not v19.State.StartTime) then
                v20:addTimeStatistic(v3.NormalizeRegionTimer(v19.State.StartTime, v19.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size]));
            end;
            v15.ChangeHistoryService:SetWaypoint("FillAction");
        end, 
        OnStart = function(v21, _)
            local l_Terrain_0 = v15.Terrain;
            local v24 = v21.Payload[l_Category_0.SelectionSettings];
            local v25 = v24[l_SelectionSettings_0.Transform];
            local v26 = v24[l_SelectionSettings_0.Size];
            local v27 = v5(v25, v26);
            local v28 = v4(v25, v26);
            v21.State = {
                BackupRegion = v28, 
                BackupTerrainRegion = l_Terrain_0:CopyRegion(v28), 
                CurrentIndex = 1, 
                Regions = v27, 
                StartTime = os.clock()
            };
        end, 
        OnStep = function(v29, _)
            assert(v29.State, "Tried to step without starting first.");
            local l_State_1 = v29.State;
            local l_Terrain_1 = v15.Terrain;
            local v33 = v29.Payload[l_Category_0.MaterialSettings];
            local v34 = v29.Payload[l_Category_0.SelectionSettings];
            local v35 = v33[l_MaterialSettings_0.FillMode];
            local v36 = v34[l_SelectionSettings_0.Size];
            local v37 = v33[l_MaterialSettings_0.SourceMaterial];
            local v38 = v33[l_MaterialSettings_0.TargetMaterial];
            local v39 = v34[l_SelectionSettings_0.Transform];
            local v40 = l_State_1.Regions[l_State_1.CurrentIndex];
            if not v12() or v40 then
                if v35 == l_FillMode_0.Replace then
                    l_Terrain_1:ReplaceMaterialInTransformSubregion(v39, v36, v37, v38, v40);
                else
                    l_Terrain_1:SetMaterialInTransformSubregion(v39, v36, v37, v40);
                end;
                if l_State_1.CurrentIndex == #l_State_1.Regions then
                    return false, 0;
                else
                    l_State_1.CurrentIndex = l_State_1.CurrentIndex + 1;
                    return true, l_State_1.CurrentIndex / #l_State_1.Regions;
                end;
            else
                return false, 0;
            end;
        end
    });
end;
