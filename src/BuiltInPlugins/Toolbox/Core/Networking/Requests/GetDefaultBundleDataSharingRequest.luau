local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local _ = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local _ = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = l_script_FirstAncestor_0.Core.Actions;
local v4 = {
    isEligible = false
};
return function(v5)
    return v5:getDefaultCreateBundleDataSharing():andThen(function(v6)
        local l_responseBody_0 = v6.responseBody;
        if l_responseBody_0.isEligible and l_responseBody_0.configurations == nil then
            return v4;
        else
            return true, l_responseBody_0;
        end;
    end, function(_)
        return false, v4;
    end);
end;
