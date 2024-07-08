local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.ContextServices.DraftsService);
local v4 = v1.PureComponent:extend("ServiceWrapper");
v4.init = function(v5)
    assert(v5.props[v1.Children] ~= nil, "Expected child elements to wrap");
    assert(v5.props.draftsService ~= nil, "Expected a DraftsService object");
    assert(v5.props.localization ~= nil, "Expected a Localization object");
    assert(v5.props.plugin ~= nil, "Expected a plugin object");
    assert(v5.props.store ~= nil, "Expected a Rodux Store object");
    assert(v5.props.theme ~= nil, "Expected a PluginTheme object");
end;
v4.render = function(v6)
    return l_ContextServices_0.provide({
        l_ContextServices_0.Store.new(v6.props.store), 
        l_ContextServices_0.Focus.new(v6.props.focusGui), 
        v6.props.theme, 
        v6.props.localization, 
        l_ContextServices_0.Plugin.new(v6.props.plugin), 
        v3.new(v6.props.draftsService)
    }, v6.props[v1.Children]);
end;
return v4;
