local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v2 = require(l_Actions_0.Callstack.AddThreadId);
local v3 = require(l_Actions_0.Common.Resumed);
local v4 = require(l_Actions_0.Common.SimPaused);
local v5 = require(l_Actions_0.Callstack.SetCurrentThread);
local v6 = require(l_Actions_0.Common.SetCurrentBreakpointId);
local v7 = require(l_Actions_0.Common.SetFocusedDebuggerConnection);
local v8 = require(l_Actions_0.Common.ClearConnectionData);
local v9 = require(l_Parent_0.Thunks.Watch.LoadAllVariablesForThreadAndFrame);
local v10 = require(l_Parent_0.Thunks.Callstack.PopulateCallstackThreadThunk);
local v11 = require(l_Parent_0.Models.DebuggerStateToken);
local v12 = require(l_Parent_0.Util.Constants);
local v13 = {};
v13.__index = v13;
v13.bufferedPauseEvents = {};
v13.onExecutionPaused = function(v14, v15, v16, v17, v18, v19)
    v14.bufferedPauseEvents[v17] = v16;
    wait(0.1);
    if v14.bufferedPauseEvents[v17] ~= v16 then
        return ;
    elseif v14.debuggerConnections[v15.Id] == nil then
        return ;
    else
        v14.store:dispatch(v7(v15.Id));
        local l_Common_0 = v14.store:getState().Common;
        local v21 = v11.fromData({
            debuggerConnectionId = v15.Id
        });
        if tostring(v17) == v12.DebuggerPauseReason.Breakpoint and v16.Breakpoint ~= nil then
            v14.store:dispatch(v6(v16.Breakpoint.MetaBreakpointId));
        end;
        local function _()
            return v21 == v14.store:getState().Common.debuggerConnectionIdToDST[v21.debuggerConnectionId];
        end;
        local v23 = tostring(v17) == v12.DebuggerPauseReason.Exception;
        v14.store:dispatch(v4(v21, v16.ThreadId, v23));
        v15:GetThreads(function(v24)
            if v21 == v14.store:getState().Common.debuggerConnectionIdToDST[v21.debuggerConnectionId] then
                local function _(v25)
                    if v21 == v14.store:getState().Common.debuggerConnectionIdToDST[v21.debuggerConnectionId] then
                        (function()
                            v14.store:dispatch(v9(v25.ThreadId, v15, 0, v18));
                            v14.store:dispatch(v5(v25.ThreadId));
                            local l_v25_Frame_0 = v25:GetFrame(0);
                            v18:SetScriptLineMarker(l_v25_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_v25_Frame_0.Line, true);
                            v18:OpenScriptAtLine(l_v25_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_v25_Frame_0.Line, false);
                            if v23 then
                                v18:OpenExceptionMessagePopup(v16.ExceptionText, l_v25_Frame_0.Line);
                            end;
                        end)();
                        return ;
                    else
                        return ;
                    end;
                end;
                local l_v24_Arg_0 = v24:GetArg();
                local v29 = if #l_v24_Arg_0 > 0 then l_v24_Arg_0[1] else nil;
                for _, v31 in pairs(l_v24_Arg_0) do
                    v14.store:dispatch(v2(v31.ThreadId, v31.ThreadName, v21));
                    if v31.ThreadId == v16.ThreadId then
                        v29 = v31;
                    end;
                end;
                if #l_v24_Arg_0 > 0 then
                    v14.store:dispatch(v10(v29, v15, v21, v19, function()
                        local l_v29_0 = v29;
                        if v21 == v14.store:getState().Common.debuggerConnectionIdToDST[v21.debuggerConnectionId] then
                            (function()
                                v14.store:dispatch(v9(l_v29_0.ThreadId, v15, 0, v18));
                                v14.store:dispatch(v5(l_v29_0.ThreadId));
                                local l_l_v29_0_Frame_0 = l_v29_0:GetFrame(0);
                                v18:SetScriptLineMarker(l_l_v29_0_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_l_v29_0_Frame_0.Line, true);
                                v18:OpenScriptAtLine(l_l_v29_0_Frame_0.Script, l_Common_0.currentDebuggerConnectionId, l_l_v29_0_Frame_0.Line, false);
                                if v23 then
                                    v18:OpenExceptionMessagePopup(v16.ExceptionText, l_l_v29_0_Frame_0.Line);
                                end;
                            end)();
                            return ;
                        else
                            return ;
                        end;
                    end));
                end;
                return ;
            else
                return ;
            end;
        end);
        return ;
    end;
end;
v13.onExecutionResumed = function(v34, v35, v36, v37)
    local v38 = v34.store:getState().Common.debuggerConnectionIdToDST[v35.Id];
    if v38 then
        v37:RemoveScriptLineMarkers(v35.Id, true);
        v34.store:dispatch(v3(v38, v36.ThreadId));
    end;
end;
v13.connectEvents = function(v39, v40, v41, v42, v43)
    v39.store:dispatch(v7(v41.Id));
    v39.connectionEventConnections[v40] = {
        paused = v41.Paused:Connect(function(v44, v45)
            v39:onExecutionPaused(v41, v44, v45, v42, v43);
        end), 
        resumed = v41.Resumed:Connect(function(v46)
            v39:onExecutionResumed(v41, v46, v42);
        end)
    };
end;
v13.onConnectionStarted = function(v47, v48, v49, v50)
    assert(v48 and v48.Id ~= 0);
    v47.debuggerConnections[v48.Id] = v48;
    v47:connectEvents(v48.Id, v48, v49, v50);
end;
v13.onConnectionEnded = function(v51, v52, _, v54)
    assert(v52 and v52.Id ~= 0);
    if v54 ~= nil then
        v54:RemoveScriptLineMarkers(v52.Id, true);
    end;
    local v55 = v51.store:getState().Common.debuggerConnectionIdToDST[v52.Id];
    if v55 then
        v51.store:dispatch(v8(v55));
    end;
    if v51.connectionEventConnections[v52.Id] then
        for _, v57 in pairs(v51.connectionEventConnections[v52.Id]) do
            v57:Disconnect();
        end;
    end;
    v51.connectionEventConnections[v52.Id] = nil;
    v51.debuggerConnections[v52.Id] = nil;
end;
v13.onFocusChanged = function(v58, v59)
    v58.store:dispatch(v7(if v59 ~= nil then v59.Id else v12.kInvalidDebuggerConnectionId));
end;
local function v71(v60, v61, v62, v63)
    local v64 = v61 or game:GetService("DebuggerConnectionManager");
    local v65 = v62 or game:GetService("DebuggerUIService");
    local v66 = v63 or game:GetService("CrossDMScriptChangeListener");
    v60._connectionStartedConnection = v64.ConnectionStarted:Connect(function(v67)
        v60:onConnectionStarted(v67, v65, v66);
    end);
    v60._connectionEndedConnection = v64.ConnectionEnded:Connect(function(v68, v69)
        v60:onConnectionEnded(v68, v69, v65);
    end);
    v60._focusChangedConnection = v64.FocusChanged:Connect(function(v70)
        v60:onFocusChanged(v70);
    end);
end;
v13.new = function(v72, v73, v74, v75)
    local v76 = {
        store = v72, 
        debuggerConnections = {}, 
        connectionEventConnections = {}
    };
    v71(v76, v73, v74, v75);
    setmetatable(v76, v13);
    return v76;
end;
v13.destroy = function(v77)
    v77.store:dispatch(v7(v12.kInvalidDebuggerConnectionId));
    if v77._connectionStartedConnection then
        v77._connectionStartedConnection:Disconnect();
        v77._connectionStartedConnection = nil;
    end;
    if v77._connectionEndedConnection then
        v77._connectionEndedConnection:Disconnect();
        v77._connectionEndedConnection = nil;
    end;
    if v77._focusChangedConnection then
        v77._focusChangedConnection:Disconnect();
        v77._focusChangedConnection = nil;
    end;
    for _, v79 in pairs(v77.debuggerConnections) do
        v77:onConnectionEnded(v79, 0);
    end;
end;
return v13;
