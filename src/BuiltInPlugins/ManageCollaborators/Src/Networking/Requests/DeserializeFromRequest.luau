local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Networking.Requests.GroupRoles);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v5 = require(l_Parent_0.Src.Networking.WebKeyConstants);
local function _(v6)
    if not v6[v5.UserId] then
        if not v6[v5.RoleId] then
            if not v6[v5.GroupId] then
                error("Could not determine subject type");
                return ;
            else
                return v4.GroupSubjectKey;
            end;
        else
            return v4.RoleSubjectKey;
        end;
    else
        return v4.UserSubjectKey;
    end;
end;
local function _(v8)
    if v8 == v5.PlayAction then
        return v4.PlayKey;
    elseif v8 == v5.EditAction then
        return v4.EditKey;
    elseif v8 == v5.AdminAction then
        return v4.EditKey;
    elseif v8 == nil then
        return v4.NoAccessKey;
    else
        error("Unsupported Action: " .. tostring(v8));
        return ;
    end;
end;
local v21 = {
    _DEPRECATEDFixEndpointKeyTypes = function(v10)
        for _, v12 in pairs(v10) do
            for v13, v14 in pairs(v12) do
                if not ((v13 ~= v5.GroupId and v13 ~= v5.UserId) and v13 ~= v5.RoleId) or v13 == v5.RoleRank then
                    v12[v13] = tonumber(v14);
                end;
            end;
        end;
    end, 
    _deserializeOne = function(v15, v16)
        local v17 = {};
        local l_ActionKey_0 = v4.ActionKey;
        local v19 = v15[v5.Action];
        local v20;
        if v19 == v5.PlayAction then
            v20 = v4.PlayKey;
        elseif v19 == v5.EditAction then
            v20 = v4.EditKey;
        elseif v19 == v5.AdminAction then
            v20 = v4.EditKey;
        elseif v19 == nil then
            v20 = v4.NoAccessKey;
        else
            error("Unsupported Action: " .. tostring(v19));
            v20 = nil;
        end;
        v17[l_ActionKey_0] = v20;
        l_ActionKey_0 = nil;
        v20 = nil;
        if v16 == v4.UserSubjectKey then
            l_ActionKey_0 = v15[v5.UserName];
            v20 = v15[v5.UserId];
        elseif v16 == v4.GroupSubjectKey then
            l_ActionKey_0 = v15[v5.GroupName];
            v20 = v15[v5.GroupId];
        elseif v16 == v4.RoleSubjectKey then
            l_ActionKey_0 = v15[v5.RoleName];
            v20 = v15[v5.RoleId];
        end;
        v17[v4.SubjectNameKey] = l_ActionKey_0;
        v17[v4.SubjectIdKey] = v20;
        v19 = v15[v5.AllowedPermissions];
        if v16 == v4.UserSubjectKey then
            if not (v19 and v19 ~= "") or v19 == "Play" then
                v17[v4.IsFriendKey] = false;
            else
                v17[v4.IsFriendKey] = true;
            end;
        end;
        if v16 == v4.RoleSubjectKey then
            v17[v4.SubjectRankKey] = v15[v5.RoleRank];
            v17[v4.GroupIdKey] = v15[v5.GroupId];
        end;
        return v17;
    end
};
v21._deserializeAll = function(v22)
    local v23 = {};
    local v24 = {
        [v4.UserSubjectKey] = {}, 
        [v4.RoleSubjectKey] = {}
    };
    for _, v26 in pairs(v22) do
        local v27;
        if not v26[v5.UserId] then
            if not v26[v5.RoleId] then
                if not v26[v5.GroupId] then
                    error("Could not determine subject type");
                    v27 = nil;
                else
                    v27 = v4.GroupSubjectKey;
                end;
            else
                v27 = v4.RoleSubjectKey;
            end;
        else
            v27 = v4.UserSubjectKey;
        end;
        if v27 == v4.GroupSubjectKey then
            local v28 = v21._deserializeOne(v26, v27);
            v23[v28[v4.SubjectIdKey]] = {
                Name = v28[v4.SubjectNameKey]
            };
        end;
    end;
    for _, v30 in pairs(v22) do
        local v31;
        if not v30[v5.UserId] then
            if not v30[v5.RoleId] then
                if not v30[v5.GroupId] then
                    error("Could not determine subject type");
                    v31 = nil;
                else
                    v31 = v4.GroupSubjectKey;
                end;
            else
                v31 = v4.RoleSubjectKey;
            end;
        else
            v31 = v4.UserSubjectKey;
        end;
        local v32 = v21._deserializeOne(v30, v31);
        local v33 = v32[v4.SubjectIdKey];
        if v31 ~= v4.GroupSubjectKey and (not (v32[v4.SubjectRankKey] == 0) or v32[v4.ActionKey] ~= v4.NoAccessKey) then
            v24[v31][v33] = v32;
        end;
    end;
    return v24, v23;
end;
v21._addOwnerIfMissing = function(v34, v35, v36, v37)
    local v38 = v37 == Enum.CreatorType.User and v5.UserId or v5.GroupId;
    local v39 = false;
    for _, v41 in pairs(v34) do
        if v41[v38] == v36 then
            v39 = true;
            break;
        end;
    end;
    if not v39 then
        if v37 == Enum.CreatorType.User then
            table.insert(v34, {
                [v5.UserId] = v36, 
                [v5.UserName] = v35, 
                [v5.Action] = v5.EditAction
            });
            return l_Promise_0.new(function(v42)
                v42();
            end);
        else
            table.insert(v34, {
                [v5.GroupId] = v36, 
                [v5.GroupName] = v35, 
                [v5.Action] = nil
            });
            return v3.Get(v36):andThen(function(v43)
                for _, v45 in pairs(v43) do
                    if v45[v5.RoleId] == 255 then
                        table.insert(v34, v2.Dictionary.join(v45, {
                            [v5.GroupId] = v36, 
                            [v5.GroupName] = v35, 
                            [v5.Action] = v5.EditAction
                        }));
                    else
                        table.insert(v34, v2.Dictionary.join(v45, {
                            [v5.GroupId] = v36, 
                            [v5.GroupName] = v35, 
                            [v5.Action] = nil
                        }));
                    end;
                end;
            end);
        end;
    else
        return l_Promise_0.new(function(v46)
            v46();
        end);
    end;
end;
v21.DeserializePermissions = function(v47, v48, v49, v50)
    v21._DEPRECATEDFixEndpointKeyTypes(v47);
    v21._addOwnerIfMissing(v47, v48, v49, v50):await();
    local v51, v52 = v21._deserializeAll(v47);
    return v51, v52;
end;
return v21;
