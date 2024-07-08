local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = require(l_Parent_0.Src.Util.quickWait);
local v3 = {};
v3.__index = v3;
v3.new = function(v4)
    local v5 = setmetatable({
        _timeBetweenOperations = (v4 or {}).timeBetweenOperations or 0, 
        _queue = {}, 
        _currentOperationIndex = 0, 
        _currentOperation = nil, 
        _currentOperationConnections = nil, 
        _lastOperationData = {}, 
        _lastOperationErrorMessage = nil, 
        _queueRunning = false, 
        QueueRunningChanged = l_Signal_0.new(), 
        NextOperationStarted = l_Signal_0.new(), 
        _paused = false, 
        PausedChanged = l_Signal_0.new(), 
        _progress = 0, 
        ProgressChanged = l_Signal_0.new(), 
        _wasCanceled = false
    }, v3);
    v5._updateProgress = function(v6)
        v5._progress = v6;
        v5.ProgressChanged:Fire(v6);
    end;
    v5._updatePaused = function(v7)
        v5._paused = v7;
        v5.PausedChanged:Fire(v7);
    end;
    v5._updateRunning = function(v8)
        if v8 then
            v5:_setQueueRunning(true);
        end;
    end;
    v5._operationFinished = function()
        v5:_cleanupCurrentOperation();
        if not v5._wasCanceled and not v5:didError() then
            if not v5:_hasNextOperation() then
                v5:_setQueueRunning(false);
                return ;
            else
                v2(v5._timeBetweenOperations);
                v5:_moveToNextOperation();
                v5:_startCurrentOperation();
                return ;
            end;
        else
            v5:_setQueueRunning(false);
            return ;
        end;
    end;
    return v5;
end;
v3.reset = function(v9)
    v9:destroy();
    v9._queue = {};
    v9._currentOperationIndex = 0;
    v9._lastOperationData = {};
    v9._queueRunning = false;
    v9._paused = false;
    v9._progress = 0;
    v9._wasCanceled = false;
    return v9;
end;
v3.destroy = function(v10)
    if v10._currentOperation then
        v10:_cleanupCurrentOperation();
    end;
end;
v3.addToQueue = function(v11, v12)
    table.insert(v11._queue, v12);
    return v11;
end;
v3.start = function(v13, v14)
    assert(not v13._currentOperation, "LongOperationQueue is already running an operation");
    assert(v13:_hasNextOperation(), "LongOperationQueue has no operation to run");
    if v14 then
        assert(type(v14) == "table", "LongOperationQueue:start() initialData should be nil or table");
        v13._lastOperationData = v14;
    end;
    v13:_moveToNextOperation();
    v13:_startCurrentOperation();
end;
v3.pause = function(v15)
    if v15._currentOperation then
        v15._currentOperation:pause();
    end;
end;
v3.resume = function(v16)
    if v16._currentOperation then
        v16._currentOperation:resume();
    end;
end;
v3.togglePause = function(v17)
    if v17._currentOperation then
        v17._currentOperation:togglePause();
    end;
end;
v3.cancel = function(v18)
    v18._wasCanceled = true;
    if v18._currentOperation then
        v18._currentOperation:cancel();
    end;
end;
v3.isQueueRunning = function(v19)
    return v19._queueRunning;
end;
v3.getProgress = function(v20)
    return v20._progress;
end;
v3.isPaused = function(v21)
    return v21._paused;
end;
v3.didError = function(v22)
    return not not v22._lastOperationErrorMessage;
end;
v3.getErrorMessage = function(v23)
    return v23._lastOperationErrorMessage;
end;
v3._setQueueRunning = function(v24, v25)
    if v24._queueRunning ~= v25 then
        v24._queueRunning = v25;
        v24.QueueRunningChanged:Fire(v25);
    end;
end;
v3._startCurrentOperation = function(v26)
    local l__currentOperation_0 = v26._currentOperation;
    assert(l__currentOperation_0, "LongOperationQueue:_startCurrentOperation() has no operation to start)");
    v26._updateProgress(0);
    v26.NextOperationStarted:Fire(l__currentOperation_0);
    l__currentOperation_0:start(v26._lastOperationData or {});
end;
v3._hasNextOperation = function(v28)
    return v28._currentOperationIndex + 1 <= #v28._queue;
end;
v3._moveToNextOperation = function(v29)
    assert(not v29._currentOperation, "LongOperationQueue is already running an operation");
    if v29:_hasNextOperation() then
        v29._currentOperationIndex = v29._currentOperationIndex + 1;
        v29._currentOperation = v29._queue[v29._currentOperationIndex];
        v29._currentOperationConnections = {
            progressChanged = v29._currentOperation.ProgressChanged:Connect(v29._updateProgress), 
            pausedChanged = v29._currentOperation.PausedChanged:Connect(v29._updatePaused), 
            runningChanged = v29._currentOperation.RunningChanged:Connect(v29._updateRunning), 
            finished = v29._currentOperation.Finished:Connect(v29._operationFinished)
        };
        return true;
    else
        return false;
    end;
end;
v3._cleanupCurrentOperation = function(v30)
    assert(v30._currentOperation, "LongOperationQueue has no operation to clean up");
    v30._lastOperationData = v30._currentOperation:getOperationData();
    v30._lastOperationErrorMessage = v30._currentOperation:getErrorMessage();
    for _, v32 in pairs(v30._currentOperationConnections) do
        v32:Disconnect();
    end;
    v30._currentOperationConnections = nil;
    v30._currentOperation:destroy();
    v30._currentOperation = nil;
end;
return v3;
