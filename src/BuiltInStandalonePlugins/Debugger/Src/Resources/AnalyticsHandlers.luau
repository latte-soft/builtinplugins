local v0 = require(script.Parent.Parent.Parent.Src.Resources.AnalyticsEventNames);
local v1 = tonumber(settings():GetFVariable("DebuggerEventsThrottleHundredthPercent"));
return function(v2)
    local function _(v3)
        v3.studioSid = v2:GetSessionId();
        v3.placeid = game.PlaceId;
        v2:ReportInfluxSeries("DebuggerUserEvent", v3, v1);
        v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v3);
    end;
    local function v8(v5, v6)
        local v7 = {
            eventName = v5, 
            actionSource = v6, 
            studioSid = v2:GetSessionId(), 
            placeid = game.PlaceId
        };
        v2:ReportInfluxSeries("DebuggerUserEvent", v7, v1);
        v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v7);
    end;
    return {
        [v0.RemoveMetaBreakpoint] = v8, 
        [v0.RemoveAllMetaBreakpoints] = v8, 
        [v0.EnableMetaBreakpoint] = v8, 
        [v0.DisableMetaBreakpoint] = v8, 
        [v0.EnableBreakpoint] = v8, 
        [v0.DisableBreakpoint] = v8, 
        [v0.EnableAllMetaBreakpoints] = v8, 
        [v0.DisableAllMetaBreakpoints] = v8, 
        [v0.MetaBreakpointConditionChanged] = v8, 
        [v0.MetaBreakpointLogMessageChanged] = v8, 
        [v0.MetaBreakpointContinueExecutionChanged] = v8, 
        [v0.MetaBreakpointRemoveOnHitChanged] = v8, 
        [v0.CallstackStepInto] = v8, 
        [v0.CallstackStepOver] = v8, 
        [v0.CallstackStepOut] = v8, 
        [v0.CallstackChangeFrame] = v8, 
        [v0.WatchAdded] = v8, 
        [v0.WatchScopeEdited] = function(v9, v10)
            local v11 = {
                eventName = v9, 
                enabledScopes = v10, 
                studioSid = v2:GetSessionId(), 
                placeid = game.PlaceId
            };
            v2:ReportInfluxSeries("DebuggerUserEvent", v11, v1);
            v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v11);
        end, 
        [v0.BreakpointsColumnsEdited] = function(v12, v13)
            local v14 = {
                eventName = v12, 
                enabledColumns = v13, 
                studioSid = v2:GetSessionId(), 
                placeid = game.PlaceId
            };
            v2:ReportInfluxSeries("DebuggerUserEvent", v14, v1);
            v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v14);
        end, 
        [v0.CallstackColumnsEdited] = function(v15, v16)
            local v17 = {
                eventName = v15, 
                enabledColumns = v16, 
                studioSid = v2:GetSessionId(), 
                placeid = game.PlaceId
            };
            v2:ReportInfluxSeries("DebuggerUserEvent", v17, v1);
            v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v17);
        end, 
        [v0.VariablesColumnsEdited] = function(v18, v19)
            local v20 = {
                eventName = v18, 
                enabledColumns = v19, 
                studioSid = v2:GetSessionId(), 
                placeid = game.PlaceId
            };
            v2:ReportInfluxSeries("DebuggerUserEvent", v20, v1);
            v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v20);
        end, 
        [v0.MyWatchesColumnsEdited] = function(v21, v22)
            local v23 = {
                eventName = v21, 
                enabledColumns = v22, 
                studioSid = v2:GetSessionId(), 
                placeid = game.PlaceId
            };
            v2:ReportInfluxSeries("DebuggerUserEvent", v23, v1);
            v2:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v23);
        end
    };
end;
