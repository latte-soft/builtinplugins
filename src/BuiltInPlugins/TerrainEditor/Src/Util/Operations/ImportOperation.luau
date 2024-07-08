local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_HeightmapSettings_0 = v3.HeightmapSettings;
local l_SelectionSettings_0 = v3.SelectionSettings;
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_RegionNormalization_0 = v7.RegionNormalization;
local l_MaxImportVolume_0 = v7.MaxImportVolume;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.AnalyticsHelper);
local v12 = require(l_Util_0.ConvertTransformToRegion);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorHeightmapFixes);
local function _(v15)
    return (Vector3.new(v15.X * 4, v15.Y * 4, v15.Z * 4));
end;
return function(v17, v18, v19)
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v18, 
        Name = v17, 
        OnCancel = function(_, _)
            l_HeightmapImporterService_0:CancelImportHeightmap();
        end, 
        OnFinish = function(v22, v23)
            local l_State_0 = v22.State;
            if l_State_0.ProgressUpdateConnection then
                l_State_0.ProgressUpdateConnection:Disconnect();
                l_State_0.ProgressUpdateConnection = nil;
                l_State_0.Progress = 0;
            end;
            if v13() then
                local v25 = v22.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
                if (l_RegionNormalization_0 <= v25.X and l_RegionNormalization_0 <= v25.Y) and l_RegionNormalization_0 <= v25.Z then
                    v23:addTimeStatistic(v11.NormalizeRegionTimer(l_State_0.StartTime, v25));
                end;
            end;
            v19.ChangeHistoryService:SetWaypoint("ImportAction");
        end, 
        OnPause = function(_, _)
            l_HeightmapImporterService_0:SetImportHeightmapPaused(true);
        end, 
        OnResume = function(_, _)
            l_HeightmapImporterService_0:SetImportHeightmapPaused(false);
        end, 
        OnStart = function(v30, v31)
            local function v40()
                local v32 = v30.Payload[l_Category_0.SelectionSettings];
                local v33 = v30.Payload[l_Category_0.HeightmapSettings];
                local v34 = v12(v32[l_SelectionSettings_0.Transform], v32[l_SelectionSettings_0.Size], true);
                local l_Min_0 = v34.Min;
                local v36 = Vector3.new(l_Min_0.X * 4, l_Min_0.Y * 4, l_Min_0.Z * 4);
                local l_Max_0 = v34.Max;
                l_Min_0 = Vector3.new(l_Max_0.X * 4, l_Max_0.Y * 4, l_Max_0.Z * 4);
                if v14() then
                    l_Max_0 = l_Min_0 - v36;
                    if l_MaxImportVolume_0 < (l_Max_0.X * l_Max_0.Y) * l_Max_0.Z then
                        l_Min_0 = l_Min_0 - Vector3.one * 4;
                    end;
                end;
                l_Max_0 = Region3.new(v36, l_Min_0);
                if v33[l_HeightmapSettings_0.Heightmap].Image then
                    local l_TemporaryId_0 = v33[l_HeightmapSettings_0.Heightmap].Image.File:GetTemporaryId();
                    local l_Image_0 = v33[l_HeightmapSettings_0.Colormap].Image;
                    l_HeightmapImporterService_0:ImportHeightmap(l_Max_0, l_TemporaryId_0, not l_Image_0 and "" or l_Image_0.File:GetTemporaryId(), v33[l_HeightmapSettings_0.DefaultMaterial]);
                    v30.State.Progress = 1;
                    return ;
                else
                    v30.State.Progress = 1;
                    return ;
                end;
            end;
            v30.State = {
                Progress = 0, 
                ProgressUpdateConnection = l_HeightmapImporterService_0.ProgressUpdate:Connect(function(v41, v42)
                    v31:setDescription(v42);
                    v30.State.Progress = v41;
                end), 
                StartTime = os.clock()
            };
            if not v30.Synchronous then
                task.spawn(v40);
                return ;
            else
                v40();
                return ;
            end;
        end, 
        OnStep = function(v43, _)
            local l_State_1 = v43.State;
            if l_State_1.Progress and l_State_1.Progress == 1 then
                return false, 1;
            else
                return true, l_State_1.Progress or 0;
            end;
        end
    });
end;
