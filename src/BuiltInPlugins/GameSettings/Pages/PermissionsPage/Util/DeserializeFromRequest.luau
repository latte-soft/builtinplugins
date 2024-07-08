local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_1.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_1.Packages.Cryo);
local v4 = require(l_Parent_1.Src.Networking.Requests.Permissions.GroupRoles);
local v5 = require(l_Parent_0.Util.PermissionsConstants);
local v6 = require(l_Parent_0.Util.WebKeyConstants);
local function _(v7)
    if not v7[v6.UserId] then
        if not v7[v6.RoleId] then
            if not v7[v6.GroupId] then
                error("Could not determine subject type");
                return ;
            else
                return v5.GroupSubjectKey;
            end;
        else
            return v5.RoleSubjectKey;
        end;
    else
        return v5.UserSubjectKey;
    end;
end;
local function _(v9)
    if v9 == v6.PlayAction then
        return v5.PlayKey;
    elseif v9 == v6.EditAction then
        return v5.EditKey;
    elseif v9 == v6.AdminAction then
        return v5.EditKey;
    elseif v9 == nil then
        return v5.NoAccessKey;
    else
        error("Unsupported Action: " .. tostring(v9));
        return ;
    end;
end;
local v22 = {
    _DEPRECATEDFixEndpointKeyTypes = function(v11)
        for _, v13 in pairs(v11) do
            for v14, v15 in pairs(v13) do
                if not ((v14 ~= v6.GroupId and v14 ~= v6.UserId) and v14 ~= v6.RoleId) or v14 == v6.RoleRank then
                    v13[v14] = tonumber(v15);
                end;
            end;
        end;
    end, 
    _deserializeOne = function(v16, v17)
        local v18 = {};
        local l_ActionKey_0 = v5.ActionKey;
        local v20 = v16[v6.Action];
        local v21;
        if v20 == v6.PlayAction then
            v21 = v5.PlayKey;
        elseif v20 == v6.EditAction then
            v21 = v5.EditKey;
        elseif v20 == v6.AdminAction then
            v21 = v5.EditKey;
        elseif v20 == nil then
            v21 = v5.NoAccessKey;
        else
            error("Unsupported Action: " .. tostring(v20));
            v21 = nil;
        end;
        v18[l_ActionKey_0] = v21;
        l_ActionKey_0 = nil;
        v21 = nil;
        if v17 == v5.UserSubjectKey then
            l_ActionKey_0 = v16[v6.UserName];
            v21 = v16[v6.UserId];
        elseif v17 == v5.GroupSubjectKey then
            l_ActionKey_0 = v16[v6.GroupName];
            v21 = v16[v6.GroupId];
        elseif v17 == v5.RoleSubjectKey then
            l_ActionKey_0 = v16[v6.RoleName];
            v21 = v16[v6.RoleId];
        end;
        v18[v5.SubjectNameKey] = l_ActionKey_0;
        v18[v5.SubjectIdKey] = v21;
        v20 = v16[v6.AllowedPermissions];
        if v17 == v5.UserSubjectKey then
            if not (v20 and v20 ~= "") or v20 == "Play" then
                v18[v5.IsFriendKey] = false;
            else
                v18[v5.IsFriendKey] = true;
            end;
        end;
        if v17 == v5.RoleSubjectKey then
            v18[v5.SubjectRankKey] = v16[v6.RoleRank];
            v18[v5.GroupIdKey] = v16[v6.GroupId];
        end;
        return v18;
    end
};
v22._deserializeAll = function(v23)
    local v24 = {};
    local v25 = {
        [v5.UserSubjectKey] = {}, 
        [v5.RoleSubjectKey] = {}
    };
    for _, v27 in pairs(v23) do
        local v28;
        if not v27[v6.UserId] then
            if not v27[v6.RoleId] then
                if not v27[v6.GroupId] then
                    error("Could not determine subject type");
                    v28 = nil;
                else
                    v28 = v5.GroupSubjectKey;
                end;
            else
                v28 = v5.RoleSubjectKey;
            end;
        else
            v28 = v5.UserSubjectKey;
        end;
        if v28 == v5.GroupSubjectKey then
            local v29 = v22._deserializeOne(v27, v28);
            local v30 = v29[v5.SubjectIdKey];
            local v31 = v29[v5.SubjectNameKey];
            local _ = v29[v5.ActionKey];
            v24[v30] = {
                Name = v31
            };
        end;
    end;
    for _, v34 in pairs(v23) do
        local v35;
        if not v34[v6.UserId] then
            if not v34[v6.RoleId] then
                if not v34[v6.GroupId] then
                    error("Could not determine subject type");
                    v35 = nil;
                else
                    v35 = v5.GroupSubjectKey;
                end;
            else
                v35 = v5.RoleSubjectKey;
            end;
        else
            v35 = v5.UserSubjectKey;
        end;
        local v36 = v22._deserializeOne(v34, v35);
        local v37 = v36[v5.SubjectIdKey];
        if v35 ~= v5.GroupSubjectKey and (not (v36[v5.SubjectRankKey] == 0) or v36[v5.ActionKey] ~= v5.NoAccessKey) then
            v25[v35][v37] = v36;
        end;
    end;
    return v25, v24;
end;
v22._addOwnerIfMissing = function(v38, v39, v40, v41)
    local v42 = v41 == Enum.CreatorType.User and v6.UserId or v6.GroupId;
    local v43 = false;
    for _, v45 in pairs(v38) do
        if v45[v42] == v40 then
            v43 = true;
            break;
        end;
    end;
    if not v43 then
        if v41 == Enum.CreatorType.User then
            table.insert(v38, {
                [v6.UserId] = v40, 
                [v6.UserName] = v39, 
                [v6.Action] = v6.EditAction
            });
            return l_Promise_0.new(function(v46)
                v46();
            end);
        else
            table.insert(v38, {
                [v6.GroupId] = v40, 
                [v6.GroupName] = v39, 
                [v6.Action] = nil
            });
            return v4.Get(v40):andThen(function(v47)
                for _, v49 in pairs(v47) do
                    if v49[v6.RoleId] == 255 then
                        table.insert(v38, v3.Dictionary.join(v49, {
                            [v6.GroupId] = v40, 
                            [v6.GroupName] = v39, 
                            [v6.Action] = v6.EditAction
                        }));
                    else
                        table.insert(v38, v3.Dictionary.join(v49, {
                            [v6.GroupId] = v40, 
                            [v6.GroupName] = v39, 
                            [v6.Action] = nil
                        }));
                    end;
                end;
            end);
        end;
    else
        return l_Promise_0.new(function(v50)
            v50();
        end);
    end;
end;
v22.DeserializePermissions = function(v51, v52, v53, v54)
    v22._DEPRECATEDFixEndpointKeyTypes(v51);
    v22._addOwnerIfMissing(v51, v52, v53, v54):await();
    local v55, v56 = v22._deserializeAll(v51);
    return v55, v56;
end;
return v22;
