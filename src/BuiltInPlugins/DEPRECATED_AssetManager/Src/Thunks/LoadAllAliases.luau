local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v5 = require(l_Parent_0.Src.Actions.SetAssets);
local v6 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local l_game_FastInt_0 = game:GetFastInt("StudioAssetManagerAssetFetchNumber");
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
local function v30(v9, v10, _)
    local v12 = {
        assets = {}
    };
    local v13 = 1;
    local function v14(v15)
        if not (((v10 ~= Enum.AssetType.Image and v10 ~= Enum.AssetType.MeshPart) and (not l_enableAudioImport_0() or v10 ~= Enum.AssetType.Audio)) and (not l_enableVideoImport_0() or v10 ~= Enum.AssetType.Video)) or v10 == Enum.AssetType.Model then
            return v9.APIS.ContentAliasesApi.aliases(game.GameId, l_game_FastInt_0, v15):makeRequest():andThen(function(v16)
                local l_responseBody_0 = v16.responseBody;
                if l_responseBody_0 then
                    for _, v19 in pairs(l_responseBody_0.Aliases) do
                        if not (not (((v10 == Enum.AssetType.Image and string.find(v19.Name, "Images/") or v10 == Enum.AssetType.MeshPart and string.find(v19.Name, "Meshes/")) or (l_enableAudioImport_0() and v10 == Enum.AssetType.Audio) and string.find(v19.Name, "Audio/")) or (l_enableVideoImport_0() and v10 == Enum.AssetType.Video) and string.find(v19.Name, "Video/")) and (not (v10 == Enum.AssetType.Model) or not string.find(v19.Name, "Models/"))) then
                            local v20 = {};
                            local v21 = tostring(v19.TargetId);
                            v20.assetType = v10;
                            v20.asset = v19.Asset;
                            v20.id = v19.TargetId;
                            if not (v10 == Enum.AssetType.Image) or not string.find(v19.Name, "Images/") then
                                if not (v10 == Enum.AssetType.MeshPart) or not string.find(v19.Name, "Meshes/") then
                                    if not (l_enableAudioImport_0() and v10 == Enum.AssetType.Audio) or not string.find(v19.Name, "Audio/") then
                                        if not (l_enableVideoImport_0() and v10 == Enum.AssetType.Video) or not string.find(v19.Name, "Video/") then
                                            if not (not (v10 == Enum.AssetType.Model) or not string.find(v19.Name, "Models/")) then
                                                v20.name = string.gsub(v19.Name, "Models/", "");
                                            end;
                                        else
                                            v20.name = string.gsub(v19.Name, "Video/", "");
                                        end;
                                    else
                                        v20.name = string.gsub(v19.Name, "Audio/", "");
                                    end;
                                else
                                    v20.name = string.gsub(v19.Name, "Meshes/", "");
                                end;
                            else
                                v20.name = string.gsub(v19.Name, "Images/", "");
                            end;
                            v20.layoutOrder = v13;
                            v12.assets = v1.Dictionary.join(v12.assets, {
                                [v21] = v20
                            });
                            v13 = v13 + 1;
                        end;
                    end;
                    if not l_responseBody_0.NextPageToken then
                        return v12, v13;
                    else
                        return v14(l_responseBody_0.NextPageToken);
                    end;
                else
                    return ;
                end;
            end);
        else
            return ;
        end;
    end;
    local function v22(v23)
        if not (((v10 ~= Enum.AssetType.Image and v10 ~= Enum.AssetType.MeshPart) and (not l_enableAudioImport_0() or v10 ~= Enum.AssetType.Audio)) and (not l_enableVideoImport_0() or v10 ~= Enum.AssetType.Video)) or v10 == Enum.AssetType.Model then
            return v9.API.Universes.getAliases(game.GameId, v23):makeRequest():andThen(function(v24)
                local l_responseBody_1 = v24.responseBody;
                if l_responseBody_1 then
                    for _, v27 in pairs(l_responseBody_1.Aliases) do
                        if not (not (((v10 == Enum.AssetType.Image and string.find(v27.Name, "Images/") or v10 == Enum.AssetType.MeshPart and string.find(v27.Name, "Meshes/")) or (l_enableAudioImport_0() and v10 == Enum.AssetType.Audio) and string.find(v27.Name, "Audio/")) or (l_enableVideoImport_0() and v10 == Enum.AssetType.Video) and string.find(v27.Name, "Video/")) and (not (v10 == Enum.AssetType.Model) or not string.find(v27.Name, "Models/"))) then
                            local v28 = {};
                            local v29 = tostring(v27.TargetId);
                            v28.assetType = v10;
                            v28.asset = v27.Asset;
                            v28.id = v27.TargetId;
                            if not (v10 == Enum.AssetType.Image) or not string.find(v27.Name, "Images/") then
                                if not (v10 == Enum.AssetType.MeshPart) or not string.find(v27.Name, "Meshes/") then
                                    if not (l_enableAudioImport_0() and v10 == Enum.AssetType.Audio) or not string.find(v27.Name, "Audio/") then
                                        if not (l_enableVideoImport_0() and v10 == Enum.AssetType.Video) or not string.find(v27.Name, "Video/") then
                                            if not (not (v10 == Enum.AssetType.Model) or not string.find(v27.Name, "Models/")) then
                                                v28.name = string.gsub(v27.Name, "Models/", "");
                                            end;
                                        else
                                            v28.name = string.gsub(v27.Name, "Video/", "");
                                        end;
                                    else
                                        v28.name = string.gsub(v27.Name, "Audio/", "");
                                    end;
                                else
                                    v28.name = string.gsub(v27.Name, "Meshes/", "");
                                end;
                            else
                                v28.name = string.gsub(v27.Name, "Images/", "");
                            end;
                            v28.layoutOrder = v13;
                            v12.assets = v1.Dictionary.join(v12.assets, {
                                [v29] = v28
                            });
                            v13 = v13 + 1;
                        end;
                    end;
                    if l_responseBody_1.FinalPage then
                        return v12, v13;
                    else
                        return v22(v23 + 1);
                    end;
                else
                    return ;
                end;
            end);
        else
            return ;
        end;
    end;
    if not l_AssetManagerMigrateAliasesEndpoint2_0 then
        return v22(1);
    else
        return v14();
    end;
end;
return function(v31, v32)
    return function(v33)
        local v34 = v33:getState();
        v33:dispatch(v6(true));
        return l_Promise_0.resolve(v30(v31, v32, v34)):andThen(function(v35, v36, _)
            v33:dispatch(v6(false));
            v33:dispatch(v5(v35, v36));
        end, function()
            v33:dispatch(v6(false));
            error("Failed to load aliases");
        end);
    end;
end;
