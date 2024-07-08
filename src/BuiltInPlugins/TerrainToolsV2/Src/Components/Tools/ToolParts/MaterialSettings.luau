local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v6 = require(l_Parent_1.MaterialSettingsFragment);
local v7 = require(l_Parent_1.Panel);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v9 = v2.PureComponent:extend("MaterialSettings");
v9.render = function(v10)
    local l_props_0 = v10.props;
    return v2.createElement(v7, {
        Title = l_props_0.Localization:getText("MaterialSettings", "MaterialSettings"), 
        LayoutOrder = v10.props.LayoutOrder
    }, {
        MaterialSettingsFragment = v2.createElement(v6, {
            LayoutOrder = 1, 
            autoMaterial = l_props_0.autoMaterial, 
            setAutoMaterial = l_props_0.setAutoMaterial, 
            material = l_props_0.material, 
            setMaterial = l_props_0.setMaterial, 
            replaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.replaceMaterial, 
            setReplaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.setReplaceMaterial, 
            source = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.source, 
            setSource = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.setSource, 
            target = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.target, 
            setTarget = if not l_TerrainEditorOverhaul_0 then nil else l_props_0.setTarget, 
            AllowAir = l_props_0.AllowAir, 
            Tool = l_props_0.currentTool
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
