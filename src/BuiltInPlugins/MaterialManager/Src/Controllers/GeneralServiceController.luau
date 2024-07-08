local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_Util_0 = l_Parent_0.Src.Util;
local v6 = require(l_Util_0.ApplyToBasePart);
local v7 = require(l_Util_0.ApplyToInstances);
local v8 = require(l_Util_0.GenerateMaterialName);
local v9 = require(l_Util_0.GenerateTerrainDetailName);
local v10 = require(l_Util_0.getNumberIdFromURL);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v12 = require(l_Constants_0.getMaterialName);
local v13 = require(l_Constants_0.getMaterialPatternName);
local v14 = require(l_Constants_0.getErrorTypes)();
local v15 = l_ContextItem_0:extend("GeneralServiceController");
v15.new = function(v16)
    return (setmetatable({
        _changeHistoryService = l_ServiceWrapper_0.new("ChangeHistoryService", v16), 
        _insertService = l_ServiceWrapper_0.new("InsertService", v16), 
        _selection = l_ServiceWrapper_0.new("Selection", v16), 
        _assetManagerService = l_ServiceWrapper_0.new("AssetManagerService", v16), 
        _materialService = l_ServiceWrapper_0.new("MaterialService", v16), 
        _studioService = l_ServiceWrapper_0.new("StudioService", v16), 
        _marketplaceService = l_ServiceWrapper_0.new("MarketplaceService", v16), 
        _loadedFiles = {}, 
        _mock = v16
    }, v15));
end;
v15.mock = function()
    return v15.new(true);
end;
v15.destroy = function(v17)
    v17._changeHistoryService:destroy();
    v17._insertService:destroy();
    v17._assetManagerService:destroy();
end;
v15.destroyWithUndo = function(v18, v19)
    v19.Parent = nil;
    v18._changeHistoryService:asService():SetWaypoint("Deleted " .. v19.Name);
end;
v15.LoadLocalAsset = function(v20, v21)
    if not v20._mock then
        if not v20._loadedFiles[v21] then
            v20._loadedFiles[v21] = v20._insertService:asService():LoadLocalAsset(v21);
        end;
        return v20._loadedFiles[v21];
    else
        local l_Model_0 = Instance.new("Model");
        Instance.new("MeshPart").Parent = l_Model_0;
        return l_Model_0;
    end;
end;
v15.SetSelection = function(v23, v24)
    v23._selection:asService():Set(v24);
end;
v15.ApplyToBasePart = function(v25, v26, v27, v28)
    v6(v26, v27, v28);
    v25._changeHistoryService:asService():SetWaypoint("Applied Material to BasePart");
end;
v15.ApplyToSelection = function(v29, v30, v31)
    v7(v29._selection:asService():Get(), v30, v31);
    v29._changeHistoryService:asService():SetWaypoint("Applied Material to Selection");
end;
v15.setName = function(v32, v33, v34)
    v33.Name = v34;
    v32._changeHistoryService:asService():SetWaypoint("Set Name for Material Variant to" .. v34);
end;
v15.setBaseMaterial = function(v35, v36, v37)
    v36.BaseMaterial = v37;
    v35._changeHistoryService:asService():SetWaypoint("Set BaseMaterial for Material Variant to" .. v12(v37));
end;
v15.setTextureMap = function(v38, v39, v40, v41)
    v39[v40] = v41;
    v38._changeHistoryService:asService():SetWaypoint("Set" .. v40 .. "for Material Variant to" .. v41);
end;
v15.importFile = function(v42)
    local v43 = {
        "png", 
        "jpg", 
        "jpeg"
    };
    local v44 = nil;
    local l_status_0, _ = pcall(function()
        v44 = v42._studioService:asService():PromptImportFile(v43);
    end);
    return l_status_0, v44;
end;
v15.insertAssetId = function(v47, v48, v49)
    local v50 = tonumber(v48:match("://(%d+)"));
    if not v50 then
        return false;
    else
        v49 = v49:match("[^.]+");
        if v49:sub(1, 7) ~= "Images/" then
            v49 = "Images/" .. v49;
        end;
        pcall(function()
            v47._assetManagerService:asService():DeleteAlias(v49);
        end);
        return (pcall(function()
            v47._assetManagerService:asService():CreateAlias(Enum.AssetType.Image.Value, v50, v49);
        end));
    end;
end;
v15.uploadTextureMap = function(v51, _, _, v54, v55, v56, v57)
    local _ = v54:handleAsset(v55, v56):andThen(function(v58)
        local v59 = v51:insertAssetId(v58, v55.Name);
        local v60 = nil;
        if not v59 then
            v60 = v14.FailedToInsertAssetManager;
        end;
        v57(v58, "uploadTextureMapSuccess", v60);
    end):catch(function(v61)
        warn("Error uploading asset, responseCode " .. tostring(v61.responseCode));
        if (not v61 or not v61.responseCode) or v61.responseCode == -1 then
            v57("", "uploadTextureMapFromFileError", v14.FailedToUploadTooLarge);
            return ;
        else
            v57("", "uploadTextureMapGeneralError", v14.FailedToUploadFromFileMap);
            return ;
        end;
    end);
end;
v15.setTextureMapFromFile = function(v63, v64, v65, v66, v67, v68, v69)
    v69("", "importTextureMap", nil);
    local v70, v71 = v63:importFile();
    if not v70 then
        v69("", "importTextureMapError", v14.FailedToImportMap);
    elseif v71 then
        local l_v71_TemporaryId_0 = v71:GetTemporaryId();
        v63:uploadTextureMap(v64, v65, v66, v71, v67, v69);
        v68(v71, l_v71_TemporaryId_0);
        return ;
    end;
end;
v15.setTextureMapFromURL = function(v73, v74, v75, v76, v77, v78)
    v78("", "uploadAssetIdTextureMap", nil);
    local v79 = v10(v76);
    if v79 then
        local v80 = nil;
        spawn(function()
            if v77() then
                local l_status_1, _ = pcall(function()
                    v80 = v73._marketplaceService:asService():GetProductInfo(v79);
                end);
                if v77() then
                    if (not l_status_1 or not v80) or v80.AssetTypeId ~= Enum.AssetType.Image.Value then
                        v78("", "uploadFromURLTextureMapError", v14.FailedUrl);
                        return ;
                    else
                        v73:setTextureMap(v74, v75, "rbxassetid://" .. tostring(v79));
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        return ;
    else
        v78("", "uploadFromURLTextureMapError", v14.FailedUrl);
        return ;
    end;
end;
v15.setStudsPerTile = function(v83, v84, v85)
    v84.StudsPerTile = v85;
    v83._changeHistoryService:asService():SetWaypoint("Set StudsPerTile for Material Variant to" .. v85);
end;
v15.setMaterialPattern = function(v86, v87, v88)
    v87.MaterialPattern = v88;
    v86._changeHistoryService:asService():SetWaypoint("Set MaterialPattern for Material Variant to" .. v13(v88));
end;
v15.setTerrainDetailName = function(v89, v90, v91)
    v90.Name = v91;
    v89._changeHistoryService:asService():SetWaypoint("Set Name for Terrain Detail to" .. v91);
end;
v15.createMaterialVariant = function(v92, v93, v94)
    v92._changeHistoryService:asService():SetWaypoint("Create new Material Variant");
    local l_MaterialVariant_0 = Instance.new("MaterialVariant");
    local v96 = if not not v94 and v94 ~= "" then v94 else "MaterialVariant";
    local v97 = v93 or Enum.Material.Plastic;
    local v98 = v8(v92._materialService:asInstance(), v97, v96);
    l_MaterialVariant_0.Name = if not v98 then v96 else v96 .. v98;
    l_MaterialVariant_0.BaseMaterial = v97;
    l_MaterialVariant_0.StudsPerTile = 10;
    l_MaterialVariant_0.Parent = game:GetService("MaterialService");
    return l_MaterialVariant_0;
end;
v15.createTerrainDetail = function(v99, v100, v101)
    local l_TerrainDetail_0 = Instance.new("TerrainDetail");
    l_TerrainDetail_0.Face = v101;
    l_TerrainDetail_0.Name = "TerrainDetail" .. v9(v100, "TerrainDetail");
    l_TerrainDetail_0.Parent = v100;
    v99._changeHistoryService:asService():SetWaypoint("Create new Terrain Detail to" .. l_TerrainDetail_0.Name);
    return l_TerrainDetail_0;
end;
return v15;
