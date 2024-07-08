local v0 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
return function(v1)
    local v2 = v1.Permissions.CurrentPermissions[v0.UserSubjectKey] or {};
    for _, v4 in v2, nil, nil do
        if v4[v0.ActionKey] == v0.EditKey and v4[v0.SubjectIdKey] ~= v1.GameOwnerMetadata.creatorId then
            return true;
        end;
    end;
    return false;
end;
