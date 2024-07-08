local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v3 = require(l_Parent_0.Src.Actions.SetLoadState);
local v4 = require(l_Parent_0.Src.Util.LoadState);
local v5 = require(l_Parent_0.Src.Actions.SetCurrentUserPermissions);
local v6 = require(l_Parent_0.Src.Actions.SetCurrentGroupMetadata);
local v7 = require(l_Parent_0.Src.Actions.SetCreatorType);
local v8 = require(l_Parent_0.Src.Actions.SetCreatorName);
local v9 = require(l_Parent_0.Src.Actions.SetCreatorId);
local v10 = require(l_Parent_0.Src.Actions.SetCreatorFriends);
local v11 = require(l_Parent_0.Src.Actions.SetGroupOwnerId);
local v12 = require(l_Parent_0.Src.Actions.SetGroupRolePermissions);
local v13 = require(l_Parent_0.Src.Actions.SetUserMinimumAge);
GetLoadFriendsJob = function(v14, v15)
    local l_gameMetadataController_0 = v15.gameMetadataController;
    local l_socialController_0 = v15.socialController;
    local l_GameId_0 = game.GameId;
    return function()
        v14:dispatch(v10((l_socialController_0:getUserFriends((l_gameMetadataController_0:getCreatorId(l_GameId_0))))));
    end;
end;
GetPermissionsLoadJobs = function(v19, v20)
    local l_gameMetadataController_1 = v20.gameMetadataController;
    local l_groupMetadataController_0 = v20.groupMetadataController;
    local l_groupRolePermisionsController_0 = v20.groupRolePermisionsController;
    local l_gamePermissionsController_0 = v20.gamePermissionsController;
    local l_GameId_1 = game.GameId;
    local v26 = GetLoadFriendsJob(v19, v20);
    return {
        function()
            local v27, v28 = l_gamePermissionsController_0:getPermissions(l_GameId_1, l_gameMetadataController_1:getCreatorName(l_GameId_1), l_gameMetadataController_1:getCreatorId(l_GameId_1), (l_gameMetadataController_1:getCreatorType(l_GameId_1)));
            v19:dispatch(v5(v27));
            v19:dispatch(v6(v28));
        end, 
        function()
            local v29 = l_gameMetadataController_1:getCreatorType(l_GameId_1);
            v19:dispatch(v7(v29));
            if v29 == Enum.CreatorType.Group then
                local v30 = l_gameMetadataController_1:getCreatorId(l_GameId_1);
                local v31 = l_groupMetadataController_0:getOwnerId(v30);
                v19:dispatch(v11(v31));
                if v31 == l_StudioService_0:GetUserId() then
                    l_groupRolePermisionsController_0:clearCache();
                    v19:dispatch(v12((l_groupRolePermisionsController_0:getGroupRolePermissions(v30))));
                    return ;
                end;
            elseif v29 == Enum.CreatorType.User then
                v26();
            end;
        end, 
        function()
            v19:dispatch(v8((l_gameMetadataController_1:getCreatorName(l_GameId_1))));
        end, 
        function()
            v19:dispatch(v9((l_gameMetadataController_1:getCreatorId(l_GameId_1))));
        end, 
        function()
            local v32 = l_gamePermissionsController_0:getMinimumAgeRecommendation(l_GameId_1);
            if v32 then
                v19:dispatch(v13(v32));
            end;
        end
    };
end;
v0.LoadFriends = function(_)
    return function(v34, v35)
        local v36 = GetLoadFriendsJob(v34, v35);
        coroutine.wrap(function()
            pcall(v36);
        end)();
    end;
end;
v0.LoadPermissions = function(_)
    return function(v38, v39)
        local v40 = GetPermissionsLoadJobs(v38, v39);
        v38:dispatch(v3(v4.Loading));
        local v41 = 0;
        local v42 = false;
        for _, v44 in ipairs(v40) do
            coroutine.wrap(function()
                local l_status_0, l_result_0 = pcall(v44);
                if not (l_status_0 or v42) then
                    warn("Failed", l_result_0);
                    v42 = true;
                    v38:dispatch(v3(v4.LoadFailed));
                end;
                v41 = v41 + 1;
                if not (not (v41 == #v40) or v42) then
                    v38:dispatch(v3(v4.Loaded));
                end;
            end)();
        end;
    end;
end;
return v0;
