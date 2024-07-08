local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local v14 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Controllers.MaterialServiceController);
local v17 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v19 = require(l_Constants_0.getSettingsNames);
local v20 = require(l_Constants_0.getSupportedMaterials)();
local v21 = v19();
local v22 = v2.PureComponent:extend("OverrideSettings");
v22.init = function(v23)
    v23.onOverrideToggled = function(v24)
        local l_props_0 = v23.props;
        if not v24 then
            l_props_0.MaterialServiceController:setMaterialOverride(l_props_0.MaterialVariant.BaseMaterial, l_props_0.MaterialOverrides[table.find(l_props_0.MaterialOverrides, l_props_0.MaterialVariant.Name)]);
        else
            l_props_0.MaterialServiceController:setMaterialOverride(l_props_0.MaterialVariant.BaseMaterial);
        end;
        l_props_0.Analytics:report("setOverrideToggled");
    end;
    v23.onExpandedChanged = function()
        local l_props_1 = v23.props;
        l_props_1.dispatchSetExpandedPane(v21.OverrideSettings, not l_props_1.ExpandedPane);
    end;
end;
v22.render = function(v27)
    local l_props_2 = v27.props;
    local l_OverrideSettings_0 = l_props_2.Stylizer.OverrideSettings;
    local l_Localization_1 = l_props_2.Localization;
    local l_MaterialVariant_0 = l_props_2.MaterialVariant;
    local v32 = false;
    if l_props_2.MaterialOverride > 1 then
        v32 = l_props_2.MaterialOverrides[l_props_2.MaterialOverride] == l_MaterialVariant_0.Name;
    end;
    return v2.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_2.LayoutOrder, 
        ContentPadding = l_OverrideSettings_0.ContentPadding, 
        ContentSpacing = l_OverrideSettings_0.ItemSpacing, 
        Text = l_Localization_1:getText("OverrideSettings", "Overrides"), 
        Style = l_OverrideSettings_0.CustomExpandablePane, 
        Expanded = l_props_2.ExpandedPane, 
        OnExpandedChanged = v27.onExpandedChanged
    }, {
        OverridesNew = v2.createElement(v17, {
            LabelColumnWidth = l_OverrideSettings_0.LabelColumnWidth, 
            Text = l_Localization_1:getText("OverrideSettings", "SetOverride")
        }, {
            Button = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(0, 195, 0, 20), 
                Padding = 5
            }, {
                ToggleButton = v2.createElement(l_ToggleButton_0, {
                    OnClick = function()
                        v27.onOverrideToggled(v32);
                    end, 
                    Selected = v32, 
                    Size = UDim2.fromOffset(30, 18)
                })
            })
        })
    });
end;
return v3.connect(function(v33, v34)
    if not v34.MockMaterial then
        if v33.MaterialBrowserReducer.Material and v20[v33.MaterialBrowserReducer.Material.Material] then
            return {
                ExpandedPane = v33.MaterialBrowserReducer.ExpandedPane[v21.OverrideSettings], 
                MaterialOverrides = v33.MaterialBrowserReducer.MaterialOverrides[v33.MaterialBrowserReducer.Material.Material], 
                MaterialOverride = v33.MaterialBrowserReducer.MaterialOverride[v33.MaterialBrowserReducer.Material.Material]
            };
        else
            return {};
        end;
    else
        return {
            ExpandedPane = v33.MaterialBrowserReducer.ExpandedPane[v21.OverrideSettings], 
            MaterialOverrides = v33.MaterialBrowserReducer.MaterialOverrides[v34.MockMaterial.Material], 
            MaterialOverride = v33.MaterialBrowserReducer.MaterialOverride[v34.MockMaterial.Material]
        };
    end;
end, function(v35)
    return {
        dispatchSetExpandedPane = function(v36, v37)
            v35(v14(v36, v37));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialServiceController = v16, 
    Stylizer = l_Stylizer_0
})(v22)));
