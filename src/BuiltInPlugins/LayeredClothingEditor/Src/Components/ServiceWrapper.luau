local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_ContextServices_0 = v2.ContextServices;
local l_AssetServiceWrapper_0 = v3.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v3.Contexts.StudioServiceWrapper;
local l_MannequinContext_0 = v3.Contexts.MannequinContext;
local v8 = v1.PureComponent:extend("ServiceWrapper");
v8.init = function(v9)
    assert(v9.props.analytics ~= nil, "Expected a Analytics object");
    assert(v9.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v9.props.localization ~= nil, "Expected a Localization object");
    assert(v9.props.plugin ~= nil, "Expected a plugin object");
    assert(v9.props.store ~= nil, "Expected a Rodux Store object");
    assert(v9.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v9.props.mouse ~= nil, "Expected a PluginMouse object");
    assert(v9.props.pluginActions ~= nil, "Expect a PluginActions object");
    assert(v9.props.signals ~= nil, "Expect a Signals object");
    assert(v9.props.editingItemContext ~= nil, "Expect a EditingItemContext");
    assert(v9.props.meshEditingContext ~= nil, "Expect a LuaMeshEditingModuleContext");
end;
v8.render = function(v10)
    return l_ContextServices_0.provide({
        v10.props.plugin, 
        v10.props.analytics, 
        v10.props.localization, 
        v10.props.theme, 
        l_ContextServices_0.Store.new(v10.props.store), 
        l_ContextServices_0.API.new(), 
        v10.props.pluginActions, 
        v10.props.signals, 
        l_ContextServices_0.Mouse.new(v10.props.mouse), 
        v10.props.editingItemContext, 
        v10.props.meshEditingContext, 
        l_AssetServiceWrapper_0.new(), 
        l_StudioServiceWrapper_0.new(), 
        l_MannequinContext_0.new()
    }, v10.props[v1.Children]);
end;
return v8;
