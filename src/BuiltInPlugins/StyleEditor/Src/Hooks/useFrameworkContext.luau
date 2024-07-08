local l_Parent_0 = script.Parent.Parent.Parent;
local l_useContext_0 = require(l_Parent_0.Packages.React).useContext;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Types);
return function()
    local v6 = l_useContext_0(l_ContextServices_0.Context);
    return {
        Focus = v6[l_ContextServices_0.Focus.Key], 
        Localization = v6[l_ContextServices_0.Localization.Key], 
        Plugin = v6[l_ContextServices_0.Plugin.Key], 
        Telemetry = v6[v3.Key]
    };
end;
