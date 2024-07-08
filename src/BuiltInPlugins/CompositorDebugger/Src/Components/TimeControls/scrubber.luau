local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = v1.PureComponent:extend("Scrubber");
v4.init = function(_)
end;
v4.render = function(v6)
    local _ = v6.state;
    local l_props_0 = v6.props;
    local l_Style_0 = l_props_0.Style;
    local l_HeadSize_0 = l_Style_0.Scrubber.HeadSize;
    local l_Color_0 = l_Style_0.Scrubber.Color;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(0, 1, 1, 0), 
        Position = l_props_0.Position, 
        ZIndex = l_props_0.ZIndex
    }, {
        Line = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, 1, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundColor = l_Color_0
        }), 
        Head = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, l_HeadSize_0, 0, l_HeadSize_0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundColor = l_Color_0
        })
    });
end;
return v4;
