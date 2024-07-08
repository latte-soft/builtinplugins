local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Resources.MakeTheme);
local v4 = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local v5 = require(l_Parent_0.Src.Contexts.ActivityHistoryProvider);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v8 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v3(true)
};
return function(v9)
    assert(type(v9) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v8, {
        ActivityHistoryProvider = v1.createElement(v5, {
            activityHistoryClient = v4, 
            contextType = "mock context"
        }, v9)
    });
end;
