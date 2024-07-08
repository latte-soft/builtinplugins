local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsTable);
local v8 = v2.PureComponent:extend("BreakpointWindow");
v8.render = function(v9)
    local l_props_0 = v9.props;
    return v2.createElement(l_DockWidget_0, {
        Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "Breakpoints", 
        Title = l_props_0.Localization:getText("BreakpointsWindow", "WindowName"), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        InitialDockState = Enum.InitialDockState.Bottom, 
        Size = Vector2.new(750, 480), 
        MinSize = Vector2.new(250, 200), 
        Enabled = l_props_0.Enabled, 
        OnClose = l_props_0.OnClose, 
        ShouldRestore = true, 
        OnWidgetRestored = l_props_0.OnRestore, 
        [v2.Change.Enabled] = l_props_0.OnWidgetEnabledChanged
    }, {
        BreakpointsTable = v2.createElement(v7)
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_Localization_0
})(v8));
