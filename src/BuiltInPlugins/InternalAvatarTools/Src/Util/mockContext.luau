local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    require(l_Parent_0.Src.Resources.MakeTheme)(true)
};
return function(v5)
    assert(type(v5) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v4, v5);
end;
