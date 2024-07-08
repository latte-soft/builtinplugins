local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Cryo);
return function()
    local v4, v5 = v2.useState({});
    local v6 = v2.useContext(v1);
    return {
        cache = v4, 
        fetchUsernames = v2.useCallback(function(v7)
            v6.activityHistoryClient.fetchUsernames(v7, function(v8)
                v5(v3.Dictionary.join(v4, v8));
            end);
        end, {
            v4
        })
    };
end;
