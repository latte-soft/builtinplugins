local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_Checkbox_0 = v2.UI.Checkbox;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_Biome_0 = require(l_Parent_0.Src.Util.TerrainEnums).Biome;
local v9 = {
    l_Biome_0.Water, 
    l_Biome_0.Marsh, 
    l_Biome_0.Plains, 
    l_Biome_0.Hills, 
    l_Biome_0.Dunes, 
    l_Biome_0.Canyons, 
    l_Biome_0.Mountains, 
    l_Biome_0.Lavascape, 
    l_Biome_0.Arctic
};
local v10 = v1.PureComponent:extend("BiomeSelector");
v10.render = function(v11)
    local v12 = v11.props.Theme:get();
    local l_Localization_0 = v11.props.Localization;
    local l_selectBiome_0 = v11.props.selectBiome;
    local l_biomeSelection_0 = v11.props.biomeSelection;
    local l_LayoutOrder_0 = v11.props.LayoutOrder;
    local v17 = {
        LayoutPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 9), 
            PaddingBottom = UDim.new(0, 9), 
            PaddingLeft = UDim.new(0, 9), 
            PaddingRight = UDim.new(0, 9)
        }), 
        GridLayout = v1.createElement("UIGridLayout", {
            CellSize = UDim2.new(0, 86, 0, 16), 
            CellPadding = UDim2.new(0, 20, 0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v18, v19 in ipairs(v9) do
        v17[v19] = v1.createElement(l_Checkbox_0, {
            Checked = l_biomeSelection_0[v19], 
            OnClick = l_selectBiome_0, 
            Key = v19, 
            LayoutOrder = v18, 
            Text = l_Localization_0:getText("Generate", v7.BiomeToLocalizationKey[v19])
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 148), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Label = v1.createElement("TextLabel", {
            Text = l_Localization_0:getText("MaterialSettings", "ChooseBiome"), 
            Font = v12.font, 
            TextSize = v12.textSize, 
            TextColor3 = v12.textColor, 
            Size = UDim2.new(1, 0, 0, 16), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = UDim2.new(0, 20, 0, 0), 
            BackgroundTransparency = 1
        }), 
        Border = v1.createElement("Frame", {
            Size = UDim2.new(0, 229, 0, 128), 
            Position = UDim2.new(0, 20, 0, 20), 
            BackgroundColor3 = v12.backgroundColor, 
            BorderColor3 = v12.borderColor
        }, v17)
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization
})(v10));
