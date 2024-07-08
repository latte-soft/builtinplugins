local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Util.getInspectorIcon);
local l_TweenService_0 = game:GetService("TweenService");
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v6 = v2.PureComponent:extend("NodeListRow");
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextLabel_0 = l_UI_0.TextLabel;
v6.init = function(v11)
    v11.containerRef = v2.createRef();
    v11.state = {
        isHovering = false
    };
    v11.onMouseEnter = function()
        v11:setState({
            isHovering = true
        });
    end;
    v11.onMouseLeave = function()
        v11:setState({
            isHovering = false
        });
    end;
    v11.onInputBegan = function(_, v13)
        if v13.UserInputType == Enum.UserInputType.MouseButton1 then
            v11.props.OnSelect(v11.props.Index);
        end;
    end;
    v11.onClick = function()
        v11.props.OnClickLink(v11.props.Index);
    end;
end;
v6.didUpdate = function(v14)
    if v14.props.Flash then
        v14:flash(v14.props.Flash.heat);
    end;
end;
v6.flash = function(v15, v16)
    local v17 = v15.containerRef:getValue();
    if v17 then
        if v15.flashTween then
            v15.flashTween:Cancel();
        end;
        if not v15.props.IsSelected then
            v15.flashTween = l_TweenService_0:create(v17, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                BackgroundColor3 = v15.props.Style.BackgroundColor
            });
            v17.BackgroundColor3 = Color3.fromRGB(255, math.max(0, 255 - v16 * 10), 100);
            v15.flashTween:Play();
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v6.render = function(v18)
    local l_props_0 = v18.props;
    local l_state_0 = v18.state;
    local l_Style_0 = l_props_0.Style;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_IconPadding_0 = l_Style_0.IconPadding;
    local v24 = v3(l_props_0.Icon);
    local l_X_0 = v24.ImageRectSize.X;
    local v26 = l_X_0 + 3 * l_IconPadding_0;
    local v27 = (not not l_IsSelected_0 and l_Style_0.SelectedColor or l_state_0.isHovering and l_Style_0.HoverColor) or l_Style_0.BackgroundColor;
    local v28 = not not l_IsSelected_0 and l_Style_0.SelectedTextColor or nil;
    return v2.createElement(l_Pane_0, {
        [v2.Event.MouseEnter] = v18.onMouseEnter, 
        [v2.Event.MouseLeave] = v18.onMouseLeave, 
        [v2.Event.InputBegan] = v18.onInputBegan, 
        [v2.Ref] = v18.containerRef, 
        LayoutOrder = l_props_0.Index, 
        BackgroundColor3 = v27, 
        Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight)
    }, {
        Icon = v2.createElement("ImageLabel", {
            Size = UDim2.fromOffset(l_X_0, v24.ImageRectSize.Y), 
            BackgroundTransparency = 1, 
            Image = v24.Image, 
            ImageRectSize = v24.ImageRectSize, 
            ImageRectOffset = v24.ImageRectOffset, 
            Position = UDim2.new(0, l_IconPadding_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5)
        }), 
        Text = v2.createElement(l_TextLabel_0, {
            Style = l_Style_0.Text, 
            Text = l_props_0.Name, 
            TextColor = v28, 
            Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight), 
            Position = UDim2.fromOffset(v26, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Link = v2.createElement(l_LinkText_0, {
            OnClick = v18.onClick, 
            Style = l_join_0(l_Style_0.Link, {
                TextColor = v28
            }), 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -10, 0, 0), 
            Text = v18.props.LinkText, 
            Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight), 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v6;
