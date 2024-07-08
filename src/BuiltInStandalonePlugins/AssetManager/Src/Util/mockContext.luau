local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local l_MockPlugin_0 = l_TestHelpers_0.Instances.MockPlugin;
local v6 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v11 = require(l_script_FirstAncestor_0.Src.Networking);
local v12 = l_MockPlugin_0.new("AssetManager");
local v13 = l_ContextServices_0.Localization.mock();
local v14 = v11.mock();
local v15 = v10.mock(v12, v14, v13);
local v16 = {
    l_ContextServices_0.Analytics.mock(), 
    v13, 
    l_ContextServices_0.Store.new(v1.Store.new(v6, nil, nil, nil)), 
    l_StudioTheme_0.mock(), 
    v15, 
    v8.mock(v15, v14), 
    v9.mock(v15, v14), 
    v14
};
return function(v17)
    assert(type(v17) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v16, v17);
end;
