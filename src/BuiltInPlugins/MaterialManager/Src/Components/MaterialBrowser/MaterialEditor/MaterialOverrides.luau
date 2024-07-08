local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Flags);
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v5.Style.Stylizer;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local v16 = require(l_Parent_0.Src.Controllers.MaterialServiceController);
local v17 = require(l_Parent_0.Src.Resources.Constants.getSupportedMaterials);
local v18 = require(l_Parent_0.Src.Components.StatusIcon);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v20 = v17();
local v21 = v3.PureComponent:extend("MaterialOverrides");
v21.init = function(v22)
    v22.onMaterialItemActivated = function(_, v24)
        local l_props_0 = v22.props;
        local v26 = if not l_props_0.Material then Enum.Material.Plastic else l_props_0.Material.Material;
        if v24 == 1 then
            l_props_0.MaterialServiceController:setMaterialOverride(v26);
            return ;
        else
            l_props_0.MaterialServiceController:setMaterialOverride(v26, l_props_0.MaterialOverrides[v24]);
            return ;
        end;
    end;
end;
v21.render = function(v27)
    local l_props_1 = v27.props;
    local l_MaterialOverrides_0 = l_props_1.Stylizer.MaterialOverrides;
    local l_Localization_1 = l_props_1.Localization;
    local l_Material_0 = l_props_1.Material;
    local l_MaterialStatus_0 = l_props_1.MaterialStatus;
    local v33 = l_MaterialStatus_0 ~= Enum.PropertyStatus.Ok;
    local v34 = "";
    if l_MaterialStatus_0 == Enum.PropertyStatus.Error then
        v34 = l_Localization_1:getText("MaterialStatus", "MissingMaterial");
    elseif l_MaterialStatus_0 == Enum.PropertyStatus.Warning then
        v34 = l_Localization_1:getText("MaterialStatus", "DuplicateMaterial");
    end;
    if l_Material_0 then
        local _ = nil;
        return v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_1.LayoutOrder, 
            Spacing = l_MaterialOverrides_0.Padding, 
            Padding = l_MaterialOverrides_0.Padding
        }, {
            Name = v3.createElement(l_TruncatedTextLabel_0, {
                LayoutOrder = 1, 
                Font = l_MaterialOverrides_0.HeaderFont, 
                Size = l_MaterialOverrides_0.LabelRowSize, 
                Text = l_Localization_1:getText("MaterialOverrides", "MaterialOverrides"), 
                TextSize = l_MaterialOverrides_0.SectionHeaderTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            OverridesPanel = if not v20[l_Material_0.Material] then v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = 2
            }, {
                TextLabel = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = l_MaterialOverrides_0.OverrideSize, 
                    Text = l_Localization_1:getText("MaterialOverrides", "OverrideUnavailable"), 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }) else v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Spacing = l_MaterialOverrides_0.Spacing
            }, {
                Label = v3.createElement(l_Pane_0, {
                    LayoutOrder = 1, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = l_MaterialOverrides_0.OverrideSize, 
                    Spacing = 3, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }, {
                    Status = v33 and v3.createElement(v18, {
                        LayoutOrder = 1, 
                        Size = l_MaterialOverrides_0.ImageSize, 
                        StatusText = v34, 
                        Status = l_MaterialStatus_0
                    }), 
                    Label = v3.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2, 
                        Text = l_Localization_1:getText("MaterialOverrides", "MaterialOverride"), 
                        TextTruncate = if not v33 then nil else Enum.TextTruncate.AtEnd
                    })
                }), 
                SelectInputWrapper = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    Size = l_MaterialOverrides_0.OverrideSize, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    SelectInput = v3.createElement(l_SelectInput_0, {
                        Items = l_props_1.MaterialOverrides, 
                        OnItemActivated = v27.onMaterialItemActivated, 
                        PlaceholderText = l_props_1.MaterialOverrides[l_props_1.MaterialOverride], 
                        SelectedIndex = l_props_1.MaterialOverride, 
                        Width = l_MaterialOverrides_0.OverrideSize.X.Offset - l_MaterialOverrides_0.Padding
                    })
                })
            })
        });
    else
        return v3.createElement(l_Pane_0);
    end;
end;
return v4.connect(function(v36, v37)
    if not v37.MockMaterial then
        if v36.MaterialBrowserReducer.Material and v20[v36.MaterialBrowserReducer.Material.Material] then
            return {
                Material = v36.MaterialBrowserReducer.Material, 
                MaterialOverrides = v36.MaterialBrowserReducer.MaterialOverrides[v36.MaterialBrowserReducer.Material.Material], 
                MaterialOverride = v36.MaterialBrowserReducer.MaterialOverride[v36.MaterialBrowserReducer.Material.Material], 
                MaterialStatus = if v36.MaterialBrowserReducer.Material.MaterialVariant then nil else v36.MaterialBrowserReducer.MaterialStatus[v36.MaterialBrowserReducer.Material.Material]
            };
        else
            return {
                Material = v36.MaterialBrowserReducer.Material
            };
        end;
    else
        return {
            Material = v37.MockMaterial, 
            MaterialOverrides = v36.MaterialBrowserReducer.MaterialOverrides[v37.MockMaterial.Material], 
            MaterialOverride = v36.MaterialBrowserReducer.MaterialOverride[v37.MockMaterial.Material], 
            MaterialStatus = if v37.MockMaterial.MaterialVariant then nil else v36.MaterialBrowserReducer.MaterialStatus[v37.MockMaterial.Material]
        };
    end;
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialServiceController = v16, 
    Stylizer = l_Stylizer_0
})(v21)));
