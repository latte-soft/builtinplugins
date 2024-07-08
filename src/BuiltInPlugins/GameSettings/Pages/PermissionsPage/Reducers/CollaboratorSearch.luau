local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Rodux);
local v4 = require(l_Parent_0.Keys.loadingInProgress);
local v5 = {
    CachedSearchResults = {}, 
    SearchText = ""
};
return v3.createReducer(v5, {
    ResetStore = function(_, _)
        return v5;
    end, 
    LoadedWebResults = function(v8, v9)
        return v2.Dictionary.join(v8, {
            CachedSearchResults = v2.Dictionary.join(v8.CachedSearchResults, {
                [v9.key] = not not v9.success and v9.results or nil
            })
        });
    end, 
    LoadingWebResults = function(v10, v11)
        return v2.Dictionary.join(v10, {
            CachedSearchResults = v2.Dictionary.join(v10.CachedSearchResults, {
                [v11.searchTerm] = v4
            })
        });
    end, 
    SearchTextChanged = function(v12, v13)
        return v2.Dictionary.join(v12, {
            SearchText = v13.text
        });
    end
});
