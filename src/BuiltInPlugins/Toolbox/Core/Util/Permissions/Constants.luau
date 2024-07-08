local _ = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
return {
    webKeys = {
        All = "All", 
        UserId = "userId", 
        UserName = "userName", 
        GroupId = "groupId", 
        GroupName = "groupName", 
        RoleId = "rolesetId", 
        RoleName = "rolesetName", 
        RoleRank = "rank", 
        UpToVersion = "upToVersion", 
        Action = "action", 
        UseViewAction = "UseView", 
        EditAction = "Edit", 
        RevokedAction = "Revoked", 
        UseAction = "Use", 
        GrantAssetPermissionsAction = "GrantAssetPermissions", 
        SubjectType = "subjectType", 
        SubjectId = "subjectId", 
        PermissionLevel = "permissionLevel", 
        PermissionSource = "permissionSource", 
        UserSubject = "User", 
        GroupSubject = "Group", 
        RoleSubject = "Roleset", 
        GroupRolesetSubject = "GroupRoleset", 
        Requests = "requests", 
        Universe = "Universe", 
        UnknownError = "UnknownError", 
        HasPermission = "HasPermission", 
        NoPermission = "NoPermission", 
        AssetNotFound = "AssetNotFound"
    }, 
    webValues = {
        AccountPermissionLevel = "Account", 
        UniversePermissionLevel = "Universe", 
        AssetPermissionLevel = "Asset", 
        AssetPermissionSource = "AssetPermissions", 
        GroupPermissionSource = "GroupRolesetPermissions"
    }
};
