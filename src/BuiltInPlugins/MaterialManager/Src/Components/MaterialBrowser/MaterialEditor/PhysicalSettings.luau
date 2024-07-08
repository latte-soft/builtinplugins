local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_UI_0 = v3.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v15 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v18 = require(l_Controllers_0.MaterialServiceController);
local v19 = require(l_Controllers_0.GeneralServiceController);
local v20 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local v21 = require(l_Parent_0.Src.Resources.Constants.getSettingsNames);
local v22 = require(l_Parent_0.Src.Util.getNumberFromText);
local v23 = require(l_Parent_0.Src.Util.ResetCustomPhysicalProperties);
local v24 = v21();
local v25 = v1.PureComponent:extend("PhysicalSettings");
v25.init = function(v26)
    v26.setPhysicalProperty = function(v27)
        return function(v28)
            v26.physicalProperties[v27] = v28;
        end;
    end;
    v26.onFocusLost = function()
        v26.props.MaterialVariant.CustomPhysicalProperties = PhysicalProperties.new(v22(v26.physicalProperties.Density) or 0, v22(v26.physicalProperties.Friction) or 0, v22(v26.physicalProperties.Elasticity) or 0, v22(v26.physicalProperties.FrictionWeight) or 0, v22(v26.physicalProperties.ElasticityWeight) or 0);
    end;
    v26.reset = function()
        v23(v26.props.MaterialVariant);
    end;
    v26.onExpandedChanged = function()
        local l_props_0 = v26.props;
        l_props_0.dispatchSetExpandedPane(v24.PhysicalSettings, not l_props_0.ExpandedPane);
    end;
end;
v25.render = function(v30)
    local l_props_1 = v30.props;
    local l_PhysicalSettings_0 = l_props_1.Stylizer.PhysicalSettings;
    local l_Localization_1 = l_props_1.Localization;
    local v34 = l_LayoutOrderIterator_0.new();
    local v35 = l_props_1.MaterialVariant.CustomPhysicalProperties or PhysicalProperties.new(l_props_1.MaterialVariant.BaseMaterial);
    if v35 then
        v30.physicalProperties = {
            Density = string.format("%.3f", v35.Density):gsub("%.?0+$", ""), 
            Elasticity = string.format("%.3f", v35.Elasticity):gsub("%.?0+$", ""), 
            ElasticityWeight = string.format("%.3f", v35.ElasticityWeight):gsub("%.?0+$", ""), 
            Friction = string.format("%.3f", v35.Friction):gsub("%.?0+$", ""), 
            FrictionWeight = string.format("%.3f", v35.FrictionWeight):gsub("%.?0+$", "")
        };
    end;
    return v1.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        ContentPadding = l_PhysicalSettings_0.ContentPadding, 
        ContentSpacing = l_PhysicalSettings_0.ItemSpacing, 
        Text = l_Localization_1:getText("PhysicalProperties", "Physics"), 
        Style = l_PhysicalSettings_0.CustomExpandablePane, 
        Expanded = l_props_1.ExpandedPane, 
        OnExpandedChanged = v30.onExpandedChanged
    }, {
        Density = v1.createElement(v20, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v34:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Density")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v30.physicalProperties.Density, 
                OnTextChanged = v30.setPhysicalProperty("Density"), 
                OnFocusLost = v30.onFocusLost
            })
        }), 
        Elasticity = v1.createElement(v20, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v34:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Elasticity")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v30.physicalProperties.Elasticity, 
                OnTextChanged = v30.setPhysicalProperty("Elasticity"), 
                OnFocusLost = v30.onFocusLost
            })
        }), 
        Friction = v1.createElement(v20, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v34:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Friction")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v30.physicalProperties.Friction, 
                OnTextChanged = v30.setPhysicalProperty("Friction"), 
                OnFocusLost = v30.onFocusLost
            })
        }), 
        ElasticityWeight = v1.createElement(v20, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v34:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "ElasticityWeight")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v30.physicalProperties.ElasticityWeight, 
                OnTextChanged = v30.setPhysicalProperty("ElasticityWeight"), 
                OnFocusLost = v30.onFocusLost
            })
        }), 
        FrictionWeight = v1.createElement(v20, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v34:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "FrictionWeight")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v30.physicalProperties.FrictionWeight, 
                OnTextChanged = v30.setPhysicalProperty("FrictionWeight"), 
                OnFocusLost = v30.onFocusLost
            })
        }), 
        Reset = v1.createElement(l_Pane_0, {
            LayoutOrder = v34:getNextOrder(), 
            Padding = {
                Left = l_PhysicalSettings_0.ButtonPadding
            }, 
            Size = l_PhysicalSettings_0.ButtonSize
        }, {
            Button = v1.createElement(l_Button_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                OnClick = v30.reset, 
                Text = l_Localization_1:getText("PhysicalProperties", "Reset"), 
                Style = "Round"
            })
        })
    });
end;
return v2.connect(function(v36, _)
    return {
        ExpandedPane = v36.MaterialBrowserReducer.ExpandedPane[v24.PhysicalSettings], 
        Material = v36.MaterialBrowserReducer.Material
    };
end, function(v38)
    return {
        dispatchSetExpandedPane = function(v39, v40)
            v38(v15(v39, v40));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    MaterialServiceController = v18, 
    GeneralServiceController = v19
})(v25)));
