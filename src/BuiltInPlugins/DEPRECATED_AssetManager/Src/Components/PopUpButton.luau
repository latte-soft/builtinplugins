local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_HoverArea_0 = require(l_Parent_0.Packages.Framework).UI.HoverArea;
local v3 = v1.PureComponent:extend("PopUpButton");
local v4 = UDim2.new(0, 32, 0, 32);
local v5 = UDim2.new(0, 28, 0, 28);
v3.init = function(v6, _)
    v6.state = {
        hovering = false
    };
    v6.mouseEnter = function()
        v6:setState({
            hovering = true
        });
    end;
    v6.mouseLeave = function()
        v6:setState({
            hovering = false
        });
    end;
end;
v3.render = function(v8)
    local l_props_0 = v8.props;
    return v1.createElement("ImageButton", {
        Position = l_props_0.Position, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = not not v8.state.hovering and v4 or v5, 
        Image = l_props_0.Image, 
        ImageTransparency = not l_props_0.ShowIcon and 1 or 0, 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = l_props_0.OnClick, 
        [v1.Event.MouseButton2Click] = not not l_props_0.OnRightClick and l_props_0.OnRightClick or function()
        end, 
        [v1.Event.MouseEnter] = v8.mouseEnter, 
        [v1.Event.MouseLeave] = v8.mouseLeave
    }, {
        Hover = v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
end;
return v3;
