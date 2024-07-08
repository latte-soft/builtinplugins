local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v4, _)
    return function(v6, _)
        local v8 = v6:getState();
        local v9 = v8.Permissions.NewPermissions or v8.Permissions.CurrentPermissions;
        v6:dispatch(v2((v1.Dictionary.join(v9, {
            [v3.UserSubjectKey] = v1.Dictionary.join(v9[v3.UserSubjectKey], {
                [v4] = v1.None
            })
        }))));
    end;
end;
