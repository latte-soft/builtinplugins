local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
return v1.createReducer({
    QuantizeWarning = false, 
    Saved = false, 
    Loaded = false, 
    ClippedWarning = false, 
    InvalidAnimation = false, 
    CannotPasteError = false
}, {
    SetNotification = function(v3, v4)
        assert(v3[v4.notification] ~= nil, "Notification " .. v4.notification .. " does not exist in Notifications.");
        local v5 = v2.Dictionary.join(v3, {
            [v4.notification] = v4.value
        });
        if not (not (v4.notification == "Loaded") or not v4.value) then
            v5.Saved = false;
        end;
        return v5;
    end
});
