local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local v3 = require(l_Packages_0.Cryo);
return (v2.createReducer({
    searchTerm = "", 
    results = {}
}, {
    [require(l_Parent_0.Core.Actions.SetLiveSearch).name] = function(v4, v5)
        return v3.Dictionary.join(v4, {
            results = v5.results, 
            searchTerm = v5.searchTerm
        });
    end
}));
