local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local function v8(v7)
    return {
        l_ContextServices_0.Analytics.mock(), 
        l_ContextServices_0.Localization.mock(), 
        l_ContextServices_0.Store.new(v7 or v1.Store.new(v5, nil, {
            v1.thunkMiddleware
        }, nil)), 
        v6(true)
    };
end;
return function(v9, v10)
    assert(type(v9) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v8(v10), v9);
end;
