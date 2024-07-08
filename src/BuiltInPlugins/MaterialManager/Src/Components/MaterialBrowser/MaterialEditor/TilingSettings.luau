local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v16 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v18 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local v19 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v21 = require(l_Constants_0.getMaterialPatterns);
local v22 = require(l_Constants_0.getMaterialPatternName);
local v23 = require(l_Constants_0.getSettingsNames);
local l_Util_0 = l_Parent_0.Src.Util;
local v25 = require(l_Util_0.getNumberFromText);
local v26 = require(l_Util_0.getTextFromNumber);
local v27 = v21();
local v28 = v23();
local v29 = v2.PureComponent:extend("TilingSettings");
v29.init = function(v30)
    v30.state = {
        studsPerTile = v26(v30.props.PBRMaterial.StudsPerTile)
    };
    v30.materialPatterns = {};
    v30.onStudsPerTileChanged = function(v31)
        v30:setState({
            studsPerTile = v31
        });
    end;
    v30.setStudsPerTileStatus = function(v32)
        v30:setState({
            studsPerTileMessage = v32 or v2.None, 
            status = if not v32 then Enum.PropertyStatus.Ok else Enum.PropertyStatus.Warning
        });
    end;
    v30.onFocusLost = function()
        local l_props_0 = v30.props;
        local l_Localization_1 = l_props_0.Localization;
        local v35 = v25(v30.state.studsPerTile);
        if not v35 then
            v30:setState({
                studsPerTile = v26(v30.props.PBRMaterial.StudsPerTile)
            });
            v30.setStudsPerTileStatus(l_Localization_1:getText("CreateDialog", "ErrorStudsPerTile"));
            return ;
        else
            l_props_0.GeneralServiceController:setStudsPerTile(l_props_0.PBRMaterial, v35);
            v30.setStudsPerTileStatus(nil);
            return ;
        end;
    end;
    v30.onMaterialPatternSelected = function(v36, v37)
        local l_props_1 = v30.props;
        if v36 then
            l_props_1.GeneralServiceController:setMaterialPattern(l_props_1.PBRMaterial, v27[v37]);
        end;
    end;
    v30.onExpandedChanged = function()
        local l_props_2 = v30.props;
        l_props_2.dispatchSetExpandedPane(v28.TilingSettings, not l_props_2.ExpandedPane);
    end;
end;
v29.didMount = function(v40)
    local l_Localization_2 = v40.props.Localization;
    for _, v43 in ipairs(v27) do
        table.insert(v40.materialPatterns, l_Localization_2:getText("MaterialPatterns", v22(v43)));
    end;
    v40:setState({});
end;
v29.didUpdate = function(v44, _, v46)
    if v44.state.studsPerTile ~= v26(v44.props.PBRMaterial.StudsPerTile) and v46.studsPerTile == v44.state.studsPerTile then
        v44:setState({
            studsPerTile = v26(v44.props.PBRMaterial.StudsPerTile), 
            studsPerTileMessage = v2.None, 
            status = Enum.PropertyStatus.Ok
        });
    end;
end;
v29.render = function(v47)
    local l_props_3 = v47.props;
    local l_TilingSettings_0 = l_props_3.Stylizer.TilingSettings;
    local l_Localization_3 = l_props_3.Localization;
    local v51 = l_LayoutOrderIterator_0.new();
    local v52 = 1;
    for v53, v54 in ipairs(v27) do
        if v54 == l_props_3.PBRMaterial.MaterialPattern then
            v52 = v53;
        end;
    end;
    local v55 = {
        StudsPerTile = v2.createElement(v19, {
            LabelColumnWidth = l_props_3.LabelWidth or l_TilingSettings_0.LabelColumnWidth, 
            LayoutOrder = v51:getNextOrder(), 
            Text = l_Localization_3:getText("MaterialTiling", "StudsPerTile"), 
            StatusText = v47.state.studsPerTileMessage, 
            Status = v47.state.status
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_TilingSettings_0.DialogColumnSize, 
                Text = v47.state.studsPerTile, 
                OnTextChanged = v47.onStudsPerTileChanged, 
                OnFocusLost = v47.onFocusLost
            })
        }), 
        MaterialPattern = v2.createElement(v19, {
            LabelColumnWidth = l_props_3.LabelWidth or l_TilingSettings_0.LabelColumnWidth, 
            LayoutOrder = v51:getNextOrder(), 
            Text = l_Localization_3:getText("MaterialTiling", "Pattern")
        }, {
            v2.createElement(l_SelectInput_0, {
                Style = l_TilingSettings_0.CustomSelectInput, 
                Items = v47.materialPatterns, 
                Size = l_TilingSettings_0.DialogColumnSize, 
                OnItemActivated = v47.onMaterialPatternSelected, 
                SelectedIndex = v52
            })
        })
    };
    if not l_props_3.Expandable then
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = l_TilingSettings_0.ItemSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, v55);
    else
        return v2.createElement(l_ExpandablePane_0, {
            LayoutOrder = l_props_3.LayoutOrder, 
            ContentPadding = l_TilingSettings_0.ContentPadding, 
            ContentSpacing = l_TilingSettings_0.ItemSpacing, 
            Text = l_Localization_3:getText("MaterialTiling", "Tiling"), 
            Style = l_TilingSettings_0.CustomExpandablePane, 
            Expanded = l_props_3.ExpandedPane, 
            OnExpandedChanged = v47.onExpandedChanged
        }, v55);
    end;
end;
return v4.connect(function(v56)
    return {
        ExpandedPane = v56.MaterialBrowserReducer.ExpandedPane[v28.TilingSettings], 
        Material = v56.MaterialBrowserReducer.Material
    };
end, function(v57)
    return {
        dispatchSetExpandedPane = function(v58, v59)
            v57(v16(v58, v59));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v18, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v29)));
