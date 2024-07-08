local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useFuzzySearch);
local l_ContextServices_0 = v1.ContextServices;
local l_SearchBar_0 = v1.UI.SearchBar;
return function(v6)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v6.LayoutOrder, 
        Size = UDim2.new(1, -5, 0, 32)
    }, {
        SearchBar = v2.createElement(l_SearchBar_0, {
            PlaceholderText = l_ContextServices_0.Localization:use():getText("SearchBar", "Search"), 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            ShowFilterButton = false, 
            IncrementalTextSearch = true, 
            IncrementalTextSearchDelay = 5, 
            SearchTerm = v6.FuzzySearch.searchText, 
            OnSearchRequested = v6.FuzzySearch.setSearchText
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 5)
        })
    });
end;
