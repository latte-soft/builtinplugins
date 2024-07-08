local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local l_StudioService_0 = game:GetService("StudioService");
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorHeightmapFixes);
local l_ImageType_0 = require(l_script_FirstAncestor_0.Src.Types).ImageType;
return function(v5, v6)
    local v7 = {
        "png", 
        "jpg", 
        "jpeg"
    };
    local v8 = nil;
    local l_status_0, l_result_0 = pcall(function()
        v8 = l_StudioService_0:PromptImportFile(v7);
    end);
    if l_status_0 then
        if v8 then
            local l_v8_TemporaryId_0 = v8:GetTemporaryId();
            local v12 = nil;
            local v13 = nil;
            local v14 = nil;
            local v15 = nil;
            local v16 = nil;
            local v17 = nil;
            if not v3() then
                local v18, v19, v20, v21, v22, v23 = l_HeightmapImporterService_0:IsValidHeightmap(l_v8_TemporaryId_0);
                v12 = v18;
                v13 = v19;
                v14 = v20;
                v15 = v21;
                v16 = v22;
                v17 = v23;
            elseif v6 == l_ImageType_0.Heightmap then
                local v24, v25, v26, v27, v28, v29 = l_HeightmapImporterService_0:IsValidHeightmap(l_v8_TemporaryId_0);
                v12 = v24;
                v13 = v25;
                v14 = v26;
                v15 = v27;
                v16 = v28;
                v17 = v29;
            elseif v6 == l_ImageType_0.Colormap then
                local v30, v31, v32, v33, v34 = l_HeightmapImporterService_0:IsValidColormap(l_v8_TemporaryId_0);
                v12 = v30;
                v13 = v31;
                v14 = v32;
                v15 = v33;
                v16 = v34;
            end;
            if v12 then
                task.spawn(function()
                    local v35 = nil;
                    local v36 = nil;
                    local _, l_result_1 = pcall(function()
                        local l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0, v38 = l_HeightmapImporterService_0:GetHeightmapPreviewAsync(l_v8_TemporaryId_0);
                        v35 = l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0;
                        v36 = v38;
                    end);
                    v5("", {
                        Preview = {
                            Id = v35, 
                            Error = l_result_1
                        }, 
                        File = v8, 
                        Width = v14, 
                        Height = v15, 
                        ChannelInfo = {
                            BytesPerChannel = v17, 
                            Channels = v16, 
                            DiscardedChannels = v36
                        }
                    });
                end);
                return ;
            else
                v5(v13);
                return ;
            end;
        else
            return ;
        end;
    else
        v5(l_result_0);
        return ;
    end;
end;
