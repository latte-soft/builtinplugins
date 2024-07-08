local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "StudioTutorialStartStep", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        23, 
        6, 
        14
    }, 
    description = "Start a step in a Studio Tutorial.", 
    links = "https://roblox.atlassian.net/wiki/spaces/developer/pages/2076443597/Onboarding+API+Discussion"
};
