return require(script.Parent.Parent.Parent.Parent.Core.Components.PluginWidget.PluginWidget)("DockWidget", function(v0, v1)
    local l_props_0 = v0.props;
    local l_plugin_0 = l_props_0.plugin;
    if not l_props_0.Widget then
        return l_plugin_0:CreateDockWidgetPluginGui(v1, (DockWidgetPluginGuiInfo.new(l_props_0.InitialDockState, l_props_0.InitialEnabled, l_props_0.InitialEnabledShouldOverrideRestore, l_props_0.FloatingXSize, l_props_0.FloatingYSize, l_props_0.MinWidth, l_props_0.MinHeight)));
    else
        return l_props_0.Widget;
    end;
end);
