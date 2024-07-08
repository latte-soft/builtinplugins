local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetAssetConfigAssetTypeAgents);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v3, v4)
    return function(v5)
        return v3:getAssetTypeAgents(v4):andThen(function(v6)
            v5:dispatch(v1(v6.responseBody.agents));
        end, function(v7)
            v5:dispatch(v2(v7));
        end);
    end;
end;
