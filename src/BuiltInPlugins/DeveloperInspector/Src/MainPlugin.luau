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
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local v14 = require(l_Parent_0.Src.Reducers.MainReducer);
local v15 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v19 = require(l_Components_0.InspectorProvider);
local v20 = require(l_Components_0.MainView);
local v21 = v2.PureComponent:extend("MainPlugin");
v21.init = function(v22)
    v22.state = {
        enabled = false
    };
    v22.toggleEnabled = function()
        v22:setState(function(v23)
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v22.onClose = function()
        v22:setState({
            enabled = false
        });
    end;
    v22.onRestore = function(v24)
        v22:setState({
            enabled = v24
        });
    end;
    v22.onWidgetEnabledChanged = function(v25)
        v22:setState({
            enabled = v25.Enabled
        });
    end;
    v22.store = v3.Store.new(v14, nil, {
        v3.thunkMiddleware
    });
    v22.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DeveloperInspector", 
        libraries = {
            [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v4.Resources.SourceStrings, 
                translationResourceTable = v4.Resources.LocalizedStrings
            }
        }
    });
    v22.pluginActions = l_PluginActions_0.new(v22.props.Plugin, {
        ToggleProfileRoact = {
            id = "ToggleProfileRoact", 
            text = "Toggle Roact Profiler", 
            defaultShortcut = "Ctrl+Shift+R", 
            allowBinding = false
        }
    });
end;
v21.renderButtons = function(v26, v27)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v27, 
            Active = v26.state.enabled, 
            Title = v26.localization:getText("Plugin", "Button"), 
            Tooltip = v26.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/DeveloperInspector/ToolbarIcon.png", 
            OnClick = v26.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v21.render = function(v28)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v28.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v15(), 
        v28.pluginActions, 
        v28.localization
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v28.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v33)
                return v28:renderButtons(v33);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "DeveloperInspector", 
            Enabled = l_enabled_0, 
            Title = v28.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v28.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v28.onRestore
        }, {
            InspectorProvider = v2.createElement(v19, {
                Active = l_enabled_0
            }, {
                MainView = v2.createElement(v20, {
                    Active = l_enabled_0
                })
            })
        })
    });
end;
return v21;
