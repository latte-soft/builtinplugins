local v0 = require(script.Parent.Parent.Parent.Packages.Roact);
local v1 = require(script.Parent.Parent.Util.Symbol).named("StudioPlugin");
local v2 = v0.PureComponent:extend("PluginProvider");
v2.init = function(v3)
    local l_plugin_0 = v3.props.plugin;
    assert(l_plugin_0 ~= nil, "PluginProvider expected to be given the plugin");
    v3._context[v1] = l_plugin_0;
end;
v2.render = function(v5)
    return v0.oneChild(v5.props[v0.Children]);
end;
return {
    Provider = v2, 
    getPlugin = function(v6)
        assert(v6 ~= nil, "A component must be provided");
        assert(v6._context[v1] ~= nil, "A PluginProvider was not put into the Roact tree");
        return v6._context[v1];
    end
};
