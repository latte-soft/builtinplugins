local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v6 = require(l_Parent_1.BiomeSelector);
local v7 = require(l_Parent_1.LabeledSlider);
local v8 = require(l_Parent_1.LabeledToggle);
local v9 = require(l_Parent_0.Src.Util.Constants);
local v10 = v2.PureComponent:extend("BiomeSettingsFragment");
v10.render = function(v11)
    local l_Localization_0 = v11.props.Localization;
    local v13 = v11.props.LayoutOrder or 1;
    return v2.createFragment({
        BiomeSelect = v2.createElement(v6, {
            LayoutOrder = v13, 
            biomeSelection = v11.props.biomeSelection, 
            selectBiome = v11.props.selectBiome
        }), 
        BiomeSize = v2.createElement(v7, {
            LayoutOrder = v13 + 1, 
            Text = l_Localization_0:getText("Generate", "BiomeSize"), 
            Min = v9.MIN_BIOME_SIZE, 
            Max = v9.MAX_BIOME_SIZE, 
            SnapIncrement = v9.BIOME_SNAP_INCREMENT, 
            Value = v11.props.biomeSize, 
            SetValue = v11.props.setBiomeSize
        }), 
        CavesToggle = v2.createElement(v8, {
            LayoutOrder = v13 + 3, 
            Text = l_Localization_0:getText("Generate", "Caves"), 
            IsOn = v11.props.haveCaves, 
            SetIsOn = v11.props.setHaveCaves
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v10));
