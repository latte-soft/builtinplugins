local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v9 = require(l_script_FirstAncestor_0.Src.Components.PublishBlocked.Buttons);
local v10 = v1.PureComponent:extend("PublishBlockedDialog");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_OnOpen_0 = l_props_0.OnOpen;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v17 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.Padding
    }, {
        Icon = v1.createElement(l_Image_0, {
            Size = UDim2.fromOffset(l_Stylizer_0.ImageSize, l_Stylizer_0.ImageSize), 
            Image = l_Stylizer_0.WarningIcon, 
            LayoutOrder = v17:getNextOrder()
        }), 
        Text = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Size = l_Stylizer_0.TextSize, 
            LayoutOrder = v17:getNextOrder(), 
            Spacing = l_Stylizer_0.TextSpacing
        }, {
            Warning = v1.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("PublishingBlocked", "Warning"), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, 0), 
                Style = "Semibold"
            }), 
            Detail = v1.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("PublishingBlocked", "Detail"), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = v17:getNextOrder(), 
                Style = "Body"
            }), 
            Buttons = v1.createElement(v9, {
                OnClose = l_OnClose_0, 
                OnOpen = l_OnOpen_0, 
                LayoutOrder = v17:getNextOrder()
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
