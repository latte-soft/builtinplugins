local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.src.Constants);
local l_actions_0 = l_Parent_0.src.actions;
return v1.createReducer({
    enabled = false, 
    screen = v3.SCREENS.AVATAR, 
    avatarType = nil
}, {
    [require(l_actions_0.ClosePlugin).name] = function(v5, v6)
        if v5.screen == v3.SCREENS.LOADING and not v6.force then
            return v5;
        else
            return v2.Dictionary.join(v5, {
                enabled = false
            });
        end;
    end, 
    [require(l_actions_0.TogglePlugin).name] = function(v7)
        return v2.Dictionary.join(v7, {
            enabled = not v7.enabled, 
            screen = v3.SCREENS.AVATAR
        });
    end, 
    [require(l_actions_0.SetScreen).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            screen = v9.screen
        });
    end, 
    [require(l_actions_0.SetOriginalAvatarType).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            avatarType = v11.avatarType
        });
    end
});
