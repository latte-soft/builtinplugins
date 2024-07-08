local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local v13 = require(l_Parent_0.Src.Actions.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v15 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.TextureMapSelector);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v17 = require(l_Constants_0.getSettingsNames);
local v18 = require(l_Constants_0.getTextureMapNames)();
local v19 = v17();
local v20 = v1.PureComponent:extend("TextureSettings");
v20.init = function(v21)
    v21.onExpandedChanged = function()
        local l_props_0 = v21.props;
        l_props_0.dispatchSetExpandedPane(v19.TextureSettings, not l_props_0.ExpandedPane);
    end;
end;
v20.render = function(v23)
    local l_props_1 = v23.props;
    local l_TextureSettings_0 = l_props_1.Stylizer.TextureSettings;
    local l_Localization_1 = l_props_1.Localization;
    if l_props_1.PBRMaterial then
        local v27 = l_LayoutOrderIterator_0.new();
        local v28 = {
            ImportColorMap = v1.createElement(v15, {
                LayoutOrder = v27:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_0.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_0.LabelWidth, 
                MapType = v18.ColorMap, 
                PreviewTitle = l_Localization_1:getText("Import", "ColorMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportColorMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_0.ColumnWidth
            }), 
            ImportMetalnessMap = v1.createElement(v15, {
                LayoutOrder = v27:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_0.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_0.LabelWidth, 
                MapType = v18.MetalnessMap, 
                PreviewTitle = l_Localization_1:getText("Import", "MetalnessMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportMetalnessMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_0.ColumnWidth
            }), 
            ImportNormalMap = v1.createElement(v15, {
                LayoutOrder = v27:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_0.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_0.LabelWidth, 
                MapType = v18.NormalMap, 
                PreviewTitle = l_Localization_1:getText("Import", "NormalMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportNormalMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_0.ColumnWidth
            }), 
            ImportRoughnessMap = v1.createElement(v15, {
                LayoutOrder = v27:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_0.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_0.LabelWidth, 
                MapType = v18.RoughnessMap, 
                PreviewTitle = l_Localization_1:getText("Import", "RoughnessMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportRoughnessMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_0.ColumnWidth
            })
        };
        if not l_props_1.Expandable then
            return v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = l_props_1.LayoutOrder, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = l_TextureSettings_0.ItemSpacing, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, v28);
        else
            return v1.createElement(l_ExpandablePane_0, {
                LayoutOrder = l_props_1.LayoutOrder, 
                ContentPadding = l_TextureSettings_0.ContentPadding, 
                ContentSpacing = l_TextureSettings_0.ItemSpacing, 
                Text = l_Localization_1:getText("MaterialTextures", "TextureMaps"), 
                Style = l_TextureSettings_0.CustomExpandablePane, 
                Expanded = l_props_1.ExpandedPane, 
                OnExpandedChanged = v23.onExpandedChanged
            }, v28);
        end;
    else
        return v1.createElement(l_Pane_0);
    end;
end;
return v2.connect(function(v29)
    return {
        ExpandedPane = v29.MaterialBrowserReducer.ExpandedPane[v19.TextureSettings]
    };
end, function(v30)
    return {
        dispatchSetExpandedPane = function(v31, v32)
            v30(v13(v31, v32));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20)));
