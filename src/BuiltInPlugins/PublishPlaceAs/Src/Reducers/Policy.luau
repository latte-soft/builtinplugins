local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    PlayerAcceptance = false
}, {
    SetPlayerAcceptance = function(v3, v4)
        return v2.Dictionary.join(v3, {
            PlayerAcceptance = v4.playerAcceptance
        });
    end, 
    ResetInfo = function(v5, _)
        return v2.Dictionary.join(v5, {
            PlayerAcceptance = false
        });
    end
});
