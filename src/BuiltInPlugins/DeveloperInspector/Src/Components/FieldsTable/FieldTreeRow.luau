local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_mapOne_0 = require(l_Parent_0.Packages.Dash).mapOne;
local v4 = v2.PureComponent:extend("FieldTreeRow");
local l_TextLabel_0 = v1.UI.TextLabel;
v4.init = function(v6)
    v6.state = {
        isHovering = false
    };
    v6.onMouseEnter = function()
        v6:setState({
            isHovering = true
        });
    end;
    v6.onMouseLeave = function()
        v6:setState({
            isHovering = false
        });
    end;
    v6.onInputBegan = function(_, v8)
        if v8.UserInputType == Enum.UserInputType.MouseButton1 then
            v6.props.OnSelect(v6.props.Index);
        end;
    end;
    v6.onToggle = function()
        v6.props.OnToggle(v6.props.Row);
    end;
end;
v4.render = function(v9)
    local l_props_0 = v9.props;
    local l_state_0 = v9.state;
    local l_Style_0 = l_props_0.Style;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_IsExpanded_0 = l_props_0.IsExpanded;
    local l_isHovering_0 = l_state_0.isHovering;
    local l_Row_0 = l_props_0.Row;
    local l_item_0 = l_Row_0.item;
    local v18 = l_item_0.Children and l_mapOne_0(l_item_0.Children);
    local l_IsHeading_0 = l_item_0.IsHeading;
    local v20 = ((not not l_IsHeading_0 and l_Style_0.HeadingColor or l_IsSelected_0 and l_Style_0.SelectedColor) or l_isHovering_0 and l_Style_0.HoverColor) or l_Style_0.BackgroundColor;
    local v21 = if not l_IsHeading_0 then l_Row_0.depth * l_Style_0.Indent else 0;
    local v22 = not not l_IsHeading_0 and UDim2.fromScale(1, 1) or UDim2.new(0.35, 0, 1, 0);
    local l_Size_0 = l_Style_0.Arrow.Size;
    local v24 = (5 + v21) + (not not v18 and l_Size_0 + 5 or 0);
    return v2.createElement("Frame", {
        [v2.Event.MouseEnter] = v9.onMouseEnter, 
        [v2.Event.MouseLeave] = v9.onMouseLeave, 
        [v2.Event.InputBegan] = v9.onInputBegan, 
        LayoutOrder = l_props_0.Index, 
        BackgroundTransparency = 1, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, {
        NameCell = v2.createElement("Frame", {
            Size = v22, 
            BackgroundColor3 = v20, 
            BorderColor3 = l_Style_0.BorderColor
        }, {
            Toggle = not not v18 and v2.createElement("ImageButton", {
                Position = UDim2.new(0, v21 + 5, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, l_Size_0, 0, l_Size_0), 
                BackgroundTransparency = 1, 
                Image = l_Style_0.Arrow.Image, 
                ImageColor3 = l_Style_0.Arrow.Color, 
                ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                ImageRectOffset = not not l_IsExpanded_0 and l_Style_0.Arrow.ExpandedOffset or l_Style_0.Arrow.CollapsedOffset, 
                [v2.Event.Activated] = v9.onToggle
            }) or nil, 
            NameLabel = v2.createElement(l_TextLabel_0, {
                Text = tostring(l_item_0.Name), 
                Font = not not l_IsHeading_0 and Enum.Font.SourceSansBold or nil, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(0, v24, 0, 2), 
                Size = UDim2.new(1, -5 - v24, 1, -4), 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        }), 
        SummaryCell = not l_IsHeading_0 and v2.createElement("Frame", {
            Size = UDim2.new(0.65, 0, 1, 0), 
            Position = UDim2.new(0.35, 0, 0, 0), 
            BackgroundColor3 = v20, 
            BorderColor3 = l_Style_0.BorderColor
        }, {
            SummaryLabel = v2.createElement(l_TextLabel_0, {
                Text = tostring(l_item_0.Summary), 
                Font = not not l_IsHeading_0 and Enum.Font.SourceSansBold or nil, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(0, 5, 0, 2), 
                Size = UDim2.new(1, -10, 1, -4), 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        })
    });
end;
return v4;
