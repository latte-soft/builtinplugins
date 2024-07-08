local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local v4 = require(script.ScopeExplorer);
local v5 = require(script.SearchPanel);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v7)
    local v8 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v7.LayoutOrder, 
        [v1.Tag] = "Contrast X-Border X-Top X-Column"
    }, {
        SearchPanel = v1.createElement(v5, {
            LayoutOrder = v8:getNextOrder()
        }), 
        ScopeExplorer = v1.createElement(v4, {
            LayoutOrder = v8:getNextOrder()
        })
    });
end;
