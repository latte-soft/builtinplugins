local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v2 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v2.EventTypes;
local l_Backends_0 = v2.Backends;
local l_StandardizedFields_0 = v2.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local v7 = require(l_Parent_0.Src.Flags.getFFlagStyleEditorEnableTelemetry)();
local v8 = l_t_0.interface({
    loadTimeMillis = l_t_0.number
});
local v9 = {
    eventName = "StyleEditor_PluginMounted", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = not v7 and 0 or v2.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        3, 
        11
    }, 
    description = "Root Roact component mounted.", 
    links = ""
};
return function(v10)
    assert(v8(v10));
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v9, 
        data = {
            customFields = v10, 
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;
