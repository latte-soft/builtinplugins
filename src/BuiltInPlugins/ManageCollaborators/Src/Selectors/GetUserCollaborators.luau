local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v2 = require(l_Parent_0.Src.Selectors.IsUserOwner);
return function(v3)
    local v4 = (v3.Permissions.NewPermissions or v3.Permissions.CurrentPermissions)[v1.UserSubjectKey] or {};
    local v5 = v3.Permissions.CurrentPermissions[v1.UserSubjectKey];
    local v6 = {};
    for v7, v8 in pairs(v4) do
        local v9 = v8[v1.SubjectNameKey];
        if not v2(v3, v7) then
            table.insert(v6, {
                Name = v9, 
                Id = v7
            });
        end;
    end;
    table.sort(v6, function(v10, v11)
        return v10.Name < v11.Name;
    end);
    local v12 = {};
    local v13 = {};
    for _, v15 in ipairs(v6) do
        if not v5[v15.Id] then
            table.insert(v12, v15.Id);
        end;
    end;
    for _, v17 in ipairs(v6) do
        if v5[v17.Id] then
            table.insert(v13, v17.Id);
        end;
    end;
    return v12, v13;
end;
