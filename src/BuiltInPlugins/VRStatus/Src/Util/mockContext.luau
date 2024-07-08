local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local v4 = require(l_Parent_0.Src.Resources.MakeTheme);
local _ = require(l_Parent_0.Src.Controllers.ServiceController);
local v6 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v4(true)
};
return function(v7, v8)
    assert(type(v7) == "table", "Expected story to be a table");
    local v9 = table.clone(v6);
    for _, v11 in v8, nil, nil do
        table.insert(v9, v11);
    end;
    return l_TestHelpers_0.provideMockContext(v9, v7);
end;
