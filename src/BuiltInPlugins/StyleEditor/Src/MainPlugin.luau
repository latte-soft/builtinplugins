local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.ReactRoblox);
local v6 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v6.UI.DockWidget;
local l_registerPluginStyles_0 = v6.Styling.registerPluginStyles;
local l_ContextServices_0 = v6.ContextServices;
local l_Networking_0 = v6.Http.Networking;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v14 = require(l_Parent_0.Src.Util.createStore);
local v15 = require(l_Parent_0.Src.Util.recordChange);
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local v17 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v18 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local v19 = require(l_Parent_0.Src.Components.AppRoot);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v21 = require(l_Thunks_0.Telemetry.SendPluginMountedEvent);
local v22 = require(l_Thunks_0.Telemetry.SendPluginUnmountedEvent);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v25 = v4.PureComponent:extend("MainPlugin");
v25.init = function(v26)
    local l_props_0 = v26.props;
    v26.firstRender = true;
    v26:setState({
        enabled = false
    });
    v26.toggleEnabled = function()
        v26:setState(function(v28)
            return {
                enabled = not v28.enabled
            };
        end);
    end;
    v26.onClose = function()
        v26:setState({
            enabled = false
        });
    end;
    v26.onRestore = function(v29)
        v26:setState({
            enabled = v29
        });
    end;
    v26.onWidgetEnabledChanged = function(v30)
        v26:setState({
            enabled = v30.Enabled
        });
    end;
    v26.onDockWidgetCreated = function()
        v26.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v26.toggleEnabled);
    end;
    v26.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StyleEditor", 
        libraries = {
            [v6.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v6.Resources.SourceStrings, 
                translationResourceTable = v6.Resources.LocalizedStrings
            }
        }
    });
    v26.telemetry = v18.new(l_MessageBusService_0);
    v26.design = l_registerPluginStyles_0(l_props_0.Plugin);
    v26.store = v14({
        Localization = v26.localization, 
        Networking = l_Networking_0.new({
            isInternal = true
        }), 
        Plugin = l_props_0.Plugin, 
        Telemetry = v26.telemetry, 
        recordChange = v15(l_ChangeHistoryService_0)
    });
    l_props_0.Plugin.Unloading:Connect(function()
        if v26.store then
            v26.store:dispatch(v22());
            v26.store:flush();
        end;
    end);
end;
v25.didUpdate = function(v31)
    v31.props.PluginLoaderContext.mainButton:SetActive(v31.state.enabled);
    if v31.firstRender then
        v31.firstRender = false;
        v31.store:dispatch(v21((os.clock() - v31.props.LoadStartTimestamp) * 1000));
    end;
end;
v25.render = function(v32)
    local l_props_1 = v32.props;
    local l_state_0 = v32.state;
    local l_Plugin_1 = l_props_1.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v32.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v32.localization, 
        v17.new(v32.telemetry), 
        v16()
    }, {
        MainWidget = v4.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "StyleEditor", 
            Enabled = l_state_0.enabled, 
            Title = v32.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(580, 500), 
            OnClose = v32.onClose, 
            ShouldRestore = true, 
            Widget = l_props_1.PluginLoaderContext.mainDockWidget, 
            OnWidgetRestored = v32.onRestore, 
            OnWidgetCreated = v32.onDockWidgetCreated, 
            [v5.Change.Enabled] = v32.onWidgetEnabledChanged
        }, {
            AppRoot = v4.createElement(v19), 
            StyleLink = v4.createElement("StyleLink", {
                StyleSheet = v32.design
            })
        })
    });
end;
return v25;
