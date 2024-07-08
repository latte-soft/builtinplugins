local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.getUserId);
local v2 = require(l_Parent_0.Core.Actions.CollaboratorSearchActions);
local l_Get_0 = require(l_Parent_0.Core.Networking.Requests.UserFriends).Get;
return function(v4, v5, _)
    return function(v7)
        local v8 = v7:getState();
        v7:dispatch(v2.SearchTextChanged(v5));
        if v5 == "" then
            return ;
        else
            if not v8.localUserFriends then
                v7:dispatch(v2.LoadingLocalUserFriends());
                spawn(function()
                    local v9, v10 = l_Get_0(v4, (tostring(v1()))):await();
                    v7:dispatch(v2.LoadedLocalUserFriends(v9, v10));
                end);
            end;
            return ;
        end;
    end;
end;
