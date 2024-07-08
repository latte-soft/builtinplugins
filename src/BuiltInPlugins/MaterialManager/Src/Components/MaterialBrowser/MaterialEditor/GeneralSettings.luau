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
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local v14 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v17 = require(l_Controllers_0.MaterialServiceController);
local v18 = require(l_Controllers_0.GeneralServiceController);
local v19 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v21 = require(l_Constants_0.getMaterialPath);
local v22 = require(l_Constants_0.getSupportedMaterials);
local v23 = require(l_Constants_0.getMaterialName);
local v24 = require(l_Constants_0.getSettingsNames)();
local v25 = v22(true);
local v26 = v2.PureComponent:extend("GeneralSettings");
v26.init = function(v27)
    v27.state = {
        name = v27.props.MaterialVariant.Name
    };
    v27.baseMaterials = {};
    v27.setNameStatus = function(v28, v29)
        v27:setState({
            nameMessage = v28 or v2.None, 
            status = v29 or Enum.PropertyStatus.Ok
        });
    end;
    v27.onNameChanged = function(v30)
        v27:setState({
            name = v30
        });
    end;
    v27.onFocusLost = function()
        local l_props_0 = v27.props;
        local l_Localization_1 = l_props_0.Localization;
        if v27.state.name and v27.state.name ~= "" then
            l_props_0.GeneralServiceController:setName(l_props_0.MaterialVariant, v27.state.name);
            if not l_props_0.MaterialServiceController:checkMaterialName(v27.state.name, l_props_0.MaterialVariant.BaseMaterial) then
                v27.setNameStatus(nil);
                return ;
            else
                v27.setNameStatus(l_Localization_1:getText("CreateDialog", "ErrorNameExists"), Enum.PropertyStatus.Warning);
                return ;
            end;
        else
            v27:setState({
                name = l_props_0.MaterialVariant.Name
            });
            return ;
        end;
    end;
    v27.onBaseMaterialSelected = function(_, v34)
        local l_props_1 = v27.props;
        local l_Localization_2 = l_props_1.Localization;
        l_props_1.GeneralServiceController:setBaseMaterial(l_props_1.MaterialVariant, v25[v34]);
        l_props_1.MaterialServiceController:setPath(v21(l_props_1.MaterialVariant.BaseMaterial));
        if not l_props_1.MaterialServiceController:checkMaterialName(l_props_1.MaterialVariant.Name, l_props_1.MaterialVariant.BaseMaterial) then
            v27.setNameStatus(nil);
            return ;
        else
            v27.setNameStatus(l_Localization_2:getText("CreateDialog", "ErrorNameExists"), Enum.PropertyStatus.Warning);
            return ;
        end;
    end;
    v27.onExpandedChanged = function()
        local l_props_2 = v27.props;
        l_props_2.dispatchSetExpandedPane(v24.GeneralSettings, not l_props_2.ExpandedPane);
    end;
end;
v26.didMount = function(v38)
    local l_Localization_3 = v38.props.Localization;
    for _, v41 in ipairs(v25) do
        table.insert(v38.baseMaterials, l_Localization_3:getText("Materials", v23(v41)));
    end;
    v38:setState({});
end;
v26.didUpdate = function(v42, _, v44)
    if v42.state.name ~= v42.props.MaterialVariant.Name and v44.name == v42.state.name then
        v42:setState({
            name = v42.props.MaterialVariant.Name
        });
    end;
end;
v26.render = function(v45)
    local l_props_3 = v45.props;
    local l_GeneralSettings_0 = l_props_3.Stylizer.GeneralSettings;
    local l_Localization_4 = l_props_3.Localization;
    local v49 = -1;
    for v50, v51 in ipairs(v25) do
        if v51 == l_props_3.MaterialVariant.BaseMaterial then
            v49 = v50;
        end;
        if v51 == Enum.Material.Plastic and v49 == -1 then
            v49 = v50;
        end;
    end;
    if v49 == -1 then
        v49 = 1;
    end;
    return v2.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_3.LayoutOrder, 
        ContentPadding = l_GeneralSettings_0.ContentPadding, 
        ContentSpacing = l_GeneralSettings_0.ItemSpacing, 
        Text = l_Localization_4:getText("MaterialGeneral", "General"), 
        Style = l_GeneralSettings_0.CustomExpandablePane, 
        Expanded = l_props_3.ExpandedPane, 
        OnExpandedChanged = v45.onExpandedChanged
    }, {
        Name = v2.createElement(v19, {
            LabelColumnWidth = l_GeneralSettings_0.LabelColumnWidth, 
            LayoutOrder = 1, 
            Text = l_Localization_4:getText("CreateDialog", "NameVariant"), 
            StatusText = v45.state.nameMessage, 
            Status = v45.state.status
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_GeneralSettings_0.DialogColumnSize, 
                Text = v45.state.name, 
                OnTextChanged = v45.onNameChanged, 
                OnFocusLost = v45.onFocusLost
            })
        }), 
        BaseMaterial = v2.createElement(v19, {
            LabelColumnWidth = l_GeneralSettings_0.LabelColumnWidth, 
            LayoutOrder = 2, 
            Text = l_Localization_4:getText("CreateDialog", "BaseMaterialVariant")
        }, {
            v2.createElement(l_SelectInput_0, {
                Style = l_GeneralSettings_0.CustomSelectInput, 
                Items = v45.baseMaterials, 
                Size = l_GeneralSettings_0.DialogColumnSize, 
                OnItemActivated = v45.onBaseMaterialSelected, 
                PlaceholderText = l_Localization_4:getText("CreateDialog", "PlaceholderBaseMaterial"), 
                SelectedIndex = v49
            })
        })
    });
end;
return v3.connect(function(v52)
    return {
        ExpandedPane = v52.MaterialBrowserReducer.ExpandedPane[v24.GeneralSettings], 
        Material = v52.MaterialBrowserReducer.Material
    };
end, function(v53)
    return {
        dispatchSetExpandedPane = function(v54, v55)
            v53(v14(v54, v55));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    MaterialServiceController = v17, 
    GeneralServiceController = v18
})(v26)));
