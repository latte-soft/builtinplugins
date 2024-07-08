local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetGameConfiguration);
local v2 = require(l_Parent_0.Src.Actions.SetChooseGameQueryState);
local v3 = require(l_Parent_0.Src.Resources.Constants);
return function(v4, v5)
    return function(v6)
        v5.Develop.V2.Universes.configuration(v4):makeRequest():andThen(function(v7)
            v6:dispatch(v1(v7.responseBody));
        end, function(_)
            v6:dispatch(v2(v3.QUERY_STATE.QUERY_STATE_FAILED));
        end);
    end;
end;
