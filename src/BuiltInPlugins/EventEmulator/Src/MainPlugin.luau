local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local _ = l_UI_0.PluginButton;
local _ = l_UI_0.PluginToolbar;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v16 = require(l_Parent_0.Src.Components.EventEmulator);
v1.setGlobalConfig({
    typeChecks = true, 
    propValidation = true, 
    elementTracing = true
});
local v17 = v1.PureComponent:extend("MainPlugin");
v17.init = function(v18, _)
    v18.state = {
        enabled = false
    };
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
    v18.onRestore = function(v20)
        v18:setState({
            enabled = v20
        });
    end;
    v18.onDockWidgetCreated = function()
        v18.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v18.toggleState);
    end;
    v18.onWidgetEnabledChanged = function(v21)
        v18:setState({
            enabled = v21.Enabled
        });
    end;
    v18.store = v2.Store.new(v3, {}, {
        v2.thunkMiddleware
    });
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = l_Parent_0.Name
    });
end;
v17.didUpdate = function(v22)
    v22.props.pluginLoaderContext.mainButton:SetActive(v22.state.enabled);
end;
v17.render = function(v23)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1)
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v23.localization:getText("Plugin", "Toolbar"), 
            Id = l_Parent_0.Name, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(310, 225), 
            MinSize = Vector2.new(310, 225), 
            OnClose = v23.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v23.onRestore, 
            OnWidgetCreated = v23.onDockWidgetCreated, 
            [v1.Change.Enabled] = v23.onWidgetEnabledChanged
        }, {
            MainProvider = l_enabled_0 and l_ContextServices_0.provide({
                l_Mouse_0.new(l_Plugin_1:getMouse()), 
                v13(), 
                l_Store_0.new(v23.store)
            }, {
                EventEmulator = v1.createElement(v16)
            })
        })
    });
end;
return v17;
