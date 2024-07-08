local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    screen = require(l_Parent_0.Src.Resources.Constants).SCREENS.CREATE_NEW_GAME
}, {
    SetScreen = function(v3, v4)
        return v2.Dictionary.join(v3, {
            screen = v4.screen
        });
    end, 
    ResetInfo = function(v5, v6)
        return v2.Dictionary.join(v5, {
            screen = v6.screen
        });
    end
});
