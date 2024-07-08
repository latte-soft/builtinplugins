local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.SharedPluginConstants);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Http_0 = v4.Http;
local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
local v17 = require(l_Parent_0.Src.Resources.MakeTheme);
local v18 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v21 = require(l_Parent_0.Src.Components.MaterialBrowser);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v23 = require(l_Controllers_0.GeneralServiceController);
local v24 = require(l_Controllers_0.ImageUploader);
local v25 = require(l_Controllers_0.ImportAssetHandler);
local v26 = require(l_Controllers_0.ImageLoader);
local v27 = require(l_Controllers_0.MaterialServiceController);
local v28 = require(l_Controllers_0.PluginController);
local v29 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerUIChanges);
local v30 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v31 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerFixButtonState);
local v32 = v2.PureComponent:extend("MainPlugin");
v32.init = function(v33, v34)
    local l_Plugin_1 = v34.Plugin;
    v33.state = {
        enabled = false
    };
    v33.assetHandler = v25.new((v24.new((l_Http_0.Networking.new({
        isInternal = true
    })))));
    v33.imageLoader = v26.new();
    v33.setEnabled = function(v36)
        if v29() then
            l_MemStorageService_0:setItem(v13.MATERIAL_MANAGER_ENABLED, (tostring(v36)));
        end;
        v33:setState({
            enabled = v36
        });
    end;
    v33.toggleEnabled = function()
        if not v31() then
            v33:setState(function(v37)
                return {
                    enabled = not v37.enabled
                };
            end);
            return ;
        else
            v33.setEnabled(not v33.state.enabled);
            return ;
        end;
    end;
    v33.onClose = function()
        if not v31() then
            v33:setState({
                enabled = false
            });
            return ;
        else
            v33.setEnabled(false);
            return ;
        end;
    end;
    v33.onRestore = function(v38)
        if not v31() then
            v33:setState({
                enabled = v38
            });
            return ;
        else
            v33.setEnabled(v38);
            return ;
        end;
    end;
    v33.onWidgetEnabledChanged = function(v39)
        if not v31() then
            v33:setState({
                enabled = v39.Enabled
            });
            return ;
        else
            v33.setEnabled(v39.Enabled);
            return ;
        end;
    end;
    v33.store = v3.Store.new(v16, nil, {
        v3.thunkMiddleware
    }, nil);
    v33.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialManager"
    });
    v33.analytics = l_ContextServices_0.Analytics.new(v18);
    v33.materialServiceController = v27.new(v33.store);
    v33.generalServiceController = v23.new();
    v33.pluginController = v28.new(l_Plugin_1, v33.store, l_Plugin_1:getMouse(), v33.generalServiceController);
    v33.pluginController:initialize();
    if not (not game:GetEngineFeature("MaterialPickerBetaEnabled") and not game:GetFastFlag("ShowMaterialManagerFromElsewhere")) then
        l_MemStorageService_0:Bind(v13.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT, function()
            if not v31() then
                v33:setState({
                    enabled = true
                });
                return ;
            else
                v33.setEnabled(true);
                return ;
            end;
        end);
        if not v30() then
            l_MemStorageService_0:Bind(v13.DEPRECATED_HIDE_MATERIAL_MANAGER_PLUGIN_EVENT, function()
                v33.onClose();
            end);
        end;
    end;
end;
v32.willUnmount = function(v40)
    if v40.imageLoader then
        v40.imageLoader:destroy();
    end;
    if v40.materialServiceController then
        v40.materialServiceController:destroy();
    end;
    if v40.generalServiceController then
        v40.generalServiceController:destroy();
    end;
    if v40.pluginController then
        v40.pluginController:destroy();
    end;
end;
v32.renderButtons = function(v41, v42)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v42, 
            Active = v41.state.enabled, 
            Title = "MaterialManager", 
            Tooltip = "", 
            Icon = "", 
            OnClick = v41.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v32.render = function(v43)
    local l_props_0 = v43.props;
    local l_state_0 = v43.state;
    local l_Plugin_2 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if not (v31() or not v29()) then
        l_MemStorageService_0:setItem(v13.MATERIAL_MANAGER_ENABLED, not l_enabled_0 and "false" or "true");
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Store_0.new(v43.store), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v17(), 
        v43.localization, 
        v43.analytics, 
        v43.generalServiceController, 
        v43.materialServiceController, 
        v43.imageLoader, 
        v43.assetHandler, 
        v43.pluginController
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = "Edit", 
            RenderButtons = function(v48)
                return v43:renderButtons(v48);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "MaterialManager", 
            Enabled = l_enabled_0, 
            Title = v43.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(300, 200), 
            OnClose = v43.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v43.onRestore, 
            [v2.Change.Enabled] = if not v31() then nil else v43.toggleEnabled
        }, {
            v2.createElement(v21)
        })
    });
end;
return v32;
