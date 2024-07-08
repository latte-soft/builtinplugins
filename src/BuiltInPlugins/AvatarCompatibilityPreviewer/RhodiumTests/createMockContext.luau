local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local v5 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local _ = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v7 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v8 = require(l_script_FirstAncestor_0.Src.Util.makePluginActions);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_MockAnalyticsService_0 = v2.TestHelpers.Instances.MockAnalyticsService;
local l_MockSelectionService_0 = v2.TestHelpers.Instances.MockSelectionService;
local l_MockPlugin_0 = v2.TestHelpers.Instances.MockPlugin;
local l_jest_0 = v3.jest;
return function()
    local v16 = l_MockPlugin_0.new();
    local v17 = l_MockAnalyticsService_0.new();
    local v18 = l_MockSelectionService_0.new();
    local v19, v20 = l_jest_0.fn();
    local v21, v22 = l_jest_0.fn();
    local v23 = {
        v2.ContextServices.Plugin.new(v16), 
        v4(true), 
        v2.ContextServices.Analytics.new(v7, v17), 
        v1.Contexts.PreviewContext.new(), 
        v5.new(v18)
    };
    if v9() then
        table.insert(v23, (l_ContextServices_0.PluginActions.new(v16, v8(v16, l_Localization_0.mock()))));
    end;
    return {
        context = v23, 
        plugin = v16, 
        analyticsService = v17, 
        selectionService = v18, 
        placesService = {
            startPlaySolo = v19, 
            stopPlaySolo = v21
        }
    }, {
        placesService = {
            startPlaySolo = v20, 
            stopPlaySolo = v22
        }
    };
end;
