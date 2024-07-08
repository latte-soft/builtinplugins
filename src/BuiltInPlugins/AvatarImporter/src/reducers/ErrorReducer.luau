local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({}, {
    [require(l_Parent_0.src.actions.SetError).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            name = v4.name, 
            message = v4.message
        });
    end
});
