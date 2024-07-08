local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_join_0 = v4.Dash.join;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Pane_0 = l_UI_0.Pane;
local v16 = require(l_Parent_0.Src.Actions.SetMaterialVariant);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v19 = require(l_Controllers_0.GeneralServiceController);
local v20 = require(l_Controllers_0.MaterialServiceController);
local v21 = require(l_Controllers_0.PluginController);
local l_Components_0 = l_Parent_0.Src.Components;
local v23 = require(l_Components_0.MaterialBrowser.MaterialEditor);
local l_TopBar_0 = l_Components_0.MaterialBrowser.TopBar;
local v25 = require(l_TopBar_0.ActionButton);
local v26 = require(l_TopBar_0.ViewTypeSelector);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v28 = require(l_Constants_0.getMaterialName);
local v29 = require(l_Constants_0.getMaterialPath);
local v30 = require(l_Constants_0.getSupportedMaterials);
local v31 = require(l_Parent_0.Src.Flags.getFFlagMaterialActionAsTool);
local l_game_FastInt_0 = game:GetFastInt("InfluxReportMaterialManagerHundrethPercent2");
local v33 = v30();
local v34 = v2.PureComponent:extend("TopBar");
local v35 = not v31() and 3 or 2;
v34.init = function(v36)
    v36.createMaterialVariant = function()
        local l_props_0 = v36.props;
        local v38 = if not l_props_0.Material then l_props_0.MaterialServiceController:getCategoryDefaultMaterial(l_props_0.Path) else l_props_0.Material.Material;
        if not v33[v38] then
            v38 = Enum.Material.Plastic;
        end;
        local v39 = l_props_0.GeneralServiceController:createMaterialVariant(v38, l_props_0.Search);
        l_props_0.Analytics:report("newMaterialVariant", {
            BaseMaterial = v28(v38)
        }, l_game_FastInt_0);
        l_props_0.Analytics:report("newMaterialVariantCounter");
        l_props_0.MaterialServiceController:setPath(v29(v38));
        l_props_0.dispatchSetMaterialVariant(v39);
        v23 = v2.createElement(v23, {
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 1)
        });
    end;
    v36.showInExplorer = function()
        local l_props_1 = v36.props;
        if not (not l_props_1.Material or not l_props_1.Material.MaterialVariant) then
            l_props_1.GeneralServiceController:SetSelection({
                l_props_1.Material.MaterialVariant
            });
            l_props_1.Analytics:report("showInExplorer");
        end;
    end;
    v36.DEPRECATED_materialAsTool = function()
        local l_props_2 = v36.props;
        if l_props_2.DEPRECATED_ActiveAsTool or not l_props_2.Material then
            if l_props_2.DEPRECATED_ActiveAsTool then
                l_props_2.PluginController:DEPRECATED_untoggleMaterialAsTool();
            end;
        else
            l_props_2.PluginController:DEPRECATED_toggleMaterialAsTool();
        end;
        l_props_2.Analytics:report("materialAsTool");
    end;
    v36.setSearch = function(v42)
        local l_props_3 = v36.props;
        l_props_3.MaterialServiceController:setSearch(v42);
        l_props_3.Analytics:report("searchBar");
    end;
end;
v34.render = function(v44)
    local l_props_4 = v44.props;
    local l_TopBar_1 = l_props_4.Stylizer.TopBar;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Size_0 = l_props_4.Size;
    local l_Localization_1 = l_props_4.Localization;
    local v50 = l_LayoutOrderIterator_0.new();
    local l_CreateNewVariant_0 = l_TopBar_1.CreateNewVariant;
    local l_ShowInExplorer_0 = l_TopBar_1.ShowInExplorer;
    local v53 = if not v31() then l_TopBar_1.DEPRECATED_MaterialAsToolMouseIcon else nil;
    local l_BackgroundColor_0 = l_TopBar_1.BackgroundColor;
    local l_Offset_0 = l_TopBar_1.ButtonSize.X.Offset;
    local l_Padding_0 = l_TopBar_1.Padding;
    local l_SpacerWidth_0 = l_TopBar_1.SpacerWidth;
    local l_SearchBarMaxWidth_0 = l_TopBar_1.SearchBarMaxWidth;
    local l_TopBarButtonWidth_0 = l_TopBar_1.TopBarButtonWidth;
    local l_Offset_1 = l_TopBar_1.ViewTypeSize.X.Offset;
    return v2.createElement(l_Pane_0, l_join_0({
        BackgroundColor = l_BackgroundColor_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = l_LayoutOrder_0, 
        Padding = l_Padding_0, 
        Size = l_Size_0, 
        Spacing = l_Padding_0
    }, l_props_4.WrapperProps), {
        CreateMaterialVariant = v2.createElement(v25, {
            ImageStyle = l_CreateNewVariant_0, 
            IsDisabled = false, 
            LayoutOrder = v50:getNextOrder(), 
            OnClick = v44.createMaterialVariant, 
            TooltipText = l_Localization_1:getText("TopBar", "Create")
        }), 
        ShowInExplorer = v2.createElement(v25, {
            ImageStyle = l_ShowInExplorer_0, 
            IsDisabled = not l_props_4.Material and true or (not l_props_4.Material.MaterialVariant or false), 
            LayoutOrder = v50:getNextOrder(), 
            OnClick = v44.showInExplorer, 
            TooltipText = l_Localization_1:getText("TopBar", "Show")
        }), 
        MaterialAsTool = if not v31() then v2.createElement(v25, {
            ImageStyle = v53, 
            IsPressed = if not v31() then if not v31() then l_props_4.DEPRECATED_ActiveAsTool else nil else nil, 
            LayoutOrder = v50:getNextOrder(), 
            OnClick = v44.DEPRECATED_materialAsTool, 
            TooltipText = l_Localization_1:getText("TopBar", "MaterialAsTool")
        }) else nil, 
        RestPane = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, -(v35 * (l_Offset_0 + l_Padding_0) + (l_Offset_1 + l_Padding_0)), 1, 0), 
            LayoutOrder = v50:getNextOrder()
        }, {
            SearchBar = v2.createElement(l_SearchBar_0, {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                OnSearchRequested = v44.setSearch, 
                PlaceholderText = l_Localization_1:getText("TopBar", "Search"), 
                ShowSearchButton = false, 
                ShowSearchIcon = true, 
                Size = UDim2.new(0, l_SearchBarMaxWidth_0 * math.min(1, (l_props_4.AbsoluteSize.X - (v35 * (l_Offset_0 + l_Padding_0) + (l_Offset_1 + l_Padding_0))) / (2 * l_SpacerWidth_0 + l_SearchBarMaxWidth_0)), 0, l_TopBarButtonWidth_0)
            })
        }), 
        ViewType = v2.createElement(v26, {
            LayoutOrder = v50:getNextOrder()
        })
    });
end;
return v3.connect(function(v61)
    return {
        DEPRECATED_ActiveAsTool = if not v31() then v61.MaterialBrowserReducer.DEPRECATED_ActiveAsTool else nil, 
        Material = v61.MaterialBrowserReducer.Material, 
        Path = v61.MaterialBrowserReducer.Path, 
        Search = v61.MaterialBrowserReducer.Search
    };
end, function(v62)
    return {
        dispatchSetMaterialVariant = function(v63)
            v62(v16(v63));
        end
    };
end)(l_withAbsoluteSize_0((l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v19, 
    Localization = l_Localization_0, 
    MaterialServiceController = v20, 
    PluginController = v21, 
    Stylizer = l_Stylizer_0
})(v34))));
