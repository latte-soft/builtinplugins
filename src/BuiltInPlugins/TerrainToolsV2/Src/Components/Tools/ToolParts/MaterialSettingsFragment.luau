local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v6 = require(l_Parent_1.LabeledToggle);
local v7 = require(l_Parent_1.MaterialSelector);
local v8 = require(l_Parent_1.ReplaceModeSelector);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v11 = v2.PureComponent:extend("MaterialSettingsFragment");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_Localization_0 = l_props_0.Localization;
    local v15 = l_props_0.LayoutOrder or 1;
    local l_autoMaterial_0 = l_props_0.autoMaterial;
    local l_replaceMaterial_0 = l_props_0.replaceMaterial;
    local l_createFragment_0 = v2.createFragment;
    local v19 = {
        AutoMaterial = if l_autoMaterial_0 ~= nil then v2.createElement(v6, {
            LayoutOrder = v15, 
            Text = l_Localization_0:getText("MaterialSettings", "AutoMaterial"), 
            IsOn = l_autoMaterial_0, 
            SetIsOn = v12.props.setAutoMaterial
        }) else nil, 
        ReplaceMaterial = if not not l_TerrainEditorOverhaul_0 and l_replaceMaterial_0 ~= nil then v2.createElement(v8, {
            LayoutOrder = v15 + 1, 
            ReplaceMode = l_replaceMaterial_0, 
            SetReplaceMode = v12.props.setReplaceMaterial, 
            Tool = l_props_0.Tool
        }) else nil
    };
    local v20;
    if l_TerrainEditorOverhaul_0 and l_replaceMaterial_0 then
        v20 = nil;
    else
        v20 = v2.createElement;
        local l_v7_0 = v7;
        local v22 = {
            Label = if not l_TerrainEditorOverhaul_0 then nil else l_Localization_0:getText("MaterialSettings", "Material"), 
            LayoutOrder = v15 + 2, 
            material = v12.props.material, 
            setMaterial = v12.props.setMaterial
        };
        local v23 = false;
        if v12.props.Tool ~= l_ToolId_0.Paint then
            v23 = v12.props.AllowAir;
        end;
        v22.AllowAir = v23;
        v22.Tooltip = if not l_TerrainEditorOverhaul_0 then nil else l_Localization_0:getText("MaterialSettings", "MaterialTooltip");
        v20 = v20(l_v7_0, v22);
    end;
    v19.MaterialSelector = v20;
    if not l_TerrainEditorOverhaul_0 or not l_replaceMaterial_0 then
        v20 = nil;
    else
        v20 = v2.createElement;
        local l_v7_1 = v7;
        local v25 = {
            Label = l_Localization_0:getText("MaterialSettings", "SourceMaterial"), 
            LayoutOrder = v15 + 3, 
            material = v12.props.source, 
            setMaterial = v12.props.setSource
        };
        local v26 = false;
        if v12.props.Tool ~= l_ToolId_0.Paint then
            v26 = v12.props.AllowAir;
        end;
        v25.AllowAir = v26;
        v25.Tooltip = l_Localization_0:getText("MaterialSettings", "SourceMaterialTooltip");
        v20 = v20(l_v7_1, v25);
    end;
    v19.SourceMaterialSelector = v20;
    v19.TargetMaterialSelector = if not not l_TerrainEditorOverhaul_0 and l_replaceMaterial_0 then v2.createElement(v7, {
        Label = l_Localization_0:getText("MaterialSettings", "TargetMaterial"), 
        LayoutOrder = v15 + 4, 
        material = v12.props.target, 
        setMaterial = v12.props.setTarget, 
        AllowAir = v12.props.AllowAir, 
        Tooltip = l_Localization_0:getText("MaterialSettings", "TargetMaterialTooltip")
    }) else nil;
    return l_createFragment_0(v19);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v11));
