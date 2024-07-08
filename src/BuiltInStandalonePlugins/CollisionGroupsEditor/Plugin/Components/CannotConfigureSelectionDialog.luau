local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local v4 = require(script.Parent.Parent.Constants);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = v1.Component:extend("CannotConfigureSelectionDialog");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_CannotConfigureSelectionDialog_0 = l_props_0.Stylizer.CannotConfigureSelectionDialog;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(l_StyledDialog_0, {
        Style = "Alert", 
        Enabled = not v10.state.userRequestedDialogNeverShow and l_props_0.Enabled, 
        Title = l_Localization_0:getText("CannotConfigureSelectionDialog", "DialogWindowTitle", {
            v4.CursorGroupName
        }), 
        MinContentSize = l_CannotConfigureSelectionDialog_0.DialogMinimumSize, 
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_0:getText("RenameWarningDialog", "Ok")
            }
        }, 
        OnButtonPressed = l_props_0.OnClose, 
        OnClose = l_props_0.OnClose
    }, {
        Contents = v1.createElement(l_Pane_0, {
            Style = "Box", 
            Layout = Enum.FillDirection.Vertical
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                TextWrapped = true, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_Localization_0:getText("CannotConfigureSelectionDialog", "WarningMessage", {
                    (("<b>%*</b>"):format(v4.CursorGroupName))
                })
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9));
