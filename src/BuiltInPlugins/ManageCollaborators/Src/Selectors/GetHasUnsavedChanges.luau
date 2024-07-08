local v0 = game:getFastFlag("COLLAB2699FixSaveChangesLogic");
local v1 = require(script.Parent.Parent.Parent.Src.Util.PermissionsConstants);
checkForDifferenceInCollaborators = function(v2, v3)
    for v4, v5 in pairs(v2) do
        if not (v3[v4] ~= nil) or v3[v4][v1.ActionKey] ~= v5[v1.ActionKey] then
            return true;
        end;
    end;
    for v6, _ in pairs(v3) do
        if v2[v6] == nil then
            return true;
        end;
    end;
    return false;
end;
return function(v8)
    assert(v0);
    if v8.Permissions.NewPermissions then
        return checkForDifferenceInCollaborators(v8.Permissions.NewPermissions[v1.UserSubjectKey], v8.Permissions.CurrentPermissions[v1.UserSubjectKey]) or checkForDifferenceInCollaborators(v8.Permissions.NewPermissions[v1.RoleSubjectKey], v8.Permissions.CurrentPermissions[v1.RoleSubjectKey]);
    else
        return false;
    end;
end;
