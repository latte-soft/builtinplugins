local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({}, {
    ResetStore = function(_, _)
        return {};
    end, 
    [require(l_Parent_0.Src.Actions.SetSaveState).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            CurrentSaveState = v6.saveState
        });
    end
});
