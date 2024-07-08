local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Core.Types.Category);
local v3 = require(l_Parent_0.Core.Types.RequestReason);
local v4 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v5 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v6 = require(l_Parent_0.Core.Actions.ClearAssets);
local v7 = require(l_Parent_0.Core.Actions.SetLiveSearch);
local v8 = require(l_Parent_0.Core.Actions.SetLoading);
local v9 = require(l_Parent_0.Core.Actions.StopPreviewSound);
local v10 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v11 = require(l_Parent_0.Core.Util.CreatorInfoHelper);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxUpdateDisplayedAudioTags);
local _ = function(v16, v17, _)
    return v16:getUsers(v17, 3):andThen(function(v19)
        local l_responseBody_0 = v19.responseBody;
        if l_responseBody_0 then
            local l_UserSearchResults_0 = l_responseBody_0.UserSearchResults;
            if l_UserSearchResults_0 and #l_UserSearchResults_0 > 0 then
                local v22 = 1;
                local v23 = string.lower(v17);
                for v24, v25 in ipairs(l_UserSearchResults_0) do
                    if string.lower(v25.Name) == v23 then
                        v22 = v24;
                        break;
                    end;
                end;
                local v26 = l_UserSearchResults_0[v22];
                return {
                    Name = v26.Name, 
                    Id = v26.UserId, 
                    Type = v11.clientToBackend(Enum.CreatorType.User.Value)
                };
            end;
        end;
        return {
            Name = v17, 
            Id = -1, 
            Type = v11.clientToBackend(Enum.CreatorType.User.Value)
        };
    end);
end;
return function(v28, v29, v30)
    return function(v31)
        v31:dispatch(v8(true));
        v31:dispatch(v6());
        local v32 = v30.AudioSearch or v1.None;
        local v33 = v30.AdditionalAudioSearch or v1.None;
        local l_includeUnverifiedCreators_0 = v30.includeUnverifiedCreators;
        local l_sound_0 = v31:getState().sound;
        if not (not (l_sound_0 ~= nil) or not l_sound_0.isPlaying) then
            v31:dispatch(v9());
        end;
        if v30.Creator and v30.Creator ~= "" then
            local function v37(v36)
                v31:dispatch(v8(false));
                v31:dispatch(v5(v28, v29, {
                    audioSearchInfo = v32, 
                    additionalAudioSearchInfo = v33, 
                    includeUnverifiedCreators = l_includeUnverifiedCreators_0, 
                    targetPage = 1, 
                    currentPage = 0, 
                    creator = v36, 
                    excludeGroupCreations = if not v14() then nil else v30.excludeGroupCreations, 
                    searchTerm = v30.searchTerm, 
                    sortIndex = v30.SortIndex or 1, 
                    requestReason = v3.StartSearch, 
                    qualityFilterData = v30.qualityFilterData
                }));
                v10.onCreatorSearched(v36.Name, v36.Id);
            end;
            if type(v30.Creator) == "string" then
                local l_v28_0 = v28;
                local l_Creator_0 = v30.Creator;
                l_v28_0:getUsers(l_Creator_0, 3):andThen(function(v40)
                    local l_responseBody_1 = v40.responseBody;
                    if l_responseBody_1 then
                        local l_UserSearchResults_1 = l_responseBody_1.UserSearchResults;
                        if l_UserSearchResults_1 and #l_UserSearchResults_1 > 0 then
                            local v43 = 1;
                            local v44 = string.lower(l_Creator_0);
                            for v45, v46 in ipairs(l_UserSearchResults_1) do
                                if string.lower(v46.Name) == v44 then
                                    v43 = v45;
                                    break;
                                end;
                            end;
                            local v47 = l_UserSearchResults_1[v43];
                            return {
                                Name = v47.Name, 
                                Id = v47.UserId, 
                                Type = v11.clientToBackend(Enum.CreatorType.User.Value)
                            };
                        end;
                    end;
                    return {
                        Name = l_Creator_0, 
                        Id = -1, 
                        Type = v11.clientToBackend(Enum.CreatorType.User.Value)
                    };
                end):andThen(v37, function(_)
                end);
                return ;
            elseif not ((not v15() or type(v30.Creator) ~= "table") and (v15() or not type(v30.Creator == "table"))) then
                v37({
                    Name = v30.Creator.Name, 
                    Id = v30.Creator.Id, 
                    Type = v11.clientToBackend(Enum.CreatorType.User.Value)
                });
                return ;
            end;
        else
            local l_None_0 = v1.None;
            local v50 = nil;
            local v51 = nil;
            if not l_showRobloxCreatedAssets_0() then
                if v13() then
                    v50 = v30.creatorTargetIds;
                    v51 = v30.groupTargetIds;
                end;
            else
                local v52 = v4.getCurrentTab(v31:getState().pageInfo);
                if v52 == v2.MARKETPLACE_KEY then
                    l_None_0 = v2.CREATOR_ROBLOX;
                elseif v13() and v52 == v2.INVENTORY_KEY then
                    l_None_0 = v2.CREATOR_ROBLOX;
                    v50 = v30.creatorTargetIds;
                    v51 = v30.groupTargetIds;
                end;
            end;
            if v13() then
                if v50 then
                    for _, v54 in v50, nil, nil do
                        v10.onCreatorSearched(v54.Name, v54.Id, if not v54.Type then nil else v54.Type.Name);
                    end;
                end;
                if v51 then
                    for _, v56 in v51, nil, nil do
                        v10.onCreatorSearched(v56.Name, v56.Id, if not v56.Type then nil else v56.Type.Name);
                    end;
                end;
            end;
            v31:dispatch(v8(false));
            v31:dispatch(v7("", {}));
            v31:dispatch(v5(v28, v29, {
                audioSearchInfo = v32, 
                additionalAudioSearchInfo = v33, 
                includeUnverifiedCreators = l_includeUnverifiedCreators_0, 
                targetPage = 1, 
                currentPage = 0, 
                sortIndex = v30.SortIndex or 1, 
                creator = l_None_0, 
                creatorTargetIds = if not v13() then nil else v50, 
                excludeGroupCreations = if not v14() then nil else v30.excludeGroupCreations, 
                groupTargetIds = if not v13() then nil else v51, 
                requestReason = v3.StartSearch, 
                searchTerm = v30.searchTerm, 
                uiSortIntent = if not v13() then nil else v30.uiSortIntent, 
                sortDirection = v30.sortDirection, 
                qualityFilterData = v30.qualityFilterData
            }));
        end;
    end;
end;
