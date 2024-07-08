local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v8 = v2.PureComponent:extend("LinkButton");
v8.init = function(v9, v10)
    v9.state = {
        hovered = false
    };
    v9.onMouseEnter = function(_, _, _)
        v9:setState({
            hovered = true
        });
    end;
    v9.onMouseLeave = function(_, _, _)
        v9:setState({
            hovered = false
        });
    end;
    v9.onActivated = function(_)
        if v10.onActivated then
            v10.onActivated();
        end;
    end;
end;
v8.render = function(v18)
    local l_props_0 = v18.props;
    local l_state_0 = v18.state;
    local l_linkButton_0 = l_props_0.Stylizer.linkButton;
    local v22 = l_GetTextSize_0(l_props_0.Text, nil, nil, Vector2.new(9999, 9999));
    return v2.createElement("Frame", {
        Size = l_props_0.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Link = v2.createElement("TextButton", {
            Size = UDim2.new(0, v22.X, 0, v22.Y), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_props_0.Text, 
            TextSize = l_props_0.TextSize, 
            Font = v4.FONT, 
            TextScaled = true, 
            TextColor3 = l_linkButton_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            [v2.Event.MouseEnter] = v18.onMouseEnter, 
            [v2.Event.MouseLeave] = v18.onMouseLeave, 
            [v2.Event.Activated] = v18.onActivated
        }, {
            UnderLine = l_state_0.hovered and v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(0, v22.X, 0, 1), 
                BackgroundColor3 = l_linkButton_0.textColor, 
                BorderSizePixel = 0
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
