local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "windsockUsage", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        23, 
        8, 
        7
    }, 
    description = "Reports aggregate counts of the three main interaction types in the windsock widget", 
    links = "https://roblox.atlassian.net/l/cp/ysYjQfcq"
};
