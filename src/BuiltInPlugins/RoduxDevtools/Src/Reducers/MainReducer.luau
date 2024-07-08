local v0 = require(script.Parent.Parent.Parent.Packages.Rodux);
local l_Parent_0 = script.Parent;
return (v0.combineReducers({
    selectedIndex = require(l_Parent_0.SelectedIndexReducer), 
    searchTerm = require(l_Parent_0.SearchTermReducer), 
    events = require(l_Parent_0.EventsReducer)
}));
