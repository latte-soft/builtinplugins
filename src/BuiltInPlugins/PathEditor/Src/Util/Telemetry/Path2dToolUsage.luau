local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "Path2DToolUsage", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        3, 
        15
    }, 
    description = "Reports aggregate counts of our main interactions with the PathEditor tool", 
    links = "https://roblox.atlassian.net/wiki/x/jwG0gw"
};
