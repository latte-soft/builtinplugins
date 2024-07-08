local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetAssets);
local v3 = require(l_Parent_0.Src.Actions.SetAssetsModerationData);
local v4 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local _ = require(l_Parent_0.Src.Thunks.GetAssetResponse);
local _ = require(l_Parent_0.Src.Util.Screens);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_game_FastInt_0 = game:GetFastInt("StudioAssetManagerAssetFetchNumber");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
return function(v13, v14, v15, v16, v17)
    return function(v18)
        local v19 = v18:getState();
        local v20 = nil;
        v20 = v17 == nil and true or v17;
        local v21 = nil;
        local v22 = {
            index = 0, 
            assets = {}, 
            assetsModerationData = {}
        };
        local v23 = {};
        local v24 = 1;
        if v15 or v16 and v16 ~= 1 then
            v22 = v19.AssetManagerReducer.assetsTable;
            v24 = v22.index + 1;
        end;
        if v20 then
            v18:dispatch(v4(true));
        end;
        if v14 == Enum.AssetType.Place then
            v21 = v13.Develop.V2.Universes.places(game.GameId, v15, l_game_FastInt_0):makeRequest():andThen(function(v25)
                return v25;
            end, function()
                v18:dispatch(v4(false));
                error("Failed to load places");
            end);
        elseif v14 == Enum.AssetType.Package then
            v21 = v13.APIS.Packages.V1.packages(game.GameId, v15, l_game_FastInt_0):makeRequest():andThen(function(v26)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v26);
                end;
                return v26;
            end, function(v27)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v27);
                end;
                v18:dispatch(v4(false));
                error("Failed to load packages");
            end);
        elseif not (((v14 ~= Enum.AssetType.Image and v14 ~= Enum.AssetType.MeshPart) and (not l_enableAudioImport_0() or v14 ~= Enum.AssetType.Audio)) and (not l_enableVideoImport_0() or v14 ~= Enum.AssetType.Video)) or v14 == Enum.AssetType.Model then
            if not l_AssetManagerMigrateAliasesEndpoint2_0 then
                local v28 = nil;
                v28 = if v16 then v16 else 1;
                do
                    local l_v28_0 = v28;
                    v13.API.Universes.getAliases(game.GameId, l_v28_0):makeRequest():andThen(function(v30)
                        local l_responseBody_0 = v30.responseBody;
                        if l_responseBody_0 then
                            if l_responseBody_0.FinalPage then
                                v22.pageNumber = nil;
                            else
                                v22.pageNumber = l_v28_0 + 1;
                            end;
                            for _, v33 in pairs(l_responseBody_0.Aliases) do
                                if not (not (((v14 == Enum.AssetType.Image and string.find(v33.Name, "Images/") or v14 == Enum.AssetType.MeshPart and string.find(v33.Name, "Meshes/")) or (l_enableAudioImport_0() and v14 == Enum.AssetType.Audio) and string.find(v33.Name, "Audio/")) or (l_enableVideoImport_0() and v14 == Enum.AssetType.Video) and string.find(v33.Name, "Video/")) and (not (v14 == Enum.AssetType.Model) or not string.find(v33.Name, "Models/"))) then
                                    local v34 = {};
                                    local v35 = tostring(v33.TargetId);
                                    v34.assetType = v14;
                                    v34.asset = v33.Asset;
                                    v34.id = v33.TargetId;
                                    if not (v14 == Enum.AssetType.Image) or not string.find(v33.Name, "Images/") then
                                        if not (v14 == Enum.AssetType.MeshPart) or not string.find(v33.Name, "Meshes/") then
                                            if not (l_enableAudioImport_0() and v14 == Enum.AssetType.Audio) or not string.find(v33.Name, "Audio/") then
                                                if not (l_enableVideoImport_0() and v14 == Enum.AssetType.Video) or not string.find(v33.Name, "Video/") then
                                                    if not (not (v14 == Enum.AssetType.Model) or not string.find(v33.Name, "Models/")) then
                                                        v34.name = string.gsub(v33.Name, "Models/", "");
                                                    end;
                                                else
                                                    v34.name = string.gsub(v33.Name, "Video/", "");
                                                end;
                                            else
                                                v34.name = string.gsub(v33.Name, "Audio/", "");
                                            end;
                                        else
                                            v34.name = string.gsub(v33.Name, "Meshes/", "");
                                        end;
                                    else
                                        v34.name = string.gsub(v33.Name, "Images/", "");
                                    end;
                                    v34.layoutOrder = v24;
                                    v22.assets = v1.Dictionary.join(v22.assets, {
                                        [v35] = v34
                                    });
                                    v24 = v24 + 1;
                                    table.insert(v23, v34.id);
                                end;
                            end;
                            v18:dispatch(v4(false));
                            v18:dispatch(v2(v22, v24));
                            v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v36)
                                for _, v38 in pairs(v36.responseBody.data) do
                                    assetModerationData = {
                                        reviewStatus = v38.reviewStatus, 
                                        isModerated = v38.isModerated, 
                                        moderationStatus = v38.moderationStatus
                                    };
                                    v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                        [v38.id] = assetModerationData
                                    });
                                end;
                                v18:dispatch(v3(v22.assetsModerationData));
                            end, function()
                                error("Failed to load asset information");
                            end);
                            return ;
                        else
                            return ;
                        end;
                    end, function()
                        v18:dispatch(v4(false));
                        error("Failed to load aliases");
                    end);
                end;
            else
                v13.APIS.ContentAliasesApi.aliases(game.GameId, l_game_FastInt_0, v15):makeRequest():andThen(function(v39)
                    local l_responseBody_1 = v39.responseBody;
                    if l_responseBody_1 then
                        v22.nextPageCursor = l_responseBody_1.NextPageToken;
                        for _, v42 in pairs(l_responseBody_1.Aliases) do
                            if not (not (((v14 == Enum.AssetType.Image and string.find(v42.Name, "Images/") or v14 == Enum.AssetType.MeshPart and string.find(v42.Name, "Meshes/")) or (l_enableAudioImport_0() and v14 == Enum.AssetType.Audio) and string.find(v42.Name, "Audio/")) or (l_enableVideoImport_0() and v14 == Enum.AssetType.Video) and string.find(v42.Name, "Video/")) and (not (v14 == Enum.AssetType.Model) or not string.find(v42.Name, "Models/"))) then
                                local v43 = {};
                                local v44 = tostring(v42.TargetId);
                                v43.assetType = v14;
                                v43.asset = v42.Asset;
                                v43.id = v42.TargetId;
                                if not (v14 == Enum.AssetType.Image) or not string.find(v42.Name, "Images/") then
                                    if not (v14 == Enum.AssetType.MeshPart) or not string.find(v42.Name, "Meshes/") then
                                        if not (l_enableAudioImport_0() and v14 == Enum.AssetType.Audio) or not string.find(v42.Name, "Audio/") then
                                            if not (l_enableVideoImport_0() and v14 == Enum.AssetType.Video) or not string.find(v42.Name, "Video/") then
                                                if not (not (v14 == Enum.AssetType.Model) or not string.find(v42.Name, "Models/")) then
                                                    v43.name = string.gsub(v42.Name, "Models/", "");
                                                end;
                                            else
                                                v43.name = string.gsub(v42.Name, "Video/", "");
                                            end;
                                        else
                                            v43.name = string.gsub(v42.Name, "Audio/", "");
                                        end;
                                    else
                                        v43.name = string.gsub(v42.Name, "Meshes/", "");
                                    end;
                                else
                                    v43.name = string.gsub(v42.Name, "Images/", "");
                                end;
                                v43.layoutOrder = v24;
                                v22.assets = v1.Dictionary.join(v22.assets, {
                                    [v44] = v43
                                });
                                v24 = v24 + 1;
                                table.insert(v23, v43.id);
                            end;
                        end;
                        v18:dispatch(v4(false));
                        v18:dispatch(v2(v22, v24));
                        v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v45)
                            local l_responseBody_2 = v45.responseBody;
                            if l_responseBody_2 then
                                for _, v48 in pairs(l_responseBody_2.data) do
                                    assetModerationData = {
                                        reviewStatus = v48.reviewStatus, 
                                        isModerated = v48.isModerated, 
                                        moderationStatus = v48.moderationStatus
                                    };
                                    v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                        [v48.id] = assetModerationData
                                    });
                                end;
                                v18:dispatch(v3(v22.assetsModerationData));
                                return ;
                            else
                                return ;
                            end;
                        end, function()
                            error("Failed to load asset information");
                        end);
                        return ;
                    else
                        return ;
                    end;
                end, function()
                    v18:dispatch(v4(false));
                    error("Failed to load aliases");
                end);
            end;
        end;
        if not (v14 ~= Enum.AssetType.Place) or v14 == Enum.AssetType.Package then
            v21:andThen(function(v49)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v49);
                end;
                local l_responseBody_3 = v49.responseBody;
                if l_responseBody_3 then
                    v22.previousPageCursor = l_responseBody_3.previousPageCursor;
                    v22.nextPageCursor = l_responseBody_3.nextPageCursor;
                    for _, v52 in pairs(l_responseBody_3.data) do
                        v52.assetType = v14;
                        local v53 = tostring(v52.id);
                        v52.layoutOrder = v24;
                        v22.assets = v1.Dictionary.join(v22.assets, {
                            [v53] = v52
                        });
                        v24 = v24 + 1;
                        table.insert(v23, v52.id);
                    end;
                    v18:dispatch(v4(false));
                    v18:dispatch(v2(v22, v24));
                    v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v54)
                        for _, v56 in pairs(v54.responseBody.data) do
                            assetModerationData = {
                                reviewStatus = v56.reviewStatus, 
                                isModerated = v56.isModerated, 
                                moderationStatus = v56.moderationStatus
                            };
                            v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                [v56.id] = assetModerationData
                            });
                        end;
                        v18:dispatch(v3(v22.assetsModerationData));
                    end, function()
                        error("Failed to load asset information");
                    end);
                    return ;
                else
                    return ;
                end;
            end);
        end;
    end;
end;
