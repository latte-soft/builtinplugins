local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Packages.Cryo);
local function _(v1)
    local v2 = newproxy(true);
    getmetatable(v2).__tostring = function()
        return "Symbol(" .. v1 .. ")";
    end;
    return v2;
end;
local v4 = {};
local v5 = newproxy(true);
local v6 = getmetatable(v5);
local v7 = "NonePermission";
local l_v7_0 = v7 --[[ copy: 9 -> 10 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_0 .. ")";
end;
v4.NoneKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "NoAccessPermission";
local l_v7_1 = v7 --[[ copy: 9 -> 11 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_1 .. ")";
end;
v4.NoAccessKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "UseViewPermission";
local l_v7_2 = v7 --[[ copy: 9 -> 12 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_2 .. ")";
end;
v4.UseViewKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "EditPermission";
local l_v7_3 = v7 --[[ copy: 9 -> 13 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_3 .. ")";
end;
v4.EditKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "RevokedPermission";
local l_v7_4 = v7 --[[ copy: 9 -> 14 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_4 .. ")";
end;
v4.RevokedKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "OwnPermisison";
local l_v7_5 = v7 --[[ copy: 9 -> 15 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_5 .. ")";
end;
v4.OwnKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "UserSubjectType";
local l_v7_6 = v7 --[[ copy: 9 -> 16 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_6 .. ")";
end;
v4.UserSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupSubjectType";
local l_v7_7 = v7 --[[ copy: 9 -> 17 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_7 .. ")";
end;
v4.GroupSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "RoleSubjectType";
local l_v7_8 = v7 --[[ copy: 9 -> 18 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_8 .. ")";
end;
v4.RoleSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "Action";
local l_v7_9 = v7 --[[ copy: 9 -> 19 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_9 .. ")";
end;
v4.ActionKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "PermissionLevel";
local l_v7_10 = v7 --[[ copy: 9 -> 20 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_10 .. ")";
end;
v4.PermissionLevelKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "PermissionSource";
local l_v7_11 = v7 --[[ copy: 9 -> 21 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_11 .. ")";
end;
v4.PermissionSourceKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectId";
local l_v7_12 = v7 --[[ copy: 9 -> 22 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_12 .. ")";
end;
v4.SubjectIdKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectName";
local l_v7_13 = v7 --[[ copy: 9 -> 23 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_13 .. ")";
end;
v4.SubjectNameKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectType";
local l_v7_14 = v7 --[[ copy: 9 -> 24 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_14 .. ")";
end;
v4.SubjectTypeKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectRank";
local l_v7_15 = v7 --[[ copy: 9 -> 25 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_15 .. ")";
end;
v4.SubjectRankKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupId";
local l_v7_16 = v7 --[[ copy: 9 -> 26 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_16 .. ")";
end;
v4.GroupIdKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupName";
v6.__tostring = function()
    return "Symbol(" .. v7 .. ")";
end;
v4.GroupNameKey = v5;
v4.AccountPermissionLevel = "Account";
v4.UniversePermissionLevel = "Universe";
v4.AssetPermissionLevel = "Asset";
v4.AssetPermissionSource = "Asset";
v4.GroupPermissionSource = "GroupRoleset";
return v0.Dictionary.join(v4, {
    MaxSearchResultsPerSubjectType = 3, 
    MaxPackageAssetIdsForHighestPermissionsRequest = 100
});
