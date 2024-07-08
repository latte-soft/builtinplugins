local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_MaterialEditor_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor;
local v14 = require(l_MaterialEditor_0.MaterialHeader);
local v15 = require(l_MaterialEditor_0.MaterialInformation);
local v16 = require(l_MaterialEditor_0.GeneralSettings);
local v17 = require(l_MaterialEditor_0.TextureSettings);
local v18 = require(l_MaterialEditor_0.TilingSettings);
local v19 = require(l_MaterialEditor_0.MaterialOverrides);
local v20 = require(l_MaterialEditor_0.OverrideSettings);
local v21 = require(l_MaterialEditor_0.TerrainDetailsSettings);
local v22 = require(l_MaterialEditor_0.PhysicalSettings);
local v23 = require(l_Parent_0.Src.Resources.Constants.getSupportedMaterials)();
local v24 = v2.PureComponent:extend("MaterialEditor");
v24.render = function(v25)
    local l_props_0 = v25.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    if l_props_0.Material then
        local l_MaterialVariant_0 = l_props_0.Material.MaterialVariant;
        local v30 = v23[l_props_0.Material.Material];
        local v31 = l_LayoutOrderIterator_0.new();
        return v2.createElement(l_ScrollingFrame_0, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0, 
            Size = l_Size_0
        }, {
            Pane = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical
            }, {
                MaterialHeader = v2.createElement(v14, {
                    LayoutOrder = v31:getNextOrder()
                }), 
                MaterialInformation = v2.createElement(v15, {
                    LayoutOrder = v31:getNextOrder()
                }), 
                GeneralSettings = if not l_MaterialVariant_0 then nil else v2.createElement(v16, {
                    LayoutOrder = v31:getNextOrder(), 
                    MaterialVariant = l_MaterialVariant_0
                }), 
                TextureSettings = if not l_MaterialVariant_0 then nil else v2.createElement(v17, {
                    LayoutOrder = v31:getNextOrder(), 
                    PBRMaterial = l_MaterialVariant_0, 
                    Expandable = true
                }), 
                OverrideSettings = if not not l_MaterialVariant_0 and v30 then v2.createElement(v20, {
                    LayoutOrder = v31:getNextOrder(), 
                    MaterialVariant = l_MaterialVariant_0
                }) else v2.createElement(v19, {
                    LayoutOrder = v31:getNextOrder()
                }), 
                TilingSettings = if not l_MaterialVariant_0 then nil else v2.createElement(v18, {
                    LayoutOrder = v31:getNextOrder(), 
                    PBRMaterial = l_MaterialVariant_0, 
                    Expandable = true
                }), 
                TerrainDetailsSettings = if not l_MaterialVariant_0 then nil else v2.createElement(v21, {
                    LayoutOrder = v31:getNextOrder(), 
                    MaterialVariant = l_MaterialVariant_0
                }), 
                PhysicalSettings = if not l_MaterialVariant_0 then nil else v2.createElement(v22, {
                    LayoutOrder = v31:getNextOrder(), 
                    MaterialVariant = l_MaterialVariant_0
                })
            })
        });
    else
        return v2.createElement(l_Pane_0);
    end;
end;
return v3.connect(function(v32, v33)
    return {
        Material = v33.MaterialMock or v32.MaterialBrowserReducer.Material
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v24)));
