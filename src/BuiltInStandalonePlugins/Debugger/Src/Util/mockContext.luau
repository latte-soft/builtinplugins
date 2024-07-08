local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_Parent_0.Src.Reducers.MainReducer);
local v6 = require(l_Parent_0.Src.Middleware.MainMiddleware);
local v7 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    require(l_Parent_0.Src.Resources.MakeTheme)(true)
};
return function(v8, v9)
    assert(type(v8) == "table", "Expected initialStore to be a table");
    assert(type(v9) == "table", "Expected children to be a table");
    local v10 = v1.Store.new(v5, v8, v6);
    table.insert(v7, l_ContextServices_0.Store.new(v10));
    return {
        getStore = function()
            return v10;
        end, 
        getChildrenWithMockContext = function()
            return l_TestHelpers_0.provideMockContext(v7, v9);
        end
    };
end;
