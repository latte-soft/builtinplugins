local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Cryo);
local v2 = require(l_Parent_0.Util.DeserializeFromRequest);
local v3 = require(l_Parent_0.Util.SerializeForRequest);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
local l_ApiProxyToUsersApiGetUserByUsernamesEnabled_0 = game:GetFastFlag("ApiProxyToUsersApiGetUserByUsernamesEnabled");
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    return (setmetatable({
        __networking = v7
    }, v6));
end;
v6.universesV1GET = function(v8, v9)
    return v8.__networking:get("develop", "/v1/universes/" .. v9);
end;
v6.universesActivateV1POST = function(v10, v11)
    return v10.__networking:post("develop", "/v1/universes/" .. v11 .. "/activate", {
        Body = {}
    });
end;
v6.universesDeactivateV1POST = function(v12, v13)
    return v12.__networking:post("develop", "/v1/universes/" .. v13 .. "/deactivate", {
        Body = {}
    });
end;
v6.configurationV2GET = function(v14, v15)
    return v14.__networking:get("develop", "/v2/universes/" .. v15 .. "/configuration");
end;
v6.configurationV2PATCH = function(v16, v17, v18)
    return v16.__networking:patch("develop", "/v2/universes/" .. v17 .. "/configuration", {
        Body = v18
    });
end;
v6.permissionsV2GET = function(v19, v20)
    return v19.__networking:get("develop", "/v2/universes/" .. v20 .. "/permissions");
end;
v6.permissionsBatchedV2POST = function(v21, v22, v23)
    return v21.__networking:post("develop", "/v2/universes/" .. v22 .. "/permissions_batched", {
        Body = v23
    });
end;
v6.permissionsBatchedV2DELETE = function(v24, v25, v26)
    return v24.__networking:delete("develop", "/v2/universes/" .. v25 .. "/permissions_batched", {
        Body = v26
    });
end;
v6.wwwSearchUsers = function(v27, v28)
    return v27.__networking:get("www", "/search/users/results", {
        Params = {
            keyword = v28, 
            maxRows = v4.MaxSearchResultsPerSubjectType
        }
    });
end;
v6.apiGetByUsernameV1GET = function(v29, v30)
    return v29.__networking:get("api", "/users/get-by-username", {
        Params = {
            username = v30
        }
    });
end;
v6.usersGetByUsernamesV1POST = function(v31, v32)
    return v31.__networking:post("users", "/v1/usernames/users", {
        Body = {
            usernames = v32
        }
    });
end;
v6.searchGroupsV1GET = function(v33, v34)
    return v33.__networking:get("groups", "/v1/groups/search/lookup", {
        Params = {
            groupName = v34, 
            maxRows = v4.MaxSearchResultsPerSubjectType
        }
    });
end;
v6.isFriendsOnly = function(v35, v36)
    return v35:configurationV2GET(v36):await().responseBody.isFriendsOnly;
end;
v6.setFriendsOnly = function(v37, v38, v39)
    v37:configurationV2PATCH(v38, {
        isFriendsOnly = v39
    }):await();
end;
v6.isActive = function(v40, v41)
    return v40:universesV1GET(v41):await().responseBody.isActive;
end;
v6.setActive = function(v42, v43, v44)
    if not v44 then
        v42:universesDeactivateV1POST(v43):await();
        return ;
    else
        v42:universesActivateV1POST(v43):await();
        return ;
    end;
end;
v6.getPermissions = function(v45, v46, v47, v48, v49)
    return v2.DeserializePermissions(v45:permissionsV2GET(v46):await().responseBody.data, v47, v48, v49);
end;
v6.setPermissions = function(v50, v51, v52, v53)
    local v54, v55 = v3.SerializePermissions(v52, v53);
    local v56 = #v54 + #v55;
    if v56 > 60 then
        error("Too many changes (" .. v56 .. ") to permissions. Maximum at once is " + 60);
    end;
    if #v54 > 0 then
        v50:permissionsBatchedV2POST(v51, v54):await();
    end;
    if #v55 > 0 then
        v50:permissionsBatchedV2DELETE(v51, v55):await();
    end;
end;
v6.searchUsers = function(v57, v58)
    local l_UserSearchResults_0 = v57:wwwSearchUsers(v58):await().responseBody.UserSearchResults;
    if not l_UserSearchResults_0 then
        if l_ApiProxyToUsersApiGetUserByUsernamesEnabled_0 then
            local l_responseBody_0 = v57:usersGetByUsernamesV1POST({
                v58
            }):await().responseBody;
            if l_responseBody_0.responseCode ~= 200 then
                if l_responseBody_0.errors and #l_responseBody_0.errors > 0 then
                    return error("Failed to find user" .. tostring(l_responseBody_0.errors[1].message));
                else
                    return error("Failed to find user");
                end;
            else
                local v61 = {};
                for _, v63 in pairs(l_responseBody_0.data) do
                    table.insert(v61, {
                        [v4.SubjectNameKey] = v63.name, 
                        [v4.SubjectIdKey] = v63.id
                    });
                end;
                return {
                    [v4.UserSubjectKey] = v61
                };
            end;
        else
            local l_responseBody_1 = v57:apiGetByUsernameV1GET(v58):await().responseBody;
            if l_responseBody_1.success == false then
                local l_errorMessage_0 = l_responseBody_1.errorMessage;
                if l_errorMessage_0 ~= "User not found" then
                    return error("Failed to find user: " .. tostring(l_errorMessage_0));
                else
                    return {
                        [v4.UserSubjectKey] = {}
                    };
                end;
            else
                return {
                    [v4.UserSubjectKey] = {
                        {
                            [v4.SubjectNameKey] = l_responseBody_1.Username, 
                            [v4.SubjectIdKey] = l_responseBody_1.Id
                        }
                    }
                };
            end;
        end;
    else
        local v66 = {};
        for _, v68 in pairs(l_UserSearchResults_0) do
            table.insert(v66, {
                [v4.SubjectNameKey] = v68.Name, 
                [v4.SubjectIdKey] = v68.UserId
            });
        end;
        return {
            [v4.UserSubjectKey] = v66
        };
    end;
end;
v6.searchGroups = function(v69, v70)
    local l_data_0 = v69:searchGroupsV1GET(v70):await().responseBody.data;
    local v72 = {};
    if l_data_0 then
        local v73 = {};
        for _, v75 in pairs(l_data_0) do
            table.insert(v73, {
                [v4.GroupNameKey] = v75.name, 
                [v4.GroupIdKey] = v75.id, 
                [v4.GroupMemberCountKey] = v75.memberCount
            });
        end;
        v72[v4.GroupSubjectKey] = v73;
    end;
    return v72;
end;
v6.search = function(v76, v77)
    return (v1.Dictionary.join(v76:searchUsers(v77), (v76:searchGroups(v77))));
end;
return v6;
