local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_Actions_0 = l_Parent_0.Src.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.UpdateEvents).name] = function(v4, v5)
        return v2.join(v4, v5.events);
    end, 
    [require(l_Actions_0.ClearEvents).name] = function(_, _)
        return {};
    end
}));
