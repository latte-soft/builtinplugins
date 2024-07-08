local l_Parent_0 = script.Parent.Parent.Parent;
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_StudioService_0 = game:GetService("StudioService");
local l_AssetManagerInsertMultipleImages_0 = game:GetFastFlag("AssetManagerInsertMultipleImages");
local l_SourceAssetIdInModelChildren_0 = game:GetFastFlag("SourceAssetIdInModelChildren");
local function v15(v7)
    local v8 = v7:getState();
    local l_recentAssets_0 = v8.AssetManagerReducer.recentAssets;
    local l_selectedAssets_0 = v8.AssetManagerReducer.selectedAssets;
    local v11 = {};
    local v12 = {};
    for _, v14 in pairs(l_recentAssets_0) do
        if l_selectedAssets_0[v14.key] and v14.assetType == Enum.AssetType.MeshPart then
            table.insert(v11, "Meshes/" .. v14.name);
            table.insert(v12, v14.id);
        end;
    end;
    return v11, v12;
end;
local function v34(v16, _, v18, v19, v20, v21)
    v19:AddNewAction("Insert", v20:getText("ContextMenu", "Insert")).Triggered:connect(function()
        local v22 = v21:getState();
        local l_recentAssets_1 = v22.AssetManagerReducer.recentAssets;
        local l_selectedAssets_1 = v22.AssetManagerReducer.selectedAssets;
        local v25 = {};
        local v26 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v28 in pairs(l_recentAssets_1) do
                if l_selectedAssets_1[v28.key] and v28.assetType == Enum.AssetType.MeshPart then
                    table.insert(v25, "Meshes/" .. v28.name);
                end;
            end;
        else
            local v29, v30 = v15(v21);
            v25 = v29;
            v26 = v30;
        end;
        if next(v25) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v25, if not l_SourceAssetIdInModelChildren_0 then {} else v26);
        end;
        if not l_AssetManagerInsertMultipleImages_0 then
            l_AssetManagerService_0:InsertImage(v18.id);
        else
            local v31 = {};
            for _, v33 in pairs(l_recentAssets_1) do
                if l_selectedAssets_1[v33.key] and v33.assetType == Enum.AssetType.Image then
                    table.insert(v31, v33.id);
                end;
            end;
            l_AssetManagerService_0:InsertImages(v31);
        end;
        v16:report("clickContextMenuItem");
    end);
    v19:AddNewAction("CopyIdToClipboard", v20:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v18.id);
        v16:report("clickContextMenuItem");
    end);
    v19:ShowAsync();
    v19:Destroy();
end;
local function v49(v35, v36, v37, v38, v39)
    v37:AddNewAction("Insert", v38:getText("ContextMenu", "Insert")).Triggered:connect(function()
        local v40 = v39:getState();
        local l_recentAssets_2 = v40.AssetManagerReducer.recentAssets;
        local l_selectedAssets_2 = v40.AssetManagerReducer.selectedAssets;
        local v43 = {};
        local v44 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v46 in pairs(l_recentAssets_2) do
                if l_selectedAssets_2[v46.key] and v46.assetType == Enum.AssetType.MeshPart then
                    table.insert(v43, "Meshes/" .. v46.name);
                end;
            end;
        else
            local v47, v48 = v15(v39);
            v43 = v47;
            v44 = v48;
        end;
        if next(v43) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v43, if not l_SourceAssetIdInModelChildren_0 then {} else v44);
        end;
        l_AssetManagerService_0:InsertAudio(v36.id, v36.name);
        v35:report("clickContextMenuItem");
    end);
    v37:AddNewAction("CopyIdToClipboard", v38:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v36.id);
        v35:report("clickContextMenuItem");
    end);
    v37:ShowAsync();
    v37:Destroy();
end;
local function v64(v50, v51, v52, v53, v54)
    v52:AddNewAction("Insert", v53:getText("ContextMenu", "Insert")).Triggered:connect(function()
        local v55 = v54:getState();
        local l_recentAssets_3 = v55.AssetManagerReducer.recentAssets;
        local l_selectedAssets_3 = v55.AssetManagerReducer.selectedAssets;
        local v58 = {};
        local v59 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v61 in pairs(l_recentAssets_3) do
                if l_selectedAssets_3[v61.key] and v61.assetType == Enum.AssetType.MeshPart then
                    table.insert(v58, "Meshes/" .. v61.name);
                end;
            end;
        else
            local v62, v63 = v15(v54);
            v58 = v62;
            v59 = v63;
        end;
        if next(v58) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v58, if not l_SourceAssetIdInModelChildren_0 then {} else v59);
        end;
        l_AssetManagerService_0:InsertVideo(v51.id, v51.name);
        v50:report("clickContextMenuItem");
    end);
    v52:AddNewAction("CopyIdToClipboard", v53:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v51.id);
        v50:report("clickContextMenuItem");
    end);
    v52:ShowAsync();
    v52:Destroy();
end;
local function v90(v65, _, v67, v68, v69, v70)
    local v71 = v70:getState();
    local l_recentAssets_4 = v71.AssetManagerReducer.recentAssets;
    local l_selectedAssets_4 = v71.AssetManagerReducer.selectedAssets;
    v68:AddNewAction("Insert", v69:getText("ContextMenu", "Insert")).Triggered:connect(function()
        local v74 = {};
        local v75 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v77 in pairs(l_recentAssets_4) do
                if l_selectedAssets_4[v77.key] and v77.assetType == Enum.AssetType.MeshPart then
                    table.insert(v74, "Meshes/" .. v77.name);
                end;
            end;
        else
            local v78, v79 = v15(v70);
            v74 = v78;
            v75 = v79;
        end;
        if next(v74) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v74, if not l_SourceAssetIdInModelChildren_0 then {} else v75);
        end;
        v65:report("clickContextMenuItem");
    end);
    v68:AddNewAction("InsertWithLocation", v69:getText("ContextMenu", "InsertWithLocation")).Triggered:connect(function()
        local v80 = {};
        local v81 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v83 in pairs(l_recentAssets_4) do
                if l_selectedAssets_4[v83.key] and v83.assetType == Enum.AssetType.MeshPart then
                    table.insert(v80, "Meshes/" .. v83.name);
                end;
            end;
        else
            local v84, v85 = v15(v70);
            v80 = v84;
            v81 = v85;
        end;
        if next(v80) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v80, if not l_SourceAssetIdInModelChildren_0 then {} else v81);
        end;
        v65:report("clickContextMenuItem");
        if utf8.len(v71.AssetManagerReducer.searchTerm) ~= 0 then
            v65:report("insertAfterSearch");
        end;
    end);
    local l_status_0, l_result_0 = pcall(l_AssetManagerService_0.GetMeshIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v67.name);
    local l_status_1, l_result_1 = pcall(l_AssetManagerService_0.GetTextureIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v67.name);
    if not l_status_0 then
        warn("Failed to get mesh id for asset id " .. v67.id);
    else
        v68:AddNewAction("CopyMeshIdToClipboard", v69:getText("ContextMenu", "CopyMeshIdToClipboard")).Triggered:connect(function()
            l_StudioService_0:CopyToClipboard(l_result_0);
            v65:report("clickContextMenuItem");
        end);
    end;
    if l_status_1 then
        v68:AddNewAction("CopyTextureIdToClipboard", v69:getText("ContextMenu", "CopyTextureIdToClipboard")).Triggered:connect(function()
            l_StudioService_0:CopyToClipboard(l_result_1);
            v65:report("clickContextMenuItem");
        end);
    end;
    v68:ShowAsync();
    v68:Destroy();
end;
local function v107(v91, _, v93, v94, v95, v96)
    local _ = v96:getState();
    v94:AddNewAction("Insert", v95:getText("ContextMenu", "Insert")).Triggered:connect(function()
        local v98 = v96:getState();
        local l_recentAssets_5 = v98.AssetManagerReducer.recentAssets;
        local l_selectedAssets_5 = v98.AssetManagerReducer.selectedAssets;
        local v101 = {};
        local v102 = {};
        if not l_SourceAssetIdInModelChildren_0 then
            for _, v104 in pairs(l_recentAssets_5) do
                if l_selectedAssets_5[v104.key] and v104.assetType == Enum.AssetType.MeshPart then
                    table.insert(v101, "Meshes/" .. v104.name);
                end;
            end;
        else
            local v105, v106 = v15(v96);
            v101 = v105;
            v102 = v106;
        end;
        if next(v101) ~= nil then
            l_AssetManagerService_0:InsertMeshesWithLocation(v101, if not l_SourceAssetIdInModelChildren_0 then {} else v102);
        end;
        l_AssetManagerService_0:InsertModel(v93.id);
        v91:report("clickContextMenuItem");
    end);
    v94:AddNewAction("CopyIdToClipboard", v95:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v93.id);
        v91:report("clickContextMenuItem");
    end);
    v94:ShowAsync();
    v94:Destroy();
end;
local function v115(v108, v109, v110, v111, v112, v113)
    local l_assetType_0 = v110.assetType;
    if l_assetType_0 == Enum.AssetType.Image then
        v34(v108, v109, v110, v111, v112, v113);
        return ;
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        v90(v108, v109, v110, v111, v112, v113);
        return ;
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        v49(v108, v110, v111, v112, v113);
        return ;
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        v64(v108, v110, v111, v112, v113);
        return ;
    else
        if l_assetType_0 == Enum.AssetType.Model then
            v107(v108, v109, v110, v111, v112, v113);
        end;
        return ;
    end;
end;
return function(v116)
    return function(v117)
        v115(v116.Analytics, v116.API:get(), v116.AssetData, v116.Plugin:get():CreatePluginMenu("AssetManagerContextMenu"), v116.Localization, v117);
    end;
end;
