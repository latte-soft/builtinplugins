local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v10 = v1.PureComponent:extend("WarningDialog");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.MainBackground, 
        Size = UDim2.new(1, 0, 1, 0), 
        Spacing = 15
    }, {
        Message = v1.createElement(l_TextLabel_0, {
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Text = l_props_0.Text, 
            Size = UDim2.new(0, 400, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            TextColor3 = l_Stylizer_0.WarningText, 
            LayoutOrder = 1
        }), 
        Buttons = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Stylizer_0.MainBackground, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = 40, 
            LayoutOrder = 2
        }, {
            Confirm = v1.createElement(l_Button_0, {
                LayoutOrder = 1, 
                OnClick = l_props_0.OkCallback, 
                Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
                Style = "PrimeTextButton", 
                Text = l_Localization_0:getText("UploadDialogContent", "ConfirmButton")
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            Cancel = v1.createElement(l_Button_0, {
                LayoutOrder = 2, 
                OnClick = l_props_0.CancelCallback, 
                Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 0, l_Stylizer_0.ButtonHeight), 
                Style = "TextButton", 
                Text = l_Localization_0:getText("UploadDialogContent", "CancelButton")
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
