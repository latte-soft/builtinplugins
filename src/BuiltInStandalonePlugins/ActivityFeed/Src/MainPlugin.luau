local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Styling_0 = v2.Styling;
local l_DockWidget_0 = v2.UI.DockWidget;
local l_PluginToolbar_0 = v2.UI.PluginToolbar;
local l_PluginButton_0 = v2.UI.PluginButton;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_registerPluginStyles_0 = l_Styling_0.registerPluginStyles;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local v15 = require(l_Parent_0.Src.Components.App);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, v18)
    v17.design = l_registerPluginStyles_0(v18.Plugin);
    v17.state = {
        enabled = false
    };
    v17.toggleEnabled = function()
        v17:setState(function(v19)
            return {
                enabled = not v19.enabled
            };
        end);
    end;
    v17.onClose = function()
        v17:setState({
            enabled = false
        });
    end;
    v17.onRestore = function(v20)
        v17:setState({
            enabled = v20
        });
    end;
    v17.onWidgetEnabledChanged = function(v21)
        v17:setState({
            enabled = v21.Enabled
        });
    end;
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ActivityFeed"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(v14);
end;
v16.renderButtons = function(v22, v23)
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v23, 
            Active = v22.state.enabled, 
            Title = "activity_feed_button", 
            Tooltip = v22.localization:getText("Plugin", "Description"), 
            OnClick = v22.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v16.render = function(v24)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v24.localization, 
        v24.analytics
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = "ActivityFeed", 
            RenderButtons = function(v28)
                return v24:renderButtons(v28);
            end
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "ActivityFeed", 
            Enabled = l_state_0.enabled, 
            Title = v24.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            [v1.Change.Enabled] = v24.onWidgetEnabledChanged
        }, {
            App = v1.createElement(v15, {
                plugin = l_Plugin_1
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v24.design
            })
        })
    });
end;
return v16;
