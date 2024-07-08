local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Core.Components.RoundButton);
local v8 = v2.PureComponent:extend("MessageBoxButton");
v8.init = function(v9, _)
    v9.state = {
        isHovered = false, 
        isSelected = false
    };
    v9.onMouseEnter = function()
        v9:setState({
            isHovered = true
        });
    end;
    v9.onMouseLeave = function()
        v9:setState({
            isHovered = false, 
            isSelected = false
        });
    end;
    v9.onMouseDown = function()
        v9:setState({
            isHovered = true, 
            isSelected = true
        });
    end;
    v9.onMouseUp = function()
        v9:setState({
            isSelected = false
        });
        if v9.props.onButtonClicked then
            v9.props.onButtonClicked(v9.props.index, v9.props.action);
        end;
    end;
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_state_0 = v11.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_index_0 = l_props_0.index;
    local l_Text_0 = l_props_0.Text;
    local l_isHovered_0 = l_state_0.isHovered;
    local l_isSelected_0 = l_state_0.isSelected;
    local l_button_0 = l_Stylizer_0.messageBox.button;
    return v2.createElement(v7, {
        Size = UDim2.new(0, v4.MESSAGE_BOX_BUTTON_WIDTH, 1, 0), 
        LayoutOrder = l_index_0, 
        BackgroundColor3 = not not l_isSelected_0 and l_button_0.backgroundSelectedColor or l_button_0.backgroundColor, 
        BorderColor3 = (l_isHovered_0 or l_isSelected_0) and l_button_0.borderSelectedColor or l_button_0.borderColor, 
        [v2.Event.MouseEnter] = v11.onMouseEnter, 
        [v2.Event.MouseLeave] = v11.onMouseLeave, 
        [v2.Event.MouseButton1Down] = v11.onMouseDown, 
        [v2.Event.MouseButton1Up] = v11.onMouseUp
    }, {
        TextLabel = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            TextColor3 = not not l_isSelected_0 and l_button_0.textSelectedColor or l_button_0.textColor, 
            Text = l_Text_0, 
            Font = v4.FONT, 
            TextSize = v4.FONT_SIZE_SMALL, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
