local _ = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v4 = require(l_Actions_0.SetCollaborators);
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local _ = require(l_Parent_0.Packages.Framework).Util.Promise;
local v8 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local v9 = require(l_Parent_0.Core.Util.Permissions.Constants);
local l_webKeys_0 = v9.webKeys;
local _ = v9.webValues;
local _ = game:GetService("ProximityPromptService");
local l_Players_0 = game:GetService("Players");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local _ = function(v15)
    local v16 = {
        [v6.UserSubjectKey] = {}, 
        [v6.RoleSubjectKey] = {}
    };
    for _, v18 in pairs(v15) do
        if v18[l_webKeys_0.SubjectType] == l_webKeys_0.UserSubject then
            v16[v6.UserSubjectKey][v18[l_webKeys_0.SubjectId]] = {
                [v6.SubjectNameKey] = l_Players_0:GetNameFromUserIdAsync(v18[l_webKeys_0.SubjectId]), 
                [v6.SubjectIdKey] = v18[l_webKeys_0.SubjectId], 
                [v6.ActionKey] = v8.getInternalAction(v18[l_webKeys_0.Action])
            };
        else
            v16[v6.RoleSubjectKey][v18[l_webKeys_0.SubjectId]] = {
                [v6.ActionKey] = v8.getInternalAction(v18[l_webKeys_0.Action])
            };
        end;
    end;
    return v16;
end;
local function v26(v20)
    local v21 = {
        [v6.UserSubjectKey] = {}, 
        [v6.RoleSubjectKey] = {}
    };
    for _, v23 in pairs(v20.results) do
        if v23[l_webKeys_0.SubjectType] == l_webKeys_0.UserSubject then
            v21[v6.UserSubjectKey][v23[l_webKeys_0.SubjectId]] = {
                [v6.SubjectNameKey] = l_Players_0:GetNameFromUserIdAsync(v23[l_webKeys_0.SubjectId]), 
                [v6.SubjectIdKey] = v23[l_webKeys_0.SubjectId], 
                [v6.ActionKey] = v8.getInternalAction(v23[l_webKeys_0.Action])
            };
        else
            local v24 = v23[l_webKeys_0.SubjectId];
            if v24 and v24 ~= "" then
                v21[v6.RoleSubjectKey][tonumber(v24)] = {
                    [v6.ActionKey] = v8.getInternalAction(v23[l_webKeys_0.Action])
                };
                local v25 = v21[v6.RoleSubjectKey][tonumber(v24)];
                v25[v6.PermissionLevelKey] = not not v23[l_webKeys_0.PermissionLevel] and v8.getPermissionLevel(v23[l_webKeys_0.PermissionLevel]) or nil;
                v25[v6.PermissionSourceKey] = not not v23[l_webKeys_0.PermissionSource] and v8.getPermissionSource(v23[l_webKeys_0.PermissionSource]) or nil;
            end;
        end;
    end;
    return v21;
end;
return function(v27, v28)
    return function(v29)
        return v27:getAssetPermissions(v28):andThen(function(v30)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v30);
            end;
            v29:dispatch(v4((v26(v30.responseBody))));
        end, function(v31)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v31);
            end;
            v29:dispatch(v5(v31));
        end);
    end;
end;
