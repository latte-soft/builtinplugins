local v0 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
return function(v1, v2)
    local v3 = (v1.Permissions.NewPermissions or v1.Permissions.CurrentPermissions)[v0.RoleSubjectKey];
    local v4 = {};
    for v5, v6 in pairs(v3) do
        local v7 = v6[v0.GroupIdKey];
        local v8 = v6[v0.SubjectRankKey];
        if v2 == v7 then
            table.insert(v4, {
                Rank = v8, 
                Id = v5
            });
        end;
    end;
    table.sort(v4, function(v9, v10)
        return v10.Rank < v9.Rank;
    end);
    local v11 = {};
    for _, v13 in ipairs(v4) do
        table.insert(v11, v13.Id);
    end;
    return v11;
end;
