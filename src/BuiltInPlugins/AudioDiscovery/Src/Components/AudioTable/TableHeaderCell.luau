local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_assign_0 = v2.Dash.assign;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_withControl_0 = v2.Wrappers.withControl;
local v10 = v1.PureComponent:extend("TableHeaderCell");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Name_0 = l_props_0.Name;
    local l_Order_0 = l_props_0.Order;
    local l_Width_0 = l_props_0.Width;
    local l_ColumnIndex_0 = l_props_0.ColumnIndex;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement(l_Pane_0, l_assign_0({
        LayoutOrder = l_ColumnIndex_0, 
        BorderColor3 = l_Style_0.Border, 
        BorderSizePixel = 1, 
        Padding = l_Style_0.HeaderCellPadding, 
        Style = "SubtleBox", 
        StyleModifier = not not (l_props_0.OnPress ~= nil) and l_props_0.StyleModifier or nil, 
        Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0)
    }, l_props_0.WrapperProps), {
        Text = v1.createElement(l_TextLabel_0, {
            Text = l_Name_0, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Icon = l_Order_0 and v1.createElement(l_Image_0, {
            ImageColor3 = l_Style_0.IconColor, 
            Image = "rbxasset://textures/DeveloperFramework/Table/sort_arrow.png", 
            Size = UDim2.fromOffset(6, 8), 
            Position = UDim2.new(1, -10, 0, 8), 
            Rotation = l_Order_0 == Enum.SortDirection.Descending and -90 or 90, 
            AnchorPoint = Vector2.new(1, 0)
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Text = l_Name_0
        })
    });
end;
return l_withControl_0(v10);
