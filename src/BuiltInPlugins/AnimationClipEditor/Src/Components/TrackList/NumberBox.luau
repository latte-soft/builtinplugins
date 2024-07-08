local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Components.DragListenerArea);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v5.UI.Pane;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v10 = v1.PureComponent:extend("NumberBox");
v10.init = function(v11)
    v11.state = {
        focused = false
    };
    v11.getTextWidth = function(v12, v13)
        return v2.getTextWidth(v12, v13.trackTheme.textSize, v13.font);
    end;
    v11.focusChanged = function(v14, v15, v16)
        v11:setState({
            focused = v15
        });
        if not v15 then
            if not v16 then
                v14.Text = v11.props.Number;
            else
                local v17 = tonumber(v14.Text);
                if not v17 or not v11.props.SetNumber then
                    v14.Text = v11.props.Number;
                    return ;
                else
                    local v18 = v11.props.SetNumber(v17);
                    if v18 then
                        v14.Text = v11:formatNumber(v18);
                        return ;
                    end;
                end;
            end;
        end;
    end;
    v11.onDragMoved = function(v19)
        if v11.props.OnDragMoved then
            v11.props.OnDragMoved(v19);
        end;
    end;
    v11.onDragBegan = function(v20)
        if v11.props.OnDragBegan then
            v11.props.OnDragBegan(v20);
        end;
    end;
end;
v10.formatNumber = function(v21, v22)
    local v23 = v21.props.Precision or v3.NUMBER_PRECISION;
    return (tostring(math.floor(0.5 + v22 * v23) / v23));
end;
v10.render = function(v24)
    local l_props_0 = v24.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_textBox_0 = l_Stylizer_0.textBox;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_state_0 = v24.state;
    local l_Name_0 = l_props_0.Name;
    local l_Color_0 = l_props_0.Color;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Number_0 = l_props_0.Number;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ReadOnly_0 = l_props_0.ReadOnly;
    local v38 = not not l_state_0.focused and l_textBox_0.focusedBorder or l_textBox_0.defaultBorder;
    local v39 = v24.getTextWidth(l_Name_0, l_Stylizer_0) + 12;
    return v1.createElement(l_Pane_0, {
        Style = "BorderBox", 
        Size = l_Size_0, 
        Position = l_Position_0, 
        ZIndex = 2, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundColor3 = l_textBox_0.backgroundColor, 
        BorderColor3 = v38, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        LabelFrame = v1.createElement(l_Pane_0, {
            Style = "BorderBox", 
            Size = UDim2.new(0, v39, 1, 0), 
            BackgroundColor3 = l_trackTheme_0.shadedBackgroundColor, 
            BorderColor3 = v38, 
            LayoutOrder = 1
        }, {
            NameLabel = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Text = l_Name_0, 
                Font = l_Stylizer_0.font, 
                TextSize = l_trackTheme_0.textSize, 
                TextColor3 = l_Color_0 or l_trackTheme_0.textColor, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            LeftBorderOverlay = v1.createElement("Frame", {
                Size = UDim2.new(0, 5, 1, -2), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = l_trackTheme_0.shadedBackgroundColor, 
                BorderSizePixel = 0
            }), 
            RightBorderOverlay = v1.createElement("Frame", {
                Size = UDim2.new(0, 5, 1, -2), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundColor3 = l_textBox_0.backgroundColor, 
                BorderSizePixel = 0
            }), 
            DragArea = not l_ReadOnly_0 and v1.createElement(v4, {
                Size = UDim2.new(1, 0, 1, 0), 
                Cursor = "SizeEW", 
                OnDragMoved = v24.onDragMoved, 
                OnDragBegan = v24.onDragBegan
            }) or nil
        }), 
        TextBox = v1.createElement(v9, {
            Size = UDim2.new(1, -v39, 1, 0), 
            Text = v24:formatNumber(l_Number_0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ReadOnly = l_ReadOnly_0, 
            LayoutOrder = 2, 
            ClearTextOnFocus = false, 
            FocusChanged = v24.focusChanged
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
