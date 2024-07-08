local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "windsockOrigin", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        23, 
        8, 
        7
    }, 
    description = "Open the Windsock widget in Studio. Does not fire when dismissing the widdget", 
    links = "https://roblox.atlassian.net/l/cp/ysYjQfcq"
};
