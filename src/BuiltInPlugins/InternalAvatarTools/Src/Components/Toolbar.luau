local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = v1.PureComponent:extend("Toolbar");
v10.renderButtons = function(v11, v12)
    return {
        Export = v1.createElement(l_PluginButton_0, {
            Active = false, 
            Toolbar = v12, 
            Title = v11.props.Localization:getText("Plugin", "Export"), 
            Tooltip = v11.props.Localization:getText("Plugin", "ExportTip"), 
            OnClick = v11.props.onExportClicked, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v10.render = function(v13)
    return v1.createElement(l_PluginToolbar_0, {
        Title = v13.props.Localization:getText("Plugin", "Name"), 
        RenderButtons = function(v14)
            return v13:renderButtons(v14);
        end
    });
end;
return (l_withContext_0({
    Plugin = l_Plugin_0, 
    Localization = l_Localization_0
})(v10));
