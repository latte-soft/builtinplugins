local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.ReactRoblox);
local v6 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v6.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local v15 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v18 = require(l_Parent_0.Src.Util.SelectionWrapper);
local v19 = require(l_Parent_0.Src.Components.App);
local v20 = v4.PureComponent:extend("MainPlugin");
v20.init = function(v21, _)
    v21:setState({
        enabled = false
    });
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
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TextureGenerator", 
        libraries = {
            [v6.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v6.Resources.SourceStrings, 
                translationResourceTable = v6.Resources.LocalizedStrings
            }
        }
    });
    v21.analytics = l_ContextServices_0.Analytics.new(v15);
end;
v20.renderButtons = function(v26, v27)
    return {
        Toggle = v4.createElement(l_PluginButton_0, {
            Toolbar = v27, 
            Active = v26.state.enabled, 
            Id = "textureButton", 
            Title = v26.localization:getText("Plugin", "Button"), 
            OnClick = v26.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.render = function(v28)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v28.localization, 
        v28.analytics, 
        v18.new(l_Selection_0)
    }, {
        Toolbar = v4.createElement(l_PluginToolbar_0, {
            Title = "TextureGenerator", 
            RenderButtons = function(v32)
                return v28:renderButtons(v32);
            end
        }), 
        MainWidget = v4.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "BuiltInTextureGenerator", 
            Enabled = l_state_0.enabled, 
            Title = v28.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(350, 480), 
            MinSize = Vector2.new(350, 480), 
            OnClose = v28.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v28.onRestore, 
            [v5.Change.Enabled] = v28.onWidgetEnabledChanged
        }, {
            App = v4.createElement(v19, {
                Plugin = l_Plugin_1
            })
        })
    });
end;
return v20;
