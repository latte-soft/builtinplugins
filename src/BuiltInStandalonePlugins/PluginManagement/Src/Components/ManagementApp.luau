local v0 = game:DefineFastFlag("PluginManagementFixBlankPage", false);
local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local _ = require(l_Parent_0.Src.Components.ManagementMainView);
local v5 = require(l_Parent_0.Src.Components.Navigation.NavigationContainer);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local v8 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local _ = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v16 = require(l_Parent_0.Src.Resources.makeTheme);
local v17 = v3.PureComponent:extend("ManagementApp");
v17.init = function(v18)
    local _ = v18.props.plugin;
    v18.state = {
        enabled = false, 
        killDockWidget = false
    };
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PluginInstallation"
    });
    v18.theme = v16;
    v18.toggleState = function()
        v18:setState({
            enabled = not v18.state.enabled
        });
    end;
    v18.onClose = function()
        v18:setState({
            enabled = false
        });
    end;
    if v0 then
        v18.onWidgetEnabledChanged = function(v20)
            v18:setState({
                enabled = v20.Enabled
            });
        end;
    end;
    v18.props.plugin.MultipleDocumentInterfaceInstance.DataModelSessionEnded:connect(function(_)
        v18:setState({
            enabled = false, 
            killDockWidget = true
        });
    end);
end;
v17.getDerivedStateFromProps = function(_, v23)
    if not v23.enabled then
        return ;
    else
        return {
            killDockWidget = false
        };
    end;
end;
v17.renderButtons = function(v24, v25)
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Toolbar = v25, 
            Active = v24.state.enabled, 
            Title = "luaManagePluginsButton", 
            OnClick = v24.toggleState
        })
    };
end;
v17.render = function(v26)
    local l_props_0 = v26.props;
    local l_plugin_1 = l_props_0.plugin;
    local l_store_0 = l_props_0.store;
    local l_api_0 = l_props_0.api;
    local l_analytics_0 = l_props_0.analytics;
    local l_enabled_0 = v26.state.enabled;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_plugin_1), 
        v8.new(l_api_0)
    }, {
        Toolbar = v3.createElement(l_PluginToolbar_0, {
            Title = "luaManagePluginsToolbar", 
            RenderButtons = function(v33)
                return v26:renderButtons(v33);
            end
        }), 
        MainWidget = not v26.state.killDockWidget and v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "PluginManagement", 
            Enabled = l_enabled_0, 
            Title = v26.localization:getText("Manage", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(600, 560), 
            MinSize = Vector2.new(600, 180), 
            OnClose = v26.onClose, 
            ShouldRestore = false, 
            [v3.Change.Enabled] = if not v0 then nil else v26.onWidgetEnabledChanged
        }, {
            MainProvider = l_enabled_0 and l_ContextServices_0.provide({
                v26.localization, 
                v26.theme, 
                l_ContextServices_0.Store.new(l_store_0), 
                l_ContextServices_0.Mouse.new(l_plugin_1:GetMouse()), 
                l_analytics_0
            }, {
                MainView = v3.createElement(v5)
            })
        })
    });
end;
return v17;
