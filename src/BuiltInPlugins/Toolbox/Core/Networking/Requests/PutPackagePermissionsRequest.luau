local _ = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v3 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
local v5 = require(l_Parent_0.Core.Actions.ClearChange);
local v6 = require(l_Parent_0.Core.Actions.NetworkError);
local v7 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local v10 = v3.getWebAction(v2.NoAccessKey);
local function v28(v11, v12, v13)
    local v14 = {
        [v2.GroupSubjectKey] = {}
    };
    if v11 and next(v11) ~= nil then
        for v15, _ in pairs(v11) do
            v14[v15] = {};
        end;
        for v17, v18 in pairs(v11) do
            for v19, v20 in pairs(v18) do
                v14[v17][v19] = {
                    Action = v20[v2.ActionKey]
                };
            end;
        end;
    end;
    if v12 and next(v12) ~= nil then
        for v21, v22 in pairs(v12) do
            v14[v2.GroupSubjectKey][v21] = v14[v2.GroupSubjectKey][v21] or {};
            v14[v2.GroupSubjectKey][v21] = {
                Action = v22.Action
            };
        end;
    end;
    local v23 = {};
    for v24, v25 in pairs(v14) do
        for v26, v27 in pairs(v25) do
            table.insert(v23, {
                [l_webKeys_0.SubjectType] = v3.getWebSubjectType(v24), 
                [l_webKeys_0.SubjectId] = v26, 
                [l_webKeys_0.Action] = v3.getWebAction(v27.Action), 
                [l_webKeys_0.UpToVersion] = v13
            });
        end;
    end;
    return v23;
end;
local function v36(v29, v30)
    local v31 = v28(v29, v30);
    local v32 = {
        [l_webKeys_0.Requests] = {}
    };
    local v33 = v32[l_webKeys_0.Requests];
    for _, v35 in pairs(v31) do
        if v35[l_webKeys_0.Action] ~= v10 then
            table.insert(v33, {
                [l_webKeys_0.SubjectType] = v3.getAssetPermissionSubjectType(v35[l_webKeys_0.SubjectType]), 
                [l_webKeys_0.SubjectId] = v35[l_webKeys_0.SubjectId], 
                [l_webKeys_0.Action] = v3.getAssetPermissionAction(v35[l_webKeys_0.Action])
            });
        end;
    end;
    return v32;
end;
local function v49(v37, v38, v39)
    local v40 = v28(v37, v38);
    local v41 = v28(v39, v38);
    local v42 = {};
    local v43 = {
        [l_webKeys_0.Requests] = {}
    };
    local v44 = v43[l_webKeys_0.Requests];
    for _, v46 in pairs(v41) do
        v42[v46[l_webKeys_0.SubjectId]] = v3.getAssetPermissionAction(v46[l_webKeys_0.Action]);
    end;
    for _, v48 in pairs(v40) do
        if v48[l_webKeys_0.Action] == v10 then
            table.insert(v44, {
                [l_webKeys_0.SubjectType] = v3.getAssetPermissionSubjectType(v48[l_webKeys_0.SubjectType]), 
                [l_webKeys_0.SubjectId] = v48[l_webKeys_0.SubjectId], 
                [l_webKeys_0.Action] = v42[v48[l_webKeys_0.SubjectId]]
            });
        end;
    end;
    return v43;
end;
return function(v50, v51, _)
    return function(v53)
        local l_changed_0 = v53:getState().changed;
        if l_changed_0 and next(l_changed_0) ~= nil then
            local l_originalCollaborators_0 = v53:getState().originalCollaborators;
            local v56 = v36(l_changed_0.permissions, l_changed_0.groupMetadata);
            local v57 = v49(l_changed_0.permissions, l_changed_0.groupMetadata, l_originalCollaborators_0);
            return l_Promise_0.all({
                next(v56[l_webKeys_0.Requests]) == nil and l_Promise_0.resolve(true) or v50:grantAssetPermissions(v51, v56), 
                next(v57[l_webKeys_0.Requests]) == nil and l_Promise_0.resolve(true) or v50:revokeAssetPermissions(v51, v57)
            }):andThen(function(v58)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    for _, v60 in pairs(v58) do
                        if v60.url ~= nil then
                            v7.sendResultToKibana(v60);
                        end;
                    end;
                end;
                v53:dispatch(v5("permissions"));
                v53:dispatch(v5("groupMetadata"));
            end, function(v61)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    v7.sendResultToKibana(v61);
                end;
                v53:dispatch(v6(v61));
            end);
        else
            return ;
        end;
    end;
end;
