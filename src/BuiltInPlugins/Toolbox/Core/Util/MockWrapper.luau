local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Rodux);
local l_provideMockContext_0 = require(l_Packages_0.Framework).TestHelpers.provideMockContext;
local v5 = require(l_Parent_0.Core.Util.Settings);
local v6 = require(l_Parent_0.Core.Util.ToolboxTheme);
local v7 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v8 = require(l_Parent_0.Core.Networking.NetworkInterfaceMock);
local v9 = require(l_Parent_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v10 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v11 = require(l_Parent_0.Core.Components.ExternalServicesWrapper);
local v12 = require(l_Parent_0.Core.Util.makeTheme);
local v13 = require(l_Packages_0.Framework);
local l_Networking_0 = v13.Http.Networking;
local l_ContextServices_0 = v13.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Signal_0 = v13.Util.Signal;
local v18 = require(l_Parent_0.Core.ContextServices.Settings);
local v19 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v20 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v21 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v22 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v23 = require(l_Parent_0.TestUtils.CoreTestUtils);
local l_MockPlugin_0 = v13.TestHelpers.Instances.MockPlugin;
local v25 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
return function(v26)
    local v27 = v26.store or v3.Store.new(v7, nil, (v23.createThunkMiddleware()));
    if v26.storeSetup then
        v26.storeSetup(v27);
    end;
    local v28 = if not v25() then v26.plugin or nil else v26.plugin or l_MockPlugin_0.new();
    local v29 = v26.pluginGui or nil;
    local v30 = v26.settings or v5.new(v28);
    local v31 = v26.theme or v6.createDummyThemeManager();
    local v32 = v26.networkInterface or v8.new();
    return v2.createElement(v11, {
        store = v27, 
        plugin = v28, 
        pluginGui = v29, 
        settings = v30, 
        theme = v31, 
        networkInterface = v32
    }, {
        MockContextProvider = l_provideMockContext_0({
            l_ContextServices_0.Store.new(v27), 
            l_ContextServices_0.Focus.new(v26.focus or Instance.new("ScreenGui")), 
            l_Mouse_0.new({
                Icon = "rbxasset://SystemCursors/Arrow"
            }), 
            l_ContextServices_0.Plugin.new(v28), 
            v18.new(v30), 
            v12(v21()), 
            l_ContextServices_0.API.new({
                networking = l_Networking_0.mock()
            }), 
            v9.new(v26.assetAnalytics or v10.mock()), 
            l_ContextServices_0.Analytics.mock(), 
            l_ContextServices_0.Localization.new({
                stringResourceTable = l_Parent_0.LocalizationSource.SourceStrings, 
                translationResourceTable = l_Parent_0.LocalizationSource.LocalizedStrings, 
                pluginName = "Toolbox", 
                libraries = {
                    [v13.Resources.LOCALIZATION_PROJECT_NAME] = {
                        stringResourceTable = v13.Resources.SourceStrings, 
                        translationResourceTable = v13.Resources.LocalizedStrings
                    }
                }, 
                overrideGetLocale = function()
                    return "en-us";
                end, 
                overrideLocaleId = "en-us", 
                overrideLocaleChangedSignal = l_Signal_0.new()
            }), 
            v26.ixpContext or v19.createMock(), 
            v20.new(), 
            (v22.new(v32))
        }, v26[v2.Children])
    });
end;
