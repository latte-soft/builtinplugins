local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_DockWidget_0 = v5.UI.DockWidget;
local v11 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v12 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v15 = require(l_Parent_0.Src.Components.MainView);
local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
local v17 = require(l_Parent_0.Src.Thunks.LoadPluginMetadata);
local v18 = require(l_Parent_0.Src.Util.Analytics);
local v19 = Vector2.new(380, 250);
local v20 = v3.PureComponent:extend("MainPlugin");
v20.init = function(v21)
    v21.state = {
        enabled = false
    };
    v21.store = v4.Store.new(v16, {}, {
        v4.thunkMiddleware
    });
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "LocalizationTools"
    });
    v21.theme = v12();
    v21.api = l_ContextServices_0.API.new();
    v21.analyticsImpl = v18.new();
    v21.toggleState = function()
        local l_enabled_0 = v21.state.enabled;
        v21:setState({
            enabled = not l_enabled_0
        });
        if not l_enabled_0 then
            v21.analyticsImpl:reportToolOpened(1);
            v21.analyticsImpl:reportButtonPress("tools", "open");
            return ;
        else
            v21.analyticsImpl:reportButtonPress("tools", "closed");
            return ;
        end;
    end;
    v21.onRestore = function(v23)
        v21:setState({
            enabled = v23
        });
    end;
    v21.onDockWidgetCreated = function()
        v21.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v21.toggleState);
    end;
    v21.onDockWidgetEnabledChanged = function(v24)
        v21:setState({
            enabled = v24.Enabled
        });
    end;
    v21.onClose = function()
        v21:setState({
            enabled = false
        });
    end;
    v21.button = v21.props.pluginLoaderContext.mainButton;
end;
v20.didMount = function(v25)
    if l_RunService_0:IsEdit() then
        local v26 = v25.api:get();
        local l_localization_0 = v25.localization;
        local l_store_0 = v25.store;
        l_store_0:dispatch(v17.GetAll(v26, l_localization_0));
        game:GetPropertyChangedSignal("GameId"):Connect(function()
            l_store_0:dispatch(v17.OnGameIdChanged(v26, l_localization_0));
        end);
        return ;
    else
        return ;
    end;
end;
v20.didUpdate = function(v29)
    v29.button:SetActive(v29.state.enabled);
end;
v20.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_1 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1)
    }, {
        MainWidget = l_RunService_0:IsEdit() and v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "LocalizationTools", 
            Enabled = l_enabled_1, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v30.localization:getText("Plugin", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = v19, 
            Size = v19, 
            OnClose = v30.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v30.onRestore, 
            OnWidgetCreated = v30.onDockWidgetCreated, 
            [v3.Change.Enabled] = v30.onDockWidgetEnabledChanged
        }, {
            MainProvider = l_enabled_1 and l_ContextServices_0.provide({
                l_Mouse_0.new(l_Plugin_1:getMouse()), 
                l_Store_0.new(v30.store), 
                v30.api, 
                v30.localization, 
                v30.theme, 
                v11.new(v30.analyticsImpl)
            }, {
                MainView = v3.createElement(v15)
            })
        })
    });
end;
return v20;
