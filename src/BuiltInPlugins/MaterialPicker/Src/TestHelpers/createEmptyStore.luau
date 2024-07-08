local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.MainReducer);
return function()
    return v1.Store.new(v2, nil, {
        v1.thunkMiddleware
    });
end;
