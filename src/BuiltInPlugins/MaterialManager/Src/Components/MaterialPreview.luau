local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_prioritize_0 = v3.Util.prioritize;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v11 = require(l_Parent_0.Src.Flags);
local l_getFFlagBetterMaterialManagerPreviews_0 = v11.getFFlagBetterMaterialManagerPreviews;
local l_getFFlagEnableSkyForMetalBalls_0 = v11.getFFlagEnableSkyForMetalBalls;
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v16 = require(l_Controllers_0.GeneralServiceController);
local v17 = require(l_Controllers_0.MaterialServiceController);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v19 = require(l_Constants_0.getMaterialColor);
local v20 = require(l_Constants_0.BASE_MATERIALS_WITH_METALNESS);
local v21 = v1.Component:extend("MaterialPreview");
v21.defaultProps = {
    InitialDistance = 6.3, 
    Material = Enum.Material.Plastic
};
v21.shouldUpdate = function(v22, v23)
    if not ((v23.MaterialWrapper == v22.props.MaterialWrapper and v23.MaterialOverride == v22.props.MaterialOverride) and v23.MaterialOverrides == v22.props.MaterialOverrides) or v23.Use2022Materials ~= v22.props.Use2022Materials then
        return true;
    else
        return false;
    end;
end;
v21.render = function(v24)
    local l_props_0 = v24.props;
    local l_MaterialPreview_0 = l_props_0.Stylizer.MaterialPreview;
    local l_MaterialWrapper_0 = l_props_0.MaterialWrapper;
    if l_MaterialWrapper_0 then
        local v28 = if not l_MaterialWrapper_0.MaterialVariant then nil else l_MaterialWrapper_0.MaterialVariant.Name;
        local l_Material_0 = l_MaterialWrapper_0.Material;
        if not v24.materialModel then
            v24.materialModel = l_props_0.GeneralServiceController:LoadLocalAsset("rbxasset://models/MaterialManager/smooth_material_model.rbxm");
        end;
        v24.model = v24.materialModel:Clone();
        v24.model.MeshPart.Material = l_Material_0;
        if l_getFFlagBetterMaterialManagerPreviews_0() then
            v24.model.MeshPart.CFrame = CFrame.Angles(0, 0.7853981633974483, 0) * CFrame.Angles(0.7853981633974483, 0, 0);
        end;
        if not v28 then
            if not ((not l_props_0.MaterialOverrides or not l_props_0.MaterialOverride) or not l_props_0.MaterialServiceController:hasDefaultMaterial(l_Material_0, l_props_0.MaterialOverrides[l_props_0.MaterialOverride])) then
                v24.model.MeshPart.Color = v19(l_Material_0, l_props_0.Use2022Materials) or Color3.fromRGB(163, 162, 165);
            end;
        else
            v24.model.MeshPart.MaterialVariant = v28;
        end;
        return v1.createElement(l_Pane_0, {
            BackgroundColor = l_props_0.BackgroundColor, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            AssetRenderModel = v1.createElement(l_AssetRenderModel_0, {
                Ambient = l_MaterialPreview_0.Ambient, 
                BackgroundColor3 = l_prioritize_0(l_props_0.BackgroundColor, if not l_props_0.Hover then l_MaterialPreview_0.BackgroundColor else l_MaterialPreview_0.BackgroundColorHover), 
                DisablePan = true, 
                DisableZoom = l_props_0.DisableZoom, 
                EnableSky = if not l_getFFlagEnableSkyForMetalBalls_0() then nil else v20[l_Material_0] and not v28, 
                InitialDistance = l_props_0.InitialDistance, 
                LightColor = l_MaterialPreview_0.LightColor, 
                LightDirection = l_MaterialPreview_0.LightDirection, 
                Model = v24.model, 
                Size = UDim2.fromScale(1, 1), 
                Static = l_props_0.Static
            })
        });
    else
        return v1.createElement(l_Pane_0, {
            BackgroundColor = l_props_0.BackgroundColor, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            LayoutOrder = l_props_0.LayoutOrder
        });
    end;
end;
return v2.connect(function(v30, v31)
    return {
        MaterialWrapper = if not v31.MaterialVariant then v30.MaterialBrowserReducer.Materials[v31.Material] else v30.MaterialBrowserReducer.Materials[v31.MaterialVariant], 
        MaterialOverride = if v31.MaterialVariant then nil else v30.MaterialBrowserReducer.MaterialOverride[v31.Material], 
        MaterialOverrides = if v31.MaterialVariant then nil else v30.MaterialBrowserReducer.MaterialOverrides[v31.Material], 
        Use2022Materials = v30.MaterialBrowserReducer.Use2022Materials
    };
end, function(_)
    return {};
end)((l_withContext_0({
    MaterialServiceController = v17, 
    GeneralServiceController = v16, 
    Stylizer = l_Stylizer_0
})(v21)));
