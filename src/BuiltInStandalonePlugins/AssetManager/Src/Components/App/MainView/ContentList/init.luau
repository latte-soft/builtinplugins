local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_List_0 = l_UI_0.List;
local v6 = require(script.HeaderRow);
local v7 = require(script.ItemRow);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(script.styles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v13)
    local v14 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v13.LayoutOrder, 
        [v1.Tag] = "MainContents ContentList X-FitY X-Top X-Column X-Center"
    }, {
        HeaderRow = v1.createElement(v6, {
            LayoutOrder = v14:getNextOrder()
        }), 
        View = v1.createElement(l_List_0, {
            LayoutOrder = v14:getNextOrder(), 
            GetRowProps = function(v15, v16, v17, v18)
                return {
                    Key = v16, 
                    Position = v17, 
                    AssetInfo = v15, 
                    Size = v18
                };
            end, 
            Rows = v9((v8.use())), 
            RowComponent = v7, 
            RowHeight = v11:GetAttribute("RowHeight"), 
            ScrollingDirection = Enum.ScrollingDirection.XY, 
            [v1.Tag] = "ItemList"
        })
    });
end;
