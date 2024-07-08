local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_Tooltip_0 = require(l_Packages_0.Framework).UI.Tooltip;
local v3 = v1.PureComponent:extend("TooltipWrapper");
v3.render = function(v4)
    local l_props_0 = v4.props;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SizeConstraint = l_props_0.SizeConstraint or Enum.SizeConstraint.RelativeXY
    }, {
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = l_props_0.canShowCurrentTooltip and l_props_0.isHovered, 
            Text = tostring(l_props_0.Text or ""), 
            Priority = 2
        })
    });
end;
return v3;
