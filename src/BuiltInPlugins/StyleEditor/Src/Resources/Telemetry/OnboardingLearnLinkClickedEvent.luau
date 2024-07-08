local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v1.EventTypes;
local l_Backends_0 = v1.Backends;
local l_StandardizedFields_0 = v1.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local v6 = {
    eventName = "StyleEditor_OnboardingLearnLinkClicked", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = not require(l_Parent_0.Src.Flags.getFFlagStyleEditorEnableTelemetry)() and 0 or v1.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        2, 
        22
    }, 
    description = "Onboarding \"learn more\" link clicked", 
    links = ""
};
return function()
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v6, 
        data = {
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;
