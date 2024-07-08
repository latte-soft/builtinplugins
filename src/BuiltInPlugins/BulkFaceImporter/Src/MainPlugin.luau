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
local v18 = require(l_Parent_0.Src.Components.mainUIComponent);
local v19 = v2.PureComponent:extend("MainPlugin");
v19.init = function(v20, _)
    v20:setState({
        enabled = false
    });
    v20.toggleEnabled = function()
        v20:setState(function(v22)
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v20.onClose = function()
        v20:setState({
            enabled = false
        });
    end;
    v20.onRestore = function(v23)
        v20:setState({
            enabled = v23
        });
    end;
    v20.onWidgetEnabledChanged = function(v24)
        v20:setState({
            enabled = v24.Enabled
        });
    end;
    v20.store = v4.Store.new(v14, nil, {
        v4.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "BulkFaceImporter"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v19.renderButtons = function(v25, v26)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v26, 
            Active = v25.state.enabled, 
            Id = "template_button", 
            Title = v25.localization:getText("Plugin", "Button"), 
            Tooltip = v25.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            OnClick = v25.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v19.render = function(v27)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v27.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v15(), 
        v27.localization, 
        v27.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = v27.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v31)
                return v27:renderButtons(v31);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "BulkFaceImporter", 
            Enabled = l_state_0.enabled, 
            Title = v27.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v27.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v27.onRestore, 
            [v3.Change.Enabled] = v27.onWidgetEnabledChanged
        }, {
            mainUIComponent = v2.createElement(v18)
        })
    });
end;
return v19;
