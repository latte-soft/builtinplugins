local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
local l_SORT_OPTIONS_0 = require(l_Parent_0.Core.Types.Sort).SORT_OPTIONS;
local l_MARKETPLACE_0 = v1.MARKETPLACE;
return function(_, _)
    return {
        categories = l_MARKETPLACE_0, 
        category = l_MARKETPLACE_0[1].category, 
        categoryName = l_MARKETPLACE_0[1].name, 
        searchTerm = "", 
        sorts = l_SORT_OPTIONS_0, 
        sortIndex = 1, 
        sortType = l_SORT_OPTIONS_0[1].sort, 
        groups = {}, 
        groupIndex = 0, 
        groupId = 0, 
        targetPage = 1, 
        curentPage = 0, 
        selectedBackgroundIndex = 1, 
        hoveredBackgroundIndex = 0
    };
end;
