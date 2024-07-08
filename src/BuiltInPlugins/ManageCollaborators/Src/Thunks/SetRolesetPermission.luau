local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, v5)
    return function(v6, _)
        local v8 = v6:getState();
        v6:dispatch(v2((l_deepJoin_0(v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions, {
            [v3.RoleSubjectKey] = {
                [v4] = {
                    [v3.ActionKey] = v5
                }
            }
        }))));
    end;
end;
