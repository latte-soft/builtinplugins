local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = require(l_Parent_0.Core.Util.Constants);
local v12 = require(l_Parent_0.Core.Util.Images);
local v13 = Vector2.new(400, 70);
local v14 = v3.PureComponent:extend("WarningDialog");
local v15 = {
    Accept = true, 
    Cancel = false
};
v14.init = function(v16)
    v16.onButtonPressed = function(v17)
        local l_props_0 = v16.props;
        if v17 == v15.Accept then
            l_props_0.OnAccepted(l_props_0.ConfirmationKey);
            return ;
        else
            l_props_0.OnCanceled();
            return ;
        end;
    end;
end;
v14.render = function(v19)
    local l_props_1 = v19.props;
    local l_publishAsset_0 = l_props_1.Stylizer.publishAsset;
    local l_AcceptText_0 = l_props_1.AcceptText;
    local l_CancelText_0 = l_props_1.CancelText;
    local l_Description_0 = l_props_1.Description;
    local l_Enabled_0 = l_props_1.Enabled;
    local l_Heading_0 = l_props_1.Heading;
    local l_OnCanceled_0 = l_props_1.OnCanceled;
    local l_Title_0 = l_props_1.Title;
    local v29 = l_LayoutOrderIterator_0.new();
    return v3.createElement(l_StyledDialog_0, {
        Buttons = {
            {
                Key = v15.Cancel, 
                Text = l_CancelText_0
            }, 
            {
                Key = v15.Accept, 
                Text = l_AcceptText_0
            }
        }, 
        Enabled = l_Enabled_0 == true, 
        FitTextButtonWidth = true, 
        MinContentSize = v13, 
        Modal = true, 
        OnButtonPressed = v19.onButtonPressed, 
        OnClose = l_OnCanceled_0, 
        Style = "AssetConfigWarningDialog", 
        Title = l_Title_0
    }, {
        Contents = v3.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = 20, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Icon = v3.createElement("ImageLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Image = v12.WARNING_ICON, 
                ImageColor3 = l_publishAsset_0.warningIconColor, 
                Size = UDim2.fromOffset(50, 50)
            }), 
            RightContents = v3.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Spacing = 5, 
                Size = UDim2.new(1, -50, 1, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Heading = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v29:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Font = v11.FONT_BOLD, 
                    Text = l_Heading_0, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Description = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v29:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Description_0, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
