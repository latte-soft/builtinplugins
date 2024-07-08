local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadFee);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.UploadResult);
local v4 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
return function(v5, v6, v7)
    return function(v8)
        v5:postBundleCreationFee(v6, v7):andThen(function(v9)
            local l_responseBody_0 = v9.responseBody;
            if l_responseBody_0.price ~= nil and l_responseBody_0.canAfford ~= nil then
                v8:dispatch(v1(true, l_responseBody_0.price, l_responseBody_0.canAfford));
                return ;
            else
                if v4.shouldDebugWarnings() then
                    warn("Unexpected postBundleCreationFee response body:", l_responseBody_0);
                end;
                v8:dispatch(v1(false));
                return ;
            end;
        end, function(v11)
            v8:dispatch(v2(v11.Body));
            v8:dispatch(v3(false));
        end);
    end;
end;
