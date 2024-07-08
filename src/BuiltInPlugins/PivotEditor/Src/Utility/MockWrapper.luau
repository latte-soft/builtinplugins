local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
return function(v4, v5)
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v4.Plugin or {}), 
        l_ContextServices_0.Mouse.new(v4.Mouse or {}), 
        l_ContextServices_0.Store.new(v4.Store or v1.Store.new(v3, nil, {
            v1.thunkMiddleware
        }))
    }, v5);
end;
