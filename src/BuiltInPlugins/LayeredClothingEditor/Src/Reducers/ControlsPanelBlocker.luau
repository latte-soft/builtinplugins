local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    isActive = false, 
    message = ""
}, {
    SetControlsPanelBlockerActivity = function(v3, v4)
        return v2.Dictionary.join(v3, {
            isActive = v4.isActive
        });
    end, 
    SetControlsPanelBlockerMessage = function(v5, v6)
        return v2.Dictionary.join(v5, {
            message = v6.message
        });
    end
});
