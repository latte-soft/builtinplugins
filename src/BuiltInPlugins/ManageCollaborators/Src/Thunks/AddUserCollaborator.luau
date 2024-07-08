local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, v5, v6)
    return function(v7, _)
        local v9 = v7:getState();
        v7:dispatch(v2((l_deepJoin_0(v9.Permissions.NewPermissions or v9.Permissions.CurrentPermissions, {
            [v3.UserSubjectKey] = {
                [v4] = {
                    [v3.SubjectNameKey] = v5, 
                    [v3.SubjectIdKey] = v4, 
                    [v3.ActionKey] = v6
                }
            }
        }))));
    end;
end;
