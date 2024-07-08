local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v13 = v1.PureComponent:extend("ColorPickerTopControls");
v13.render = function(v14)
    local l_props_0 = v14.props;
    local l_ColorPickerTopControls_0 = l_props_0.Stylizer.ColorPickerTopControls;
    local l_Localization_1 = l_props_0.Localization;
    local v18 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Vertical, 
        Size = l_ColorPickerTopControls_0.Size, 
        Spacing = l_ColorPickerTopControls_0.Spacing
    }, {
        TitleText = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_1:getText("Info", "ColorPickerTitle") .. " " .. l_props_0.TagName, 
            Size = l_ColorPickerTopControls_0.TitleTextSize, 
            LayoutOrder = v18:getNextOrder()
        }), 
        Buttons = v1.createElement(l_Pane_0, {
            LayoutOrder = v18:getNextOrder(), 
            Size = l_ColorPickerTopControls_0.ButtonsPaneSize, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Spacing = l_ColorPickerTopControls_0.ButtonsPaneSpacing, 
            Padding = l_ColorPickerTopControls_0.ButtonsPanePadding
        }, {
            Cancel = v1.createElement(l_Button_0, {
                Size = l_ColorPickerTopControls_0.CancelButtonSize, 
                Text = l_Localization_1:getText("General", "Cancel"), 
                OnClick = l_props_0.Close, 
                LayoutOrder = 1, 
                Style = "Round"
            }), 
            Submit = v1.createElement(l_Button_0, {
                Size = l_ColorPickerTopControls_0.SubmitButtonSize, 
                LayoutOrder = 2, 
                Text = l_Localization_1:getText("General", "Apply"), 
                Style = "RoundPrimary", 
                OnClick = l_props_0.Save
            })
        }), 
        ColorPane = v1.createElement(l_Pane_0, {
            LayoutOrder = v18:getNextOrder(), 
            Size = l_ColorPickerTopControls_0.ColorPaneSize, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_ColorPickerTopControls_0.ColorPaneSpacing, 
            Padding = l_ColorPickerTopControls_0.ColorPanePadding
        }, {
            TitleText = v1.createElement(l_TextLabel_0, {
                TextXAlignment = Enum.TextXAlignment.Right, 
                Text = l_Localization_1:getText("Info", "SelectedColor"), 
                Size = l_ColorPickerTopControls_0.PreviewTitleSize, 
                LayoutOrder = 1
            }), 
            Preview = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Size = l_ColorPickerTopControls_0.ColorPreviewSize, 
                BackgroundColor = l_props_0.Color
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13));
