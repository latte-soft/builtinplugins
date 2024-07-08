local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local v1 = v0.PureComponent:extend("HorizontalList");
v1.render = function(v2)
    local v3 = v2.props.Data or {};
    local l_OnRenderItem_0 = v2.props.OnRenderItem;
    local l_Position_0 = v2.props.Position;
    local l_LayoutOrder_0 = v2.props.LayoutOrder;
    local l_DisplayCount_0 = v2.props.DisplayCount;
    local v8 = {
        Layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        })
    };
    local v9 = 0;
    for v10, v11 in pairs(v3) do
        local l_v9_0 = v9;
        if typeof(v11) == "table" and v11.index ~= nil then
            l_v9_0 = v11.index;
        end;
        if l_v9_0 < l_DisplayCount_0 then
            v9 = v9 + 1;
            v8[tostring(v10)] = l_OnRenderItem_0(v10, v11);
        end;
    end;
    return v0.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        Position = l_Position_0, 
        BackgroundTransparency = 1
    }, v8);
end;
return v1;
