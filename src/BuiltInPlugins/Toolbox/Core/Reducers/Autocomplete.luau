local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    autocompleteResults = {}
}, {
    [require(l_Parent_0.Core.Actions.SetAutocompleteResults).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            autocompleteResults = v4.autocompleteResults
        });
    end
});
