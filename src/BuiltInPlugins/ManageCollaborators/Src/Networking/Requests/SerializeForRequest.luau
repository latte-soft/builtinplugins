local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v2 = require(l_Parent_0.Src.Networking.WebKeyConstants);
local v3 = {
    v1.NoAccessKey, 
    v1.PlayKey, 
    v1.EditKey
};
local v4 = {};
for v5, v6 in pairs(v3) do
    v4[v6] = v5;
end;
local function _(v7)
    if v7 == v1.UserSubjectKey then
        return v2.UserSubject;
    elseif v7 == v1.GroupSubjectKey then
        return v2.GroupSubject;
    elseif v7 == v1.RoleSubjectKey then
        return v2.RoleSubject;
    else
        error("Invalid SubjectType: " .. tostring(v7));
        return ;
    end;
end;
local function _(v9)
    if v9 == v1.PlayKey then
        return v2.PlayAction;
    elseif v9 == v1.EditKey then
        return v2.EditAction;
    elseif v9 == v1.AdminKey then
        return v2.EditAction;
    elseif v9 == v1.NoAccessKey then
        return nil;
    else
        error("Invalid Action: " .. tostring(v9));
        return ;
    end;
end;
local v53 = {
    _getGroupsForRoles = function(v11, v12)
        local v13 = {};
        for v14, v15 in pairs(v11[v1.RoleSubjectKey]) do
            v13[v14] = v15[v1.GroupIdKey];
        end;
        for v16, v17 in pairs(v12[v1.RoleSubjectKey]) do
            v13[v16] = v17[v1.GroupIdKey];
        end;
        return v13;
    end, 
    diffPermissionChanges = function(v18, v19)
        local v20 = {
            [v1.GroupSubjectKey] = {}
        };
        for v21, _ in pairs(v18) do
            v20[v21] = {};
        end;
        for v23, _ in pairs(v19) do
            v20[v23] = {};
        end;
        for v25, v26 in pairs(v18) do
            for v27, v28 in pairs(v26) do
                v20[v25][v27] = {
                    Current = v28[v1.ActionKey]
                };
            end;
        end;
        for v29, v30 in pairs(v19) do
            for v31, v32 in pairs(v30) do
                v20[v29][v31] = v20[v29][v31] or {};
                v20[v29][v31].Changed = v32[v1.ActionKey];
            end;
        end;
        return v20;
    end, 
    _resolvePermissionChanges = function(v33, _)
        local v35 = {};
        local v36 = {};
        for v37, v38 in pairs(v33) do
            for v39, v40 in pairs(v38) do
                local v41 = v4[v40.Current] or v4[v1.NoAccessKey];
                local v42 = v4[v40.Changed] or v4[v1.NoAccessKey];
                if v41 < v42 then
                    for v43 = v41 + 1, v42 do
                        local v44 = {};
                        local l_SubjectType_0 = v2.SubjectType;
                        local v46;
                        if v37 == v1.UserSubjectKey then
                            v46 = v2.UserSubject;
                        elseif v37 == v1.GroupSubjectKey then
                            v46 = v2.GroupSubject;
                        elseif v37 == v1.RoleSubjectKey then
                            v46 = v2.RoleSubject;
                        else
                            error("Invalid SubjectType: " .. tostring(v37));
                            v46 = nil;
                        end;
                        v44[l_SubjectType_0] = v46;
                        v44[v2.SubjectId] = v39;
                        l_SubjectType_0 = v2.Action;
                        local v47 = v3[v43];
                        if v47 == v1.PlayKey then
                            v46 = v2.PlayAction;
                        elseif v47 == v1.EditKey then
                            v46 = v2.EditAction;
                        elseif v47 == v1.AdminKey then
                            v46 = v2.EditAction;
                        elseif v47 == v1.NoAccessKey then
                            v46 = nil;
                        else
                            error("Invalid Action: " .. tostring(v47));
                            v46 = nil;
                        end;
                        v44[l_SubjectType_0] = v46;
                        table.insert(v35, v44);
                    end;
                elseif v42 < v41 then
                    for v48 = v41, v42 + 1, -1 do
                        local v49 = {};
                        local l_SubjectType_1 = v2.SubjectType;
                        local v51;
                        if v37 == v1.UserSubjectKey then
                            v51 = v2.UserSubject;
                        elseif v37 == v1.GroupSubjectKey then
                            v51 = v2.GroupSubject;
                        elseif v37 == v1.RoleSubjectKey then
                            v51 = v2.RoleSubject;
                        else
                            error("Invalid SubjectType: " .. tostring(v37));
                            v51 = nil;
                        end;
                        v49[l_SubjectType_1] = v51;
                        v49[v2.SubjectId] = v39;
                        l_SubjectType_1 = v2.Action;
                        local v52 = v3[v48];
                        if v52 == v1.PlayKey then
                            v51 = v2.PlayAction;
                        elseif v52 == v1.EditKey then
                            v51 = v2.EditAction;
                        elseif v52 == v1.AdminKey then
                            v51 = v2.EditAction;
                        elseif v52 == v1.NoAccessKey then
                            v51 = nil;
                        else
                            error("Invalid Action: " .. tostring(v52));
                            v51 = nil;
                        end;
                        v49[l_SubjectType_1] = v51;
                        table.insert(v36, v49);
                    end;
                end;
            end;
        end;
        return v35, v36;
    end
};
v53.SerializePermissions = function(v54, v55)
    local v56, v57 = v53._resolvePermissionChanges(v53.diffPermissionChanges(v54, v55), (v53._getGroupsForRoles(v54, v55)));
    return v56, v57;
end;
return v53;
