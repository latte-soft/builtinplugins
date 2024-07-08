local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.PostInsertAsset);
return function(v4, v5)
    return function(v6)
        return v4:postInsertAsset(v5):andThen(function(v7)
            v6:dispatch(v3(v5, v7.responseBody));
        end, function(v8)
            if v1.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v6:dispatch(v2(v8));
        end);
    end;
end;
