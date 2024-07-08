local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Constants);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_RemoveVRToggleDialog2_0 = game:GetFastFlag("RemoveVRToggleDialog2");
local v6 = nil;
if l_shouldShowDevPublishLocations_0() then
    v6 = {};
end;
local function v13(v7, v8)
    v7 = v7 or {};
    v8 = v8 or {};
    if v3.isEmpty(v7) ~= v3.isEmpty(v8) then
        return false;
    else
        for v9, v10 in pairs(v7) do
            if v8[v9] ~= v10 then
                return false;
            end;
        end;
        for v11, v12 in pairs(v8) do
            if v7[v11] ~= v12 then
                return false;
            end;
        end;
        return true;
    end;
end;
return v2.createReducer({
    current = {}, 
    changed = {
        name = "Untitled Game", 
        creatorId = 0, 
        description = "", 
        genre = v1.GENRE_IDS[1], 
        playableDevices = {
            Computer = true, 
            Phone = true, 
            Tablet = true, 
            VR = l_RemoveVRToggleDialog2_0 or nil
        }, 
        teamCreateEnabled = true, 
        OptInLocations = v6, 
        isActive = false, 
        isFriendsOnly = false
    }, 
    errors = {}
}, {
    AddChange = function(v14, v15)
        local l_value_0 = v15.value;
        if l_value_0 == v14.current[v15.setting] then
            l_value_0 = v3.None;
        end;
        if not (not (type(l_value_0) == "table") or not v13(l_value_0, v14.current[v15.setting])) then
            l_value_0 = v3.None;
        end;
        return v3.Dictionary.join(v14, {
            changed = v3.Dictionary.join(v14.changed, {
                [v15.setting] = l_value_0
            }), 
            errors = v3.Dictionary.join(v14.errors, {
                [v15.setting] = v3.None
            })
        });
    end, 
    AddErrors = function(v17, v18)
        return v3.Dictionary.join(v17, {
            errors = v3.Dictionary.join(v17.errors, v18.errors)
        });
    end, 
    ResetInfo = function(v19, v20)
        return v3.Dictionary.join(v19, {
            current = v3.Dictionary.join(v19.current, v20.current), 
            changed = v3.Dictionary.join(v19.changed, v20.changed), 
            errors = v3.Dictionary.join(v19.errors, v20.errors)
        });
    end
});
