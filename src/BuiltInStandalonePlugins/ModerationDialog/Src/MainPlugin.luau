local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Design_0 = l_ContextServices_0.Design;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v12 = require(l_script_FirstAncestor_0.Src.Components.DialogContainer);
local v13 = v1.PureComponent:extend("MainPlugin");
v13.init = function(v14, v15)
    v14.state = {
        enabled = false
    };
    v14.toggleEnabled = function()
        v14:setState(function(v16)
            return {
                enabled = not v16.enabled
            };
        end);
    end;
    v14.onClose = function()
        v14:setState({
            enabled = false
        });
    end;
    v14.onRestore = function(v17)
        v14:setState({
            enabled = v17
        });
    end;
    v14.onWidgetEnabledChanged = function(v18)
        v14:setState({
            enabled = v18.Enabled
        });
    end;
    v14.onDockWidgetCreated = function()
        v14.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v14.toggleEnabled);
    end;
    v14.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ModerationDialog"
    });
    v14.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v14.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v14.design = l_registerPluginStyles_0(v15.Plugin);
end;
v13.didUpdate = function(v19)
    v19.props.PluginLoaderContext.mainButton:SetActive(v19.state.enabled);
end;
local v20 = {
    punishedUserId = 123456789, 
    interventionId = "af9j230-34j1-2314-jfji-123j43i2oj", 
    punishmentId = 0, 
    messageToUser = "Roblox does not permit discriminatory language, behavior, or content of any kind.", 
    punishmentTypeDescription = "Ban 1 Day", 
    beginDate = "2024-05-01T22:27:27.378Z", 
    endDate = "2024-05-02T22:27:27.378Z", 
    badUtterances = {
        {
            abuseType = "ABUSE_TYPE_DISCRIMINATORY", 
            utteranceText = "some discriminatory text", 
            imageUrl = "null"
        }, 
        {
            abuseType = "ABUSE_TYPE_SPAM", 
            utteranceText = "XDDDDD", 
            imageUrl = "null"
        }, 
        {
            abuseType = "ABUSE_TYPE_SEXUAL_CONTENT", 
            utteranceText = "Asset Name:TEST Asset ID:17357472299", 
            imageUrl = "null"
        }
    }, 
    verificationCategory = "", 
    consequenceTransparencyMessage = "", 
    showAppealsProcessLink = false, 
    agreedCheckBoxExperimentVariant = "null"
};
v13.render = function(v21)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local _ = v21.localization;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v21.localization, 
        v21.analytics, 
        l_Design_0.new(v21.design)
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "ModerationDialog", 
            Enabled = false, 
            Title = v21.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v21.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v21.onDockWidgetCreated, 
            [v1.Change.Enabled] = v21.onWidgetEnabledChanged
        }, {
            DialogContainer = v1.createElement(v12, {
                Reason = v20.badUtterances[1], 
                ReviewDateTime = v20.beginDate, 
                ModeratorNote = v20.messageToUser, 
                Enabled = l_enabled_0
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v21.design
            })
        })
    });
end;
return v13;
