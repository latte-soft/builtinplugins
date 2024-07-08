local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.SetCodeSummaryForAsset);
return function(v4, v5)
    return function(v6)
        return v4:getCodeSummary(v5):andThen(function(v7)
            local l_responseBody_0 = v7.responseBody;
            if not (not l_responseBody_0 or not l_responseBody_0.codeSummary) and l_responseBody_0.codeSummary ~= "" then
                v6:dispatch(v3(v5, l_responseBody_0.codeSummary));
            end;
        end, function(v9)
            if v1.shouldDebugWarnings() then
                warn(("Could not get Code Understanding Summary for %d"):format(v5));
            end;
            v6:dispatch(v2(v9));
        end);
    end;
end;
