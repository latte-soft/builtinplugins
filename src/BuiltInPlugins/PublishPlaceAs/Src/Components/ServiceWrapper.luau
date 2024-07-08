local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = v1.PureComponent:extend("ServiceWrapper");
v3.init = function(v4)
    assert(v4.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v4.props.localization ~= nil, "Expected a Localization object");
    assert(v4.props.plugin ~= nil, "Expected a plugin object");
    assert(v4.props.store ~= nil, "Expected a Rodux Store object");
    assert(v4.props.theme ~= nil, "Expected a PluginTheme object");
    assert(v4.props.focusGui ~= nil, "Expected a FocusGui object");
    assert(v4.props.mouse ~= nil, "Expected a Mouse object");
end;
v3.render = function(v5)
    return l_ContextServices_0.provide({
        l_ContextServices_0.Focus.new(v5.props.focusGui), 
        l_ContextServices_0.Plugin.new(v5.props.plugin), 
        v5.props.localization, 
        v5.props.theme, 
        l_ContextServices_0.Store.new(v5.props.store), 
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Mouse.new(v5.props.mouse), 
        v5.props.calloutController
    }, v5.props[v1.Children]);
end;
return v3;
