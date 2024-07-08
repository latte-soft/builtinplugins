local v0 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
return function(v1, v2)
    local v3 = v1.Permissions.NewPermissions or v1.Permissions.CurrentPermissions;
    local v4 = true;
    local v5 = true;
    for _, v7 in pairs(v3[v0.RoleSubjectKey]) do
        if v7[v0.ActionKey] ~= v0.PlayKey and v7[v0.GroupIdKey] == v2 then
            v4 = false;
        end;
        if v7[v0.ActionKey] ~= v0.NoAccessKey and v7[v0.GroupIdKey] == v2 then
            v5 = false;
        end;
    end;
    if not v4 then
        if not v5 then
            return v0.MultipleKey;
        else
            return v0.NoAccessKey;
        end;
    else
        return v0.PlayKey;
    end;
end;
