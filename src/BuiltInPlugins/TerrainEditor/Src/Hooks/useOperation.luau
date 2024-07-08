local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
return function(v6)
    local v7 = v6:getTool();
    local v8, v9 = l_useState_0(false);
    local v10, v11 = l_useState_0({
        Operation = l_useState_0(v7:operation()), 
        Paused = l_useState_0(false), 
        Progress = l_useState_0(0)
    });
    l_useEffect_0(function()
        local v13 = v7.OnOperationChanged:Connect(function()
            local v12 = v7:operation();
            v11({
                Operation = v12, 
                Paused = v12:isPaused(), 
                Progress = v12:getProgress()
            });
            v9(v12:hasStarted());
        end);
        return function()
            v13:Disconnect();
        end;
    end, {
        v7
    });
    l_useEffect_0(function()
        if v10.Operation then
            local v14 = v10.Operation.Canceled:Connect(function()
                v9(false);
            end);
            local v15 = v10.Operation.Finished:Connect(function()
                v9(false);
            end);
            local v16 = v10.Operation.Paused:Connect(function()
                v11(v1.join(v10, {
                    Paused = true
                }));
            end);
            local v19 = v10.Operation.ProgressChanged:Connect(function(v17, v18)
                v11(v1.join(v10, {
                    Progress = v17, 
                    TimeRemaining = v18
                }));
            end);
            local v20 = v10.Operation.Resumed:Connect(function()
                v11(v1.join(v10, {
                    Paused = false
                }));
            end);
            local v21 = v10.Operation.Started:Connect(function()
                v9(true);
            end);
            if v10.Operation:hasFinished() then
                v9(false);
            end;
            return function()
                v14:Disconnect();
                v15:Disconnect();
                v16:Disconnect();
                v19:Disconnect();
                v20:Disconnect();
                v21:Disconnect();
            end;
        else
            return ;
        end;
    end, {
        v7, 
        v10.Operation, 
        v10.Paused, 
        v10.Progress, 
        v10.TimeRemaining
    });
    local v22 = l_useCallback_0(function()
        if not (not v10.Operation or v10.Operation:isPaused()) then
            v10.Operation:pause();
        end;
    end, {
        v7, 
        v10.Operation
    });
    local v23 = l_useCallback_0(function()
        if not (not v10.Operation or not v10.Operation:isPaused()) then
            v10.Operation:resume();
        end;
    end, {
        v7, 
        v10.Operation
    });
    local v24 = l_useCallback_0(function()
        if v10.Operation then
            v10.Operation:cancel();
        end;
    end, {
        v7, 
        v10.Operation
    });
    if not v10.Operation then
        return nil;
    else
        return {
            Description = v10.Operation:getDescription(), 
            Enabled = v8, 
            OnCancel = if not v10.Operation:canCancel() then nil else v24, 
            OnClose = v24, 
            OnPause = if not v10.Operation:canPause() then nil else v22, 
            OnResume = if not v10.Operation:canResume() then nil else v23, 
            Paused = v10.Paused, 
            Progress = v10.Progress, 
            TimeRemaining = v10.TimeRemaining, 
            Title = v10.Operation:getName()
        };
    end;
end;
