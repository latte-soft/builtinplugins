local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetHomeConfiguration);
return function(v4, v5, v6)
    return function(v7)
        return v4:getHomeConfiguration(v5, v6):andThen(function(v8)
            v7:dispatch(v3(v5, v8.responseBody));
        end, function(v9)
            if v1.shouldDebugWarnings() then
                warn(string.format("Could not get home configuration for assetType %s", v5.Name));
            end;
            v7:dispatch(v2(v9));
        end);
    end;
end;
