local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_FlattenMode_0 = require(l_Parent_0.Src.Util.TerrainEnums).FlattenMode;
local l_Parent_1 = script.Parent.Parent;
local v8 = require(l_Parent_1.LabeledElementPair);
local v9 = require(l_Parent_1.SelectableImageButton);
local v10 = Color3.fromRGB(228, 238, 254);
local v11 = Color3.fromRGB(227, 227, 227);
local v12 = v2.PureComponent:extend("FlattenModeSelector");
v12.render = function(v13)
    local v14 = v13.props.Theme:get();
    local l_Localization_0 = v13.props.Localization;
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_flattenMode_0 = v13.props.flattenMode;
    local l_setFlattenMode_0 = v13.props.setFlattenMode;
    local v19 = {
        {
            l_FlattenMode_0.Erode, 
            v14.brushSettingsTheme.flattenErodeImage
        }, 
        {
            l_FlattenMode_0.Grow, 
            v14.brushSettingsTheme.flattenGrowImage
        }, 
        {
            l_FlattenMode_0.Both, 
            v14.brushSettingsTheme.flattenBothImage
        }
    };
    local v20 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    for v21, v22 in ipairs(v19) do
        v20[v22[1]] = v2.createElement(v9, {
            LayoutOrder = v21, 
            Item = v22[1], 
            Image = v22[2], 
            IsSelected = l_flattenMode_0 == v22[1], 
            SelectItem = l_setFlattenMode_0, 
            Size = UDim2.new(0, 40, 0, 40), 
            BackgroundColor3 = v10, 
            SelectedTransparency = 0
        });
    end;
    return v2.createElement(v8, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 48), 
        BackgroundTransparency = 1, 
        Text = l_Localization_0:getText("BrushSettings", "FlattenMode")
    }, {
        FlattenModes = v2.createElement("ImageLabel", {
            Size = UDim2.new(0, 120, 0, 40), 
            Image = v14.roundedBorderImage, 
            ImageTransparency = 0, 
            ImageColor3 = v11, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v14.roundedBorderSlice, 
            BackgroundTransparency = 1
        }, v20)
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization
})(v12));
