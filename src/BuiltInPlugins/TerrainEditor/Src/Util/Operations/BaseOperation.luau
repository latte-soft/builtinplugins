local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements)();
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    return (setmetatable({
        Started = l_Signal_0.new(), 
        Paused = l_Signal_0.new(), 
        Resumed = l_Signal_0.new(), 
        Canceled = l_Signal_0.new(), 
        Finished = l_Signal_0.new(), 
        ProgressChanged = l_Signal_0.new(), 
        _name = v5.Name, 
        _description = v5.Description, 
        _onStartFunc = v5.OnStart, 
        _onStepFunc = v5.OnStep, 
        _onPauseFunc = v5.OnPause, 
        _onResumeFunc = v5.OnResume, 
        _onCancelFunc = v5.OnCancel, 
        _onFinishFunc = v5.OnFinish, 
        _onErrorFunc = v5.OnError, 
        _budget = v5.Budget, 
        _timeBetweenSteps = v5.TimeBetweenSteps or 0, 
        _timeBetweenPauseChecks = v5.TimeBetweenPauseChecks or 0.1, 
        _options = {}, 
        _canCancel = v5.AllowCancel or false, 
        _canPause = v5.AllowPause or false, 
        _hasStarted = false, 
        _isPaused = false, 
        _wasCanceled = false, 
        _hasFinished = false, 
        _isRunning = false, 
        _operationProgress = 0, 
        _errorMessage = nil, 
        _steps = 0, 
        _startTime = 0, 
        _endTime = 0, 
        _yieldTime = 0
    }, v4));
end;
v4.destroy = function(v6)
    if not ((not v6._hasStarted or v6._hasFinished) or v6._wasCanceled) then
        v6:cancel();
    end;
end;
v4.start = function(v7, v8)
    assert(typeof(v8) == "table", "Options must be a table.");
    assert(not v7._hasStarted, "Cannot start an operation that was already started.");
    if v8 then
        v7._options = v8;
    end;
    v7._hasStarted = true;
    v7._isRunning = true;
    v7._startTime = os.clock();
    v7._cycles = v8.cycles;
    v7._Synchronous = v8.Synchronous;
    v7.Started:Fire();
    if not v7._cycles and not v7._Synchronous then
        task.spawn(function()
            v7:_runOperation();
        end);
        return ;
    else
        v7:_runOperation();
        return ;
    end;
end;
v4.pause = function(v9)
    if not (not v9._hasStarted or v9._hasFinished) and not v9._wasCanceled then
        assert(not v9._isPaused, "Operation already paused.");
        v9._isPaused = true;
        v9.Paused:Fire();
        return ;
    else
        return ;
    end;
end;
v4.resume = function(v10)
    if not (not v10._hasStarted or v10._hasFinished) and not v10._wasCanceled then
        assert(v10._isPaused, "Operation already running.");
        v10._isPaused = false;
        v10.Resumed:Fire();
        return ;
    else
        return ;
    end;
end;
v4.togglePause = function(v11)
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
v4.cancel = function(v12)
    if not (not v12._hasStarted or v12._hasFinished) and not v12._wasCanceled then
        v12._wasCanceled = true;
        v12.Canceled:Fire();
        return ;
    else
        return ;
    end;
end;
v4.getName = function(v13)
    return v13._name;
end;
v4.setName = function(v14, v15)
    v14._name = v15;
end;
v4.getDescription = function(v16)
    return v16._description;
end;
v4.setDescription = function(v17, v18)
    v17._description = v18;
end;
v4.getOptions = function(v19)
    return v19._options;
end;
v4.setOptions = function(v20, v21)
    v20._options = v21;
end;
v4.updateOptions = function(v22, v23)
    v22._options = v1.join(v22._options, v23);
end;
v4.updatePayload = function(v24, v25)
    v24._options.Payload = v25;
end;
v4.canCancel = function(v26)
    return v26._canCancel;
end;
v4.canPause = function(v27)
    return v27._canPause;
end;
v4.canResume = function(v28)
    return v28._canPause;
end;
v4.hasStarted = function(v29)
    return v29._hasStarted;
end;
v4.isPaused = function(v30)
    return v30._isPaused;
end;
v4.wasCanceled = function(v31)
    return v31._wasCanceled;
end;
v4.hasFinished = function(v32)
    return v32._hasFinished;
end;
v4.isRunning = function(v33)
    return v33._isRunning;
end;
v4.didError = function(v34)
    return v34._errorMessage ~= nil;
end;
v4.getErrorMessage = function(v35)
    return v35._errorMessage;
end;
v4.getProgress = function(v36)
    return v36._operationProgress;
end;
v4._setProgress = function(v37, v38)
    if v37._operationProgress ~= v38 then
        v37._operationProgress = v38;
        v37._runningTime = os.clock() - v37._startTime;
        v37.ProgressChanged:Fire(v38, if v38 > 0 then v37._runningTime / v38 - v37._runningTime else nil);
    end;
end;
v4.getStepsTaken = function(v39)
    if v39._steps == 0 then
        return 1;
    else
        return v39._steps;
    end;
end;
v4.getCurrentTimeTaken = function(v40)
    return os.clock() - v40._startTime;
end;
v4.getTimeTaken = function(v41)
    if v41._hasFinished then
        return v41._endTime - v41._startTime;
    else
        return 0;
    end;
end;
v4.getYieldTime = function(v42)
    return v42._yieldTime;
end;
v4.getWorkTime = function(v43)
    if v43._hasFinished then
        return v43:getTimeTaken() - v43:getYieldTime();
    else
        return 0;
    end;
end;
v4.addTimeStatistic = function(v44, v45)
    if v45 then
        if v44._time then
            v44._time = v44._time + v45;
            v44._timeTotals = v44._timeTotals + 1;
            return ;
        else
            v44._time = v45;
            v44._timeTotals = 1;
            return ;
        end;
    else
        return ;
    end;
end;
v4.skipBudget = function(v46)
    v46._skipBudget = true;
end;
v4.getTimeStatistic = function(v47)
    if not v47._time or not v47._timeTotals then
        return nil;
    else
        return v47._time / v47._timeTotals;
    end;
end;
v4._yield = function(v48, ...)
    if not v48._cycles and not v48._Synchronous then
        local v49 = os.clock();
        task.wait(...);
        v48._yieldTime = v48._yieldTime + (os.clock() - v49);
        return ;
    else
        return ;
    end;
end;
v4._handleError = function(v50, v51)
    if not v50:didError() then
        v50._errorMessage = tostring(v51);
        if not v50._onErrorFunc then
            error(v50._errorMessage);
            return ;
        else
            v50:_runCallback(v50._onErrorFunc);
            return ;
        end;
    else
        return ;
    end;
end;
v4._runCallback = function(v52, v53)
    if v53 then
        local v54 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v54 = table.pack(v53(v52._options, v52));
        end);
        if not l_status_0 then
            v52:_handleError(l_result_0);
            return false;
        else
            return true, unpack(v54);
        end;
    else
        return false;
    end;
end;
v4._runOperation = function(v57)
    v57:_runCallback(v57._onStartFunc);
    v57:_yield(v57._timeBetweenSteps);
    local v58 = false;
    local v59 = os.clock();
    while not v57:didError() do
        if not v57._wasCanceled then
            if not v57._isPaused then
                if not (not (not v58 or not v57._onResumeFunc) and not v57:_runCallback(v57._onResumeFunc)) then
                    v58 = false;
                    local v60, v61, v62 = v57:_runCallback(v57._onStepFunc);
                    v57._steps = v57._steps + 1;
                    if v60 then
                        if v62 then
                            v57:_setProgress(v62);
                        end;
                        if v57._cycles then
                            v57._cycles = v57._cycles - 1;
                        end;
                        if v61 and v57._cycles ~= 0 then
                            if not ((v57._budget and v57._budget >= os.clock() - v59) and (not v3 or not v57._skipBudget)) then
                                v57:_yield(v57._timeBetweenSteps);
                                v57._skipBudget = false;
                                v59 = os.clock();
                            end;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                else
                    break;
                end;
            elseif not (not (v58 or not v57._onPauseFunc) and not v57:_runCallback(v57._onPauseFunc)) then
                v58 = true;
                v57:_yield(v57._timeBetweenPauseChecks);
            else
                break;
            end;
        else
            v57:_runCallback(v57._onCancelFunc);
            break;
        end;
    end;
    v57._hasFinished = true;
    v57._isRunning = false;
    v57._endTime = os.clock();
    v57:_runCallback(v57._onFinishFunc);
    v57.Finished:Fire();
end;
return v4;
