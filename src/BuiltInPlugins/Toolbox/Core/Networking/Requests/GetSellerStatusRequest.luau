local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local _ = require(l_script_FirstAncestor_0.Packages.Framework).Util.Promise;
local v2 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.SetSellerStatus);
return function(v5)
    return function(v6)
        return v5:getSellerStatus():andThen(function(v7)
            local v8 = if not v7 then nil else v7.responseBody;
            if not v8 then
                if v2.shouldDebugWarnings() then
                    warn("No seller status data was given in the response body");
                end;
                return ;
            else
                v6:dispatch(v4(v8));
                return ;
            end;
        end, function(v9)
            if v2.shouldDebugWarnings() then
                warn("Unable to fetch seller status data");
            end;
            v6:dispatch(v3(v9));
        end);
    end;
end;
