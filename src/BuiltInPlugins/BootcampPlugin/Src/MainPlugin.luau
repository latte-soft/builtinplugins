local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v12 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v15 = require(l_Parent_0.Src.Components.Aggregator);
local v16 = v2.PureComponent:extend("MainPlugin");
v16.init = function(v17, _)
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
        pluginName = "BootcampPlugin"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v16.renderButtons = function(v22, v23)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v23, 
            Active = v22.state.enabled, 
            Id = "BootcampPluginButton", 
            Title = v22.localization:getText("Plugin", "Button"), 
            Tooltip = v22.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
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
        v12(), 
        v24.localization, 
        v24.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v24.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v28)
                return v24:renderButtons(v28);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "Bootcamp", 
            Enabled = l_state_0.enabled, 
            Title = v24.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            [v3.Change.Enabled] = v24.onWidgetEnabledChanged
        }, {
            Aggregator = v2.createElement(v15, {})
        })
    });
end;
return v16;
