local v0 = require(script.Parent.Parent.Parent.Core.Types.Category);
local v5 = {
    SORT_OPTIONS = {
        {
            name = "Relevance", 
            sort = "Relevance"
        }, 
        {
            name = "MostTaken", 
            sort = "MostTaken"
        }, 
        {
            name = "Favorites", 
            sort = "Favorites"
        }, 
        {
            name = "Updated", 
            sort = "Updated"
        }, 
        {
            name = "Ratings", 
            sort = "Ratings"
        }
    }, 
    canSort = function(v1, v2)
        local v3 = false;
        if v1 ~= "" then
            v3 = v0.categoryIsFreeAsset(v2);
        end;
        return v3;
    end, 
    getDefaultSortForCategory = function(v4)
        if not v0.categoryIsPackage(v4) then
            return 1;
        else
            return 4;
        end;
    end
};
v5.getDefaultSortNameForCategory = function(v6)
    return v5.SORT_OPTIONS[v5.getDefaultSortForCategory(v6)];
end;
v5.getDefaultSortForGroups = function(v7)
    return v5.getDefaultSortForCategory(v7.categoryName);
end;
return v5;
