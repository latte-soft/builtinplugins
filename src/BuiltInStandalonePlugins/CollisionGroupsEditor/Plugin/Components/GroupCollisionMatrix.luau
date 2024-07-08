local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(script.Parent.CollisionCheckbox);
local v4 = require(script.Parent.Parent.Constants);
local v5 = v1.PureComponent:extend("GroupCollisionMatrix");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local v8 = #l_props_0.Groups;
    local _ = l_props_0.Stylizer.GroupCollisionMatrix;
    local v10 = {
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 0), 
            PaddingTop = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 0)
        }), 
        UIGridLayout = v1.createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(1, 1), 
            CellSize = v4.GridCellSize, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_v8_0 = v8;
    for v12, v13 in ipairs(l_props_0.Groups) do
        for v14, v15 in ipairs(l_props_0.Groups) do
            local v16 = v8 * v12 - v14;
            v10[v16] = v3({
                ShouldShowCheckbox = v12 <= v14, 
                Group = v13, 
                OtherGroup = v15, 
                Style = l_props_0.Stylizer, 
                RowHovered = l_props_0.RowHovered, 
                OnColHovered = l_props_0.OnColHovered, 
                OnRowHovered = l_props_0.OnRowHovered, 
                LayoutOrder = v16, 
                RowIndex = l_v8_0
            });
        end;
        l_v8_0 = l_v8_0 - 1;
    end;
    return v1.createElement("Frame", {
        Size = v4.CalculateTableSize(v8), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v10);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
