local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_MockPlugin_0 = v1.TestHelpers.Instances.MockPlugin;
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
return function()
    local v13 = l_MockPlugin_0.new("TerrainEditor");
    v13:GetMouse().UnitRay = Ray.new(Vector3.zero, Vector3.xAxis);
    v13:GetMouse().X = 0;
    v13:GetMouse().Y = 0;
    local v14 = v7.mock(v13);
    local v15 = l_Localization_0.mock(v12);
    local v16 = l_Analytics_0.mock();
    local v17 = v8.new(v13, v15);
    local v18 = v6(true);
    return {
        Analytics = v16, 
        Localization = v15, 
        PluginController = v14, 
        ShortcutController = v17, 
        StudioServices = l_StudioServices_0.mock(), 
        Stylizer = v18, 
        ToolController = v9.mock(v14, v17, v16, v15, v18)
    };
end;
