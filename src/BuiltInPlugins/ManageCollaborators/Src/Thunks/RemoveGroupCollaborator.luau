local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Actions.SetGroupMetadata);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v5)
    return function(v6, _)
        local v8 = v6:getState();
        local v9 = v1.Dictionary.join(v8.GroupMetadata.NewGroupMetadata or v8.GroupMetadata.CurrentGroupMetadata, {
            [v5] = v1.None
        });
        local v10 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        for v11, v12 in pairs(v10[v4.RoleSubjectKey]) do
            if v12[v4.GroupIdKey] == v5 then
                v10 = v1.Dictionary.join(v10, {
                    [v4.RoleSubjectKey] = v1.Dictionary.join(v10[v4.RoleSubjectKey], {
                        [v11] = v1.None
                    })
                });
            end;
        end;
        v6:dispatch(v2(v10));
        v6:dispatch(v3(v9));
    end;
end;
