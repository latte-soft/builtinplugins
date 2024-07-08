local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_AudioDiscoveryLoader_0 = game:GetFastFlag("AudioDiscoveryLoader");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = require(l_Parent_0.Src.Actions.UpdateRows);
local l_ThunkWithArgsMiddleware_0 = v5.Util.ThunkWithArgsMiddleware;
local l_UI_0 = v5.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v5.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_makeTheme_0 = v5.Style.makeTheme;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v20 = require(l_Parent_0.Src.Components.Window);
local v21 = require(l_Parent_0.Src.Actions.SetDialog);
local v22 = require(l_Parent_0.Src.Actions.Unpause);
local v23 = require(l_Parent_0.Src.Thunks.DiscoverAudio);
local v24 = require(l_Parent_0.Src.Util.Analytics);
local v25 = v3.PureComponent:extend("MainPlugin");
v25.init = function(v26, v27)
    v26.state = {
        enabled = false
    };
    v26.toggleEnabled = function()
        local v28 = not v26.state.enabled;
        v26.setEnabled(v28);
        if v28 then
            v26.store:dispatch(v22());
            v26.store:dispatch(v23());
        end;
    end;
    v26.onClose = function()
        v26.setEnabled(false);
    end;
    v26.onRestore = function(v29)
        v26.setEnabled(v29);
    end;
    v26.onWidgetEnabledChanged = function(v30)
        v26.setEnabled(v30.Enabled);
    end;
    v26.setEnabled = function(v31)
        v26:setState({
            enabled = v31
        });
    end;
    v26.onDockWidgetCreated = function()
        v26.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v26.toggleEnabled);
    end;
    v26.store = v4.Store.new(v16, nil, {
        l_ThunkWithArgsMiddleware_0({
            SoundAssetChecker = v27.SoundAssetChecker
        })
    }, nil);
    v26.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AudioDiscovery"
    });
    v26.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v25.didUpdate = function(v32)
    if v32.state.enabled and game.CreatorId == 0 then
        v32.store:dispatch(v21(true));
    end;
    if v32.props.pluginLoaderContext then
        v32.props.pluginLoaderContext.mainButton:SetActive(v32.state.enabled);
    end;
end;
v25.didMount = function(v33)
    v24:reportOpen();
    v33.connection = v33.props.SoundAssetChecker.soundsFound:Connect(function(v34)
        v33.store:dispatch(v6(v34));
    end);
end;
v25.willUnmount = function(v35)
    v35.connection:Disconnect();
end;
v25.renderButtons = function(v36, v37)
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Id = "ViewSounds", 
            Toolbar = v37, 
            Active = v36.state.enabled, 
            Title = v36.localization:getText("Plugin", "Button"), 
            Tooltip = v36.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/AudioDiscovery/icon.png", 
            OnClick = v36.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v25.render = function(v38)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v38.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        l_makeTheme_0(l_Parent_0.Src.Components)(), 
        v38.localization, 
        v38.analytics
    }, {
        Toolbar = if not l_AudioDiscoveryLoader_0 then v3.createElement(l_PluginToolbar_0, {
            Title = v38.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v42)
                return v38:renderButtons(v42);
            end
        }) else nil, 
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "AudioDiscovery", 
            Widget = if not l_AudioDiscoveryLoader_0 then nil else l_props_0.pluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = if not l_AudioDiscoveryLoader_0 then nil else v38.onDockWidgetCreated, 
            Enabled = l_state_0.enabled, 
            Title = v38.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v38.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v38.onRestore, 
            [v3.Change.Enabled] = v38.onWidgetEnabledChanged
        }, {
            Window = v3.createElement(v20)
        })
    });
end;
return v25;
