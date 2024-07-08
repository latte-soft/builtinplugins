local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetScreen);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_SourceAssetIdInModelChildren_0 = game:GetFastFlag("SourceAssetIdInModelChildren");
return function(v6, v7, _)
    return function(v9)
        if not (v7.ClassName == "Folder") then
            local l_assetType_0 = v7.assetType;
            if l_assetType_0 == Enum.AssetType.Place then
                l_AssetManagerService_0:OpenPlace(v7.id);
            elseif l_assetType_0 == Enum.AssetType.Package then
                l_AssetManagerService_0:InsertPackage(v7.id);
            elseif l_assetType_0 == Enum.AssetType.Image then
                l_AssetManagerService_0:InsertImage(v7.id);
            elseif l_assetType_0 == Enum.AssetType.MeshPart then
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v7.name, false, not l_SourceAssetIdInModelChildren_0 and -1 or v7.id);
            elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
                l_AssetManagerService_0:InsertAudio(v7.id, v7.name);
            elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
                l_AssetManagerService_0:InsertVideo(v7.id, v7.name);
            elseif l_assetType_0 == Enum.AssetType.Model then
                l_AssetManagerService_0:InsertModel(v7.id);
            end;
            v6:report("doubleClickInsert");
            if utf8.len(v9:getState().AssetManagerReducer.searchTerm) ~= 0 then
                v6:report("insertAfterSearch");
            end;
            return ;
        else
            v6:report("openFolder", v7.Screen.Path);
            v9:dispatch(v1(v7.Screen));
            return ;
        end;
    end;
end;
