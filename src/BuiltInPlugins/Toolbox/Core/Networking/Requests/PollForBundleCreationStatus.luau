local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.DebugFlags);
local v2 = game:DefineFastInt("UGCBundleCreationPollStatusAttempts", 5);
local v3 = require(l_Util_0.SharedFlags.getFFlagEnableCreateUGCBundleCreationFeeErrorCodes);
local v4 = {
    Unknown = 0, 
    InProgress = 1, 
    Success = 2, 
    ValidationFailed = 3, 
    InsufficientFunds = 4, 
    Failed = if not v3() then nil else 5, 
    CreationFeeMismatch = if not v3() then nil else 6
};
local function v5(v6, v7, v8, v9)
    v6:getBundleCreationStatus(v7):andThen(function(v10)
        local v11 = if not v10.responseBody then nil else v10.responseBody.status;
        if v11 == v4.Success then
            v8(v10.responseBody.bundleId, v10.responseBody);
            return ;
        elseif v11 == v4.InProgress then
            if v9 < v2 then
                task.delay(2 ^ (v9 + 1), function()
                    v5(v6, v7, v8, v9 + 1);
                end);
                return ;
            else
                v8(nil, v10.responseBody);
                return ;
            end;
        else
            v8(nil, v10.responseBody);
            return ;
        end;
    end, function(v12)
        if v1.shouldDebugWarnings() then
            warn("Lua toolbox: Could not get UGC Bundle creation status");
        end;
        v8(nil, v12.responseBody);
    end);
end;
return function(v13, v14, v15)
    return function(_)
        v5(v13, v14, v15, 0);
    end;
end;
