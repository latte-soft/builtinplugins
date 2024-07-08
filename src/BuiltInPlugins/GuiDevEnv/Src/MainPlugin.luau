local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_DockWidget_0 = v3.UI.DockWidget;
local v7 = v2.PureComponent:extend("MainPlugin");
v7.init = function(v8, _)
    v8.onClose = function()
    end;
    v8.onRestore = function(_)
    end;
    v8.mouse = v8.props.plugin:GetMouse();
end;
v7.render = function(v11)
    local l_plugin_0 = v11.props.plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_plugin_0)
    }, {
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "GuiDevEnv", 
            Enabled = false, 
            Title = l_plugin_0.Name, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v11.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v11.onRestore
        })
    });
end;
return v7;
