local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, v5)
    return function(v6, _)
        local v8 = v6:getState();
        local v9 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        local l_v9_0 = v9;
        for v11, v12 in pairs(v9[v3.RoleSubjectKey]) do
            if v12[v3.GroupIdKey] == v4 then
                l_v9_0 = l_deepJoin_0(l_v9_0, {
                    [v3.RoleSubjectKey] = {
                        [v11] = {
                            [v3.ActionKey] = v5
                        }
                    }
                });
            end;
        end;
        v6:dispatch(v2(l_v9_0));
    end;
end;
