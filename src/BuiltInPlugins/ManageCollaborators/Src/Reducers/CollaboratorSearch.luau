local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Keys.loadingInProgress);
local v4 = {
    CachedSearchResults = {}, 
    SearchText = ""
};
return v1.createReducer(v4, {
    ResetStore = function(_, _)
        return v4;
    end, 
    LoadedWebResults = function(v7, v8)
        return v2.Dictionary.join(v7, {
            CachedSearchResults = v2.Dictionary.join(v7.CachedSearchResults, {
                [v8.key] = not not v8.success and v8.results or nil
            })
        });
    end, 
    LoadWebResults = function(v9, v10)
        return v2.Dictionary.join(v9, {
            CachedSearchResults = v2.Dictionary.join(v9.CachedSearchResults, {
                [v10.searchTerm] = v3
            })
        });
    end, 
    SearchTextChanged = function(v11, v12)
        return v2.Dictionary.join(v11, {
            SearchText = v12.text
        });
    end
});
