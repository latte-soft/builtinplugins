local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    l_ContextServices_0.Store.new(v1.Store.new(require(l_script_FirstAncestor_0.Src.Reducers.MainReducer), nil, nil, nil)), 
    require(l_script_FirstAncestor_0.Src.Resources.MakeTheme)(true)
};
return function(v6)
    assert(type(v6) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v5, v6);
end;
