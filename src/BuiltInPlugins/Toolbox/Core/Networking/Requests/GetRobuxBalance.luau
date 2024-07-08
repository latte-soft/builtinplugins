local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.getUserId);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetRobuxBalance);
return function(v5)
    return function(v6)
        return v5:getRobuxBalance((v2())):andThen(function(v7)
            v6:dispatch(v4((tonumber(v7.responseBody.robux))));
        end, function(v8)
            if v1.shouldDebugWarnings() then
                warn("Could not get Robux balance");
            end;
            v6:dispatch(v3(v8));
        end);
    end;
end;
