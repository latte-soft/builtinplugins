local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v2 = require(l_Parent_0.Core.Util.Permissions.Constants);
local l_webKeys_0 = v2.webKeys;
local l_webValues_0 = v2.webValues;
local v5 = {};
local v6 = require(l_Parent_0.Core.Util.DebugFlags);
v5.getInternalSubjectType = function(v7)
    if v7 == l_webKeys_0.UserSubject then
        return v1.UserSubjectKey;
    elseif v7 == l_webKeys_0.RoleSubject then
        return v1.RoleSubjectKey;
    elseif v7 == l_webKeys_0.GroupSubject then
        return v1.GroupSubjectKey;
    else
        error("Could not determine subject type");
        return ;
    end;
end;
v5.getInternalAction = function(v8)
    if v8 == l_webKeys_0.GrantAssetPermissionsAction then
        return v1.OwnKey;
    elseif v8 == l_webKeys_0.UseAction then
        return v1.UseViewKey;
    elseif v8 == l_webKeys_0.EditAction then
        return v1.EditKey;
    elseif v8 == l_webKeys_0.UseViewAction then
        return v1.UseViewKey;
    elseif v8 == l_webKeys_0.RevokedAction then
        return v1.NoAccessKey;
    elseif v8 == nil then
        return v1.NoAccessKey;
    else
        error("Unsupported Action: " .. tostring(v8));
        return ;
    end;
end;
v5.getPermissionLevel = function(v9)
    if v9 == l_webValues_0.AccountPermissionLevel then
        return v1.AccountPermissionLevel;
    elseif v9 == l_webValues_0.UniversePermissionLevel then
        return v1.UniversePermissionLevel;
    elseif v9 == l_webValues_0.AssetPermissionLevel then
        return v1.AssetPermissionLevel;
    else
        error("Unsupported PermissionLevel: " .. tostring(v9));
        return ;
    end;
end;
v5.getPermissionSource = function(v10)
    if v10 == l_webValues_0.AssetPermissionSource then
        return v1.AssetPermissionSource;
    elseif v10 == l_webValues_0.GroupPermissionSource then
        return v1.GroupPermissionSource;
    else
        error("Unsupported PermissionSource: " .. tostring(v10));
        return ;
    end;
end;
v5.getWebSubjectType = function(v11)
    if v11 == v1.UserSubjectKey then
        return l_webKeys_0.UserSubject;
    elseif v11 == v1.GroupSubjectKey then
        return l_webKeys_0.GroupSubject;
    elseif v11 == v1.RoleSubjectKey then
        return l_webKeys_0.RoleSubject;
    else
        error("Invalid SubjectType: " .. tostring(v11));
        return ;
    end;
end;
v5.getWebAction = function(v12)
    if v12 == v1.UseViewKey then
        return l_webKeys_0.UseViewAction;
    elseif v12 == v1.EditKey then
        return l_webKeys_0.EditAction;
    elseif v12 == v1.NoAccessKey then
        return l_webKeys_0.RevokedAction;
    elseif v12 == v1.RevokedKey then
        return l_webKeys_0.RevokedAction;
    else
        error("Invalid Action: " .. tostring(v12));
        return ;
    end;
end;
v5.getAssetPermissionAction = function(v13)
    if v13 == l_webKeys_0.UseViewAction then
        return l_webKeys_0.UseAction;
    elseif v13 == l_webKeys_0.OwnAction then
        return l_webKeys_0.EditAction;
    else
        return v13;
    end;
end;
v5.getAssetPermissionSubjectType = function(v14)
    if v14 == l_webKeys_0.RoleSubject then
        return l_webKeys_0.GroupRolesetSubject;
    else
        return v14;
    end;
end;
v5.resolveActionPermission = function(v15, v16, v17)
    if v16 == l_webKeys_0.UnknownError then
        if v6.shouldDebugWarnings() then
            warn(string.format("Ignoring %s for assetId: %s, webKey: %s", tostring(v16), tostring(v17), (tostring(v15))));
        end;
        return v1.NoneKey;
    elseif v16 == l_webKeys_0.HasPermission then
        return v5.getInternalAction(v15);
    elseif v16 == l_webKeys_0.NoPermission then
        return v1.NoAccessKey;
    elseif v16 == l_webKeys_0.AssetNotFound then
        error("Permissions Error: " .. tostring(v16) .. ", assetId: " .. tostring(v17));
        return ;
    else
        error("Permissions Error: " .. tostring(v16) .. ", assetId: " .. tostring(v17));
        return ;
    end;
end;
return v5;
