local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v6 = require(l_Parent_0.Src.Controllers.ServiceController);
local l_PluginButton_0 = v2.UI.PluginButton;
local v8 = v1.PureComponent:extend("StatusButton");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Localization_1 = l_props_0.Localization;
    local v12 = "rbxasset://textures/VRStatus/error.png";
    if v9.props.deviceName ~= "" then
        v12 = not v9.props.vrEnabled and "rbxasset://textures/VRStatus/warning.png" or "rbxasset://textures/VRStatus/ok.png";
    end;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = l_props_0.toolbar, 
            Active = l_props_0.enabled, 
            Id = "status_button", 
            Title = l_Localization_1:getText("StatusButton", "Title"), 
            Tooltip = l_Localization_1:getText("StatusButton", "Tooltip"), 
            Icon = v12, 
            OnClick = v9.props.showAlert, 
            ClickableWhenViewportHidden = true
        })
    };
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    ServiceController = v6
})(v8));
