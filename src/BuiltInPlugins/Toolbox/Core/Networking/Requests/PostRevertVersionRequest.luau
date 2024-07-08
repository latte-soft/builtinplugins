local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Networking.Requests.GetVersionsHistoryRequest);
return function(v4, v5, v6)
    return function(v7)
        return v4:postRevertVersion(v5, v6):andThen(function(_)
            v7:dispatch(v3(v4, v5));
        end, function(v9)
            if v1.shouldDebugWarnings() then
                warn("Got false response from ReverVersion");
            end;
            v7:dispatch(v2(v9));
        end);
    end;
end;
