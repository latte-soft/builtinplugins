local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
return (v1.createReducer({
    DefaultStateObject = ""
}, {
    [require(l_Parent_0.Src.Actions.ExampleAction).name] = function(v3, v4)
        return l_join_0(v3, {
            DefaultStateObject = v4.something
        });
    end
}));
