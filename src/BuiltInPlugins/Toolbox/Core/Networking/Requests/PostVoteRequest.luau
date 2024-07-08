local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.PostVote);
return function(v4, v5, v6)
    return function(v7)
        return v4:postVote(v5, v6):andThen(function(v8)
            v7:dispatch(v3(v5, v8.responseBody, v6));
        end, function(v9)
            if v1.shouldDebugWarnings() then
                warn("Voting unsucessful");
            end;
            v7:dispatch(v2(v9));
        end);
    end;
end;
