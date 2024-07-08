local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    require(l_Parent_0.Src.Resources.MakeTheme)(true), 
    (l_ContextServices_0.Store.new(v1.Store.new(require(l_Parent_0.Src.Reducers), require(l_Parent_0.Src.InitialStoreState), {
        v1.thunkMiddleware
    }, nil)))
};
return function(v6)
    assert(type(v6) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v5, v6);
end;
