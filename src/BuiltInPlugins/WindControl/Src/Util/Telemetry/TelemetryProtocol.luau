local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(script.Parent.TelemetryProtocolTypes);
local v2 = {
    TelemetryBackends = {
        UNSPECIFIED = "UNSPECIFIED", 
        EventIngest = "EventIngest", 
        Points = "Points", 
        EphemeralCounter = "EphemeralCounter", 
        EphemeralStat = "EphemeralStat"
    }, 
    StandardizedFields = {
        addPlaceId = "addPlaceId", 
        addUniverseId = "addUniverseId", 
        addPlaceInstanceId = "addPlaceInstanceId", 
        addSessionId = "addSessionId"
    }, 
    LOG_EVENT_WITH_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "logEventWithTimestamp"), 
    GET_TIMESTAMP = l_MessageBusService_0:GetMessageId("Logging", "getTimestamp"), 
    LOG_EVENT_FROM_LUA = l_MessageBusService_0:GetMessageId("Logging", "logEventFromLua"), 
    ONE_HUNDRED_PERCENT = 10000
};
v2.__index = v2;
v2.new = function(v3)
    local v4 = {
        messageBus = v3 or l_MessageBusService_0
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.logEventWithTimestamp = function(v5, v6, v7, v8)
    v5.messageBus:Call(v5.LOG_EVENT_WITH_TIMESTAMP, {
        eventName = v6, 
        timestamp = v7, 
        metadata = v8
    });
end;
v2.logEvent = function(v9, v10, v11)
    v9:logEventWithTimestamp(v10, 0, v11);
end;
v2.getTimestamp = function(v12)
    return v12.messageBus:Call(v12.GET_TIMESTAMP, {});
end;
v2.logRobloxTelemetryEvent = function(v13, v14, v15, v16, v17)
    v13.messageBus:Call(v13.LOG_EVENT_FROM_LUA, {
        eventType = "RobloxTelemetry", 
        config = v14, 
        data = {
            standardizedFields = v15, 
            customFields = v16, 
            eventContext = v17
        }
    });
end;
v2.logEphemeralCounterEvent = function(v18, v19, v20)
    v18.messageBus:Call(v18.LOG_EVENT_FROM_LUA, {
        eventType = "EphemeralCounter", 
        config = v19, 
        data = if not v20 then nil else {
            incrementValue = v20
        }
    });
end;
v2.logEphemeralStatEvent = function(v21, v22, v23)
    v21.messageBus:Call(v21.LOG_EVENT_FROM_LUA, {
        eventType = "EphemeralStat", 
        config = v22, 
        data = {
            statValue = v23
        }
    });
end;
v2.default = v2.new();
return v2;
