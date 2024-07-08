local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
return function(v8)
    local v9 = l_Localization_0.use();
    local _ = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v8.LayoutOrder, 
        [v1.Tag] = "TopBar X-Center X-Stroke X-Middle X-ColumnM"
    }, {
        SearchBar = v1.createElement(l_SearchBar_0, {
            PlaceholderText = v9:getText("Search", "Placeholder"), 
            OnTextChanged = function()
            end, 
            [v1.Tag] = "X-PadS"
        })
    });
end;
