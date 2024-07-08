local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Telemetry.PluginUnmountedEvent);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v5, v6)
        local v7 = v5:getState();
        v6.Telemetry:logTelemetryEvent(v1({
            sessionLengthSeconds = os.time() - v7.SessionStats.SessionStartTimestamp, 
            focusTimeSeconds = v7.SessionStats.TotalPluginFocusTimeSeconds, 
            unmatchedFocusEndCount = v7.SessionStats.PluginFocusEndWithoutStartCount, 
            buttonPressCounts = v7.SessionStats.ButtonPressCounts
        }));
    end;
end;
