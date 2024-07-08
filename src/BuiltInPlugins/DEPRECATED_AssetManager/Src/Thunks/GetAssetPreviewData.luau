local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_GroupService_0 = game:GetService("GroupService");
local v3 = require(l_Parent_0.Src.Thunks.GetRootTreeViewInstance);
local v4 = require(l_Parent_0.Src.Actions.SetAssetPreviewData);
local v5 = require(l_Parent_0.Src.Actions.SetAssetOwnerName);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v10, v11)
    return function(v12)
        local v13 = {};
        for _, v15 in ipairs(v11) do
            v13[v15] = true;
        end;
        v12:dispatch(v4(v13));
        v10.Develop.V1.Assets.assets(v11):makeRequest():andThen(function(v16)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v16);
            end;
            local l_responseBody_0 = v16.responseBody;
            if not l_responseBody_0 or #l_responseBody_0.data == 0 then
                return ;
            else
                local v18 = {};
                for _, v20 in ipairs(l_responseBody_0.data) do
                    local l_id_0 = v20.id;
                    local l_targetId_0 = v20.creator.targetId;
                    local l_name_0 = v20.name;
                    local l_typeId_0 = v20.typeId;
                    if not (l_typeId_0 == Enum.AssetType.Image.Value) or not string.find(v20.name, "Images/") then
                        if not (l_typeId_0 == Enum.AssetType.MeshPart.Value) or not string.find(v20.name, "Meshes/") then
                            if not (l_enableAudioImport_0() and l_typeId_0 == Enum.AssetType.Audio.Value) or not string.find(v20.name, "Audio/") then
                                if not (l_enableVideoImport_0() and l_typeId_0 == Enum.AssetType.Video.Value) or not string.find(v20.name, "Video/") then
                                    if not (not (l_typeId_0 == Enum.AssetType.Model.Value) or not string.find(v20.Name, "Models/")) then
                                        l_name_0 = string.gsub(v20.Name, "Models/", "");
                                    end;
                                else
                                    l_name_0 = string.gsub(v20.name, "Video/", "");
                                end;
                            else
                                l_name_0 = string.gsub(v20.name, "Audio/", "");
                            end;
                        else
                            l_name_0 = string.gsub(v20.name, "Meshes/", "");
                        end;
                    else
                        l_name_0 = string.gsub(v20.name, "Images/", "");
                    end;
                    v18[l_id_0] = {
                        Asset = {
                            Id = v20.id, 
                            Type = v20.type, 
                            TypeId = l_typeId_0, 
                            Name = l_name_0, 
                            Description = v20.description, 
                            AssetGenres = v20.genres, 
                            Created = v20.created, 
                            Updated = v20.updated
                        }, 
                        Creator = {
                            Type = v20.creator.type, 
                            TypeId = v20.creator.typeId, 
                            TargetId = v20.creator.targetId, 
                            Name = ""
                        }
                    };
                    spawn(function()
                        if v20.creator.type == "Group" then
                            local l_Name_0 = l_GroupService_0:GetGroupInfoAsync(l_targetId_0).Name;
                            if l_Name_0 then
                                v12:dispatch(v5(l_id_0, l_Name_0));
                                return ;
                            end;
                        elseif v20.creator.type == "User" then
                            local l_l_Players_0_NameFromUserIdAsync_0 = l_Players_0:GetNameFromUserIdAsync(l_targetId_0);
                            if l_l_Players_0_NameFromUserIdAsync_0 then
                                v12:dispatch(v5(l_id_0, l_l_Players_0_NameFromUserIdAsync_0));
                            end;
                        end;
                    end);
                    v12:dispatch(v3(l_id_0, v20.typeId));
                end;
                v12:dispatch(v4(v18));
                return v16;
            end;
        end, function(v27)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v27);
            end;
            error("Failed to load data for Asset Preview");
        end);
    end;
end;
