local v0 = require(script.Parent.Parent.Parent.Packages.Promise);
return function(v1, v2, v3)
    return function(v4)
        if not (v2.ClassName == "Folder") then
            local l_id_0 = v2.id;
            local l_name_0 = v2.name;
            local l_assetType_0 = v2.assetType;
            local v8 = l_assetType_0 == Enum.AssetType.Package;
            if v8 then
                l_assetType_0 = Enum.AssetType.Model;
            end;
            v1:beginDragInsert(l_id_0, l_name_0, l_assetType_0, v8):andThen(function(_, _)
                v3:report("dragInsert");
                if utf8.len(v4:getState().AssetManagerReducer.searchTerm) ~= 0 then
                    v3:report("insertAfterSearch");
                end;
            end):catch(function(v11)
                warn(v11);
            end):finally(function(v12)
                if v12 == v0.Status.Cancelled then
                    v3:report("cancelDragInsert");
                end;
            end);
            return ;
        else
            warn("Cannot drag a folder");
            return ;
        end;
    end;
end;
