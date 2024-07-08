local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetUniverseName);
return function(v1)
    return function(v2)
        v1.Develop.V2.Universes.configuration(game.GameId):makeRequest():andThen(function(v3)
            local l_responseBody_0 = v3.responseBody;
            if l_responseBody_0 then
                v2:dispatch(v0(l_responseBody_0.name));
                return ;
            else
                return ;
            end;
        end, function()
            error("Failed to load universe configuration");
        end);
    end;
end;
