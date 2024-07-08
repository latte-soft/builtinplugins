local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = require(l_Parent_0.Src.Util.quickWait);
local v3 = {};
v3.__index = v3;
v3.new = function(v4)
    assert(type(v4) == "table", "LongOperation needs an options table");
    local v5 = setmetatable({
        Started = l_Signal_0.new(), 
        Paused = l_Signal_0.new(), 
        Resumed = l_Signal_0.new(), 
        PausedChanged = l_Signal_0.new(), 
        Canceled = l_Signal_0.new(), 
        Finished = l_Signal_0.new(), 
        RunningChanged = l_Signal_0.new(), 
        ProgressChanged = l_Signal_0.new(), 
        _name = v4.name or "", 
        _onStartFunc = v4.onStart, 
        _onStepFunc = v4.onStep, 
        _onPauseFunc = v4.onPause, 
        _onResumeFunc = v4.onResume, 
        _onCancelFunc = v4.onCancel, 
        _onFinishFunc = v4.onFinish, 
        _onErrorFunc = v4.onError, 
        _timeBetweenSteps = v4.timeBetweenSteps or 0, 
        _timeBetweenPauseChecks = v4.timeBetweenPauseChecks or 0.1, 
        _operationData = {}, 
        _hasStarted = false, 
        _isPaused = false, 
        _wasCanceled = false, 
        _hasFinished = false, 
        _isRunning = false, 
        _operationProgress = 0, 
        _errorMessage = nil, 
        _startTime = 0, 
        _endTime = 0, 
        _yieldTime = 0
    }, v3);
    assert(v5._onStepFunc and type(v5._onStepFunc) == "function", "LongOperation.new() requires an onStep callback");
    return v5;
end;
v3.destroy = function(v6)
    if not ((not v6._hasStarted or v6._hasFinished) or v6._wasCanceled) then
        v6:cancel();
    end;
end;
v3.start = function(v7, v8)
    if not v7._hasStarted then
        if v8 then
            assert(type(v8) == "table", "LongOperation:start() initialData should be nil or table");
            v7._operationData = v8;
        end;
        v7._hasStarted = true;
        v7._isRunning = true;
        v7._startTime = tick();
        v7.Started:Fire();
        v7.RunningChanged:Fire(true);
        spawn(function()
            v7:_runOperation();
        end);
        return ;
    else
        return ;
    end;
end;
v3.pause = function(v9)
    if not ((not v9._hasStarted or v9._hasFinished) or v9._wasCanceled) and not v9._isPaused then
        v9._isPaused = true;
        v9.Paused:Fire();
        v9.PausedChanged:Fire(true);
        return ;
    else
        return ;
    end;
end;
v3.resume = function(v10)
    if not ((not v10._hasStarted or v10._hasFinished) or v10._wasCanceled) and v10._isPaused then
        v10._isPaused = false;
        v10.Resumed:Fire();
        v10.PausedChanged:Fire(false);
        return ;
    else
        return ;
    end;
end;
v3.togglePause = function(v11)
    if not (not v11._hasStarted or v11._hasFinished) and not v11._wasCanceled then
        if not v11._isPaused then
            v11:pause();
            return ;
        else
            v11:resume();
            return ;
        end;
    else
        return ;
    end;
end;
v3.cancel = function(v12)
    if not (not v12._hasStarted or v12._hasFinished) and not v12._wasCanceled then
        v12._wasCanceled = true;
        v12.Canceled:Fire();
        return ;
    else
        return ;
    end;
end;
v3.getName = function(v13)
    return v13._name;
end;
v3.getOperationData = function(v14)
    return v14._operationData;
end;
v3.hasStarted = function(v15)
    return v15._hasStarted;
end;
v3.isPaused = function(v16)
    return v16._isPaused;
end;
v3.wasCanceled = function(v17)
    return v17._wasCanceled;
end;
v3.hasFinished = function(v18)
    return v18._hasFinished;
end;
v3.isRunning = function(v19)
    return v19._isRunning;
end;
v3.didError = function(v20)
    return not not v20._errorMessage;
end;
v3.getErrorMessage = function(v21)
    return v21._errorMessage;
end;
v3.getProgress = function(v22)
    return v22._operationProgress;
end;
v3._setProgress = function(v23, v24)
    if v23._operationProgress ~= v24 then
        v23._operationProgress = v24;
        v23.ProgressChanged:Fire(v24);
    end;
end;
v3.getTimeTaken = function(v25)
    if v25._hasFinished then
        return v25._endTime - v25._startTime;
    else
        return 0;
    end;
end;
v3.getYieldTime = function(v26)
    return v26._yieldTime;
end;
v3.getWorkTime = function(v27)
    if v27._hasFinished then
        return v27:getTimeTaken() - v27:getYieldTime();
    else
        return 0;
    end;
end;
v3._yield = function(v28, ...)
    local v29 = tick();
    v2(...);
    v28._yieldTime = v28._yieldTime + (tick() - v29);
end;
v3._handleError = function(v30, v31)
    if not v30:didError() then
        v30._errorMessage = tostring(v31) or "";
        v30:_runCallback(v30._onErrorFunc);
        return ;
    else
        return ;
    end;
end;
v3._runCallback = function(v32, v33)
    if v33 then
        local v34 = nil;
        if not xpcall(function()
            v34 = {
                v33(v32._operationData, v32)
            };
        end, function(v35)
            v32:_handleError(v35);
        end) then
            return false;
        else
            return true, unpack(v34);
        end;
    else
        return false;
    end;
end;
v3._runOperation = function(v36)
    v36:_runCallback(v36._onStartFunc);
    v36:_yield(v36._timeBetweenSteps);
    local v37 = false;
    while not v36:didError() do
        if not v36._wasCanceled then
            if not v36._isPaused then
                if not (v37 and not v36:_runCallback(v36._onResumeFunc)) then
                    v37 = false;
                    local v38, v39, v40 = v36:_runCallback(v36._onStepFunc);
                    if v38 then
                        v36:_setProgress(v40);
                        if v39 then
                            v36:_yield(v36._timeBetweenSteps);
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                else
                    break;
                end;
            elseif not (not v37 and not v36:_runCallback(v36._onPauseFunc)) then
                v37 = true;
                v36:_yield(v36._timeBetweenPauseChecks);
            else
                break;
            end;
        else
            v36:_runCallback(v36._onCancelFunc);
            break;
        end;
    end;
    v36._hasFinished = true;
    v36._isRunning = false;
    v36._endTime = tick();
    v36.RunningChanged:Fire(false);
    v36:_runCallback(v36._onFinishFunc);
    v36.Finished:Fire();
end;
return v3;
