local l_COLLAB6395SocialPresenceStylesheets_0 = game:GetFastFlag("COLLAB6395SocialPresenceStylesheets");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local v9 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v13 = not not l_COLLAB6395SocialPresenceStylesheets_0 and require(l_Components_0.CollaboratorRibbon) or require(l_Components_0.DEPRECATED_CollaboratorRibbon);
local v14 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v15 = require(l_Parent_0.Src.Util.AnalyticsHandlers);
local v16 = v2.PureComponent:extend("RibbonPlugin");
v16.init = function(v17, v18)
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "SocialPresence"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(v15);
    if l_COLLAB6395SocialPresenceStylesheets_0 then
        v17.design = l_registerPluginStyles_0(v18.Plugin);
    end;
end;
v16.render = function(v19)
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local l_props_0 = v19.props;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        not not l_COLLAB6395SocialPresenceStylesheets_0 and l_StudioTheme_0.new() or v9(), 
        v19.localization, 
        v19.analytics, 
        v14.new(l_CollaboratorsService_0)
    }, {
        RibbonComponent = v2.createElement(v13, {
            Widget = l_props_0.Widget, 
            OnClick = l_props_0.OnClick
        }), 
        StyleLink = not not l_COLLAB6395SocialPresenceStylesheets_0 and v2.createElement("StyleLink", {
            StyleSheet = v19.design
        }) or nil
    });
end;
return v16;
