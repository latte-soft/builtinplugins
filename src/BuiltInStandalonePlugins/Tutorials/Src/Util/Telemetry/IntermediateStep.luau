local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "StudioTutorialIntermediateStep", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        23, 
        6, 
        22
    }, 
    description = "Make intermediate progress during a step in a Studio Tutorial.", 
    links = "https://roblox.atlassian.net/wiki/spaces/developer/pages/2076443597/Onboarding+API+Discussion"
};
