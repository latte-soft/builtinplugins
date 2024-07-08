local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v7 = require(l_Actions_0.NetworkError);
local v8 = require(l_Actions_0.ResolveAssetPermissionsRollingRequest);
local v9 = require(l_Actions_0.StartInProgressAssetPermissionsRollingRequest);
local v10 = require(l_Actions_0.QueueAssetPermissionsRollingRequest);
local v11 = require(l_Actions_0.SetDescendantPermissions);
local l_Promise_0 = v4.Util.Promise;
local v13 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
local v14 = game:DefineFastInt("ToolboxRollingAssetPermissionRequestsLimit", 10);
return function(v15, v16)
    return function(v17)
        if not v13() then
            local l_descendantPermissions_0 = v17:getState().descendantPermissions;
            return v15:getAssetPermissions(v16):andThen(function(v19)
                local l_responseBody_0 = v19.responseBody;
                if not l_responseBody_0 or not l_responseBody_0.results then
                    warn("Fetching asset permissions response body empty");
                    return ;
                else
                    l_descendantPermissions_0 = v3.Dictionary.join(l_descendantPermissions_0, {
                        [v16] = l_responseBody_0.results[1]
                    });
                    v17:dispatch(v11(l_descendantPermissions_0));
                    return ;
                end;
            end, function(v21)
                if v5.shouldDebugWarnings() then
                    warn("Fetching asset permissions unsuccessful");
                end;
                v17:dispatch(v7(v21));
            end);
        else
            return l_Promise_0.new(function(v22)
                local v23 = l_HttpService_0:GenerateGUID();
                task.spawn(function()
                    local v24 = v17:getState();
                    if v14 <= #v24.rollingAssetPermissionRequests.inProgress then
                        v17:dispatch(v10(v23));
                        local v25 = coroutine.running();
                        local l_v25_0 = v25 --[[ copy: 1 -> 3 ]];
                        local v28 = v17.changed:connect(function(v27)
                            if v27.rollingAssetPermissionRequests.queued[1] == v23 then
                                task.spawn(l_v25_0);
                            end;
                        end);
                        coroutine.yield();
                        v28:disconnect();
                        v24 = v17:getState();
                    end;
                    local l_descendantPermissions_1 = v24.descendantPermissions;
                    local function _()
                        v17:dispatch(v8(v23));
                        v22();
                    end;
                    v17:dispatch(v9(v23));
                    return v15:getAssetPermissions(v16):andThen(function(v31)
                        local l_responseBody_1 = v31.responseBody;
                        if not l_responseBody_1 or not l_responseBody_1.results then
                            warn("Fetching asset permissions response body empty");
                        else
                            l_descendantPermissions_1 = v3.Dictionary.join(l_descendantPermissions_1, {
                                [v16] = l_responseBody_1.results[1]
                            });
                            v17:dispatch(v11(l_descendantPermissions_1));
                        end;
                        v17:dispatch(v8(v23));
                        v22();
                    end, function(v33)
                        if v5.shouldDebugWarnings() then
                            warn("Fetching asset permissions unsuccessful");
                        end;
                        v17:dispatch(v7(v33));
                        v17:dispatch(v8(v23));
                        v22();
                    end);
                end);
            end);
        end;
    end;
end;
