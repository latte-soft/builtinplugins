local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetPluginData);
return function(v4, v5)
    return function(v6)
        return v4:getPluginInfo(v5):andThen(function(v7)
            v6:dispatch(v3(v7.responseBody.data[1]));
        end, function(v8)
            if v1.shouldDebugWarnings() then
                warn("Unable to fetch plugin data");
            end;
            v6:dispatch(v2(v8));
        end);
    end;
end;
