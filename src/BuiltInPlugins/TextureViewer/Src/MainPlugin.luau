local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_PluginToolbar_0 = v3.UI.PluginToolbar;
local l_PluginButton_0 = v3.UI.PluginButton;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_Parent_0.Src.Components.App);
local v14 = v1.PureComponent:extend("MainPlugin");
v14.init = function(v15, _)
    v15:setState({
        enabled = false
    });
    v15.toggleEnabled = function()
        v15:setState(function(v17)
            return {
                enabled = not v17.enabled
            };
        end);
    end;
    v15.onClose = function()
        v15:setState({
            enabled = false
        });
    end;
    v15.onRestore = function(v18)
        v15:setState({
            enabled = v18
        });
    end;
    v15.onWidgetEnabledChanged = function(v19)
        v15:setState({
            enabled = v19.Enabled
        });
    end;
    v15.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TextureViewer"
    });
    v15.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v14.renderButtons = function(v20, v21)
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v21, 
            Active = v20.state.enabled, 
            Id = "template_button", 
            Title = v20.localization:getText("Plugin", "Button"), 
            Tooltip = v20.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v20.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v14.render = function(v22)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v22.localization, 
        v22.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v22.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v26)
                return v22:renderButtons(v26);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Enabled = l_state_0.enabled, 
            Title = v22.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(680, 480), 
            MinSize = Vector2.new(415, 100), 
            OnClose = v22.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v22.onRestore, 
            [v2.Change.Enabled] = v22.onWidgetEnabledChanged
        }, {
            App = v1.createElement(v13)
        })
    });
end;
return v14;
