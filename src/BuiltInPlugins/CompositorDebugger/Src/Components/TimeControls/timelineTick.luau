local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = v1.PureComponent:extend("TimelineTick");
v7.init = function(_)
end;
v7.render = function(v9)
    local _ = v9.state;
    local l_props_0 = v9.props;
    local v12 = l_props_0.TextAlignment == Enum.TextXAlignment.Right;
    return v1.createElement(l_Pane_0, {
        ZIndex = l_props_0.ZIndex, 
        Size = UDim2.new(0, 1, 1, 0), 
        Position = l_props_0.Position
    }, {
        Tick = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, l_props_0.Width, l_props_0.Height, 0), 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            BorderSizePixel = 0, 
            BackgroundColor = l_props_0.Color, 
            BackgroundTransparency = 0
        }), 
        Label = if not l_props_0.TextAlignment then nil else v1.createElement(l_TextLabel_0, {
            AnchorPoint = Vector2.new(not v12 and 0 or 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = tostring(if l_props_0.Tick ~= 0 then -l_props_0.Tick else l_props_0.Tick), 
            TextSize = 14, 
            TextXAlignment = l_props_0.TextAlignment, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Position = UDim2.new(0, not v12 and 3 or -3, 0, 0), 
            TextColor = l_props_0.Color, 
            ZIndex = 2
        })
    });
end;
return v7;
