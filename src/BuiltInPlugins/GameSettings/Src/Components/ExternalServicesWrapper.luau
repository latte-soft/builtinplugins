local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.ContextServices.Dialog);
local v4 = v1.PureComponent:extend("ServiceWrapper");
v4.init = function(v5)
    assert(v5.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v5.props.localization ~= nil, "Expected a Localization object");
    assert(v5.props.mouse ~= nil, "Expected a mouse object");
    assert(v5.props.plugin ~= nil, "Expected a plugin object");
    assert(v5.props.pluginGui ~= nil, "Expected a pluginGui object");
    assert(v5.props.theme ~= nil, "Expected a PluginTheme object");
end;
v4.render = function(v6)
    local v7 = v6.props[v1.Children];
    local l_localization_0 = v6.props.localization;
    local l_mouse_0 = v6.props.mouse;
    local l_plugin_0 = v6.props.plugin;
    local l_pluginGui_0 = v6.props.pluginGui;
    local l_showDialog_0 = v6.props.showDialog;
    local l_store_0 = v6.props.store;
    local l_theme_0 = v6.props.theme;
    local l_worldRootPhysics_0 = v6.props.worldRootPhysics;
    local v16 = {
        l_ContextServices_0.Focus.new(l_pluginGui_0), 
        l_ContextServices_0.Plugin.new(l_plugin_0), 
        l_localization_0, 
        l_theme_0
    };
    if l_showDialog_0 then
        table.insert(v16, v3.new(l_showDialog_0));
    end;
    if l_store_0 then
        table.insert(v16, l_ContextServices_0.Store.new(l_store_0));
    end;
    table.insert(v16, l_ContextServices_0.API.new());
    table.insert(v16, l_ContextServices_0.Mouse.new(l_mouse_0));
    if l_worldRootPhysics_0 then
        table.insert(v16, l_worldRootPhysics_0);
    end;
    return l_ContextServices_0.provide(v16, v7);
end;
return v4;
