local l_Parent_0 = script.Parent.Parent.Parent.Parent;
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
local l_Pane_0 = l_UI_0.Pane;
local l_InfiniteScrollingGrid_0 = l_UI_0.InfiniteScrollingGrid;
local l_IconButton_0 = l_UI_0.IconButton;
local v14 = require(l_Parent_0.Src.Actions.SetMenuHover);
local v15 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialGrid.MaterialItem);
local v16 = v2.PureComponent:extend("MaterialGrid");
v16.init = function(v17)
    v17.renderItem = function(v18, v19)
        return v2.createElement(v15, {
            MaterialItem = v19, 
            LayoutOrder = v18
        });
    end;
    v17.onMouseEnter = function()
        v17.props.dispatchSetMenuHover(true);
    end;
    v17.onMouseLeave = function()
        v17.props.dispatchSetMenuHover(false);
    end;
end;
v16.render = function(v20)
    local l_props_0 = v20.props;
    local l_MaterialGrid_0 = l_props_0.Stylizer.MaterialGrid;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaterialTileSize_0 = l_props_0.MaterialTileSize;
    local l_Size_0 = l_props_0.Size;
    local l_ViewType_0 = l_props_0.ViewType;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = l_MaterialGrid_0.BackgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0
    }, {
        Grid = v2.createElement(l_InfiniteScrollingGrid_0, {
            AbsoluteMax = #l_props_0.MaterialList, 
            CellPadding = if l_ViewType_0 == "Grid" then UDim2.fromOffset(l_MaterialGrid_0.GridPadding, l_MaterialGrid_0.GridPadding) else UDim2.fromOffset(l_MaterialGrid_0.ListPadding, l_MaterialGrid_0.ListPadding), 
            CellSize = if l_ViewType_0 == "Grid" then UDim2.fromOffset(l_MaterialTileSize_0, l_MaterialTileSize_0) else UDim2.new(1, -20, 0, l_MaterialGrid_0.ListHeight), 
            BufferedRows = 2, 
            Items = l_props_0.MaterialList, 
            Loading = false, 
            Padding = l_MaterialGrid_0.Padding, 
            RenderItem = v20.renderItem, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        SidebarButton = if l_props_0.SideBarVisible then nil else v2.createElement(l_IconButton_0, {
            Size = l_MaterialGrid_0.IconSize, 
            LeftIcon = l_MaterialGrid_0.ChevronRight, 
            IconColor = l_MaterialGrid_0.IconColor, 
            OnClick = l_props_0.OnShowButtonClicked or function()
            end, 
            OnMouseEnter = v20.onMouseEnter, 
            OnMouseLeave = v20.onMouseLeave, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 5, 1, -5), 
            ZIndex = 2
        })
    });
end;
return v3.connect(function(v27, _)
    return {
        MaterialList = v27.MaterialBrowserReducer.MaterialList, 
        MaterialTileSize = v27.MaterialBrowserReducer.MaterialTileSize, 
        ViewType = v27.MaterialBrowserReducer.ViewType
    };
end, function(v29)
    return {
        dispatchSetMenuHover = function(v30)
            v29(v14(v30));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v16)));
