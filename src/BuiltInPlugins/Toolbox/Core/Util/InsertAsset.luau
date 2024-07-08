local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.InsertToolPromise);
local _ = require(l_Parent_0.Core.Util.isCli);
local _ = require(l_Parent_0.Core.Networking.NetworkInterface);
local v6 = require(l_Parent_0.Core.Util.Urls);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v8 = require(l_Parent_0.Core.Types.Category);
local v9 = require(l_Parent_0.Core.Types.AssetSubTypes);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local v12 = game:DefineFastFlag("ToolboxUnifyModelPackageInsertion2", false);
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxDeleteTempModelFix_0 = game:GetFastFlag("ToolboxDeleteTempModelFix");
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local l_ToolboxVideoUsePermissionInsertion_0 = game:GetFastFlag("ToolboxVideoUsePermissionInsertion");
local l_ToolboxVideoTestUseLocalAudioFile_0 = game:GetFastFlag("ToolboxVideoTestUseLocalAudioFile");
local l_SourceAssetIdInModelChildren_0 = game:GetFastFlag("SourceAssetIdInModelChildren");
local v20 = require(l_Parent_0.Core.Flags.getFFlagToolboxSetParentFix);
local v21 = require(l_Parent_0.Core.Util.ToolboxCommunication);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_InsertService_0 = game:GetService("InsertService");
local l_Selection_0 = game:GetService("Selection");
local l_StarterPack_0 = game:GetService("StarterPack");
local l_Workspace_0 = game:GetService("Workspace");
local l_StudioService_0 = game:GetService("StudioService");
local l_Lighting_0 = game:GetService("Lighting");
local l_MaterialService_0 = game:GetService("MaterialService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v31 = {
    [Enum.RibbonTool.Move] = true, 
    [Enum.RibbonTool.Rotate] = true, 
    [Enum.RibbonTool.Scale] = true, 
    [Enum.RibbonTool.Select] = true
};
local function v38()
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local v33 = l_CurrentCamera_0.ViewportSize / 2;
    local v34 = l_CurrentCamera_0:ViewportPointToRay(v33.X, v33.Y, 0);
    local v35 = Ray.new(v34.Origin, v34.Direction * 2048);
    local v36 = RaycastParams.new();
    v36.BruteForceAllSlow = true;
    local v37 = l_Workspace_0:Raycast(v35.Origin, v35.Direction, v36);
    if not v37 then
        return l_CurrentCamera_0.CFrame.p + v34.Direction * 64;
    else
        return v37.Position;
    end;
end;
local function v43(v39, v40)
    if not ((not v39 or not v40) or not v39:IsA("Folder")) then
        for _, v42 in ipairs(v39:GetChildren()) do
            if v42:IsA("Model") then
                v42.SourceAssetId = v40;
            end;
        end;
    end;
end;
local function v47(v44, v45)
    if game.GameId == 0 then
        return ;
    else
        return v45:grantAssetPermissionWithTimeout(v44, {
            requests = {
                {
                    action = l_webKeys_0.UseAction, 
                    subjectId = game.GameId, 
                    subjectType = l_webKeys_0.Universe
                }
            }
        }):catch(function(v46)
            return v46;
        end):await();
    end;
end;
local function v55(v48, v49, v50, v51, v52, v53)
    if game.GameId == 0 then
        return ;
    elseif v51 then
        if not l_MarketplaceService_0:GetProductInfo(v49, Enum.InfoType.Asset).IsPublicDomain then
            if v50 ~= Enum.AssetType.Audio.Value then
                error("Only support for fetching permissions on Audio is implemented at this time.");
            end;
            if v51:promptPermissionsGrantAndWait({
                assetName = v48, 
                assetId = v49, 
                assetType = v52:getText("General", "AssetTypeAudio")
            }) then
                local v54 = v47(v49, v53);
                if (((v54 ~= nil and v54.Body ~= nil) and v54.Body.Error ~= nil) and v54.Body.Error.Code ~= nil) and v54.Body.Error.Code ~= 4 then
                    warn(v52:getText("GrantAssetPermission", "Failure", {
                        assetId = v49
                    }));
                    return ;
                else
                    print(v52:getText("GrantAssetPermission", "Success", {
                        assetId = v49
                    }));
                end;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v63(v56, v57, v58, v59, v60)
    local v61 = v6.constructAssetIdString(v56);
    if v2.shouldDebugUrls() then
        print(("Inserting sound %s"):format(v61));
    end;
    v47(v56, v60);
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.SourceAssetId = v56;
    l_Sound_0.SoundId = v61;
    l_Sound_0.Name = v57;
    l_Sound_0.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
    l_Selection_0:Set({
        l_Sound_0
    });
    if l_ToolboxEnableAudioGrantDialog_0 then
        v55(v57, v56, Enum.AssetType.Audio.Value, v58, v59, v60);
    end;
    return l_Sound_0;
end;
local function v71(v64, v65, v66)
    local v67 = false;
    local v68 = {};
    for _, v70 in ipairs(v65) do
        if not v70:IsA("MeshPart") then
            v70:Destroy();
            v67 = true;
        else
            if #v70:GetChildren() > 0 then
                v70:ClearAllChildren();
                v67 = true;
            end;
            table.insert(v68, v70);
        end;
    end;
    if v67 then
        v1.reportMeshPartFiltered(v64);
    end;
    if #v68 == 0 then
        warn(v66:getText("Common", "InsertAborted", {
            assetId = v64
        }));
    end;
    return v68;
end;
local _ = function(v72, v73, v74)
    return l_Promise_0.new(function(v75, _)
        local function v79()
            for _, v78 in ipairs(v73) do
                v78:Destroy();
            end;
            v75(false);
        end;
        local function v80()
            v75(true);
        end;
        if not v73 then
            v75(true);
        end;
        if not v74 then
            v75(true);
        end;
        local v81 = 0;
        for _, v83 in ipairs(v73) do
            if v83:IsA("Script") then
                v81 = v81 + 1;
            end;
            for _, v85 in ipairs(v83:GetDescendants()) do
                if v85:IsA("Script") then
                    v81 = v81 + 1;
                end;
            end;
        end;
        if v81 < 1 then
            v75(true);
        end;
        if v81 >= 1 then
            v74:promptScriptWarningAndWait({
                assetName = v72, 
                numScripts = v81, 
                cancel = v79, 
                insert = v80
            });
        end;
        if l_ToolboxDeleteTempModelFix_0 then
            v75(true);
        end;
    end);
end;
local function v97(v87, v88, v89, v90, v91)
    for _, v93 in ipairs(v89) do
        if not v93:IsA("Sky") and not v93:IsA("Atmosphere") then
            if not v9.contains(v90, v9.MaterialPack) then
                local l_v88_0 = v88;
                if not (not v93:IsA("Tool") and not v93:IsA("HopperBin")) then
                    local v95 = v87:promptAndWait();
                    if v95 == v3.INSERT_TO_WORKSPACE then
                        l_v88_0 = v88;
                    elseif v95 == v3.INSERT_TO_STARTER_PACK then
                        l_v88_0 = l_StarterPack_0;
                    elseif v95 == v3.INSERT_CANCELLED then
                        l_v88_0 = nil;
                    end;
                end;
                do
                    local l_l_v88_0_0 = l_v88_0;
                    if not v20() then
                        v93.Parent = l_l_v88_0_0;
                        if not v93.Parent then
                            v93:Destroy();
                        end;
                    else
                        xpcall(function()
                            if not game:GetService(v93.ClassName) then
                                v93.Parent = l_l_v88_0_0;
                                if not v93.Parent then
                                    v93:Destroy();
                                end;
                                return ;
                            else
                                if v2.shouldDebugWarnings() then
                                    warn((("Attempted to insert unsupported service type: %*"):format(v93.ClassName)));
                                end;
                                return ;
                            end;
                        end, function()
                            if not (not v93 or not v2.shouldDebugWarnings()) then
                                warn((("Attempted to insert unsupported instance type: %*"):format(v93.ClassName)));
                            end;
                        end);
                    end;
                end;
            else
                v93.Parent = l_MaterialService_0;
            end;
        else
            v93.Parent = l_Lighting_0;
        end;
        v91[#v91 + 1] = v93;
    end;
end;
local function v105(v98, v99)
    if v98 then
        if #v98:GetChildren() > 0 then
            v98:MoveTo(v99);
            local l_v98_BoundingBox_0, v101 = v98:GetBoundingBox();
            if v101.Magnitude > 0 then
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                l_CurrentCamera_1.CFrame = CFrame.new(l_v98_BoundingBox_0.p + (v101.Magnitude * 1.2) * (l_CurrentCamera_1.CFrame.p - l_v98_BoundingBox_0.p).unit);
                l_CurrentCamera_1.Focus = CFrame.new(l_v98_BoundingBox_0.p);
            end;
            for _, v104 in ipairs(v98:GetChildren()) do
                v104.Parent = v98.Parent;
            end;
        end;
        v98:Destroy();
    end;
end;
local function v114(v106, v107, v108, v109, v110, v111, v112)
    local v113 = {};
    if not v107 then
        if v2.shouldDebugWarnings() then
            print("destroying temp model insert");
        end;
        v109:Destroy();
    else
        v97(v108, v109, v110, v111, v113);
        v105(v109, v112);
        v21:fire("AssetInserted", {
            assetId = v106, 
            assetInstance = v110
        });
    end;
    l_Selection_0:Set(v113);
    return v113;
end;
local function v145(v115, v116, v117, v118, v119, v120, v121, v122, v123)
    local l_l_Workspace_0_0 = l_Workspace_0;
    local v125 = if (v12 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0) or v122 then (v9.contains(v120, v9.Package) or v121 ~= nil and v8.categoryIsPackage(v121)) or v122 and v8.getCategoryByName(v121) == v8.FREE_MODELS else nil;
    local v126 = nil;
    local l_status_0, l_result_0 = pcall(function()
        local v127 = v6.constructAssetIdString(v115);
        if not (v12 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0) and not v122 then
            if v2.shouldDebugUrls() then
                print(("Inserting asset %s"):format(v127));
            end;
            v126 = game:InsertObjectsAndJoinIfLegacyAsync(v127);
            return ;
        elseif not v125 then
            if v2.shouldDebugUrls() then
                print(("Inserting asset %s"):format(v127));
            end;
            v126 = game:InsertObjectsAndJoinIfLegacyAsync(v127);
            return ;
        else
            if v2.shouldDebugUrls() then
                print(("Inserting package %s"):format(v127));
            end;
            v126 = l_InsertService_0:LoadPackageAssetAsync(v127);
            return ;
        end;
    end);
    if not l_status_0 or not v126 then
        return nil, l_result_0;
    else
        if not ((not v12 and not v122 or not v125) or not v126[1]) then
            v126[1].SourceAssetId = v115;
        end;
        if not ((not l_SourceAssetIdInModelChildren_0 or not v126[1]) or not v126[1].SourceAssetId) then
            v43(v126[1], v115);
        end;
        local v130 = if not (v123 and v123.positionOverride) then v38() else v123.positionOverride;
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "ToolboxTemporaryInsertModel";
        l_Model_0.Parent = l_l_Workspace_0_0;
        if v118 == Enum.AssetType.MeshPart.Value then
            v126 = v71(v115, v126, v119);
        end;
        local l_v126_0 = v126;
        return l_Promise_0.new(function(v133, _)
            local function v137()
                for _, v136 in ipairs(l_v126_0) do
                    v136:Destroy();
                end;
                v133(false);
            end;
            local function v138()
                v133(true);
            end;
            if not l_v126_0 then
                v133(true);
            end;
            if not v117 then
                v133(true);
            end;
            local v139 = 0;
            for _, v141 in ipairs(l_v126_0) do
                if v141:IsA("Script") then
                    v139 = v139 + 1;
                end;
                for _, v143 in ipairs(v141:GetDescendants()) do
                    if v143:IsA("Script") then
                        v139 = v139 + 1;
                    end;
                end;
            end;
            if v139 < 1 then
                v133(true);
            end;
            if v139 >= 1 then
                v117:promptScriptWarningAndWait({
                    assetName = v116, 
                    numScripts = v139, 
                    cancel = v137, 
                    insert = v138
                });
            end;
            if l_ToolboxDeleteTempModelFix_0 then
                v133(true);
            end;
        end):andThen(function(v144)
            if v2.shouldDebugWarnings() then
                print(("assetWasInserted: %s"):format((tostring(v144))));
            end;
            return (v114(v115, v144, v117, l_Model_0, v126, v120, v130));
        end):await();
    end;
end;
local function v154(_, v147, v148)
    local v149 = nil;
    local l_status_1, l_result_1 = pcall(function()
        local v150 = v6.constructAssetIdString(v147);
        if v2.shouldDebugUrls() then
            print(("Inserting decal %s"):format(v150));
        end;
        v149 = game:GetObjectsAsync(v150);
    end);
    if (not l_status_1 or not v149) or not v149[1] then
        return nil, l_result_1;
    else
        local v153 = v149[1];
        v153.Name = v148;
        v153.SourceAssetId = v147;
        v153.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
        l_Selection_0:Set({
            v153
        });
        return v153;
    end;
end;
local function v160(v155)
    local v156 = nil;
    local l_status_2, l_result_2 = pcall(function()
        local v157 = v6.constructAssetIdString(v155);
        if v2.shouldDebugUrls() then
            print(("Inserting package %s"):format(v157));
        end;
        v156 = l_InsertService_0:LoadPackageAssetAsync(v157);
    end);
    if (not l_status_2 or not v156) or not v156[1] then
        return nil, l_result_2;
    else
        v156[1].SourceAssetId = v155;
        v156[1].Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
        l_Selection_0:set(v156);
        return v156[1];
    end;
end;
local v161 = nil;
v161 = l_ToolboxVideoUsePermissionInsertion_0 and function(v162, v163, v164)
    local v165 = v6.constructAssetIdString(v162);
    if v2.shouldDebugUrls() then
        print(("Inserting video %s"):format(v165));
    end;
    v47(v162, v164);
    local v166 = l_Selection_0:Get()[1];
    local l_VideoFrame_0 = Instance.new("VideoFrame");
    l_VideoFrame_0.SourceAssetId = v162;
    l_VideoFrame_0.Video = v165;
    l_VideoFrame_0.Name = v163;
    l_VideoFrame_0.Parent = v166 or l_Workspace_0;
    l_VideoFrame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Selection_0:Set({
        l_VideoFrame_0
    });
    return l_VideoFrame_0;
end or function(v168, v169)
    local v170 = v6.constructAssetIdString(v168);
    if v2.shouldDebugUrls() then
        print(("Inserting video %s"):format(v170));
    end;
    local l_VideoFrame_1 = Instance.new("VideoFrame");
    l_VideoFrame_1.SourceAssetId = v168;
    l_VideoFrame_1.Video = v170;
    l_VideoFrame_1.Name = v169;
    l_VideoFrame_1.Parent = (l_Selection_0:Get() or {})[1] or l_Workspace_0;
    l_VideoFrame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Selection_0:Set({
        l_VideoFrame_1
    });
    return l_VideoFrame_1;
end;
local function v176(_, _)
    local l_status_3, l_result_3 = pcall(function()
    end);
    return l_status_3, l_result_3;
end;
local function v182(v177, v178, _)
    local l_status_4, l_result_4 = pcall(function()
        if v2.shouldDebugUrls() then
            print(("Installing plugin %s"):format((tostring(v177))));
        end;
        if not l_StudioService_0 then
            warn("StudioService not found");
            return ;
        else
            l_StudioService_0:TryInstallPlugin(v177, v178);
            return ;
        end;
    end);
    return l_status_4, l_result_4;
end;
local function v184(v183)
    if v183 == Enum.AssetType.Model.Value then
        return "Model";
    elseif v183 == Enum.AssetType.Decal.Value then
        return "Decal";
    elseif v183 == Enum.AssetType.Audio.Value then
        return "Audio";
    elseif v183 == Enum.AssetType.FontFamily.Value then
        return "FontFamily";
    elseif v183 == Enum.AssetType.MeshPart.Value then
        return "Mesh";
    elseif v183 == Enum.AssetType.Plugin.Value then
        return "Plugin";
    elseif v183 == Enum.AssetType.Video.Value then
        return "Video";
    elseif v183 == Enum.AssetType.Animation.Value then
        return "Animation";
    else
        if v2.shouldDebugWarnings() then
            warn(("Missing name for assetTypeId %s"):format((tostring(v183))));
        end;
        return "Unknown";
    end;
end;
local function v190(v185, v186, v187)
    local v188 = if v185.assetSubTypes ~= nil then v9.contains(v185.assetSubTypes, v9.Package) else v8.categoryIsPackage(v185.categoryName);
    local v189 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or (l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v185.getIsIXPVariableEnabled) and v185.getIsIXPVariableEnabled("MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
    if (v12 or v189) or not v188 then
        if v185.assetTypeId == Enum.AssetType.Audio.Value then
            return (v63(v185.assetId, v185.assetName, v186, v185.localization, v187));
        elseif v185.assetTypeId == Enum.AssetType.Decal.Value then
            return v154(v185.plugin, v185.assetId, v185.assetName);
        elseif v185.assetTypeId == Enum.AssetType.Plugin.Value then
            return v182(v185.assetId, v185.assetVersionId, v185.assetName);
        elseif v185.assetTypeId == Enum.AssetType.Video.Value then
            if not l_ToolboxVideoUsePermissionInsertion_0 then
                return v161(v185.assetId, v185.assetName);
            else
                return v161(v185.assetId, v185.assetName, v187);
            end;
        elseif v185.assetTypeId == Enum.AssetType.FontFamily.Value then
            return v176(v185.assetId, v185.assetName);
        elseif not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
            return v145(v185.assetId, v185.assetName, v186, v185.assetTypeId, v185.localization, v185.assetSubTypes, v185.categoryName, nil, v185.tutorialLimits);
        else
            return v145(v185.assetId, v185.assetName, v186, v185.assetTypeId, v185.localization, v185.assetSubTypes, v185.categoryName, v189, v185.tutorialLimits);
        end;
    else
        return v160(v185.assetId);
    end;
end;
local function v194(v191, v192)
    v1.incrementToolboxInsertCounter((v184(v191.assetTypeId)));
    local l_categoryName_0 = v191.categoryName;
    v1.incrementToolboxCategoryInsertCounter(l_categoryName_0);
    if v192 then
        v1.onAssetDragInserted(v191.assetId, v191.searchTerm, v191.assetIndex, l_categoryName_0);
    elseif not v16() then
        v1.onAssetInserted(v191.assetId, v191.searchTerm, v191.assetIndex, l_categoryName_0);
    else
        v1.onAssetInserted(v191.assetId, v191.searchTerm, v191.assetIndex, l_categoryName_0, v191.layoutMode);
    end;
    v1.incrementWorkspaceInsertCounter();
end;
local v195 = {
    _localization = nil, 
    registerLocalization = nil, 
    registerProcessDragHandler = nil
};
local v196 = nil;
v195.tryInsert = function(v197, v198, v199, v200)
    if not v199 then
        local v201, v202 = v195.doInsertAsset(v197, v198, v200);
        return v201, v202;
    else
        if not v31[v197.plugin:GetSelectedRibbonTool()] then
            v197.plugin:SelectRibbonTool(Enum.RibbonTool.Select, UDim2.new());
        end;
        v196 = {
            assetName = v197.assetName, 
            assetId = v197.assetId, 
            assetTypeId = if not l_ToolboxEnableAudioGrantDialog_0 then nil else v197.assetTypeId, 
            assetSubTypes = v197.assetSubTypes, 
            localization = if not l_ToolboxEnableAudioGrantDialog_0 then nil else v195._localization, 
            insertToolPromise = v198, 
            onSuccess = v197.onSuccess
        };
        v195.doDragInsertAsset(v197);
        return ;
    end;
end;
v195.doInsertAsset = function(v203, v204, v205)
    local l_assetId_0 = v203.assetId;
    local l_assetName_0 = v203.assetName;
    local l_assetTypeId_0 = v203.assetTypeId;
    if v2.shouldDebugWarnings() then
        print(("Inserting asset %s %s"):format(tostring(l_assetId_0), (tostring(l_assetName_0))));
    end;
    if not l_ToolboxVideoTestUseLocalAudioFile_0 then
        l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %d"):format(l_assetId_0));
    else
        l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %s"):format((tostring(l_assetId_0))));
    end;
    v203.localization = v195._localization;
    local v209, v210 = v190(v203, v204, v205);
    if l_assetTypeId_0 == Enum.AssetType.Plugin.Value then
        if not l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("After attempt to install plugin %d"):format(l_assetId_0));
        else
            l_ChangeHistoryService_0:SetWaypoint(("After attempt to install plugin %s"):format((tostring(l_assetId_0))));
        end;
        v194(v203, false);
        if v203.onSuccess then
            v203.onSuccess(l_assetId_0, nil);
            return v209, v210;
        end;
    elseif not v209 then
        if not l_ToolboxVideoTestUseLocalAudioFile_0 then
            warn(("Toolbox failed to insert asset %d %s: %s"):format(l_assetId_0, l_assetName_0, v210 or ""));
        else
            warn(("Toolbox failed to insert asset %s %s: %s"):format(tostring(l_assetId_0), l_assetName_0, v210 or ""));
            return v209, v210;
        end;
    else
        if not l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("After insert asset %d"):format(l_assetId_0));
        else
            l_ChangeHistoryService_0:SetWaypoint(("After insert asset %s"):format((tostring(l_assetId_0))));
        end;
        v194(v203, false);
        if v203.onSuccess then
            v203.onSuccess(l_assetId_0, v209);
            return v209, v210;
        end;
    end;
    return v209, v210;
end;
v195.doDragInsertAsset = function(v211)
    local l_assetId_1 = v211.assetId;
    local l_assetName_1 = v211.assetName;
    if v211.assetTypeId == Enum.AssetType.Plugin.Value then
        return ;
    else
        if v2.shouldDebugWarnings() then
            print(("Inserting asset %s %s"):format(tostring(l_assetId_1), (tostring(l_assetName_1))));
        end;
        if not l_ToolboxVideoTestUseLocalAudioFile_0 then
            l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %d"):format(l_assetId_1));
        else
            l_ChangeHistoryService_0:SetWaypoint(("Before insert asset %s"):format((tostring(l_assetId_1))));
        end;
        local l_status_5, l_result_5 = pcall(function()
            v211.plugin.UsesAssetInsertionDrag = true;
            local v214 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or (l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v211.getIsIXPVariableEnabled) and v211.getIsIXPVariableEnabled("MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
            local _ = nil;
            local v216 = v6.constructAssetGameAssetIdUrl(l_assetId_1, v211.assetTypeId, if not v214 then if v211.assetSubTypes ~= nil then v9.contains(v211.assetSubTypes, v9.Package) else v8.categoryIsPackage(v211.categoryName) else (v8.categoryIsPackage(v211.categoryName) or v211.assetSubTypes and v9.contains(v211.assetSubTypes, v9.Package)) or v8.getCategoryByName(v211.categoryName) == v8.FREE_MODELS, l_assetName_1);
            if v2.shouldDebugUrls() then
                print(("Dragging asset url %s"):format(v216));
            end;
            v211.plugin:StartDrag({
                Sender = "LuaToolbox", 
                MimeType = "text/plain", 
                Data = v216
            });
        end);
        if not l_status_5 then
            if not l_ToolboxVideoTestUseLocalAudioFile_0 then
                warn(("Toolbox failed to drag asset %d %s: %s"):format(l_assetId_1, l_assetName_1, l_result_5 or ""));
                return l_status_5;
            else
                warn(("Toolbox failed to drag asset %s %s: %s"):format(tostring(l_assetId_1), l_assetName_1, l_result_5 or ""));
                return l_status_5;
            end;
        else
            v194(v211, true);
            return l_status_5;
        end;
    end;
end;
local function v223(v219, v220)
    for _, v222 in ipairs(v220) do
        v222.SourceAssetId = v219;
        if l_SourceAssetIdInModelChildren_0 then
            v43(v222, v219);
        end;
    end;
end;
v195.registerLocalization = function(v224)
    v195._localization = v224;
end;
v195.registerProcessDragHandler = function(v225)
    v225.ProcessAssetInsertionDrag = function(v226, v227, v228)
        v223(v226, v228);
        spawn(function()
            v1.reportDragInsertFinished(v226, v227);
        end);
        if v227 == Enum.AssetType.MeshPart.Value then
            return (v71(v226, v228, v195._localization));
        else
            v196.instances = v228;
            return v228;
        end;
    end;
    v225.ProcessAssetInsertionDrop = function()
        spawn(function()
            if v196 then
                if l_ToolboxEnableAudioGrantDialog_0 and v196.assetTypeId == Enum.AssetType.Audio.Value then
                    v55(v196.assetName, v196.assetId, v196.assetTypeId, v196.insertToolPromise, v196.localization);
                end;
                local l_assetName_2 = v196.assetName;
                local l_instances_0 = v196.instances;
                local l_insertToolPromise_0 = v196.insertToolPromise;
                local _ = l_Promise_0.new(function(v232, _)
                    local function v236()
                        for _, v235 in ipairs(l_instances_0) do
                            v235:Destroy();
                        end;
                        v232(false);
                    end;
                    local function v237()
                        v232(true);
                    end;
                    if not l_instances_0 then
                        v232(true);
                    end;
                    if not l_insertToolPromise_0 then
                        v232(true);
                    end;
                    local v238 = 0;
                    for _, v240 in ipairs(l_instances_0) do
                        if v240:IsA("Script") then
                            v238 = v238 + 1;
                        end;
                        for _, v242 in ipairs(v240:GetDescendants()) do
                            if v242:IsA("Script") then
                                v238 = v238 + 1;
                            end;
                        end;
                    end;
                    if v238 < 1 then
                        v232(true);
                    end;
                    if v238 >= 1 then
                        l_insertToolPromise_0:promptScriptWarningAndWait({
                            assetName = l_assetName_2, 
                            numScripts = v238, 
                            cancel = v236, 
                            insert = v237
                        });
                    end;
                    if l_ToolboxDeleteTempModelFix_0 then
                        v232(true);
                    end;
                end);
                if v9.contains(v196.assetSubTypes, v9.MaterialPack) then
                    for _, v245 in v196.instances, nil, nil do
                        v245.Parent = l_MaterialService_0;
                    end;
                end;
                if v196.onSuccess then
                    v196.onSuccess(v196.assetId, v196.instances);
                end;
                v196 = nil;
            end;
        end);
    end;
end;
return v195;
