local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Core.Components.RoundButton);
local v8 = v2.Component:extend("NavButton");
v8.init = function(v9, _)
    v9:setState({
        hovered = false, 
        pressed = false
    });
    v9.buttonRef = v2.createRef();
    v9.onMouseEnter = function()
        v9:setState({
            hovered = true
        });
    end;
    v9.onMouseLeave = function()
        v9:setState({
            hovered = false
        });
    end;
    v9.onMouseButton1Down = function()
        v9:setState({
            pressed = true
        });
    end;
    v9.onMouseButton1Up = function()
        v9:setState({
            pressed = false
        });
    end;
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v14 = not not l_props_0.isPrimary and l_Stylizer_0.nav.mainButton or l_Stylizer_0.nav.button;
    local _ = nil;
    return v2.createElement(v7, {
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundColor3 = if not not v11.state.hovered and v11.state.pressed then v14.pressBackground else if v11.state.hovered then v14.hoverBackground else v14.background, 
        BorderColor3 = v14.borderColor, 
        BorderSizePixel = not l_props_0.isPrimary and 1 or 0, 
        [v2.Event.MouseEnter] = v11.onMouseEnter, 
        [v2.Event.MouseLeave] = v11.onMouseLeave, 
        [v2.Event.MouseButton1Down] = v11.onMouseButton1Down, 
        [v2.Event.MouseButton1Up] = v11.onMouseButton1Up, 
        [v2.Event.MouseButton1Click] = l_props_0.onClick
    }, {
        Title = v2.createElement("TextLabel", {
            Text = l_props_0.titleText, 
            Font = v4.FONT, 
            TextSize = v4.FONT_SIZE_LARGE, 
            BackgroundTransparency = 1, 
            TextColor3 = v14.textColor, 
            Size = UDim2.new(1, 0, 1, 0)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
