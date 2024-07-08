local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local _ = require(script.Parent.Types);
local v5 = {
    RobloxTelemetry = "RobloxTelemetry", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat"
};
local v6 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat"
};
local v7 = {
    addPlaceId = "addPlaceId", 
    addUniverseId = "addUniverseId", 
    addPlaceInstanceId = "addPlaceInstanceId", 
    addSessionId = "addSessionId"
};
local v8 = l_t_0.interface({
    eventType = l_t_0.valueOf(v5), 
    config = l_t_0.interface({
        eventName = l_t_0.string, 
        backends = l_t_0.array(l_t_0.valueOf(v6))
    }), 
    data = l_t_0.union(l_t_0.none, l_t_0.interface({
        customFields = l_t_0.optional(l_t_0.keys(l_t_0.string))
    }), l_t_0.interface({
        incrementValue = l_t_0.number
    }), l_t_0.interface({
        statValue = l_t_0.number
    }))
});
local v9 = {
    EventTypes = v5, 
    Backends = v6, 
    StandardizedFields = v7, 
    LOG_EVENT_WITH_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "logEventWithTimestamp"), 
    GET_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "getTimestamp"), 
    LOG_EVENT_FROM_LUA = l_MessageBusService_0:GetMessageId("Logging", "logEventFromLua"), 
    ONE_HUNDRED_PERCENT = 10000
};
v9.__index = v9;
v9.new = function(v10)
    local v11 = {
        _messageBus = v10 or l_MessageBusService_0
    };
    setmetatable(v11, v9);
    return v11;
end;
v9.logEventWithTimestamp = function(v12, v13, v14, v15)
    v12._messageBus:Call(v12.LOG_EVENT_WITH_TIMESTAMP, {
        eventName = v13, 
        timestamp = v14, 
        metadata = v15
    });
end;
v9.logEvent = function(v16, v17, v18)
    v16:logEventWithTimestamp(v17, 0, v18);
end;
v9.getTimestamp = function(v19)
    return v19._messageBus:Call(v19.GET_TIMESTAMP, {});
end;
v9.logTelemetryEvent = function(v20, v21)
    assert(v8(v21));
    if v3.LogTelemetry() then
        print(("StyleEditor logged telemetry event '%*':"):format(v21.config.eventName), v21);
    end;
    v20._messageBus:Call(v20.LOG_EVENT_FROM_LUA, v21);
end;
return v9;
