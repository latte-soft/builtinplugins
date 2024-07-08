local v0 = require(script:FindFirstAncestor("ControlsEmulator").Packages.Framework);
local l_TestHelpers_0 = v0.TestHelpers;
local l_ContextServices_0 = v0.ContextServices;
local v3 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock()
};
return function(v4)
    assert(type(v4) == "table", "Expected children to be a table");
    return l_TestHelpers_0.provideMockContext(v3, v4);
end;
