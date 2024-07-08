local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local v5 = require(l_Actions_0.Callstack.AddCallstack);
local v6 = require(l_Actions_0.Callstack.AddThreadId);
local v7 = require(l_Actions_0.Common.Resumed);
local v8 = require(l_Actions_0.Common.ClearConnectionData);
local v9 = require(l_Actions_0.Common.SimPaused);
local v10 = require(l_Actions_0.Callstack.ColumnFilterChange);
local v11 = require(l_Models_0.ThreadInfo);
local _ = require(l_Models_0.DebuggerStateToken);
local _ = require(l_Models_0.Callstack.CallstackRow);
local v14 = require(l_Models_0.Callstack.ColumnEnum);
return v1.createReducer({
    stateTokenToCallstackVars = {}, 
    listOfEnabledColumns = {
        v14.Frame, 
        v14.Source, 
        v14.Function, 
        v14.Line
    }
}, {
    [v6.name] = function(v15, v16)
        return v2.Dictionary.join(v15, {
            stateTokenToCallstackVars = v2.Dictionary.join(v15.stateTokenToCallstackVars, {
                [v16.debuggerStateToken] = {
                    threadList = v2.List.join(v15.stateTokenToCallstackVars[v16.debuggerStateToken].threadList, {
                        v11.fromData(v16)
                    }), 
                    threadIdToFrameList = v15.stateTokenToCallstackVars[v16.debuggerStateToken].threadIdToFrameList
                }
            })
        });
    end, 
    [v5.name] = function(v17, v18)
        if v17.stateTokenToCallstackVars[v18.debuggerStateToken] == nil then
            assert(false);
            return v17;
        else
            return v2.Dictionary.join(v17, {
                stateTokenToCallstackVars = v2.Dictionary.join(v17.stateTokenToCallstackVars, {
                    [v18.debuggerStateToken] = {
                        threadIdToFrameList = v2.Dictionary.join(v17.stateTokenToCallstackVars[v18.debuggerStateToken].threadIdToFrameList, {
                            [v18.threadId] = v18.frameList
                        }), 
                        threadList = v17.stateTokenToCallstackVars[v18.debuggerStateToken].threadList
                    }
                })
            });
        end;
    end, 
    [v9.name] = function(v19, v20)
        local v21 = true;
        if v19.stateTokenToCallstackVars[v20.debuggerStateToken] ~= nil then
            v21 = v19.stateTokenToCallstackVars[v20.debuggerStateToken].threadIdToFrameList[v20.threadId] == nil;
        end;
        assert(v21);
        return v2.Dictionary.join(v19, {
            stateTokenToCallstackVars = v2.Dictionary.join(v19.stateTokenToCallstackVars, {
                [v20.debuggerStateToken] = {
                    threadList = not not v19.stateTokenToCallstackVars[v20.debuggerStateToken] and v19.stateTokenToCallstackVars[v20.debuggerStateToken].threadList or {}, 
                    threadIdToFrameList = not not v19.stateTokenToCallstackVars[v20.debuggerStateToken] and v19.stateTokenToCallstackVars[v20.debuggerStateToken].threadIdToFrameList or {}
                }
            })
        });
    end, 
    [v7.name] = function(v22, v23)
        local v24 = {};
        for _, v26 in ipairs(v22.stateTokenToCallstackVars[v23.debuggerStateToken].threadList) do
            if v26.threadId ~= v23.threadId then
                table.insert(v24, v26);
            end;
        end;
        assert(v22.stateTokenToCallstackVars[v23.debuggerStateToken] ~= nil);
        local v27 = v2.Dictionary.join(v22.stateTokenToCallstackVars[v23.debuggerStateToken].threadIdToFrameList, {});
        v27[v23.threadId] = nil;
        return v2.Dictionary.join(v22, {
            stateTokenToCallstackVars = v2.Dictionary.join(v22.stateTokenToCallstackVars, {
                [v23.debuggerStateToken] = {
                    threadIdToFrameList = v27, 
                    threadList = v24
                }
            })
        });
    end, 
    [v8.name] = function(v28, v29)
        return v2.Dictionary.join(v28, {
            stateTokenToCallstackVars = v2.Dictionary.join(v28.stateTokenToCallstackVars, {
                [v29.debuggerStateToken] = v2.None
            })
        });
    end, 
    [v10.name] = function(v30, v31)
        return v2.Dictionary.join(v30, {
            listOfEnabledColumns = v31.listOfEnabledColumns
        });
    end
});
