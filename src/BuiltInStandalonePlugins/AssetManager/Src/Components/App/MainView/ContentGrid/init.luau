local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Grid_0 = l_UI_0.Grid;
local l_Pane_0 = l_UI_0.Pane;
local v5 = require(script.ItemCell);
local v6 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useLayoutInfo);
local v9 = require(script.styles);
return function(v10)
    local v11 = v6.use();
    local v12 = v7(v11);
    local l_GridSize_0 = v8(v11).GridSize;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v10.LayoutOrder, 
        [v1.Tag] = "MainContents ContentGrid X-FitY X-Top X-Column X-Center"
    }, {
        View = v1.createElement(l_Grid_0, {
            Cells = v12, 
            CellSize = UDim2.fromOffset(l_GridSize_0, l_GridSize_0 + v9:GetAttribute("CellHeightDiff")), 
            CellPadding = v9:GetAttribute("CellPadding"), 
            CellComponent = v5
        })
    });
end;
