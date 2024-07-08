local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v4)
    return function(_, v6)
        v6.Telemetry:logTelemetryEvent(v4);
    end;
end;
