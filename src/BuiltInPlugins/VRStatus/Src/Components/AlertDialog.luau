local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = v1.PureComponent:extend("AlertDialog");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    local v14 = l_Localization_1:getText("AlertDialog", "NoDeviceDetected");
    if v10.props.deviceName ~= "" then
        v14 = v10.props.deviceName .. " " .. l_Localization_1:getText("AlertDialog", "Detected") .. ". " .. if not v10.props.vrEnabled then l_Localization_1:getText("AlertDialog", "ModeOff") else l_Localization_1:getText("AlertDialog", "ModeOn");
    end;
    return v1.createElement(l_StyledDialog_0, {
        Style = "Alert", 
        Enabled = v10.props.enabled, 
        Title = "VR Status Information", 
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_1:getText("AlertDialog", "OkButtonText")
            }
        }, 
        OnButtonPressed = l_props_0.OnClose, 
        OnClose = l_props_0.OnClose, 
        MinContentSize = l_Stylizer_0.PopupMessageSize, 
        Modal = true
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Size = UDim2.fromScale(0.95, 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Text = v14, 
            TextColor = l_Stylizer_0.TextColor, 
            TextWrapped = true, 
            TextSize = l_Stylizer_0.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
