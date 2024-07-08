local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v4 = require(l_Parent_0.Core.ContextServices.Settings);
local v5 = require(l_Parent_0.Core.Util.makeTheme);
local v6 = v2.PureComponent:extend("ToolboxServiceWrapper");
v6.render = function(v7)
    local l_props_0 = v7.props;
    local l_localization_0 = l_props_0.localization;
    local l_plugin_0 = l_props_0.plugin;
    local l_settings_0 = l_props_0.settings;
    local l_store_0 = l_props_0.store;
    local _ = l_props_0.theme;
    local l_analytics_0 = l_props_0.analytics;
    local _ = l_props_0.ixp;
    return l_ContextServices_0.provide({
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        l_localization_0, 
        v5(), 
        l_ContextServices_0.Store.new(l_store_0), 
        v4.new(l_settings_0), 
        l_ContextServices_0.Mouse.new((l_plugin_0:GetMouse())), 
        l_analytics_0, 
        l_props_0.assetAnalytics, 
        l_props_0.ixp
    }, l_props_0[v2.Children]);
end;
return v6;
