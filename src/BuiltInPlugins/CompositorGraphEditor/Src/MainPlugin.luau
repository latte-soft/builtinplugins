local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v14 = require(l_Parent_0.Src.Reducers.MainReducer);
local v15 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v19 = require(l_Components_0.ExampleComponent);
local v20 = require(l_Components_0.ExampleRoactRoduxComponent);
local v21 = v2.PureComponent:extend("MainPlugin");
v21.init = function(v22, _)
    v22:setState({
        enabled = false
    });
    v22.toggleEnabled = function()
        v22:setState(function(v24)
            return {
                enabled = not v24.enabled
            };
        end);
    end;
    v22.onClose = function()
        v22:setState({
            enabled = false
        });
    end;
    v22.onRestore = function(v25)
        v22:setState({
            enabled = v25
        });
    end;
    v22.onWidgetEnabledChanged = function(v26)
        v22:setState({
            enabled = v26.Enabled
        });
    end;
    v22.store = v4.Store.new(v14, nil, {
        v4.thunkMiddleware
    }, nil);
    v22.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CompositorGraphEditor"
    });
    v22.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v21.renderButtons = function(v27, v28)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = v27.state.enabled, 
            Id = "template_button", 
            Title = v27.localization:getText("Plugin", "Button"), 
            Tooltip = v27.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v27.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v21.render = function(v29)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v29.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v15(), 
        v29.localization, 
        v29.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v29.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v33)
                return v29:renderButtons(v33);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "CompositorGraphEditor", 
            Enabled = l_state_0.enabled, 
            Title = v29.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v29.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v29.onRestore, 
            [v3.Change.Enabled] = v29.onWidgetEnabledChanged
        }, {
            ExampleComponent = v2.createElement(v19), 
            ExampleRoactRoduxComponent = v2.createElement(v20)
        })
    });
end;
return v21;
