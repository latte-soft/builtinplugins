local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = v1.PureComponent:extend("DeleteAllBreakpointsDialog");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_StyledDialog_0, {
        Style = "AcceptCancel", 
        Enabled = l_props_0.Enabled, 
        Modal = true, 
        Title = l_Localization_1:getText("BreakpointsWindow", "DeleteAll"), 
        MinContentSize = Vector2.new(300, 100), 
        Buttons = {
            {
                Key = "Yes", 
                Text = l_Localization_1:getText("BreakpointsWindow", "DeleteAllPopupYes")
            }, 
            {
                Key = "No", 
                Text = l_Localization_1:getText("BreakpointsWindow", "DeleteAllPopupNo")
            }
        }, 
        OnButtonPressed = function(v12)
            if v12 == "Yes" then
                l_props_0.DeleteAllBreakpoints();
            end;
            l_props_0.CloseDialog();
        end, 
        OnClose = function()
            l_props_0.CloseDialog();
        end
    }, {
        Contents = v1.createElement(l_TextLabel_0, {
            BackgroundTransparency = 1, 
            TextSize = 20, 
            Text = l_Localization_1:getText("BreakpointsWindow", "DeleteAllPopupText"), 
            TextColor3 = Color3.new(1, 1, 1), 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0)
        })
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_Localization_0
})(v8));
