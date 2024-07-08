local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.AssertType);
local v2 = require(script.Parent.Action);
local _ = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
return v2(script.Name, function(v4)
    v1.assertNullableType(v4, "table", "SetPublishInProgress arg");
    local v5 = v4 or {};
    return {
        publishInProgress = {
            universe = v5.universe, 
            place = v5.place, 
            isPublish = v5.isPublish, 
            failCount = v5.failCount, 
            requestInFlight = v5.requestInFlight
        }
    };
end);
