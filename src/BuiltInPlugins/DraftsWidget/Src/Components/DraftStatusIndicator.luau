local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_Tooltip_0 = require(l_Parent_0.Packages.Framework).UI.Tooltip;
local v3 = v1.PureComponent:extend("DraftStatusIndicator");
v3.render = function(v4)
    local l_Tooltip_1 = v4.props.Tooltip;
    return v1.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(16, 16), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Image = v4.props.Icon
    }, {
        Tooltip = l_Tooltip_1 and v1.createElement(l_Tooltip_0, {
            Text = l_Tooltip_1, 
            Enabled = true
        })
    });
end;
return v3;
