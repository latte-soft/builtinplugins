local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
local v2 = require(l_Parent_0.Core.Types.Sort);
local v3 = require(l_Parent_0.Core.Types.RequestReason);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v6 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v7 = require(l_Parent_0.Core.Actions.StopAllSounds);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
return function(v9, v10, v11)
    return function(v12)
        v12:dispatch(v7());
        local v13 = v2.getDefaultSortForCategory(v11);
        local v14 = nil;
        if l_showRobloxCreatedAssets_0() then
            v14 = if v5.getCurrentTab(v12:getState().pageInfo) == v1.MARKETPLACE_KEY and v1.categoryIsVideo(v11) then v1.CREATOR_ROBLOX_DEVELOP_API else v1.CREATOR_ROBLOX;
        end;
        v12:dispatch(v6(v9, v10, {
            audioSearchInfo = v4.None, 
            additionalAudioSearchInfo = v4.None, 
            categoryName = v11, 
            creator = v14, 
            searchTerm = "", 
            sortIndex = v13, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v3.ChangeCategory, 
            queryParams = v4.None
        }));
    end;
end;
