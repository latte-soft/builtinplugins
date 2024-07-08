return require(script:FindFirstAncestor("AnimationClipEditor").Src.Components.PluginWidget.PluginWidget)("DockWidget", function(v0, v1)
    local l_props_0 = v0.props;
    local l_Plugin_0 = l_props_0.Plugin;
    if not l_props_0.Widget then
        return l_Plugin_0:CreateDockWidgetPluginGui(v1, (DockWidgetPluginGuiInfo.new(l_props_0.InitialDockState, l_props_0.InitialEnabled, l_props_0.InitialEnabledShouldOverrideRestore, l_props_0.Size.X, l_props_0.Size.Y, l_props_0.MinSize.X, l_props_0.MinSize.Y)));
    else
        return l_props_0.Widget;
    end;
end);
