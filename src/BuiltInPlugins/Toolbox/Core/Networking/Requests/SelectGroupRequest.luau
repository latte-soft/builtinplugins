local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Sort);
local v2 = require(l_Parent_0.Core.Types.RequestReason);
local v3 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v4 = require(l_Parent_0.Core.Actions.StopAllSounds);
return function(v5, v6)
    return function(v7)
        v7:dispatch(v4());
        v7:dispatch(v3(v5, nil, {
            searchTerm = "", 
            sortIndex = v1.getDefaultSortForGroups(v7:getState().pageInfo), 
            groupIndex = v6, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v2.ChangeGroup
        }));
    end;
end;
