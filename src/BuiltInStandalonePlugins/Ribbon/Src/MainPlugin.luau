local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v11 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v17 = require(l_Components_0.ExampleComponent);
local v18 = require(l_Components_0.ExampleRoduxComponent);
local v19 = v1.PureComponent:extend("MainPlugin");
v19.init = function(v20, v21)
    v20.state = {
        enabled = false
    };
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
    v20.onDockWidgetCreated = function()
        v20.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v20.toggleEnabled);
    end;
    v20.store = v2.Store.new(v11, nil, {
        v2.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Ribbon"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v20.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v20.design = l_registerPluginStyles_0(v21.Plugin);
end;
v19.didUpdate = function(v25)
    v25.props.PluginLoaderContext.mainButton:SetActive(v25.state.enabled);
end;
v19.render = function(v26)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v26.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v26.DEPRECATED_stylizer, 
        v26.localization, 
        v26.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "Ribbon", 
            Enabled = l_state_0.enabled, 
            Title = v26.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v26.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v26.onDockWidgetCreated, 
            [v1.Change.Enabled] = v26.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                ExampleComponent = v1.createElement(v17), 
                ExampleRoduxComponent = v1.createElement(v18)
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v26.design
            })
        })
    });
end;
return v19;
