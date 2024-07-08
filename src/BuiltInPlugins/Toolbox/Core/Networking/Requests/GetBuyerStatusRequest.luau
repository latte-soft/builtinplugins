local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Promise_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Promise;
local v2 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.SetBuyerStatus);
return function(v5)
    return function(v6)
        local v7 = v6:getState();
        if not v7.purchase or not v7.purchase.buyerStatus then
            return v5:getPurchaserStatus():andThen(function(v8)
                local v9 = if not v8 then nil else v8.responseBody;
                local v10 = if not v9 then nil else v9.purchaserStatus;
                if v10 then
                    v6:dispatch(v4(v10));
                end;
            end, function(v11)
                if v2.shouldDebugWarnings() then
                    warn("Unable to fetch purchaser status data");
                end;
                v6:dispatch(v3(v11));
            end);
        else
            return l_Promise_0.resolve();
        end;
    end;
end;
