local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = require(l_Parent_0.Src.Types.Category);
local v6 = {
    getCategory = function(v3, v4)
        local v5 = v3[v4];
        if v5 and v5.category then
            return v5.category;
        else
            if v1.shouldDebugWarnings() then
                warn(("Lua toolbox: No category for category index %s"):format((tostring(v4))));
            end;
            return "";
        end;
    end
};
v6.getCategoryForPageInfo = function(v7)
    return v6.getCategory(v7.categories, v7.categoryIndex);
end;
v6.getSortType = function(v8, v9)
    local v10 = v8[v9];
    if v10 and v10.sort then
        return v10.sort;
    else
        if v1.shouldDebugWarnings() then
            warn(("Lua Toolbox: no sort for sort index %s"):format((tostring(v9))));
        end;
        return "";
    end;
end;
v6.getSortTypeForPageInfo = function(v11)
    return v6.getSortType(v11.sorts, v11.sortIndex);
end;
v6.getGroupId = function(v12, v13)
    if v13 == 0 then
        return 0;
    elseif (v13 >= 1 and #v12 >= v13) and v12[v13].id then
        return v12[v13].id;
    else
        if v1.shouldDebugWarnings() then
            warn(("Lua Toolbox: no group for group index %s"):format((tostring(v13))));
        end;
        return 0;
    end;
end;
v6.getGroupIdForPageInfo = function(v14)
    return v6.getGroupId(v14.groups, v14.groupIndex);
end;
v6.getEngineAssetTypeForPageInfoCategory = function(v15)
    local v16 = v15.categories[v15.categoryIndex];
    if v16 and v16.assetType then
        return v2.getEngineAssetType(v16.assetType);
    else
        if v1.shouldDebugWarnings() then
            warn(("Lua toolbox: No assetType for category index %s"):format((tostring(v15.categoryIndex))));
        end;
        return nil;
    end;
end;
return v6;
