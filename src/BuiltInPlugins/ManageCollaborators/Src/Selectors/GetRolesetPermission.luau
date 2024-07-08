local v0 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
return function(v1, v2)
    return (v1.Permissions.NewPermissions or v1.Permissions.CurrentPermissions)[v0.RoleSubjectKey][v2][v0.ActionKey];
end;
