local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v17 = require(l_Parent_0.Src.Components.MainView);
local v18 = require(l_Parent_0.Src.Util.DMBridge);
local v19 = require(l_Parent_0.Src.Util.Enums);
local v20 = v2.PureComponent:extend("MainPlugin");
v20.init = function(v21, _)
    v21.state = {
        enabled = false
    };
    v18.setPluginEnabled(false);
    v21.toggleEnabled = function()
        v21:setState(function(v23)
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function()
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.store = v3.Store.new(v13, nil, {
        v3.thunkMiddleware
    }, nil);
    v21.roduxStateChangedConnection = v21.store.changed:connect(function(v26, _)
        v18.setRoduxState(v26);
    end);
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "UserInputPlayback"
    });
    v21.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v20.renderButtons = function(v28, v29)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v29, 
            Active = v28.state.enabled, 
            Title = v28.localization:getText("Plugin", "Button"), 
            Tooltip = v28.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v28.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.didMount = function(_)
    v18.setPluginState(v19.PluginState.Default);
end;
v20.didUpdate = function(v31, _, _)
    v18.setPluginEnabled(v31.state.enabled);
end;
v20.willUnmount = function(v34)
    if v34.roduxStateChangedConnection then
        v34.roduxStateChangedConnection.disconnect();
    end;
end;
v20.render = function(v35)
    local l_props_0 = v35.props;
    local l_state_0 = v35.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v35.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v35.localization, 
        v35.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v35.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v40)
                return v35:renderButtons(v40);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "UserInputPlayback", 
            Enabled = l_enabled_0, 
            Title = v35.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(360, 480), 
            MinSize = Vector2.new(360, 200), 
            OnClose = v35.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v35.onRestore, 
            [v2.Change.Enabled] = v35.onWidgetEnabledChanged
        }, {
            MainView = l_enabled_0 and v2.createElement(v17)
        })
    });
end;
return v20;
