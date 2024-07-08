local v0 = require(script:FindFirstAncestor("AnimationClipEditor").Packages.Roact);
local v1 = v0.PureComponent:extend("Line");
v1.render = function(v2)
    local l_props_0 = v2.props;
    local l_A_0 = l_props_0.A;
    local l_B_0 = l_props_0.B;
    if l_B_0.X < l_A_0.X then
        local l_l_B_0_0 = l_B_0;
        l_B_0 = l_A_0;
        l_A_0 = l_l_B_0_0;
    end;
    return v0.createElement("Frame", {
        Position = UDim2.new(0, (l_A_0.X + l_B_0.X) / 2, 0, (l_A_0.Y + l_B_0.Y) / 2), 
        Size = UDim2.new(0, math.sqrt((l_B_0.X - l_A_0.X) * (l_B_0.X - l_A_0.X) + (l_B_0.Y - l_A_0.Y) * (l_B_0.Y - l_A_0.Y)) + 1, 0, l_props_0.Width or 1), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = l_props_0.Transparency, 
        BackgroundColor3 = l_props_0.Color, 
        BorderSizePixel = 0, 
        BorderColor3 = l_props_0.Color, 
        Rotation = math.deg((math.atan2(l_B_0.Y - l_A_0.Y, l_B_0.X - l_A_0.X))), 
        ZIndex = l_props_0.ZIndex
    });
end;
return v1;
