local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v6 = require(l_Parent_0.Src.Components.LeftTruncateTextLabel);
local l_StudioService_0 = game:GetService("StudioService");
local v8 = v1.PureComponent:extend("RightCell");
v8.getIcon = function(v9)
    local l_props_0 = v9.props;
    if type(l_props_0.Value) ~= "userdata" then
        return ;
    else
        local l_l_StudioService_0_ClassIcon_0 = l_StudioService_0:GetClassIcon(l_props_0.Value.ClassName);
        local v12 = l_l_StudioService_0_ClassIcon_0.ImageRectSize or Vector2.new();
        return v1.createElement("ImageLabel", {
            Size = UDim2.fromOffset(v12.X, v12.Y), 
            BackgroundTransparency = 1, 
            Image = l_l_StudioService_0_ClassIcon_0.Image, 
            ImageRectSize = v12, 
            ImageRectOffset = l_l_StudioService_0_ClassIcon_0.ImageRectOffset, 
            Position = UDim2.new(0, 2, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5)
        });
    end;
end;
v8.render = function(v13)
    local l_props_1 = v13.props;
    local l_Style_0 = l_props_1.Style;
    local v16 = if l_props_1.RowIndex % 2 == 1 then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v17 = l_props_1.Width or UDim.new(1 / #l_props_1.Columns, 0);
    local v18 = if not l_props_1.Value then nil else tostring(l_props_1.Value);
    local v19 = v13:getIcon();
    local _ = nil;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v16, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v17.Scale, v17.Offset, 1, 0)
    }, {
        Icon = v19, 
        Label = if not v19 then v1.createElement(v6, {
            TextColor = l_props_1.Style.Text, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = l_props_1.ColumnIndex, 
            Text = tostring(l_props_1.Value)
        }) else v1.createElement(l_TextLabel_0, {
            TextColor = l_props_1.Style.Text, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Position = UDim2.fromOffset(24, 0), 
            Size = UDim2.new(1, -24, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = l_props_1.ColumnIndex, 
            Text = tostring(l_props_1.Value)
        }), 
        Tooltip = v18 and v1.createElement(l_Tooltip_0, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = v18, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return v8;
