local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local v16 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v18 = require(l_Parent_0.Src.Actions.SetMaterialVariant);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v20 = require(l_Constants_0.getFullMaterialType);
local v21 = require(l_Constants_0.getMaterialName);
local v22 = require(l_Constants_0.getSupportedMaterials);
local l_game_FastInt_0 = game:GetFastInt("InfluxReportMaterialManagerHundrethPercent2");
local v24 = v22();
local v25 = v2.PureComponent:extend("MaterialInformation");
v25.init = function(v26)
    v26.delete = function()
        local l_props_0 = v26.props;
        local l_Material_0 = l_props_0.Material;
        if not (not l_Material_0 or not l_Material_0.MaterialVariant) then
            l_props_0.GeneralServiceController:destroyWithUndo(l_Material_0.MaterialVariant);
            l_props_0.Analytics:report("deleteMaterialVariant");
        end;
    end;
    v26.createVariant = function()
        local l_props_1 = v26.props;
        local l_Material_1 = l_props_1.Material;
        if not (not l_Material_1 or l_Material_1.MaterialVariant) then
            local v31 = l_props_1.GeneralServiceController:createMaterialVariant(l_Material_1.Material);
            l_props_1.Analytics:report("newMaterialVariant", {
                BaseMaterial = v21(l_Material_1.Material)
            }, l_game_FastInt_0);
            l_props_1.Analytics:report("newMaterialVariantCounter");
            l_props_1.dispatchSetMaterialVariant(v31);
        end;
    end;
    v26.applyToSelection = function()
        local l_props_2 = v26.props;
        if l_props_2.Material then
            l_props_2.GeneralServiceController:ApplyToSelection(l_props_2.Material.Material, if not l_props_2.Material.MaterialVariant then nil else l_props_2.Material.MaterialVariant.Name);
            l_props_2.Analytics:report("applyToSelectionButton");
        end;
    end;
end;
v25.render = function(v33)
    local l_props_3 = v33.props;
    local l_MaterialInformation_0 = l_props_3.Stylizer.MaterialInformation;
    local l_Localization_1 = l_props_3.Localization;
    local l_Material_2 = l_props_3.Material;
    if l_Material_2 then
        local v38 = not l_Material_2.MaterialVariant;
        local v39 = if not v38 then l_Material_2.MaterialVariant.Name else l_Localization_1:getText("Materials", v21(l_Material_2.Material));
        local v40 = v20(l_Material_2, l_Localization_1);
        local l_MaterialPath_0 = l_Material_2.MaterialPath;
        local v42 = {};
        for v43, v44 in ipairs(l_MaterialPath_0) do
            v42[v43] = l_Localization_1:getText("Categories", v44);
        end;
        local v45 = table.concat(v42, " > ");
        local v46 = 1;
        if v24[l_Material_2.Material] then
            v46 = 2;
        end;
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Padding = 10
        }, {
            Title = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                Size = l_MaterialInformation_0.LabelRowSize
            }, {
                Name = v2.createElement(l_TruncatedTextLabel_0, {
                    LayoutOrder = 1, 
                    Font = l_MaterialInformation_0.HeaderFont, 
                    Size = UDim2.new(1, -(v46 * l_MaterialInformation_0.ButtonSize.X.Offset), 1, 0), 
                    Text = v39, 
                    TextSize = l_MaterialInformation_0.TitleTextSize, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                ApplyToSelection = v2.createElement(l_Button_0, {
                    LayoutOrder = 2, 
                    OnClick = v33.applyToSelection, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.ApplyToSelection, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("TopBar", "Apply")
                    })
                }), 
                CreateVariant = if not not v38 and v24[l_Material_2.Material] then v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    OnClick = v33.createVariant, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.CreateVariant, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("MaterialInformation", "CreateVariant")
                    })
                }) else nil, 
                Delete = if v38 then nil else v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    OnClick = v33.delete, 
                    Size = l_MaterialInformation_0.ButtonSize, 
                    Style = l_MaterialInformation_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_MaterialInformation_0.Delete, 
                        Size = l_MaterialInformation_0.ImageSize, 
                        Position = l_MaterialInformation_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("MaterialInformation", "Delete")
                    })
                })
            }), 
            MaterialType = v2.createElement(l_TruncatedTextLabel_0, {
                LayoutOrder = 2, 
                Size = l_MaterialInformation_0.LabelRowSize, 
                Text = v40, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Category = v2.createElement(l_TruncatedTextLabel_0, {
                LayoutOrder = 3, 
                Size = l_MaterialInformation_0.LabelRowSize, 
                Text = v45, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    else
        return v2.createElement(l_Pane_0);
    end;
end;
return v3.connect(function(v47, v48)
    return {
        Material = v48.MaterialMock or v47.MaterialBrowserReducer.Material
    };
end, function(v49)
    return {
        dispatchSetMaterialVariant = function(v50)
            v49(v18(v50));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v16, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v25)));
