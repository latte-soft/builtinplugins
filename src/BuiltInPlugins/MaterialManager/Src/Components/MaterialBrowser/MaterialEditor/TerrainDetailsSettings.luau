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
local l_Button_0 = l_UI_0.Button;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local v15 = require(l_Parent_0.Src.Util.getTerrainDetails);
local v16 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v18 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local l_MaterialEditor_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor;
local v20 = require(l_MaterialEditor_0.LabeledElement);
local v21 = require(l_MaterialEditor_0.TerrainDetailsEditor);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v23 = require(l_Constants_0.getTerrainFaceName);
local v24 = require(l_Constants_0.getTerrainFaces);
local v25 = require(l_Constants_0.getSettingsNames)();
local v26 = v24();
local v27 = v2.PureComponent:extend("TerrainDetailsSettings");
v27.init = function(v28)
    v28.onClick = function(v29)
        v28.props.GeneralServiceController:createTerrainDetail(v28.props.MaterialVariant, v29);
    end;
    v28.onDelete = function(v30)
        v28.props.GeneralServiceController:destroyWithUndo(v30);
    end;
    v28.onExpandedChanged = function()
        local l_props_0 = v28.props;
        l_props_0.dispatchSetExpandedPane(v25.TerrainDetailsSettings, not l_props_0.ExpandedPane);
    end;
end;
v27.render = function(v32)
    local l_props_1 = v32.props;
    local l_TerrainDetailsSettings_0 = l_props_1.Stylizer.TerrainDetailsSettings;
    local l_Localization_1 = l_props_1.Localization;
    local v36 = l_LayoutOrderIterator_0.new();
    local l_Material_0 = l_props_1.Material;
    if l_Material_0.MaterialVariant then
        local v38 = v15(l_Material_0.MaterialVariant);
        local v39 = {};
        for _, v41 in ipairs(v26) do
            local v42 = v23(v41);
            local v43 = v38[v41];
            if not v43 then
                v39[v42] = v2.createElement(v20, {
                    LabelColumnWidth = l_TerrainDetailsSettings_0.LabelColumnWidth, 
                    LayoutOrder = v36:getNextOrder(), 
                    Text = l_Localization_1:getText("TerrainDetails", v42)
                }, {
                    v2.createElement(l_Button_0, {
                        Size = l_TerrainDetailsSettings_0.DialogColumnSize, 
                        Text = l_Localization_1:getText("TerrainDetails", "ButtonCreate"), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        OnClick = function()
                            v32.onClick(v42);
                        end, 
                        Style = "Round"
                    })
                });
            else
                v39[v42] = v2.createElement(v21, {
                    LabelColumnWidth = l_TerrainDetailsSettings_0.LabelColumnWidth, 
                    LayoutOrder = v36:getNextOrder(), 
                    TerrainDetail = v43, 
                    TerrainFace = v42, 
                    OnDelete = function()
                        v32.onDelete(v43);
                    end
                });
            end;
        end;
        return v2.createElement(l_ExpandablePane_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            ContentPadding = l_TerrainDetailsSettings_0.ContentPadding, 
            ContentSpacing = l_TerrainDetailsSettings_0.ItemSpacing, 
            Text = l_Localization_1:getText("TerrainDetails", "TerrainDetails"), 
            Style = l_TerrainDetailsSettings_0.CustomExpandablePane, 
            Expanded = l_props_1.ExpandedPane, 
            OnExpandedChanged = v32.onExpandedChanged
        }, v39);
    else
        return v2.createElement(l_Pane_0);
    end;
end;
return v4.connect(function(v44, v45)
    return {
        Material = v45.MockMaterial or v44.MaterialBrowserReducer.Material, 
        ExpandedPane = v44.MaterialBrowserReducer.ExpandedPane[v25.TerrainDetailsSettings]
    };
end, function(v46)
    return {
        dispatchSetExpandedPane = function(v47, v48)
            v46(v16(v47, v48));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v18, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v27)));
