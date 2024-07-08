local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v14 = v1.PureComponent:extend("ExpandableCharacterListItem");
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Expanded_0 = l_props_0.Expanded;
    local l_RenderContent_0 = l_props_0.RenderContent;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    if l_Expanded_0 then
        v22 = "BorderBox";
        v21 = l_Stylizer_0.SelectedBorderColor;
        v20 = l_Stylizer_0.SelectedColor;
    end;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v24 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        BorderColor = v21, 
        BackgroundColor3 = v20, 
        Style = v22, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        OnClick = l_props_0.OnExpandedChanged
    }, {
        Header = v15:renderHeader(v24:getNextOrder()), 
        Container = if not l_Expanded_0 then nil else v1.createElement(l_Pane_0, {
            LayoutOrder = v24:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Padding = l_Stylizer_0.Content.Padding
        }, {
            Content = l_RenderContent_0()
        })
    });
end;
v14.renderHeader = function(v25, v26)
    local l_props_1 = v25.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Header_0 = l_Stylizer_1.Header;
    local l_Localization_0 = l_props_1.Localization;
    local l_Size_0 = l_props_1.Size;
    local l_Selected_0 = l_props_1.Selected;
    local l_Expanded_1 = l_props_1.Expanded;
    local l_StatusKey_0 = l_props_1.StatusKey;
    local l_OnClick_0 = l_props_1.OnClick;
    local v36 = l_LayoutOrderIterator_0.new();
    local v37 = nil;
    v37 = if not l_Expanded_1 then l_Header_0.BackgroundColor else nil;
    return v1.createElement(l_Pane_0, {
        BackgroundColor3 = v37, 
        BorderSizePixel = 0, 
        HorizontalAlignment = l_Header_0.HorizontalAlignment, 
        LayoutOrder = v26, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_Header_0.Padding, 
        Size = l_Size_0, 
        VerticalAlignment = l_Header_0.VerticalAlignment
    }, {
        Checkbox = v1.createElement(l_Checkbox_0, {
            Checked = l_Selected_0, 
            OnClick = l_OnClick_0, 
            LayoutOrder = v36:getNextOrder()
        }), 
        MainElements = v1.createElement(l_Pane_0, {
            BackgroundColor3 = v37, 
            BorderSizePixel = 0, 
            HorizontalAlignment = l_Header_0.HorizontalAlignment, 
            LayoutOrder = v36:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Size = UDim2.new(1, -l_Header_0.Padding.Right, 1, 0), 
            Spacing = l_Header_0.Spacing, 
            VerticalAlignment = l_Header_0.VerticalAlignment
        }, {
            Arrow = v1.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                LayoutOrder = v36:getNextOrder(), 
                Size = l_Header_0.Arrow.Size, 
                [v1.Event.MouseButton1Click] = l_props_1.OnExpandedChanged
            }, {
                Image = v1.createElement(l_Image_0, {
                    Style = l_Header_0.Arrow, 
                    StyleModifier = not not l_props_1.Expanded and l_StyleModifier_0.Selected or nil
                })
            }), 
            Title = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v36:getNextOrder(), 
                Style = l_Header_0.Text, 
                Text = l_props_1.Text, 
                TextWrapped = true
            }), 
            Icon = l_StatusKey_0 and v1.createElement(l_Image_0, {
                Image = l_Stylizer_1.Icons[l_StatusKey_0], 
                Size = l_Stylizer_1.StatusImageSize, 
                AnchorPoint = Vector2.new(1, 0.5), 
                LayoutOrder = v36:getNextOrder()
            }, {
                Tooltip = v1.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText("CharacterConversion", l_StatusKey_0)
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));
