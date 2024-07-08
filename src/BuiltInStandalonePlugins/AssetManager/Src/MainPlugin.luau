local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v17 = require(l_script_FirstAncestor_0.Src.Components.App);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v19 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v20 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v21 = require(l_script_FirstAncestor_0.Src.Networking);
local v22 = v1.PureComponent:extend("MainPlugin");
v22.init = function(v23, v24)
    v23.state = {
        enabled = false
    };
    v23.toggleEnabled = function()
        v23:setState(function(v25)
            return {
                enabled = not v25.enabled
            };
        end);
    end;
    v23.onClose = function()
        v23:setState({
            enabled = false
        });
    end;
    v23.onRestore = function(v26)
        v23:setState({
            enabled = v26
        });
    end;
    v23.onWidgetEnabledChanged = function(v27)
        v23:setState({
            enabled = v27.Enabled
        });
    end;
    v23.onDockWidgetCreated = function()
        v23.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v23.toggleEnabled);
    end;
    v23.store = v2.Store.new(v12, nil, {
        v2.thunkMiddleware
    }, nil);
    v23.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AssetManager"
    });
    v23.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v23.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v23.design = l_registerPluginStyles_0(v24.Plugin);
    v23.networking = v21.new();
    v23.pluginController = v20.new(v24.Plugin, v23.networking, v23.localization);
    v23.explorerController = v18.new(v23.pluginController, v23.networking);
    v23.itemsController = v19.new(v23.pluginController, v23.networking);
end;
v22.didUpdate = function(v28)
    v28.props.PluginLoaderContext.mainButton:SetActive(v28.state.enabled);
end;
v22.willUnmount = function(v29)
    v29.pluginController:destroy();
    v29.explorerController:destroy();
    v29.itemsController:destroy();
end;
v22.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v30.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v30.DEPRECATED_stylizer, 
        v30.localization, 
        v30.analytics, 
        v30.pluginController, 
        v30.explorerController, 
        v30.itemsController, 
        v30.networking
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AssetManager", 
            Enabled = l_state_0.enabled, 
            Title = v30.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v30.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v30.onDockWidgetCreated, 
            [v1.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                App = v1.createElement(v17), 
                KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(v34)
                        v30.pluginController:addKeyPress(v34.KeyCode);
                    end, 
                    OnKeyReleased = function(v35)
                        v30.pluginController:removeKeyPress(v35.KeyCode);
                    end
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v30.design
            })
        })
    });
end;
return v22;
