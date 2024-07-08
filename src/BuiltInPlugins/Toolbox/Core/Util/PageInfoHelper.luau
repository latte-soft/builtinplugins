local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepEqual_0 = require(l_Parent_0.Packages.Framework).Util.deepEqual;
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v4 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Util.Constants);
local v9 = {
    getCurrentTab = function(v6)
        return (v4.getTabKeyForCategoryName(v6.categoryName));
    end, 
    getCategory = function(v7)
        local v8 = v4.getCategoryByName(v7);
        if v8 and v8.category then
            return v8.category;
        else
            if v2.shouldDebugWarnings() then
                warn(("Lua toolbox: No category for category name %s"):format((tostring(v7))));
            end;
            return "";
        end;
    end
};
v9.getCategoryForPageInfo = function(v10)
    return v9.getCategory(v10.categoryName);
end;
v9.getSortType = function(v11, v12)
    if v11 and v12 then
        local v13 = v11[v12];
        if v13 and v13.sort then
            return v13.sort;
        else
            if v2.shouldDebugWarnings() then
                warn(("Lua Toolbox: no sort for sort index %s"):format((tostring(v12))));
            end;
            return "";
        end;
    else
        return nil;
    end;
end;
v9.getSortTypeForPageInfo = function(v14)
    return v9.getSortType(v14.sorts, v14.sortIndex);
end;
v9.getGroupId = function(v15, v16)
    if v16 == 0 then
        return 0;
    elseif (v16 >= 1 and #v15 >= v16) and v15[v16].id then
        return v15[v16].id;
    else
        if v2.shouldDebugWarnings() then
            warn(("Lua Toolbox: no group for group index %s"):format((tostring(v16))));
        end;
        return 0;
    end;
end;
v9.getGroupIdForPageInfo = function(v17)
    return v9.getGroupId(v17.groups, v17.groupIndex);
end;
v9.getEngineAssetTypeForPageInfoCategory = function(v18)
    local v19 = v4.getCategoryByName(v18.categoryName);
    if v19 and v19.assetType then
        return v4.getEngineAssetType(v19.assetType);
    else
        if v2.shouldDebugWarnings() then
            warn(("Lua toolbox: No assetType for category name %s"):format((tostring(v18.categoryName))));
        end;
        return nil;
    end;
end;
v9.getBackendNameForPageInfoCategory = function(v20)
    local v21 = v9.getEngineAssetTypeForPageInfoCategory(v20);
    return not not v21 and v21.Name or nil;
end;
v9.isDeveloperCategory = function(v22)
    return v3.developCategoryType[v9.getCategoryForPageInfo(v22)];
end;
v9.isPackagesCategory = function(v23)
    return v3.packagesCategoryType[v9.getCategoryForPageInfo(v23)];
end;
v9.getRequestInfo = function(v24)
    return {
        category = v9.getCategoryForPageInfo(v24) or "", 
        creatorId = not not v24.creator and v24.creator.Id or "", 
        creatorType = not not v24.creator and v24.creator.Type or 1, 
        groupId = not not v4.categoryIsGroupAsset(v24.categoryName) and v9.getGroupIdForPageInfo(v24) or 0, 
        searchTerm = v24.searchTerm or "", 
        sortType = v9.getSortTypeForPageInfo(v24) or "", 
        targetPage = v24.targetPage or 1
    };
end;
v9.isPageInfoStale = function(v25, v26)
    return not l_deepEqual_0(v9.getRequestInfo(v25), (v9.getRequestInfo(v26:getState().pageInfo)));
end;
return v9;
