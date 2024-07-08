local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Telemetry.PluginMountedEvent);
local v2 = require(l_Parent_0.Src.Actions.SessionStats.SetSessionStartTimestamp);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v6)
    return function(v7, v8)
        v8.Telemetry:logTelemetryEvent(v1({
            loadTimeMillis = v6
        }));
        v7:dispatch(v2((os.time())));
    end;
end;
