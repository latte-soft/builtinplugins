local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
return function(v3, v4, v5)
    return function(v6)
        v6:dispatch(v2(v3, v4, {
            sortIndex = v5, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v1.ChangeSort
        }));
    end;
end;
