local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local v5 = nil;
v5 = v2.PureComponent:extend("SingleSelectButton");
v5.init = function(v6)
    v6.state = {
        isHovered = false
    };
    v6.onMouseEnter = function()
        v6:setState({
            isHovered = true
        });
    end;
    v6.onMouseLeave = function()
        v6:setState({
            isHovered = false
        });
    end;
    v6.onActivated = function()
        if not v6.props.IsSelected then
            v6.props.Select(v6.props.Data);
        end;
    end;
end;
v5.render = function(v7)
    local l_LayoutOrder_0 = v7.props.LayoutOrder;
    local l_Width_0 = v7.props.Width;
    local l_IsLeftmost_0 = v7.props.IsLeftmost;
    local l_IsRightmost_0 = v7.props.IsRightmost;
    local l_IsSelected_0 = v7.props.IsSelected;
    local l_isHovered_0 = v7.state.isHovered;
    local v14 = v7.props.Theme:get();
    local l_buttonSelectedColor_0 = v14.singleSelectButtonGroupTheme.buttonSelectedColor;
    local l_buttonHoveredColor_0 = v14.singleSelectButtonGroupTheme.buttonHoveredColor;
    local v17 = l_IsSelected_0 or l_isHovered_0;
    local v18 = not not l_IsSelected_0 and l_buttonSelectedColor_0 or l_buttonHoveredColor_0;
    return v2.createElement("ImageButton", {
        Position = UDim2.new((l_LayoutOrder_0 - 1) * l_Width_0, 0, 0, 0), 
        Size = UDim2.new(l_Width_0, 0, 1, 0), 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.Activated] = v7.onActivated, 
        [v2.Event.MouseEnter] = v7.onMouseEnter, 
        [v2.Event.MouseLeave] = v7.onMouseLeave
    }, {
        BackgroundContents = v17 and v2.createFragment({
            LeftBackground = l_IsLeftmost_0 and v2.createElement("ImageLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0, 8, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ImageTransparency = 0, 
                Image = v14.singleSelectButtonGroupTheme.roundedBackgroundImage, 
                ImageColor3 = v18, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v14.singleSelectButtonGroupTheme.roundedElementSlice
            }), 
            RightBackground = l_IsRightmost_0 and v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 8, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ImageTransparency = 0, 
                Image = v14.singleSelectButtonGroupTheme.roundedBackgroundImage, 
                ImageColor3 = v18, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v14.singleSelectButtonGroupTheme.roundedElementSlice
            }), 
            Background = v2.createElement("Frame", {
                Position = not not l_IsLeftmost_0 and UDim2.new(0, 4, 0, 0) or UDim2.new(0, 0, 0, 0), 
                Size = ((not not l_IsLeftmost_0 and l_IsRightmost_0) and UDim2.new(1, -8, 1, 0) or (l_IsLeftmost_0 or l_IsRightmost_0) and UDim2.new(1, -4, 1, 0)) or UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v18, 
                BorderSizePixel = 0
            })
        }), 
        Label = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v7.props.Text, 
            TextSize = v14.textSize, 
            Font = v14.font, 
            TextColor3 = v14.textColor, 
            ZIndex = 3
        })
    });
end;
v5 = l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v5);
local v19 = v2.PureComponent:extend("SingleSelectButtonGroup");
v19.render = function(v20)
    local l_props_0 = v20.props;
    local v22 = l_props_0.Theme:get();
    local l_Size_0 = l_props_0.Size;
    local v24 = l_props_0.Options or {};
    local v25 = #v24;
    local v26 = 1 / v25;
    local l_Selected_0 = v20.props.Selected;
    local _ = v22.singleSelectButtonGroupTheme.buttonSelectedColor;
    local v29 = {};
    for v30, v31 in ipairs(v24) do
        v29[tostring(v31.Data)] = v2.createElement(v5, {
            LayoutOrder = v30, 
            Width = v26, 
            IsSelected = v31.Data == l_Selected_0, 
            IsLeftmost = v30 == 1, 
            IsRightmost = v30 == v25, 
            Data = v31.Data, 
            Text = v31.Text, 
            Select = v20.props.Select
        });
    end;
    for v32 = 1, v25 - 1 do
        v29["Divider" .. v32] = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(v32 * v26, 0, 0, 0), 
            Size = UDim2.new(0, 1, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v22.borderColor, 
            ZIndex = 2
        });
    end;
    v29.Border = v2.createElement("ImageLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = v22.singleSelectButtonGroupTheme.roundedBorderImage, 
        ImageTransparency = 0, 
        ImageColor3 = v22.borderColor, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v22.singleSelectButtonGroupTheme.roundedElementSlice, 
        ZIndex = 3
    });
    return v2.createElement("Frame", {
        AnchorPoint = l_props_0.AnchorPoint, 
        Position = l_props_0.Position, 
        Size = l_Size_0, 
        BackgroundTransparency = 1
    }, v29);
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v19));
