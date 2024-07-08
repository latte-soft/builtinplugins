local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssets);
local v2 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v3 = require(l_Parent_0.Src.Actions.SetScreen);
local v4 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
local v5 = require(l_Parent_0.Src.Thunks.GetAssets);
local v6 = require(l_Parent_0.Src.Thunks.LaunchBulkImport);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v9 = require(l_Parent_0.Src.Util.Screens);
local v10 = require(l_Parent_0.Src.Util.View);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_StudioService_0 = game:GetService("StudioService");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_AssetManagerInsertMultipleImages_0 = game:GetFastFlag("AssetManagerInsertMultipleImages");
local l_SourceAssetIdInModelChildren_0 = game:GetFastFlag("SourceAssetIdInModelChildren");
local v19 = game:DefineFastFlag("AssetManagerInsertMeshCorrectly", false);
local function v27(v20, v21, v22, v23, v24)
    for _, v26 in pairs(v22) do
        if v23[v26.key] then
            if v26.assetType == Enum.AssetType.Place then
                l_AssetManagerService_0:RemovePlace(v26.id);
            elseif v26.assetType == Enum.AssetType.Image then
                l_AssetManagerService_0:DeleteAlias("Images/" .. v26.name);
            elseif v26.assetType == Enum.AssetType.MeshPart then
                l_AssetManagerService_0:DeleteAlias("Meshes/" .. v26.name);
            elseif l_enableAudioImport_0() and v26.assetType == Enum.AssetType.Audio then
                l_AssetManagerService_0:DeleteAlias("Audio/" .. v26.name);
            elseif l_enableVideoImport_0() and v26.assetType == Enum.AssetType.Video then
                l_AssetManagerService_0:DeleteAlias("Video/" .. v26.name);
            end;
        end;
    end;
    v24:dispatch(v4({}));
    v24:dispatch(v1({
        assets = {}
    }));
    v24:dispatch(v5(v20, v21.assetType));
end;
local function _(v28, v29, v30, v31, v32, v33)
    v28:AddNewAction("RenameAlias", v31:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v32();
        v33:dispatch(v2({
            [v30.id] = true
        }));
        v29:report("clickContextMenuItem");
    end);
end;
local function v40(v35, v36, v37, v38, v39)
    if l_RunService_0:IsEdit() then
        v35:AddNewAction("EditAsset", v38:getText("ContextMenu", "EditAsset")).Triggered:connect(function()
            l_MemStorageService_0:Fire("OpenAssetConfiguration", l_HttpService_0:JSONEncode({
                id = v37.id, 
                assetType = v39
            }));
            v36:report("clickContextMenuItem");
        end);
    end;
end;
local function v51(v41, v42, v43, v44, v45, v46, v47, v48)
    local l_assets_0 = v48.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_0 = v48.AssetManagerReducer.selectedAssets;
    v41:AddNewAction("RemoveFromGame", v45:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function()
        v27(v42, v44, l_assets_0, l_selectedAssets_0, v47);
        v46();
        v43:report("clickContextMenuItem");
    end);
end;
local function v60(v52, v53, v54, v55, v56, v57)
    v55:AddNewAction("OpenFolder", v56:getText("ContextMenu", "OpenFolder")).Triggered:connect(function()
        v57:dispatch(v3(v54.Screen));
        v52:report("clickContextMenuItem");
    end);
    if v54.Screen.Path == v9.IMAGES.Path then
        v55:AddNewAction("AddImages", v56:getText("ContextMenu", "AddImages")).Triggered:connect(function()
            v57:dispatch(v6(Enum.AssetType.Image.Value));
            v52:report("clickContextMenuItem");
        end);
    elseif l_enableAudioImport_0() and v54.Screen.Path == v9.AUDIO.Path then
        v55:AddNewAction("AddAudio", v56:getText("ContextMenu", "AddAudio")).Triggered:connect(function()
            v57:dispatch(v6(Enum.AssetType.Audio.Value));
            v52:report("clickContextMenuItem");
        end);
    elseif l_enableVideoImport_0() and v54.Screen.Path == v9.VIDEO.Path then
        v55:AddNewAction("AddVideo", v56:getText("ContextMenu", "AddVideo")).Triggered:connect(function()
            v57:dispatch(v6(Enum.AssetType.Video.Value));
            v52:report("clickContextMenuItem");
        end);
    elseif v54.Screen.Path == v9.MESHES.Path then
        v55:AddNewAction("AddMeshes", v56:getText("ContextMenu", "AddMeshes")).Triggered:connect(function()
            v57:dispatch(v6(Enum.AssetType.MeshPart.Value));
            v52:report("clickContextMenuItem");
        end);
    elseif v54.Screen.Path == v9.PLACES.Path then
        v55:AddNewAction("AddPlace", v56:getText("ContextMenu", "AddNewPlace")).Triggered:connect(function()
            local _, v59 = l_AssetManagerService_0:AddNewPlace();
            if not v59 then
                v57:dispatch(v1({
                    assets = {}
                }));
                if v57:getState().Screen.currentScreen.Path == v9.PLACES.Path then
                    v57:dispatch(v5(v53, v9.PLACES.AssetType));
                else
                    v57:dispatch(v3(v9.PLACES));
                end;
                v52:report("clickContextMenuItem");
                return ;
            else
                error(v59);
                return ;
            end;
        end);
    end;
    v55:ShowAsync();
    v55:Destroy();
end;
local function _(v61, v62, v63, v64, v65, v66, v67)
    local v68 = v67:getState();
    local l_assets_1 = v68.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_1 = v68.AssetManagerReducer.selectedAssets;
    v64:AddNewAction("Rename", v65:getText("ContextMenu", "Rename")).Triggered:connect(function()
        v66();
        v67:dispatch(v2({
            [v63.id] = true
        }));
        v61:report("clickContextMenuItem");
    end);
    v64:AddNewAction("CopyIdToClipboard", v65:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard(v63.id);
        v61:report("clickContextMenuItem");
    end);
    v64:AddNewAction("ViewPlaceHistory", v65:getText("ContextMenu", "ViewPlaceHistory")).Triggered:connect(function()
        l_StudioService_0:ShowPlaceVersionHistoryDialog(v63.id);
        v61:report("clickContextMenuItem");
    end);
    if not v63.isRootPlace then
        v64:AddNewAction("RemoveFromGame", v65:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function()
            v27(v62, v63, l_assets_1, l_selectedAssets_1, v67);
            v61:report("clickContextMenuItem");
        end);
    end;
    v64:ShowAsync();
    v64:Destroy();
end;
local function v83(v72, v73, v74, v75, v76, v77, v78, v79)
    local v80 = v79:getState();
    local l_assets_2 = v80.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_2 = v80.AssetManagerReducer.selectedAssets;
    v75:AddNewAction("Rename", v76:getText("ContextMenu", "Rename")).Triggered:connect(function()
        v77();
        v79:dispatch(v2({
            [v74.id] = true
        }));
        v72:report("clickContextMenuItem");
    end);
    v75:AddNewAction("CopyIdToClipboard", v76:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard(v74.id);
        v72:report("clickContextMenuItem");
    end);
    v75:AddNewAction("ViewPlaceHistory", v76:getText("ContextMenu", "ViewPlaceHistory")).Triggered:connect(function()
        l_StudioService_0:ShowPlaceVersionHistoryDialog(v74.id);
        v72:report("clickContextMenuItem");
    end);
    if not v74.isRootPlace then
        v75:AddNewAction("RemoveFromGame", v76:getText("ContextMenu", "RemoveFromGame")).Triggered:connect(function()
            v78();
            l_MemStorageService_0:Bind("RemovePlaceConfirmed", function()
                v27(v73, v74, l_assets_2, l_selectedAssets_2, v79);
            end);
            v72:report("clickContextMenuItem");
        end);
    end;
    v75:ShowAsync();
    v75:Destroy();
end;
local function v93(v84, v85, v86, v87, v88, v89, v90)
    local l_view_0 = v90:getState().AssetManagerReducer.view;
    local v92 = true;
    if v85.action ~= "Edit" then
        v92 = v85.action == "Own";
    end;
    if not (not (l_view_0.Key == v10.LIST.Key) or v87) then
        v86:AddNewAction("AssetPreview", v88:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v90:dispatch(v4({
                [v85.key] = true
            }));
            v89(v85);
        end);
    end;
    if l_RunService_0:IsEdit() then
        v86:AddNewAction("Insert", v88:getText("ContextMenu", "Insert")).Triggered:connect(function()
            l_AssetManagerService_0:InsertPackage(v85.id);
            v84:report("clickContextMenuItem");
            if utf8.len(v90:getState().AssetManagerReducer.searchTerm) ~= 0 then
                v84:report("insertAfterSearch");
            end;
        end);
    end;
    if l_RunService_0:IsEdit() then
        v86:AddNewAction("UpdateAll", v88:getText("ContextMenu", "UpdateAll")).Triggered:connect(function()
            l_AssetManagerService_0:UpdateAllPackages(v85.id);
            v84:report("clickContextMenuItem");
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v84:report("massUpdateFromAssetManager");
            end;
        end);
    end;
    v86:AddNewAction("ViewOnWebsite", v88:getText("ContextMenu", "ViewOnWebsite")).Triggered:connect(function()
        l_AssetManagerService_0:ViewPackageOnWebsite(v85.id);
        v84:report("clickContextMenuItem");
    end);
    v86:AddNewAction("CopyIdToClipboard", v88:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard(v85.id);
        v84:report("clickContextMenuItem");
    end);
    if not (not l_RunService_0:IsEdit() or not v92) then
        v86:AddNewAction("PackageDetails", v88:getText("ContextMenu", "PackageDetails")).Triggered:connect(function()
            l_AssetManagerService_0:ShowPackageDetails(v85.id);
            v84:report("clickContextMenuItem");
        end);
    end;
    v86:ShowAsync();
    v86:Destroy();
end;
local function v109(v94, v95, v96, v97, v98, v99, v100, v101, v102)
    local v103 = v102:getState();
    if not (not (v103.AssetManagerReducer.view.Key == v10.LIST.Key) or v98) then
        v97:AddNewAction("AssetPreview", v99:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v102:dispatch(v4({
                [v96.key] = true
            }));
            v100(v96);
        end);
    end;
    v40(v97, v94, v96, v99, Enum.AssetType.Image.Value);
    v97:AddNewAction("RenameAlias", v99:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v101();
        v102:dispatch(v2({
            [v96.id] = true
        }));
        v94:report("clickContextMenuItem");
    end);
    v97:AddNewAction("Insert", v99:getText("ContextMenu", "Insert")).Triggered:connect(function()
        if not l_AssetManagerInsertMultipleImages_0 then
            l_AssetManagerService_0:InsertImage(v96.id);
        else
            local l_assets_3 = v103.AssetManagerReducer.assetsTable.assets;
            local l_selectedAssets_3 = v103.AssetManagerReducer.selectedAssets;
            if #l_selectedAssets_3 == 1 then
                l_AssetManagerService_0:InsertImage(v96.id);
            else
                local v106 = {};
                for _, v108 in pairs(l_assets_3) do
                    if l_selectedAssets_3[v108.layoutOrder] then
                        table.insert(v106, v108.id);
                    end;
                end;
                l_AssetManagerService_0:InsertImages(v106);
            end;
        end;
        v94:report("clickContextMenuItem");
        if utf8.len(v103.AssetManagerReducer.searchTerm) ~= 0 then
            v94:report("insertAfterSearch");
        end;
    end);
    v97:AddNewAction("CopyIdToClipboard", v99:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v96.id);
        v94:report("clickContextMenuItem");
    end);
    v51(v97, v95, v94, v96, v99, v101, v102, v103);
    v97:ShowAsync();
    v97:Destroy();
end;
local function v120(v110, v111, v112, v113, v114, v115, v116, v117, v118)
    local v119 = v118:getState();
    if not (not (v119.AssetManagerReducer.view.Key == v10.LIST.Key) or v114) then
        v113:AddNewAction("AssetPreview", v115:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v116(v112);
        end);
    end;
    v40(v113, v110, v112, v115, Enum.AssetType.Audio.Value);
    v113:AddNewAction("RenameAlias", v115:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v117();
        v118:dispatch(v2({
            [v112.id] = true
        }));
        v110:report("clickContextMenuItem");
    end);
    v113:AddNewAction("Insert", v115:getText("ContextMenu", "Insert")).Triggered:connect(function()
        l_AssetManagerService_0:InsertAudio(v112.id, v112.name);
        v110:report("clickContextMenuItem");
        if utf8.len(v119.AssetManagerReducer.searchTerm) ~= 0 then
            v110:report("insertAfterSearch");
        end;
    end);
    v113:AddNewAction("CopyIdToClipboard", v115:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v112.id);
        v110:report("clickContextMenuItem");
    end);
    v51(v113, v111, v110, v112, v115, v117, v118, v119);
    v113:ShowAsync();
    v113:Destroy();
end;
local function v131(v121, v122, v123, v124, v125, v126, v127, v128, v129)
    local v130 = v129:getState();
    if not (not (v130.AssetManagerReducer.view.Key == v10.LIST.Key) or v125) then
        v124:AddNewAction("AssetPreview", v126:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v127(v123);
        end);
    end;
    v40(v124, v121, v123, v126, Enum.AssetType.Video.Value);
    v124:AddNewAction("RenameAlias", v126:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v128();
        v129:dispatch(v2({
            [v123.id] = true
        }));
        v121:report("clickContextMenuItem");
    end);
    v124:AddNewAction("Insert", v126:getText("ContextMenu", "Insert")).Triggered:connect(function()
        l_AssetManagerService_0:InsertVideo(v123.id, v123.name);
        v121:report("clickContextMenuItem");
        if utf8.len(v130.AssetManagerReducer.searchTerm) ~= 0 then
            v121:report("insertAfterSearch");
        end;
    end);
    v124:AddNewAction("CopyIdToClipboard", v126:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v123.id);
        v121:report("clickContextMenuItem");
    end);
    v51(v124, v122, v121, v123, v126, v128, v129, v130);
    v124:ShowAsync();
    v124:Destroy();
end;
local function v155(v132, v133, v134, v135, v136, v137, v138, v139, v140)
    local v141 = v140:getState();
    local l_assets_4 = v141.AssetManagerReducer.assetsTable.assets;
    local l_selectedAssets_4 = v141.AssetManagerReducer.selectedAssets;
    local v144 = 0;
    for _, _ in pairs(l_selectedAssets_4) do
        v144 = v144 + 1;
    end;
    if not (not (v141.AssetManagerReducer.view.Key == v10.LIST.Key) or v136) then
        v135:AddNewAction("AssetPreview", v137:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v140:dispatch(v4({
                [v134.key] = true
            }));
            v138(v134);
        end);
    end;
    v40(v135, v132, v134, v137, Enum.AssetType.MeshPart.Value);
    v135:AddNewAction("RenameAlias", v137:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v139();
        v140:dispatch(v2({
            [v134.id] = true
        }));
        v132:report("clickContextMenuItem");
    end);
    if v144 == 1 then
        v135:AddNewAction("Insert", v137:getText("ContextMenu", "Insert")).Triggered:connect(function()
            l_AssetManagerService_0:InsertMesh("Meshes/" .. v134.name, false, not l_SourceAssetIdInModelChildren_0 and -1 or v134.id);
            v132:report("clickContextMenuItem");
            if utf8.len(v141.AssetManagerReducer.searchTerm) ~= 0 then
                v132:report("insertAfterSearch");
            end;
        end);
    end;
    v135:AddNewAction("InsertWithLocation", v137:getText("ContextMenu", "InsertWithLocation")).Triggered:connect(function()
        if v144 == 1 then
            if not v19 then
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v134.name, false, not l_SourceAssetIdInModelChildren_0 and -1 or v134.id);
            else
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v134.name, true, not l_SourceAssetIdInModelChildren_0 and -1 or v134.id);
            end;
        else
            local v147 = {};
            local v148 = {};
            for _, v150 in pairs(l_assets_4) do
                if l_selectedAssets_4[v150.layoutOrder] then
                    table.insert(v147, "Meshes/" .. v150.name);
                    if l_SourceAssetIdInModelChildren_0 then
                        table.insert(v148, v150.id);
                    end;
                end;
            end;
            l_AssetManagerService_0:InsertMeshesWithLocation(v147, if not l_SourceAssetIdInModelChildren_0 then {} else v148);
        end;
        v132:report("clickContextMenuItem");
        if utf8.len(v141.AssetManagerReducer.searchTerm) ~= 0 then
            v132:report("insertAfterSearch");
        end;
    end);
    local l_status_0, l_result_0 = pcall(l_AssetManagerService_0.GetMeshIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v134.name);
    local l_status_1, l_result_1 = pcall(l_AssetManagerService_0.GetTextureIdFromAliasName, l_AssetManagerService_0, "Meshes/" .. v134.name);
    if not l_status_0 then
        warn("Failed to get mesh id for asset id " .. v134.id);
    else
        v135:AddNewAction("CopyMeshIdToClipboard", v137:getText("ContextMenu", "CopyMeshIdToClipboard")).Triggered:connect(function()
            l_StudioService_0:CopyToClipboard(l_result_0);
            v132:report("clickContextMenuItem");
        end);
    end;
    if l_status_1 then
        v135:AddNewAction("CopyTextureIdToClipboard", v137:getText("ContextMenu", "CopyTextureIdToClipboard")).Triggered:connect(function()
            l_StudioService_0:CopyToClipboard(l_result_1);
            v132:report("clickContextMenuItem");
        end);
    end;
    v51(v135, v133, v132, v134, v137, v139, v140, v141);
    v135:ShowAsync();
    v135:Destroy();
end;
local function v166(v156, v157, v158, v159, v160, v161, v162, v163, v164)
    local v165 = v164:getState();
    if not (not (v165.AssetManagerReducer.view.Key == v10.LIST.Key) or v160) then
        v159:AddNewAction("AssetPreview", v161:getText("ContextMenu", "AssetPreview")).Triggered:connect(function()
            v164:dispatch(v4({
                [v158.key] = true
            }));
            v162(v158);
        end);
    end;
    v40(v159, v156, v158, v161, Enum.AssetType.Model.Value);
    v159:AddNewAction("RenameAlias", v161:getText("ContextMenu", "RenameAlias")).Triggered:connect(function()
        v163();
        v164:dispatch(v2({
            [v158.id] = true
        }));
        v156:report("clickContextMenuItem");
    end);
    v159:AddNewAction("Insert", v161:getText("ContextMenu", "Insert")).Triggered:connect(function()
        v156:report("clickContextMenuItem");
        l_AssetManagerService_0:InsertModel(v158.id);
        if utf8.len(v165.AssetManagerReducer.searchTerm) ~= 0 then
            v156:report("insertAfterSearch");
        end;
    end);
    v159:AddNewAction("CopyIdToClipboard", v161:getText("ContextMenu", "CopyIdToClipboard")).Triggered:connect(function()
        l_StudioService_0:CopyToClipboard("rbxassetid://" .. v158.id);
        v156:report("clickContextMenuItem");
    end);
    v51(v159, v157, v156, v158, v161, v163, v164, v165);
    v159:ShowAsync();
    v159:Destroy();
end;
local function v178(v167, v168, v169, v170, v171, v172, v173, v174, v175, v176)
    local l_assetType_0 = v169.assetType;
    if l_assetType_0 == Enum.AssetType.Place then
        v83(v167, v168, v169, v170, v172, v174, v175, v176);
        return ;
    elseif l_assetType_0 == Enum.AssetType.Package then
        v93(v167, v169, v170, v171, v172, v173, v176);
        return ;
    elseif l_assetType_0 == Enum.AssetType.Image then
        v109(v167, v168, v169, v170, v171, v172, v173, v174, v176);
        return ;
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        v155(v167, v168, v169, v170, v171, v172, v173, v174, v176);
        return ;
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        v120(v167, v168, v169, v170, v171, v172, v173, v174, v176);
        return ;
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        v131(v167, v168, v169, v170, v171, v172, v173, v174, v176);
        return ;
    else
        if l_assetType_0 == Enum.AssetType.Model then
            v166(v167, v168, v169, v170, v171, v172, v173, v174, v176);
        end;
        return ;
    end;
end;
return function(v179)
    return function(v180)
        local l_Analytics_0 = v179.Analytics;
        local v182 = v179.API:get();
        local l_AssetData_0 = v179.AssetData;
        local l_IsAssetPreviewMenu_0 = v179.IsAssetPreviewMenu;
        local l_Localization_0 = v179.Localization;
        local v186 = v179.Plugin:get();
        local l_OnOpenAssetPreview_0 = v179.OnOpenAssetPreview;
        local l_OnAssetPreviewClose_0 = v179.OnAssetPreviewClose;
        local l_OnOpenConfirmRemovePlaceDialog_0 = v179.OnOpenConfirmRemovePlaceDialog;
        local l_v186_PluginMenu_0 = v186:CreatePluginMenu("AssetManagerContextMenu");
        if not (l_AssetData_0.ClassName == "Folder") then
            v178(l_Analytics_0, v182, l_AssetData_0, l_v186_PluginMenu_0, l_IsAssetPreviewMenu_0, l_Localization_0, l_OnOpenAssetPreview_0, l_OnAssetPreviewClose_0, l_OnOpenConfirmRemovePlaceDialog_0, v180);
            return ;
        else
            v60(l_Analytics_0, v182, l_AssetData_0, l_v186_PluginMenu_0, l_Localization_0, v180);
            return ;
        end;
    end;
end;
