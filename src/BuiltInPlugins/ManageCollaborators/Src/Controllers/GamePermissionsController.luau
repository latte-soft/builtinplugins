local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Networking.Requests.DeserializeFromRequest);
local v3 = require(l_Parent_0.Src.Networking.Requests.SerializeForRequest);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
local l_StudioService_0 = game:GetService("StudioService");
local l_ApiProxyToUsersApiGetUserByUsernamesEnabled_0 = game:GetFastFlag("ApiProxyToUsersApiGetUserByUsernamesEnabled");
local v7 = {};
v7.__index = v7;
v7.new = function(v8)
    return (setmetatable({
        __networking = v8
    }, v7));
end;
v7.universesV1GET = function(v9, v10)
    return v9.__networking:get("develop", "/v1/universes/" .. v10);
end;
v7.universesActivateV1POST = function(v11, v12)
    return v11.__networking:post("develop", "/v1/universes/" .. v12 .. "/activate", {
        Body = {}
    });
end;
v7.universesDeactivateV1POST = function(v13, v14)
    return v13.__networking:post("develop", "/v1/universes/" .. v14 .. "/deactivate", {
        Body = {}
    });
end;
v7.configurationV2GET = function(v15, v16)
    return v15.__networking:get("develop", "/v2/universes/" .. v16 .. "/configuration");
end;
v7.configurationV2PATCH = function(v17, v18, v19)
    return v17.__networking:patch("develop", "/v2/universes/" .. v18 .. "/configuration", {
        Body = v19
    });
end;
v7.permissionsV2GET = function(v20, v21)
    return v20.__networking:get("develop", "/v2/universes/" .. v21 .. "/permissions");
end;
v7.permissionsBatchedV2POST = function(v22, v23, v24)
    return v22.__networking:post("develop", "/v2/universes/" .. v23 .. "/permissions_batched", {
        Body = v24
    });
end;
v7.permissionsBatchedV2DELETE = function(v25, v26, v27)
    return v25.__networking:delete("develop", "/v2/universes/" .. v26 .. "/permissions_batched", {
        Body = v27
    });
end;
v7.wwwSearchUsers = function(v28, v29)
    return v28.__networking:get("www", "/search/users/results", {
        Params = {
            keyword = v29, 
            maxRows = v4.MaxSearchResultsPerSubjectType
        }
    });
end;
v7.apiGetByUsernameV1GET = function(v30, v31)
    return v30.__networking:get("api", "/users/get-by-username", {
        Params = {
            username = v31
        }
    });
end;
v7.usersGetByUsernamesV1POST = function(v32, v33)
    return v32.__networking:post("users", "/v1/usernames/users", {
        Body = {
            usernames = v33
        }
    });
end;
v7.searchGroupsV1GET = function(v34, v35)
    return v34.__networking:get("groups", "/v1/groups/search/lookup", {
        Params = {
            groupName = v35, 
            maxRows = v4.MaxSearchResultsPerSubjectType
        }
    });
end;
v7.isFriendsOnly = function(v36, v37)
    return v36:configurationV2GET(v37):await().responseBody.isFriendsOnly;
end;
v7.setFriendsOnly = function(v38, v39, v40)
    v38:configurationV2PATCH(v39, {
        isFriendsOnly = v40
    }):await();
end;
v7.isActive = function(v41, v42)
    return v41:universesV1GET(v42):await().responseBody.isActive;
end;
v7.setActive = function(v43, v44, v45)
    if not v45 then
        v43:universesDeactivateV1POST(v44):await();
        return ;
    else
        v43:universesActivateV1POST(v44):await();
        return ;
    end;
end;
v7.getPermissions = function(v46, v47, v48, v49, v50)
    return v2.DeserializePermissions(v46:permissionsV2GET(v47):await().responseBody.data, v48, v49, v50);
end;
v7.setPermissions = function(v51, v52, v53, v54)
    local v55, v56 = v3.SerializePermissions(v53, v54);
    local v57 = #v55 + #v56;
    if v57 > 60 then
        error("Too many changes (" .. v57 .. ") to permissions. Maximum at once is " + 60);
    end;
    if #v55 > 0 then
        v51:permissionsBatchedV2POST(v52, v55):await();
    end;
    if #v56 > 0 then
        v51:permissionsBatchedV2DELETE(v52, v56):await();
    end;
    return v55, v56;
end;
v7.searchUsers = function(v58, v59)
    local l_UserSearchResults_0 = v58:wwwSearchUsers(v59):await().responseBody.UserSearchResults;
    if not l_UserSearchResults_0 then
        if l_ApiProxyToUsersApiGetUserByUsernamesEnabled_0 then
            local l_responseBody_0 = v58:usersGetByUsernamesV1POST({
                v59
            }):await().responseBody;
            if l_responseBody_0.responseCode ~= 200 then
                if l_responseBody_0.errors and #l_responseBody_0.errors > 0 then
                    return error("Failed to find user" .. tostring(l_responseBody_0.errors[1].message));
                else
                    return error("Failed to find user");
                end;
            else
                local v62 = {};
                for _, v64 in pairs(l_responseBody_0.data) do
                    table.insert(v62, {
                        [v4.SubjectNameKey] = v64.name, 
                        [v4.SubjectIdKey] = v64.id
                    });
                end;
                return {
                    [v4.UserSubjectKey] = v62
                };
            end;
        else
            local l_responseBody_1 = v58:apiGetByUsernameV1GET(v59):await().responseBody;
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
        local v67 = {};
        for _, v69 in pairs(l_UserSearchResults_0) do
            table.insert(v67, {
                [v4.SubjectNameKey] = v69.Name, 
                [v4.SubjectIdKey] = v69.UserId
            });
        end;
        return {
            [v4.UserSubjectKey] = v67
        };
    end;
end;
v7.searchGroups = function(v70, v71)
    local l_data_0 = v70:searchGroupsV1GET(v71):await().responseBody.data;
    local v73 = {};
    if l_data_0 then
        local v74 = {};
        for _, v76 in pairs(l_data_0) do
            table.insert(v74, {
                [v4.GroupNameKey] = v76.name, 
                [v4.GroupIdKey] = v76.id, 
                [v4.GroupMemberCountKey] = v76.memberCount
            });
        end;
        v73[v4.GroupSubjectKey] = v74;
    end;
    return v73;
end;
v7.creatorEligibilitiesPOST = function(v77, v78, v79)
    return v77.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-creator-eligibility", {
        Body = {
            action = 1, 
            universeId = v78, 
            userIds = v79, 
            locale = l_StudioService_0.StudioLocaleId
        }
    });
end;
v7.search = function(v80, v81, v82)
    local v83 = v80:searchUsers(v81);
    local v84 = v83[v4.UserSubjectKey];
    for v85 = 1, #v84 do
        v84[v85][v4.IsEligibleKey] = not v82;
    end;
    if v82 then
        local v86 = {};
        local v87 = {};
        for v88 = 1, #v84 do
            v86[v88] = v84[v88][v4.SubjectIdKey];
            v87[v86[v88]] = v84[v88];
        end;
        for _, v90 in pairs(v80:creatorEligibilitiesPOST(game.GameId, v86):await().responseBody.eligibilityByCreator) do
            v87[v90.userId][v4.IsEligibleKey] = v90.userIsEligible;
            v87[v90.userId][v4.EligibilityTextKey] = v90.displayText;
        end;
    end;
    return (v1.Dictionary.join(v83, (v80:searchGroups(v81))));
end;
v7.guidelinesPOST = function(v91, v92)
    return v91.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-age-recommendation", {
        Body = {
            universeIds = {
                v92
            }
        }
    });
end;
v7.getMinimumAgeRecommendation = function(v93, v94)
    local v95 = v93:guidelinesPOST(v94):await().responseBody.ageRecommendationDetailsByUniverse[1];
    assert(v95);
    assert(v95.universeId == v94);
    if v95 then
        local l_ageRecommendation_0 = v95.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
        if l_ageRecommendation_0 then
            return l_ageRecommendation_0.minimumAge;
        end;
    end;
    return nil;
end;
return v7;
