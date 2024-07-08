local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Packages_0.Framework);
local l_Networking_0 = v4.Http.Networking;
local l_ContextServices_0 = v4.ContextServices;
local l_ThemeSwitcher_0 = v4.Style.ThemeSwitcher;
local l_Signal_0 = v4.Util.Signal;
local v9 = require(l_Parent_0.Core.Util.Settings);
local v10 = require(l_Parent_0.Core.Util.ToolboxTheme);
local v11 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v12 = require(l_Parent_0.Core.Networking.NetworkInterfaceMock);
local v13 = require(l_Parent_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v15 = require(l_Parent_0.Core.Components.ExternalServicesWrapper);
local v16 = require(l_Parent_0.Core.ContextServices.Settings);
local v17 = require(l_Parent_0.Core.Util.makeTheme);
local v18 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v19 = require(l_Parent_0.TestUtils.CoreTestUtils);
return function(v20)
    local v21 = v20.store or v3.Store.new(v11, nil, (v19.createThunkMiddleware()));
    if v20.storeSetup then
        v20.storeSetup(v21);
    end;
    local v22 = v20.pluginGui or nil;
    local v23 = v20.settings or v9.new(plugin);
    return v2.createElement(v15, {
        store = v21, 
        plugin = plugin, 
        pluginGui = v22, 
        settings = v23, 
        theme = v20.legacyTheme or v10.createDummyThemeManager(), 
        networkInterface = v20.networkInterface or v12.new()
    }, {
        l_ContextServices_0.provide({
            l_ContextServices_0.Store.new(v21), 
            v16.new(v23), 
            l_ContextServices_0.API.new({
                networking = l_Networking_0.mock()
            }), 
            v13.new(v20.assetAnalytics or v14.mock()), 
            v17(v18(), l_ThemeSwitcher_0), 
            (l_ContextServices_0.Localization.new({
                stringResourceTable = l_Parent_0.LocalizationSource.SourceStrings, 
                translationResourceTable = l_Parent_0.LocalizationSource.LocalizedStrings, 
                pluginName = "Toolbox", 
                libraries = {
                    [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                        stringResourceTable = v4.Resources.SourceStrings, 
                        translationResourceTable = v4.Resources.LocalizedStrings
                    }
                }, 
                overrideGetLocale = function()
                    return "en-us";
                end, 
                overrideLocaleId = "en-us", 
                overrideLocaleChangedSignal = l_Signal_0.new()
            }))
        }, v20[v2.Children])
    });
end;
