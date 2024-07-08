local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Packages.AvatarToolsShared);
local v6 = require(l_Parent_0.Packages.Framework);
local v7 = require(l_Parent_0.Packages.React);
local v8 = require(l_Parent_0.Packages.ReactRoblox);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v6.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local v17 = require(l_Parent_0.Src.Util.SelectionWrapper);
local v18 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local v19 = require(l_Parent_0.Src.Util.makePluginActions);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v23 = require(l_Components_0.App);
local v24 = require(l_Components_0.TestInExperienceManager);
local v25 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v26 = require(l_Parent_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v27 = v7.PureComponent:extend("MainPlugin");
v27.init = function(v28)
    v28:setState({
        enabled = false
    });
    v28.toggleEnabled = function()
        v28:setState(function(v29)
            return {
                enabled = not v29.enabled
            };
        end);
    end;
    v28.onClose = function()
        v28:setState({
            enabled = false
        });
    end;
    v28.onRestore = function(v30)
        v28:setState({
            enabled = v30
        });
    end;
    v28.onWidgetEnabledChanged = function(v31)
        v28:setState({
            enabled = v31.Enabled
        });
    end;
    v28.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AvatarCompatibilityPreviewer"
    });
    if v25() then
        v28.pluginActions = l_ContextServices_0.PluginActions.new(v28.props.Plugin, v19(v28.props.Plugin, v28.localization));
    end;
    if v26() then
        v28.onImporterValidateUgcRequestConnection = l_MemStorageService_0:Bind("ValidateUgcBody", function()
            v28:setState({
                enabled = true
            });
        end);
    end;
    v28.analytics = l_ContextServices_0.Analytics.new(v18);
end;
v27.renderButtons = function(v32, v33)
    return {
        Toggle = v7.createElement(l_PluginButton_0, {
            Toolbar = v33, 
            Active = v32.state.enabled, 
            Id = "previewAvatar", 
            Title = v32.localization:getText("Plugin", "Button"), 
            OnClick = v32.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
if v26() then
    v27.willUnmount = function(v34)
        if v34.onImporterValidateUgcRequestConnection ~= nil then
            v34.onImporterValidateUgcRequestConnection:Disconnect();
            v34.onImporterValidateUgcRequestConnection = nil;
        end;
    end;
end;
v27.render = function(v35)
    local l_props_0 = v35.props;
    local l_state_0 = v35.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v40 = {
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v16(), 
        v35.localization, 
        v35.analytics, 
        v5.Contexts.PreviewContext.new()
    };
    if v25() then
        table.insert(v40, v35.pluginActions);
    end;
    table.insert(v40, v17.new(l_Selection_0));
    return l_ContextServices_0.provide(v40, {
        Toolbar = v7.createElement(l_PluginToolbar_0, {
            Title = "AvatarPreviewer", 
            RenderButtons = function(v41)
                return v35:renderButtons(v41);
            end
        }), 
        TestInExperienceManager = if not l_RunService_0:IsRunning() then v7.createElement(v24) else nil, 
        MainWidget = v7.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "AvatarCompatibilityPreviewer", 
            Enabled = l_enabled_0, 
            Title = v35.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(450, 600), 
            MinSize = Vector2.new(240, 250), 
            OnClose = v35.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v35.onRestore, 
            [v8.Change.Enabled] = v35.onWidgetEnabledChanged
        }, {
            App = v35.state.enabled and v7.createElement(v23)
        })
    });
end;
return v27;
