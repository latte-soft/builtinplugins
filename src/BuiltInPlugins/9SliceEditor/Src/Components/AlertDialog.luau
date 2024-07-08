local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v9 = v1.PureComponent:extend("AlertDialog");
v9.init = function(v10, v11)
    v10:setState({
        enabled = v11.Enabled
    });
    v10.closeDialog = function()
        v10:setState({
            enabled = false
        });
        v10.props.OnClose();
    end;
end;
v9.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_StyledDialog_0, {
        Style = "Alert", 
        Enabled = v12.state.enabled, 
        Title = l_Localization_1:getText("AlertDialog", l_props_0.TitleKey), 
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_1:getText("AlertDialog", "OkButtonText")
            }
        }, 
        OnButtonPressed = v12.closeDialog, 
        OnClose = l_props_0.OnClose, 
        MinContentSize = l_Stylizer_0.PopupMessageSize, 
        Modal = true
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Size = UDim2.fromScale(0.95, 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Text = l_Localization_1:getText("AlertDialog", l_props_0.MessageKey, l_props_0.MessageKeyFormatTable), 
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
