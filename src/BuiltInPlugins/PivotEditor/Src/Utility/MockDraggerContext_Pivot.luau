local v0 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Implementation.DraggerContext_FixtureImpl);
return {
    new = function(...)
        local v1 = v0.new(...);
        v1.shouldSnapPivotToGeometry = function(_)
            return true;
        end;
        return v1;
    end
};
