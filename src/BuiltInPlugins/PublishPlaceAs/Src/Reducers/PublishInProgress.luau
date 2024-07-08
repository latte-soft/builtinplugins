local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    publishInProgress = {
        universe = {}, 
        place = {}, 
        isPublish = false, 
        failCount = 0, 
        requestInFlight = false
    }
}, {
    SetPublishInProgress = function(v3, v4)
        return v2.Dictionary.join(v3, {
            publishInProgress = v2.Dictionary.join(v3.publishInProgress, v4.publishInProgress)
        });
    end
});
