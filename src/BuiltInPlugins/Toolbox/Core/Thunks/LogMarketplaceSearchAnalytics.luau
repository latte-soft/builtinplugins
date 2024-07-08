local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Util_0.PageInfoHelper);
local v6 = require(l_Util_0.AssetQualityUtil);
local v7 = require(l_Parent_0.Core.Actions.UpdateLastLoggedSearchId);
local v8 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v9 = require(l_Parent_0.Core.Types.Category);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v12 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local _ = function(v13)
    local v14 = {};
    for v15, _ in v13, nil, nil do
        table.insert(v14, v15);
    end;
    return table.concat(v14, ",");
end;
return function(v18, v19, v20, v21, v22)
    return function(v23)
        local l_pageInfo_0 = v23:getState().pageInfo;
        local v25 = v5.getCurrentTab(l_pageInfo_0);
        local v26 = v5.getSortTypeForPageInfo(l_pageInfo_0);
        local l_creator_0 = l_pageInfo_0.creator;
        local v28 = not not l_creator_0 and l_creator_0.Id or nil;
        local v29 = l_pageInfo_0.searchId or "";
        local l_categoryName_0 = l_pageInfo_0.categoryName;
        local l_includeUnverifiedCreators_0 = l_pageInfo_0.includeUnverifiedCreators;
        local v32 = v9.getEngineAssetType(v9.getCategoryByName(l_categoryName_0).assetType);
        if v32 == Enum.AssetType.Decal then
            v32 = Enum.AssetType.Image;
        end;
        local v33 = string.lower(v32.Name);
        local l_lastLoggedSearchId_0 = l_pageInfo_0.lastLoggedSearchId;
        if l_lastLoggedSearchId_0 == v29 then
            if v4.shouldDebugWarnings() then
                warn("SearchId was already logged for ", l_lastLoggedSearchId_0);
            end;
            return ;
        else
            local v35;
            if not v11() or not l_pageInfo_0.creatorTargetIds then
                v35 = nil;
            else
                local l_creatorTargetIds_0 = l_pageInfo_0.creatorTargetIds;
                local v37 = {};
                for v38, _ in l_creatorTargetIds_0, nil, nil do
                    table.insert(v37, v38);
                end;
                v35 = table.concat(v37, ",");
            end;
            local v40;
            if not v11() or not l_pageInfo_0.groupTargetIds then
                v40 = nil;
            else
                local l_groupTargetIds_0 = l_pageInfo_0.groupTargetIds;
                local v42 = {};
                for v43, _ in l_groupTargetIds_0, nil, nil do
                    table.insert(v42, v43);
                end;
                v40 = table.concat(v42, ",");
            end;
            local v45 = nil;
            if not (not v12() or not v9.categoryIsModel(l_categoryName_0)) then
                v45 = v6.convertQualityFilterDataToTagsCSV(l_pageInfo_0.qualityFilterData);
            end;
            v2.marketplaceSearch(v18, v19 or false, {
                assetType = v33, 
                categoryName = l_categoryName_0, 
                creatorID = if not v11() then v28 else nil, 
                creatorIDs = if not v11() then nil else v35 or v28, 
                excludeGroupCreations = if not v11() then nil else l_pageInfo_0.excludeGroupCreations, 
                groupIDs = if not v11() then nil else v40, 
                originalUserQuery = if not v10() then nil else v21 or "", 
                originalCorrection = if not v10() then nil else v22 or "", 
                previousSearchId = if not v10() then nil else l_lastLoggedSearchId_0, 
                querySource = if not v10() then nil else v20 or v8.QuerySource.OriginalUserQuery, 
                searchId = v29, 
                sort = v26, 
                toolboxTab = v25, 
                includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                qualityFilterTags = v45
            });
            v23:dispatch(v7(v29));
            return ;
        end;
    end;
end;
