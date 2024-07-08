local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_DockWidget_0 = v4.UI.DockWidget;
local v7 = require(l_Parent_0.Src.Components.MainView);
local v8 = require(l_Parent_0.Src.Util.CreatePluginGlobals);
local v9 = require(l_Parent_0.Src.Util.Constants);
local v10 = v3.PureComponent:extend("PlayerEmulatorPlugin");
local v11 = Vector2.new(320, 330);
v10.updateToolbarButtonActiveState = function(v12)
    local l_active_0 = v12.state.active;
    if v12.button then
        v12.button:SetActive(l_active_0);
    end;
end;
v10.initPluginWidgetStatus = function(v14)
    local l_Setting_0 = v14.props.plugin:GetSetting(v9.PLUGIN_WIDGET_STATE);
    if l_Setting_0 ~= v14.state.active then
        v14:setState({
            active = l_Setting_0
        });
    end;
end;
v10.init = function(v16)
    v16.state = {
        active = false
    };
    v16.contextItems = {
        l_ContextServices_0.Plugin.new(v16.props.plugin), 
        v8.localization, 
        v8.theme, 
        v8.networking, 
        v8.store, 
        l_ContextServices_0.Mouse.new(v16.props.plugin:GetMouse())
    };
    v16.toggleActive = function()
        local l_plugin_0 = v16.props.plugin;
        local v18 = not v16.state.active;
        v16:setState({
            active = v18
        });
        l_plugin_0:SetSetting(v9.PLUGIN_WIDGET_STATE, v18);
    end;
    v16.onClose = function()
        v16:setState({
            active = false
        });
        v16.props.plugin:SetSetting(v9.PLUGIN_WIDGET_STATE, false);
    end;
    v16.onWidgetEnabledChanged = function(v19)
        v16:setState({
            active = v19.Enabled
        });
    end;
    v16.onAncestryChanged = function(_, _, v22)
        if not (v22 or not v16.props.onPluginWillDestroy) then
            v16.props.onPluginWillDestroy();
        end;
    end;
    v16.button = v16.props.pluginLoaderContext.mainButton;
    v16.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v16.toggleActive);
end;
v10.didMount = function(v23)
    v23:initPluginWidgetStatus();
    v23:updateToolbarButtonActiveState();
end;
v10.didUpdate = function(v24)
    v24:updateToolbarButtonActiveState();
end;
v10.render = function(v25)
    local l_active_1 = v25.state.active;
    return l_ContextServices_0.provide(v25.contextItems, {
        MainWidget = l_RunService_0:IsEdit() and v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "PlayerEmulator", 
            Enabled = l_active_1, 
            Title = v8.localization:getText("Meta", "PluginTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = v11, 
            MinSize = v11, 
            OnClose = v25.onClose, 
            ShouldRestore = false, 
            [v3.Change.Enabled] = v25.onWidgetEnabledChanged
        }, {
            MainView = l_active_1 and v3.createElement(v7)
        })
    });
end;
return v10;
