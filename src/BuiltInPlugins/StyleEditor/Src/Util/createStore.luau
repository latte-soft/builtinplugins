local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_ThunkWithArgsMiddleware_0 = require(l_Parent_0.Packages.Framework).Util.ThunkWithArgsMiddleware;
local v3 = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5)
    return v1.Store.new(v3, nil, {
        (l_ThunkWithArgsMiddleware_0(v5))
    }, nil);
end;
