local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local l_MockPlugin_0 = l_TestHelpers_0.Instances.MockPlugin;
local v6 = require(l_Parent_0.Src.Resources.MakeTheme);
local v7 = require(l_Parent_0.Src.Controllers.PluginController);
local v8 = require(l_Parent_0.Src.Controllers.ShortcutController);
local v9 = require(l_Parent_0.Src.Controllers.ToolController);
local v10 = require(l_Parent_0.Src.Util.mockResourceTable);
local l_StudioServices_0 = v2.Context.StudioServices;
local v12 = {
    libraries = {
        [v2.Resources.LOCALIZATION_PROJECT_NAME] = {
            stringResourceTable = v10, 
            translationResourceTable = v10
        }, 
        [v1.Resources.LOCALIZATION_PROJECT_NAME] = {
            stringResourceTable = v10, 
            translationResourceTable = v10
        }
    }
};
local v13 = l_MockPlugin_0.new("TerrainEditor");
v13:GetMouse().UnitRay = Ray.new(Vector3.zero, Vector3.xAxis);
v13:GetMouse().X = 0;
v13:GetMouse().Y = 0;
local v14 = l_ContextServices_0.Analytics.mock();
local v15 = l_ContextServices_0.Localization.mock(v12);
local v16 = v7.mock(v13);
local v17 = v8.new(v13, v15);
local v18 = l_StudioServices_0.mock();
local v19 = v6(true);
local v20 = {
    v19, 
    v14, 
    v15, 
    v16, 
    v17, 
    v18, 
    (v9.mock(v16, v17, v14, v15, v19))
};
return function(v21, v22)
    assert(type(v21) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v22 or v20, v21);
end;
