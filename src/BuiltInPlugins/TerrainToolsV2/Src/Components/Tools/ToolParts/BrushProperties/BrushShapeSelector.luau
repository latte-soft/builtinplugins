local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local l_BrushShape_0 = require(l_Parent_0.Src.Util.TerrainEnums).BrushShape;
local v6 = require(script.Parent.Parent.SelectableImageButton);
local v7 = v2.PureComponent:extend("BrushShapeSelector");
v7.render = function(v8)
    local v9 = v8.props.Theme:get();
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_brushShape_0 = v8.props.brushShape;
    local l_setBrushShape_0 = v8.props.setBrushShape;
    local v13 = {
        {
            l_BrushShape_0.Sphere, 
            v9.brushSettingsTheme.sphereBrushImage
        }, 
        {
            l_BrushShape_0.Cube, 
            v9.brushSettingsTheme.cubeBrushImage
        }, 
        {
            l_BrushShape_0.Cylinder, 
            v9.brushSettingsTheme.cylinderBrushImage
        }
    };
    local v14 = {
        Padding = v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 5), 
            PaddingLeft = UDim.new(0, 5)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0.05, 0)
        })
    };
    for v15, v16 in ipairs(v13) do
        v14[v16[1]] = v2.createElement(v6, {
            LayoutOrder = v15, 
            Item = v16[1], 
            Image = v16[2], 
            IsSelected = l_brushShape_0 == v16[1], 
            SelectItem = l_setBrushShape_0
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 270, 0, 42), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        v2.createElement("Frame", {
            Size = UDim2.new(0, 230, 1, 0), 
            Position = UDim2.new(0, 20, 0, 0), 
            BackgroundColor3 = v9.backgroundColor, 
            BorderColor3 = v9.borderColor
        }, v14)
    });
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v7));
