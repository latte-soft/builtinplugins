local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Core.Types.RequestReason);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v4 = require(l_Parent_0.Core.Networking.Requests.GetToolboxManageableGroupsRequest);
local v5 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxExcludeGroupCreations);
local v10 = require(l_Parent_0.Core.Types.Category);
local v11 = require(l_Parent_0.Core.Actions.StopAllSounds);
return function(v12, v13, _, v15, v16, v17)
    return function(v18)
        local v19 = v10.getCategories(v13, v18:getState().roles, if not v6() then nil else v17);
        local l_None_0 = v1.None;
        if l_showRobloxCreatedAssets_0() then
            l_None_0 = v16.creator or v1.None;
        end;
        local _ = nil;
        v18:dispatch(v5(v12, v15, {
            audioSearchInfo = v1.None, 
            additionalAudioSearchInfo = v1.None, 
            creator = l_None_0, 
            currentTab = v13, 
            categories = v19, 
            requestReason = v2.ChangeTabs, 
            categoryName = v16.categoryName, 
            excludeGroupCreations = not not v9() or not v8() and nil, 
            searchTerm = v16.searchTerm, 
            sortIndex = v16.sortIndex, 
            groupIndex = v16.groupIndex, 
            targetPage = 1, 
            currentPage = 0, 
            selectedBackgroundIndex = v16.selectedBackgroundIndex, 
            includeUnverifiedCreators = if not v7() then nil else false, 
            creatorTargetIds = if not v7() then nil else v1.None, 
            groupTargetIds = if not v7() then nil else v1.None, 
            uiSortIntent = if not v7() then nil else v1.None, 
            queryParams = v1.None, 
            sortDirection = v1.None
        }));
        local v22 = true;
        if v13 ~= v10.INVENTORY_KEY then
            v22 = v13 == v10.CREATIONS_KEY;
        end;
        if v22 then
            v18:dispatch(v4(v12));
        end;
        v18:dispatch(v11());
    end;
end;
