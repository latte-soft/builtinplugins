local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local _ = l_UI_0.Button;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v10 = v1.Component:extend("GroupRenameDialog");
v10.init = function(v11)
    v11:setState({
        neverShowCheckboxToggled = false, 
        userRequestedDialogNeverShow = false
    });
    v11.toggleDialogNeverShow = function()
        v11:setState(function(v12)
            return {
                neverShowCheckboxToggled = not v12.userRequestedDialogNeverShow
            };
        end);
    end;
end;
v10.render = function(v13)
    local l_props_0 = v13.props;
    local l_GroupRenameDialog_0 = l_props_0.Stylizer.GroupRenameDialog;
    local l_Localization_0 = l_props_0.Localization;
    local v17 = l_props_0.Plugin:get();
    return v1.createElement(l_StyledDialog_0, {
        Style = "Alert", 
        Enabled = not v13.state.userRequestedDialogNeverShow and l_props_0.Enabled, 
        Title = l_Localization_0:getText("RenameWarningDialog", "DialogWindowTitle"), 
        MinContentSize = l_GroupRenameDialog_0.DialogMinimumSize, 
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_0:getText("RenameWarningDialog", "Ok")
            }
        }, 
        OnButtonPressed = function(_)
            l_props_0.OnClose();
            v17:SetSetting("userRequestedRenameDialogNeverShow", v13.state.neverShowCheckboxToggled);
            v13:setState(function(v19)
                return {
                    userRequestedDialogNeverShow = v19.neverShowCheckboxToggled
                };
            end);
        end, 
        OnClose = function()
            l_props_0.OnClose();
        end
    }, {
        Contents = v1.createElement(l_Pane_0, {
            Style = "Box", 
            Layout = Enum.FillDirection.Vertical, 
            Padding = l_GroupRenameDialog_0.Padding, 
            Spacing = l_GroupRenameDialog_0.Spacing
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                TextWrapped = true, 
                Size = l_GroupRenameDialog_0.WarningTextSize, 
                Text = l_Localization_0:getText("RenameWarningDialog", "WarningMessage")
            }), 
            Checkbox = v1.createElement(l_Checkbox_0, {
                LayoutOrder = 2, 
                Text = l_Localization_0:getText("RenameWarningDialog", "DontShowThisWarningAgain"), 
                Checked = v13.state.neverShowCheckboxToggled, 
                OnClick = v13.toggleDialogNeverShow
            })
        })
    });
end;
v10.didMount = function(v20)
    v20:setState({
        userRequestedDialogNeverShow = v20.props.Plugin:get():GetSetting("userRequestedRenameDialogNeverShow")
    });
end;
return (l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
