local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v2 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v2.EventTypes;
local l_Backends_0 = v2.Backends;
local l_StandardizedFields_0 = v2.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Types);
local v8 = require(l_Parent_0.Src.Flags.getFFlagStyleEditorEnableTelemetry)();
local v9 = l_t_0.interface({
    sessionLengthSeconds = l_t_0.number, 
    focusTimeSeconds = l_t_0.number, 
    unmatchedFocusEndCount = l_t_0.number, 
    buttonPressCounts = l_t_0.map(l_t_0.string, l_t_0.number)
});
local v10 = {
    eventName = "StyleEditor_PluginUnmounted", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = not v8 and 0 or v2.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        3, 
        20
    }, 
    description = "Root Roact component unmounted.", 
    links = ""
};
return function(v11)
    assert(v9(v11));
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v10, 
        data = {
            customFields = v11, 
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;
