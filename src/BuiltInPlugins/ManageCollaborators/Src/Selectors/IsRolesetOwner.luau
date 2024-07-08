local v0 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
return function(v1, v2)
    local l_creatorId_0 = v1.GameOwnerMetadata.creatorId;
    local l_creatorType_0 = v1.GameOwnerMetadata.creatorType;
    local v5 = (v1.Permissions.NewPermissions or v1.Permissions.CurrentPermissions)[v0.RoleSubjectKey][v2];
    local v6 = v5[v0.GroupIdKey];
    local v7 = v5[v0.SubjectRankKey];
    local v8 = false;
    if l_creatorType_0 == Enum.CreatorType.Group then
        v8 = false;
        if l_creatorId_0 == v6 then
            v8 = v7 == 255;
        end;
    end;
    return v8;
end;
