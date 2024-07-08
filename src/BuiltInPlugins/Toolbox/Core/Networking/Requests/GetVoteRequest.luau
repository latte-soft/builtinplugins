local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.GetVote);
local v4 = require(l_Parent_0.Core.Actions.SetVoteLoading);
return function(v5, v6, v7, v8)
    return function(v9)
        if v8 then
            local v10 = v9:getState();
            if (v10 ~= nil and v10.voting ~= nil) and v10.voting[v6] ~= nil then
                if not v10.voting[v6].VoteFetchAttempted then
                    v9:dispatch(v4(v6, true, true));
                else
                    return ;
                end;
            end;
        end;
        return v5:getVote(v6, v7):andThen(function(v11)
            local l_responseBody_0 = v11.responseBody;
            local v13 = if l_responseBody_0 == nil then nil else l_responseBody_0.userVote;
            if v13 ~= nil then
                v9:dispatch(v3(v6, v13));
            end;
            v9:dispatch(v4(v6, false, true));
        end, function(v14)
            if v1.shouldDebugWarnings() then
                warn("Could not get vote data");
            end;
            v9:dispatch(v2(v14));
            v9:dispatch(v4(v6, false, true));
        end);
    end;
end;
