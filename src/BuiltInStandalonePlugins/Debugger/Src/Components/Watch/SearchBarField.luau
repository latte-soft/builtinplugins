local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_SearchBar_0 = require(l_Parent_0.Packages.Framework).UI.SearchBar;
local v4 = require(l_Parent_0.Src.Thunks.Watch.FilterWatchDataThunk);
local v5 = v1.PureComponent:extend("SearchBarField");
v5.render = function(v6)
    local l_props_0 = v6.props;
    return v1.createElement(l_SearchBar_0, {
        ShowSearchIcon = true, 
        ShowSearchButton = false, 
        OnTextChanged = l_props_0.onFilterTextChanged, 
        OnSearchRequested = l_props_0.onSearchRequested, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        SearchTerm = l_props_0.SearchTerm
    });
end;
return (v2.connect(function(v8, _)
    return {
        SearchTerm = v8.Watch.filterText
    };
end, function(v10)
    return {
        onFilterTextChanged = function(v11)
            return v10(v4(v11));
        end, 
        onSearchRequested = function(v12)
            return v10(v4(v12));
        end
    };
end)(v5));
