local l_TerrainToolsImportUploadAssets_0 = game:GetFastFlag("TerrainToolsImportUploadAssets");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_Util_0 = v2.Util;
local l_Signal_0 = l_Util_0.Signal;
local l_Promise_0 = l_Util_0.Promise;
local v8 = require(l_Parent_0.Src.Util.Constants);
local l_ImportMaterialMode_0 = require(l_Parent_0.Src.Util.TerrainEnums).ImportMaterialMode;
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = function(v12, _)
    if v12.heightmap and v12.heightmap.file then
        if not (v12.materialMode == l_ImportMaterialMode_0.Colormap) or v12.colormap and v12.colormap.file then
            return true;
        else
            return false, "NoColormapProvided";
        end;
    else
        return false, "ValidHeightMapImport";
    end;
end;
local v15 = l_ContextItem_0:extend("TerrainImporter");
v15.new = function(v16)
    assert(v16 and type(v16) == "table", "TerrainImporter requires an options table");
    local v17 = setmetatable({
        _localization = v16.localization, 
        _analytics = v16.analytics, 
        _heightmapImporterService = v16.heightmapImporterService or l_HeightmapImporterService_0, 
        _importSettings = {
            guid = nil, 
            position = Vector3.new(0, 0, 0), 
            size = Vector3.new(0, 0, 0), 
            heightmap = nil, 
            colormap = nil, 
            defaultMaterial = Enum.Material.Asphalt, 
            materialMode = l_ImportMaterialMode_0.DefaultMaterial
        }, 
        _importing = false, 
        _importProgress = 0, 
        _importOperation = "", 
        _isPaused = false, 
        _hasPixelWarning = false, 
        _updateSignal = l_Signal_0.new(), 
        _errorSignal = l_Signal_0.new(), 
        _importFinishSignal = l_Signal_0.new()
    }, v15);
    assert(v17._heightmapImporterService, "TerrainImporter.new() requires a HeightmapImporterService");
    v17._updateImportProgress = function(v18, v19)
        v17._importProgress = v18;
        v17._importOperation = v19;
        v17._updateSignal:Fire();
    end;
    v17._terrainProgressUpdateConnection = v17._heightmapImporterService.ProgressUpdate:Connect(v17._updateImportProgress);
    v17._heightmapImporterService.ColormapHasUnknownPixels:Connect(function()
        v17._hasPixelWarning = true;
    end);
    return v17;
end;
v15.getSignal = function(v20)
    return v20._updateSignal;
end;
v15.subscribeToImportFinish = function(v21, v22)
    return v21._importFinishSignal:Connect(v22);
end;
v15.subscribeToErrors = function(v23, v24)
    return v23._errorSignal:Connect(v24);
end;
v15.getHasPixelWarning = function(v25)
    return v25._hasPixelWarning;
end;
v15.clearHasPixelWarning = function(v26)
    v26._hasPixelWarning = false;
end;
v15.getImportProgress = function(v27)
    return v27._importProgress;
end;
v15.getImportOperation = function(v28)
    return v28._importOperation;
end;
v15.isImporting = function(v29)
    return v29._importing;
end;
v15.isPaused = function(v30)
    return v30._isPaused;
end;
v15.destroy = function(v31)
    v31:_setImporting(false);
    v31._heightmapImporterService = nil;
    v31._localization = nil;
    v31._analytics = nil;
end;
v15.updateSettings = function(v32, v33)
    v32._importSettings = v3.Dictionary.join(v32._importSettings, v33);
end;
v15._setImporting = function(v34, v35)
    if v35 ~= v34._importing then
        v34._importing = v35;
        v34._isPaused = false;
        v34._updateSignal:Fire();
    end;
end;
v15.togglePause = function(v36)
    v36._isPaused = not v36._isPaused;
    v36._heightmapImporterService:SetImportHeightmapPaused(v36._isPaused);
    v36._updateSignal:Fire();
end;
v15.cancel = function(v37)
    v37._heightmapImporterService:CancelImportHeightmap();
    v37._hasPixelWarning = false;
end;
local function v63(v38, v39, _, v41, v42, v43)
    v39 = v3.Dictionary.join(v39, {});
    return l_Promise_0.new(function(v44, v45)
        local l_v39_0 = v39;
        local v47, v48;
        if l_v39_0.heightmap and l_v39_0.heightmap.file then
            if not (l_v39_0.materialMode == l_ImportMaterialMode_0.Colormap) or l_v39_0.colormap and l_v39_0.colormap.file then
                v47 = true;
                v48 = nil;
            else
                v47 = false;
                v48 = "NoColormapProvided";
            end;
        else
            v47 = false;
            v48 = "ValidHeightMapImport";
        end;
        if v47 then
            l_v39_0 = v39.size;
            local v49 = (v39.position or Vector3.new(0, 0, 0)) + Vector3.new(0, l_v39_0.Y / 2, 0);
            local v50 = l_v39_0 / 2;
            local v51 = Region3.new(v49 - v50, v49 + v50):ExpandToGrid(v8.VOXEL_RESOLUTION);
            local l_TemporaryId_0 = v39.heightmap.file:GetTemporaryId();
            local l_materialMode_0 = v39.materialMode;
            local v54 = "";
            local l_Asphalt_0 = Enum.Material.Asphalt;
            if l_materialMode_0 == l_ImportMaterialMode_0.DefaultMaterial then
                l_Asphalt_0 = v39.defaultMaterial;
            elseif l_materialMode_0 == l_ImportMaterialMode_0.Colormap then
                v54 = v39.colormap.file:GetTemporaryId();
            end;
            if v42 then
                local v56 = "Colormap";
                local v57 = {};
                if l_materialMode_0 == l_ImportMaterialMode_0.DefaultMaterial then
                    v56 = v39.defaultMaterial.Name;
                else
                    v57 = {
                        width = v39.colormap.width, 
                        height = v39.colormap.height, 
                        channels = v39.colormap.channels
                    };
                end;
                v42:report("importTerrainLocal", v51, v56, {
                    width = v39.heightmap.width, 
                    height = v39.heightmap.height, 
                    channels = v39.heightmap.channels
                }, v57, v39.guid);
            end;
            if l_TerrainToolsImportUploadAssets_0 then
                spawn(function()
                    v43:handleAsset(v39.heightmap.file, v51, not not v39.guid and function(v58)
                        v42:report("importTerrainLocalHeightMap", v58, v39.guid);
                    end or nil);
                    local v59 = false;
                    if l_materialMode_0 == l_ImportMaterialMode_0.Colormap then
                        v59 = v39.colormap.file;
                    end;
                    if v59 then
                        v43:handleAsset(v39.colormap.file, v51, not not v39.guid and function(v60)
                            v42:report("importTerrainLocalColorMap", v60, v39.guid);
                        end or nil);
                    end;
                end);
            end;
            local l_status_0, l_result_0 = pcall(function()
                v38:ImportHeightmap(v51, l_TemporaryId_0, v54, l_Asphalt_0);
            end);
            v47 = l_status_0;
            v48 = l_result_0;
            if v47 then
                v44();
                return ;
            else
                v45(v48);
                return ;
            end;
        else
            v45(v41:getText("Warning", v48));
            return ;
        end;
    end);
end;
v15.startImport = function(v64)
    if not v64._importing then
        if l_TerrainToolsImportUploadAssets_0 then
            v64:updateSettings({
                guid = l_HttpService_0:GenerateGUID()
            });
        end;
        local function _()
            v64._hasPixelWarning = false;
            v64._updateImportProgress(0, "Starting");
            v64:_setImporting(true);
        end;
        local function _()
            v64._updateImportProgress(1, "");
            v64:_setImporting(false);
            v64._importFinishSignal:Fire();
        end;
        local function v68(v67)
            v64._errorSignal:Fire(v67);
        end;
        v64._hasPixelWarning = false;
        v64._updateImportProgress(0, "Starting");
        v64:_setImporting(true);
        v63(v64._heightmapImporterService, v64._importSettings, v64._updateImportProgress, v64._localization, v64._analytics, v64._assetHandler):catch(v68):await();
        v64._updateImportProgress(1, "");
        v64:_setImporting(false);
        v64._importFinishSignal:Fire();
        return ;
    else
        return ;
    end;
end;
return v15;
