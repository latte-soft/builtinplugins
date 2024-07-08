local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v4 = require(l_Parent_0.Src.ContextServices.NetworkContext);
local v5 = v2.PureComponent:extend("ServiceWrapper");
v5.init = function(v6, _)
    assert(v6.props[v2.Children] ~= nil, "Expected child elements to wrap");
    assert(v6.props.networkInterface ~= nil, "Expected a NetworkInterface object");
    assert(v6.props.localization ~= nil, "Expected a Localization object");
    assert(v6.props.plugin ~= nil, "Expected a plugin object");
    assert(v6.props.mouse ~= nil, "Expected a mouse object");
    assert(v6.props.store ~= nil, "Expected a Rodux Store object");
    assert(v6.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v6.props.focusGui ~= nil, "Expected a FocusGui object");
end;
v5.render = function(v8)
    local l_props_0 = v8.props;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Store.new(l_props_0.store), 
        l_ContextServices_0.Focus.new(l_props_0.focusGui), 
        l_props_0.theme, 
        l_props_0.localization, 
        l_ContextServices_0.Plugin.new(l_props_0.plugin), 
        v4.new(l_props_0.networkInterface), 
        l_ContextServices_0.Mouse.new(l_props_0.mouse)
    }, v8.props[v2.Children]);
end;
return v5;
