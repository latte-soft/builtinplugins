local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Callstack.SetCurrentThread);
local v6 = require(l_Actions_0.Callstack.SetCurrentFrameNumber);
local v7 = require(l_Actions_0.Common.Resumed);
local v8 = require(l_Actions_0.Common.SetPausedState);
local v9 = require(l_Actions_0.Common.SimPaused);
local v10 = require(l_Actions_0.Common.SetCurrentBreakpointId);
local v11 = require(l_Actions_0.Common.ClearConnectionData);
local v12 = require(l_Actions_0.Callstack.AddThreadId);
local v13 = require(l_Actions_0.Common.SetFocusedDebuggerConnection);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local _ = require(l_Parent_0.Src.Models.DebuggerStateToken);
return v1.createReducer({
    debuggerConnectionIdToDST = {}, 
    currentDebuggerConnectionId = v3.kInvalidDebuggerConnectionId, 
    debuggerConnectionIdToCurrentThreadId = {}, 
    currentFrameMap = {}, 
    currentBreakpointId = nil, 
    isPaused = false, 
    hitException = {}, 
    pausedDebuggerConnectionIds = {}
}, {
    [v5.name] = function(v16, v17)
        local v18 = l_deepCopy_0(v16.debuggerConnectionIdToCurrentThreadId);
        v18[v16.currentDebuggerConnectionId] = v17.currentThreadId;
        return v2.Dictionary.join(v16, {
            debuggerConnectionIdToCurrentThreadId = v18
        });
    end, 
    [v6.name] = function(v19, v20)
        local v21 = l_deepCopy_0(v19.currentFrameMap);
        assert(v21[v19.currentDebuggerConnectionId] ~= nil);
        v21[v19.currentDebuggerConnectionId][v20.threadId] = v20.currentFrame;
        return v2.Dictionary.join(v19, {
            currentFrameMap = v21
        });
    end, 
    [v7.name] = function(v22, v23)
        return v2.Dictionary.join(v22, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v22.debuggerConnectionIdToDST, {
                [v23.debuggerStateToken.debuggerConnectionId] = v2.None
            }), 
            debuggerConnectionIdToCurrentThreadId = {}, 
            currentFrameMap = {}, 
            isPaused = false, 
            hitException = {}, 
            pausedDebuggerConnectionIds = v2.Dictionary.join(v22.pausedDebuggerConnectionIds, {
                [v23.debuggerStateToken.debuggerConnectionId] = v2.None
            })
        });
    end, 
    [v11.name] = function(v24, v25)
        local l_debuggerConnectionId_0 = v25.debuggerStateToken.debuggerConnectionId;
        local l_isPaused_0 = v24.isPaused;
        local l_currentDebuggerConnectionId_0 = v24.currentDebuggerConnectionId;
        if l_debuggerConnectionId_0 == v24.currentDebuggerConnectionId then
            l_currentDebuggerConnectionId_0 = v3.kInvalidDebuggerConnectionId;
            l_isPaused_0 = false;
        end;
        local v29 = v2.Dictionary.join(v24.pausedDebuggerConnectionIds, {
            [l_debuggerConnectionId_0] = v2.None
        });
        if next(v29) == nil then
            l_isPaused_0 = false;
        end;
        local v30 = l_deepCopy_0(v24.hitException);
        if v24.currentFrameMap[l_debuggerConnectionId_0] then
            for v31, _ in pairs(v24.currentFrameMap[l_debuggerConnectionId_0]) do
                v30 = v2.Dictionary.join(v30, {
                    [v31] = v2.None
                });
            end;
        end;
        return v2.Dictionary.join(v24, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v24.debuggerConnectionIdToDST, {
                [l_debuggerConnectionId_0] = v2.None
            }), 
            currentDebuggerConnectionId = l_currentDebuggerConnectionId_0, 
            debuggerConnectionIdToCurrentThreadId = v2.List.removeValue(v24.debuggerConnectionIdToCurrentThreadId, l_debuggerConnectionId_0), 
            currentFrameMap = v2.List.removeValue(v24.currentFrameMap, l_debuggerConnectionId_0), 
            isPaused = l_isPaused_0, 
            hitException = v30, 
            pausedDebuggerConnectionIds = v29
        });
    end, 
    [v9.name] = function(v33, v34)
        local l_debuggerConnectionId_1 = v34.debuggerStateToken.debuggerConnectionId;
        return v2.Dictionary.join(v33, {
            debuggerConnectionIdToDST = v2.Dictionary.join(v33.debuggerConnectionIdToDST, {
                [v34.debuggerStateToken.debuggerConnectionId] = v34.debuggerStateToken
            }), 
            isPaused = true, 
            hitException = v2.Dictionary.join(v33.hitException, {
                [v34.threadId] = v34.hitException
            }), 
            pausedDebuggerConnectionIds = v2.Dictionary.join(v33.pausedDebuggerConnectionIds, {
                [l_debuggerConnectionId_1] = l_debuggerConnectionId_1
            }), 
            debuggerConnectionIdToCurrentThreadId = v2.Dictionary.join(v33.debuggerConnectionIdToCurrentThreadId, {
                [l_debuggerConnectionId_1] = nil
            }), 
            currentFrameMap = v2.Dictionary.join(v33.currentFrameMap, {
                [l_debuggerConnectionId_1] = nil
            })
        });
    end, 
    [v10.name] = function(v36, v37)
        return v2.Dictionary.join(v36, {
            currentBreakpointId = v37.breakpointId
        });
    end, 
    [v8.name] = function(v38, v39)
        if not v39.pause then
            return v2.Dictionary.join(v38, {
                isPaused = v39.pause, 
                debuggerConnectionIdToCurrentThreadId = {}
            });
        else
            return v2.Dictionary.join(v38, {
                isPaused = v39.pause
            });
        end;
    end, 
    [v12.name] = function(v40, v41)
        local v42 = {
            debuggerConnectionIdToCurrentThreadId = l_deepCopy_0(v40.debuggerConnectionIdToCurrentThreadId)
        };
        if v42.debuggerConnectionIdToCurrentThreadId[v40.currentDebuggerConnectionId] == nil then
            v42.debuggerConnectionIdToCurrentThreadId[v40.currentDebuggerConnectionId] = v41.threadId;
        end;
        v42.currentFrameMap = l_deepCopy_0(v40.currentFrameMap);
        if v42.currentFrameMap[v40.currentDebuggerConnectionId] == nil then
            v42.currentFrameMap[v40.currentDebuggerConnectionId] = {};
        end;
        v42.currentFrameMap[v40.currentDebuggerConnectionId][v41.threadId] = 1;
        return v2.Dictionary.join(v40, v42);
    end, 
    [v13.name] = function(v43, v44)
        return v2.Dictionary.join(v43, {
            currentDebuggerConnectionId = v44.debuggerConnectionId
        });
    end
});
