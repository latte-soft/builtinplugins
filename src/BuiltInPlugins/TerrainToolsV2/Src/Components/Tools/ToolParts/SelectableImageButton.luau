local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Packages.Roact);
local v1 = Color3.fromRGB(227, 227, 227);
local v2 = v0.PureComponent:extend("SelectableImageButton");
v2.init = function(v3)
    v3.selectItem = function()
        v3.props.SelectItem(v3.props.Item);
    end;
end;
v2.render = function(v4)
    local l_props_0 = v4.props;
    return v0.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size or UDim2.new(0, 32, 0, 32), 
        BackgroundColor3 = l_props_0.BackgroundColor3, 
        BackgroundTransparency = not not l_props_0.IsSelected and (l_props_0.SelectedTransparency or 0.5) or 1, 
        BorderColor3 = v1, 
        Image = l_props_0.Image, 
        [v0.Event.Activated] = v4.selectItem
    });
end;
return v2;
