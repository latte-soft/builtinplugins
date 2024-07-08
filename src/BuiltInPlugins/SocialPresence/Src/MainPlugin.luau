local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = if not v4.SharedFlags.getFFlagDevFrameworkBetterInit() then v4.StudioUI.DockWidget else v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v9 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v12 = require(l_Parent_0.Src.Components.CollaboratorList);
local v13 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v14 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local l_RunService_0 = game:GetService("RunService");
local v16 = v2.PureComponent:extend("MainPlugin");
v16.init = function(v17, v18)
    v17:setState({
        enabled = false
    });
    v17.toggleEnabled = function()
        v17.analytics:report("panelToggled", not v17.state.enabled);
        v17:setState(function(v19)
            return {
                enabled = not v19.enabled
            };
        end);
    end;
    v17.onClose = function()
        v17.analytics:report("panelToggled", false);
        v17:setState({
            enabled = false
        });
    end;
    v17.onRestore = function(v20)
        v17:setState({
            enabled = v20
        });
    end;
    v17.onWidgetEnabledChanged = function(v21)
        v17:setState({
            enabled = v21.Enabled
        });
    end;
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "SocialPresence"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(v14);
    v18.EnableSignal.Event:Connect(v17.toggleEnabled);
end;
v16.render = function(v22)
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v9(), 
        v22.localization, 
        v22.analytics, 
        v13.new(l_CollaboratorsService_0)
    }, {
        MainWidget = v2.createElement(v5, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "SocialPresence", 
            Enabled = l_state_0.enabled and l_RunService_0:IsEdit(), 
            Title = v22.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v22.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v22.onRestore, 
            [v3.Change.Enabled] = v22.onWidgetEnabledChanged
        }, {
            CollaboratorList = v2.createElement(v12)
        })
    });
end;
return v16;
