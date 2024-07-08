local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v2 = require(l_Parent_0.Core.Actions.SetToolboxManageableGroups);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v4, v5, v6)
    return function(v7)
        return v4:getManageableGroups():andThen(function(v8)
            v7:dispatch(v2(v8.responseBody.data));
            if v6 then
                v7:dispatch(v1(v4, v5, v6));
            end;
        end, function(v9)
            v7:dispatch(v3(v9));
        end);
    end;
end;
