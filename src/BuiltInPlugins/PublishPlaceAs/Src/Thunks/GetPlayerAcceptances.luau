local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetPlayerAcceptance);
return function(v1)
    return function(v2)
        v1.APIS.UserAgreements.V1.agreementsResolution("App"):makeRequest():andThen(function(v3)
            v2:dispatch(v0(next(v3.responseBody) == nil));
        end, function()
            error("Failed to get Player user agreements acceptances.");
        end);
    end;
end;
