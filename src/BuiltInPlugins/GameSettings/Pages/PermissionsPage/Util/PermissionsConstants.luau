local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Cryo);
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
local v7 = "NoAccessPermission";
local l_v7_0 = v7 --[[ copy: 8 -> 9 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_0 .. ")";
end;
v4.NoAccessKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "PlayPermission";
local l_v7_1 = v7 --[[ copy: 8 -> 10 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_1 .. ")";
end;
v4.PlayKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "EditPermission";
local l_v7_2 = v7 --[[ copy: 8 -> 11 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_2 .. ")";
end;
v4.EditKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "NoEditMustBeFriendPermission";
local l_v7_3 = v7 --[[ copy: 8 -> 12 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_3 .. ")";
end;
v4.NoEditMustBeFriendKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "NoUserEditGroupGamePermission";
local l_v7_4 = v7 --[[ copy: 8 -> 13 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_4 .. ")";
end;
v4.NoUserEditGroupGameKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "AdminPermission";
local l_v7_5 = v7 --[[ copy: 8 -> 14 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_5 .. ")";
end;
v4.AdminKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "OwnerPermission";
local l_v7_6 = v7 --[[ copy: 8 -> 15 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_6 .. ")";
end;
v4.OwnerKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "MultiplePermission";
local l_v7_7 = v7 --[[ copy: 8 -> 16 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_7 .. ")";
end;
v4.MultipleKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "UserSubjectType";
local l_v7_8 = v7 --[[ copy: 8 -> 17 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_8 .. ")";
end;
v4.UserSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupSubjectType";
local l_v7_9 = v7 --[[ copy: 8 -> 18 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_9 .. ")";
end;
v4.GroupSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "RoleSubjectType";
local l_v7_10 = v7 --[[ copy: 8 -> 19 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_10 .. ")";
end;
v4.RoleSubjectKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "Action";
local l_v7_11 = v7 --[[ copy: 8 -> 20 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_11 .. ")";
end;
v4.ActionKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectId";
local l_v7_12 = v7 --[[ copy: 8 -> 21 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_12 .. ")";
end;
v4.SubjectIdKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectName";
local l_v7_13 = v7 --[[ copy: 8 -> 22 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_13 .. ")";
end;
v4.SubjectNameKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectType";
local l_v7_14 = v7 --[[ copy: 8 -> 23 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_14 .. ")";
end;
v4.SubjectTypeKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "SubjectRank";
local l_v7_15 = v7 --[[ copy: 8 -> 24 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_15 .. ")";
end;
v4.SubjectRankKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupId";
local l_v7_16 = v7 --[[ copy: 8 -> 25 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_16 .. ")";
end;
v4.GroupIdKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupName";
local l_v7_17 = v7 --[[ copy: 8 -> 26 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_17 .. ")";
end;
v4.GroupNameKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "GroupMemberCountKey";
local l_v7_18 = v7 --[[ copy: 8 -> 27 ]];
v6.__tostring = function()
    return "Symbol(" .. l_v7_18 .. ")";
end;
v4.GroupMemberCountKey = v5;
v5 = newproxy(true);
v6 = getmetatable(v5);
v7 = "IsFriend";
v6.__tostring = function()
    return "Symbol(" .. v7 .. ")";
end;
v4.IsFriendKey = v5;
return v0.Dictionary.join(v4, {
    DEPRECATED_MaxSearchResultsPerSubjectType = 3, 
    MaxSearchResultsPerSubjectTypeUsers = 3, 
    MaxSearchResultsPerSubjectTypeGroups = 2
});
