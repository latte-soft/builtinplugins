local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "StudioTutorialExtraAction", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        23, 
        7, 
        3
    }, 
    description = "Perform an extra action in a Studio Tutorial.", 
    links = "https://roblox.atlassian.net/wiki/spaces/developer/pages/2076443597/Onboarding+API+Discussion"
};
