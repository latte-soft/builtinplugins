local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Curves.Line);
local v4 = v1.PureComponent:extend("Cubic");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local v7 = {};
    local l_A_0 = l_props_0.A;
    local l_B_0 = l_props_0.B;
    local v10 = nil;
    local v11 = nil;
    for v12 = l_A_0.X, l_B_0.X, v2.CURVE_INTERVAL do
        local v13 = (v12 - l_A_0.X) / (l_B_0.X - l_A_0.X);
        local v14 = v13 * v13;
        local v15 = (((v14 * (2 * v13 - 3) + 1) * l_A_0.Y + ((((v13 - 2) * v13 + 1) * v13) * (l_B_0.X - l_A_0.X)) * l_props_0.ASlope) + (v14 * (3 - 2 * v13)) * l_B_0.Y) + ((v14 * (v13 - 1)) * (l_B_0.X - l_A_0.X)) * l_props_0.BSlope;
        if not (not v5.props.MinClamp or not v5.props.MaxClamp) then
            v15 = math.clamp(v15, v5.props.MinClamp, v5.props.MaxClamp);
        end;
        if (v10 and v10 < l_props_0.FrameWidth) and v12 > 0 then
            table.insert(v7, v1.createElement(v3, {
                A = Vector2.new(v10, v11), 
                B = Vector2.new(v12, v15), 
                Color = l_props_0.Color, 
                Width = l_props_0.Width, 
                Transparency = l_props_0.Transparency, 
                ZIndex = l_props_0.ZIndex
            }));
        end;
        v10 = v12;
        v11 = v15;
    end;
    table.insert(v7, v1.createElement(v3, {
        A = if not v10 then l_A_0 else Vector2.new(v10, v11), 
        B = l_B_0, 
        Color = l_props_0.Color, 
        Width = l_props_0.Width, 
        Transparency = l_props_0.Transparency, 
        ZIndex = l_props_0.ZIndex
    }));
    return v1.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.ZIndex
    }, v7);
end;
return v4;
