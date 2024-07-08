local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeView_0 = l_UI_0.TreeView;
local v6 = require(script.ExplorerRow);
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerState);
local v10 = require(script.styles);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v12)
    local v13 = l_LayoutOrderIterator_0.new();
    local v14 = v9(v8.use(), (v7.use()));
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v12.LayoutOrder, 
        [v1.Tag] = "Explorer X-Column"
    }, {
        TreeView = v1.createElement(l_TreeView_0, {
            LayoutOrder = v13:getNextOrder(), 
            RootItems = v14.Items, 
            Expansion = v14.Expansion, 
            OnExpansionChange = function(_)
            end, 
            RowComponent = v6, 
            RowHeight = v10:GetAttribute("RowHeight"), 
            [v1.Tag] = ""
        })
    });
end;
