local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Implementation.DraggerContext_PluginImpl);
return {
    new = function(...)
        local v2 = v1.new(...);
        v2.shouldSnapPivotToGeometry = function(_)
            return l_StudioService_0.PivotSnapToGeometry;
        end;
        return v2;
    end
};
