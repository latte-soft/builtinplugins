local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v8 = game:getFastFlag("UserInputPlaybackPluginChooseRecordingNamePopUpFixStyle");
local v9 = v1.PureComponent:extend("ChooseRecordingNamePopUp");
v9.init = function(v10, v11)
    assert(v11.OnSaveButtonPressed, "OnSaveButtonPressed prop not defined");
    assert(v11.OnCancelButtonPressed, "OnCancelButtonPressed prop not defined");
    assert(v11.MessageLocalizationKey, "MessageLocalizationKey prop not defined");
    v10:setState({
        dialogInputValue = v11.DefaultInputValue or ""
    });
    v10.onTextInputChanged = function(v12)
        v10:setState({
            dialogInputValue = v12
        });
    end;
end;
v9.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_StyledDialog_0, {
        Title = l_Localization_0:getText("ChooseRecordingNamePopUp", "Title"), 
        OnClose = l_props_0.OnCancelButtonPressed, 
        OnButtonPressed = function(v17)
            if v17 == "Save" then
                l_props_0.OnSaveButtonPressed(v13.state.dialogInputValue);
                return ;
            else
                if v17 == "Cancel" then
                    l_props_0.OnCancelButtonPressed();
                end;
                return ;
            end;
        end, 
        Buttons = {
            {
                Key = "Save", 
                Text = l_Localization_0:getText("ChooseRecordingNamePopUp", "SaveButtonName"), 
                Style = "RoundPrimary"
            }, 
            {
                Key = "Cancel", 
                Text = l_Localization_0:getText("ChooseRecordingNamePopUp", "CancelButtonName"), 
                Style = "Round"
            }
        }, 
        MinContentSize = l_Stylizer_0.ContentSize
    }, {
        Container = v1.createElement(l_Pane_0, {
            Size = l_Stylizer_0.PanelSize, 
            Position = l_Stylizer_0.PanelPosition, 
            Spacing = l_Stylizer_0.PaddingPx, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Message = v1.createElement(l_TextLabel_0, {
                Size = l_Stylizer_0.DialogMessageSize, 
                Text = l_Localization_0:getText("ChooseRecordingNamePopUp", l_props_0.MessageLocalizationKey, {
                    numBytes = l_props_0.MessageLocalizationArgs[1]
                }), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            Input = v1.createElement(l_UI_0.TextInput, {
                Size = l_Stylizer_0.TextInputSize, 
                Text = v13.state.dialogInputValue, 
                OnTextChanged = v13.onTextInputChanged, 
                Style = not v8 and "RoundedBorder" or nil, 
                PlaceholderText = "", 
                LayoutOrder = 2
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9));
