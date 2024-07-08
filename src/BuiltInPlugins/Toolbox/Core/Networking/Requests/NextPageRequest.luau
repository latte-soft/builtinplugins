local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
return function(v3, v4)
    return function(v5)
        local l_assets_0 = v5:getState().assets;
        if not l_assets_0.isLoading and not l_assets_0.hasReachedBottom then
            v5:dispatch(v2(v3, v4, {
                targetPage = (v5:getState().pageInfo.currentPage or 0) + 1, 
                requestReason = v1.NextPage
            }));
            return ;
        else
            return ;
        end;
    end;
end;
