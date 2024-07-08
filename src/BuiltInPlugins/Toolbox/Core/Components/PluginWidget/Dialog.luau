return require(script.Parent.Parent.Parent.Parent.Core.Components.PluginWidget.PluginWidget)("Dialog", function(v0, v1)
    local l_props_0 = v0.props;
    local l_plugin_0 = l_props_0.plugin;
    local _ = nil;
    return l_plugin_0:CreateQWidgetPluginGui(v1, l_props_0.options or {
        Size = l_props_0.Size or nil, 
        MinSize = l_props_0.MinSize or nil, 
        Resizable = l_props_0.Resizable or nil, 
        Modal = l_props_0.Modal or nil, 
        InitialEnabled = not l_props_0.InitialEnabled and true or l_props_0.InitialEnabled
    });
end);
