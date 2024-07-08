local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
local v11 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v15 = require(l_Components_0.PublishFrame);
local v16 = require(l_Components_0.ExampleRoactRoduxComponent);
local v17 = v2.PureComponent:extend("MainPlugin");
v17.init = function(v18, _)
    v18.state = {
        enabled = false
    };
    v18.toggleEnabled = function()
        v18:setState(function(v20)
            return {
                enabled = not v20.enabled
            };
        end);
    end;
    v18.onClose = function()
        v18:setState({
            enabled = false
        });
    end;
    v18.onRestore = function(v21)
        v18:setState({
            enabled = v21
        });
    end;
    v18.onDockWidgetCreated = function()
        v18.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v18.toggleEnabled);
    end;
    v18.onWidgetEnabledChanged = function(v22)
        v18:setState({
            enabled = v22.Enabled
        });
    end;
    v18.store = v3.Store.new(v10, nil, {
        v3.thunkMiddleware
    }, nil);
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "NestedPackagePublisher"
    });
    v18.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v17.didUpdate = function(v23)
    v23.props.pluginLoaderContext.mainButton:SetActive(v23.state.enabled);
end;
v17.render = function(v24)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v24.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v11(), 
        v24.localization, 
        v24.analytics
    }, {
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "NestedPackagePublisher", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v24.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            OnWidgetCreated = v24.onDockWidgetCreated, 
            [v2.Change.Enabled] = v24.onWidgetEnabledChanged
        }, {
            PublishFrame = v2.createElement(v15, {
                Enabled = l_enabled_0
            }), 
            ExampleRoactRoduxComponent = v2.createElement(v16)
        })
    });
end;
return v17;
