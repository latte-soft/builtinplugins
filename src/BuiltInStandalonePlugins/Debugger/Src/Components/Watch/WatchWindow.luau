local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_Parent_0.Src.Components.Watch.WatchComponent);
local v9 = v2.PureComponent:extend("WatchWindow");
v9.render = function(v10)
    local l_props_0 = v10.props;
    return v2.createElement(l_DockWidget_0, {
        Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "Watch", 
        Title = l_props_0.Localization:getText("Watch", "WindowName"), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        InitialDockState = Enum.InitialDockState.Bottom, 
        Size = Vector2.new(640, 480), 
        MinSize = Vector2.new(250, 200), 
        Enabled = l_props_0.Enabled, 
        OnClose = l_props_0.OnClose, 
        ShouldRestore = true, 
        OnWidgetRestored = l_props_0.OnRestore, 
        [v2.Change.Enabled] = l_props_0.OnWidgetEnabledChanged
    }, {
        Watch = v2.createElement(v8)
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0
})(v9));
