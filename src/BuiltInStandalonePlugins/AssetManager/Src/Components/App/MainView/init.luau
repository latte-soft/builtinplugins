local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Pane_0 = v2.UI.Pane;
local v5 = require(script.ContentGrid);
local v6 = require(script.ContentList);
local v7 = require(script.HeaderBar);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useLayoutInfo);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
return function(v11)
    local v12 = l_LayoutOrderIterator_0.new();
    local v13 = v9((v8.use()));
    local v14 = v1.createElement(v7, {
        LayoutOrder = v12:getNextOrder()
    });
    local _ = nil;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v11.LayoutOrder, 
        [v1.Tag] = "Main X-Border X-Top X-Column"
    }, {
        HeaderBar = v14, 
        Contents = if v13.ViewType == v10.ViewType.Grid then v1.createElement(v5, {
            LayoutOrder = v12:getNextOrder()
        }) else v1.createElement(v6, {
            LayoutOrder = v12:getNextOrder()
        })
    });
end;
