local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_Tooltip_0 = v3.UI.Tooltip;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v2.PureComponent:extend("Tab");
v9.init = function(v10)
    v10.state = {
        hovered = false
    };
    v10.onClick = function()
        if not v10.props.Disabled then
            if v10.props.onClick then
                v10.props.onClick();
            end;
            return ;
        else
            return ;
        end;
    end;
    v10.mouseEnter = function()
        if not v10.props.Disabled then
            v10:setState({
                hovered = true
            });
            return ;
        else
            return ;
        end;
    end;
    v10.mouseLeave = function()
        if not v10.props.Disabled then
            v10:setState({
                hovered = false
            });
            return ;
        else
            return ;
        end;
    end;
end;
v9.render = function(v11)
    local l_Stylizer_0 = v11.props.Stylizer;
    local v13 = v11.props.Text or "";
    local l_Image_0 = v11.props.Image;
    local v15 = v11.props.LayoutOrder or 0;
    local v16 = v11.props.Selected or false;
    local l_hovered_0 = v11.state.hovered;
    local l_tabSet_0 = l_Stylizer_0.tabSet;
    local l_TabWidth_0 = v11.props.TabWidth;
    local l_DisplayText_0 = v11.props.DisplayText;
    local l_Disabled_0 = v11.props.Disabled;
    local l_X_0 = l_GetTextSize_0(v13, nil, v4.FONT_BOLD, Vector2.new(0, 0)).X;
    local v23 = if not l_Disabled_0 then if v16 or l_hovered_0 then l_tabSet_0.selectedColor else l_tabSet_0.contentColor else l_tabSet_0.disabledColor;
    return v2.createElement("ImageButton", {
        LayoutOrder = v15, 
        Size = UDim2.new(0, l_TabWidth_0, 1, 0), 
        BorderSizePixel = not v16 and 0 or 2, 
        BorderColor3 = l_tabSet_0.borderColor, 
        ZIndex = not v16 and 0 or 2, 
        BackgroundColor3 = l_tabSet_0.tabBackground, 
        AutoButtonColor = false, 
        [v2.Event.MouseEnter] = v11.mouseEnter, 
        [v2.Event.MouseLeave] = v11.mouseLeave, 
        [v2.Event.Activated] = v11.onClick
    }, {
        Tooltip = not l_DisplayText_0 and v2.createElement(l_Tooltip_0, {
            Text = v13
        }) or nil, 
        UpperBorder = v16 and v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.topBorderColor
        }), 
        LowerBorder = not v16 and v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 2), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.borderColor
        }), 
        Content = v2.createElement("Frame", {
            Size = UDim2.new(1, -(v4.TAB_OUTER_PADDING * 2), 1, 0), 
            Position = UDim2.new(0, v4.TAB_OUTER_PADDING, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v4.TAB_INNER_PADDING)
            }), 
            Icon = v2.createElement("ImageLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, v4.TAB_ICON_SIZE, 0, v4.TAB_ICON_SIZE), 
                BackgroundTransparency = 1, 
                ImageColor3 = v23, 
                Image = l_Image_0
            }), 
            Text = l_DisplayText_0 and v2.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v13, 
                Font = not not v16 and v4.FONT_BOLD or v4.FONT, 
                TextSize = v4.FONT_SIZE_MEDIUM, 
                BackgroundTransparency = 1, 
                TextColor3 = v23, 
                Size = UDim2.new(0, l_X_0, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                ClipsDescendants = true
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
