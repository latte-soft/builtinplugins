local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactRoblox);
local v5 = require(l_Parent_0.Packages.Rodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v11 = game:DefineFastFlag("CDCompositorDebuggerIcon", false);
local l_ContextServices_0 = v6.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Resources_0 = l_Parent_0.Src.Resources;
local v18 = require(l_Resources_0.AnalyticsHandlers);
local v19 = require(l_Resources_0.MakeTheme);
local l_SourceStrings_0 = l_Resources_0.SourceStrings;
local l_LocalizedStrings_0 = l_Resources_0.LocalizedStrings;
local v22 = require(l_Parent_0.Src.Components.MainComponent);
local v23 = v3.PureComponent:extend("MainPlugin");
v23.init = function(v24, _)
    v24:setState({
        enabled = false
    });
    v24.toggleEnabled = function()
        v24:setState(function(v26)
            return {
                enabled = not v26.enabled
            };
        end);
    end;
    v24.onClose = function()
        v24:setState({
            enabled = false
        });
    end;
    v24.onRestore = function(v27)
        v24:setState({
            enabled = v27
        });
    end;
    v24.onWidgetEnabledChanged = function(v28)
        v24:setState({
            enabled = v28.Enabled
        });
    end;
    v24.store = v5.Store.new(v16, nil, {
        v5.thunkMiddleware
    }, nil);
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CompositorDebugger"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(v18);
end;
v23.renderButtons = function(v29, v30)
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Toolbar = v30, 
            Active = v29.state.enabled, 
            Id = not v11 and "template_button" or "CompositorDebuggerButton", 
            Title = v29.localization:getText("Plugin", "Button"), 
            Tooltip = v29.localization:getText("Plugin", "Description"), 
            Icon = not v11 and "rbxasset://textures/GameSettings/ToolbarIcon.png" or nil, 
            OnClick = v29.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v23.render = function(v31)
    local l_props_0 = v31.props;
    local l_state_0 = v31.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v31.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v19(), 
        v31.localization, 
        v31.analytics
    }, {
        Toolbar = v3.createElement(l_PluginToolbar_0, {
            Title = if not v11 then v31.localization:getText("Plugin", "Toolbar") else "CompositorToolbar", 
            RenderButtons = function(v36)
                return v31:renderButtons(v36);
            end
        }), 
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "CompositorDebugger", 
            Enabled = l_enabled_0, 
            Title = v31.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(350, 200), 
            OnClose = v31.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v31.onRestore, 
            [v4.Change.Enabled] = v31.onWidgetEnabledChanged
        }, {
            MainComponent = l_enabled_0 and v3.createElement(v22)
        })
    });
end;
return v23;
