local l_ImprovePluginSpeed_RobloxClassic_0 = game:GetFastFlag("ImprovePluginSpeed_RobloxClassic");
local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
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
local v16 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v19 = require(l_Parent_0.Src.Components.MainView);
local v20 = v3.PureComponent:extend("MainPlugin");
v20.initToolbarAndButton = function(v21, v22)
    v21.toolbar = v22.PluginLoaderContext.toolbar;
    v21.mainButton = v22.PluginLoaderContext.mainButton;
    v21.mainButton:SetActive(v21.state.enabled);
    v22.PluginLoaderContext.mainButtonClickedSignal:Connect(v21.toggleEnabled);
end;
v20.init = function(v23, v24)
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
    v23.store = v4.Store.new(v14, nil, {
        v4.thunkMiddleware
    }, nil);
    v23.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "RobloxClassic"
    });
    v23.analytics = l_ContextServices_0.Analytics.new(v16);
    if l_ImprovePluginSpeed_RobloxClassic_0 then
        v23:initToolbarAndButton(v24);
    end;
end;
v20.renderButtons = function(v28, v29)
    assert(not l_ImprovePluginSpeed_RobloxClassic_0);
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Toolbar = v29, 
            Active = v28.state.enabled, 
            Id = "RobloxClassicButton", 
            Title = v28.localization:getText("Plugin", "Button"), 
            Tooltip = v28.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/AnimationEditor/rigbuilder_blue.png", 
            OnClick = v28.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v20.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v30.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v15(), 
        v30.localization, 
        v30.analytics
    }, {
        Toolbar = if l_ImprovePluginSpeed_RobloxClassic_0 then nil else v3.createElement(l_PluginToolbar_0, {
            Title = "AvatarUnification", 
            RenderButtons = function(v35)
                return v30:renderButtons(v35);
            end
        }), 
        MainWidget = if not l_ImprovePluginSpeed_RobloxClassic_0 then v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "RobloxClassic", 
            Enabled = l_enabled_0, 
            Title = v30.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v30.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v30.onRestore, 
            [v3.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            MainView = l_enabled_0 and v3.createElement(v19)
        }) else v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "RobloxClassic", 
            Enabled = l_enabled_0, 
            Title = v30.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            OnClose = v30.onClose, 
            ShouldRestore = true, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetRestored = v30.onRestore, 
            [v3.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            MainView = l_enabled_0 and v3.createElement(v19)
        })
    });
end;
if l_ImprovePluginSpeed_RobloxClassic_0 then
    v20.didUpdate = function(v36)
        v36.mainButton:SetActive(v36.state.enabled);
    end;
end;
return v20;
