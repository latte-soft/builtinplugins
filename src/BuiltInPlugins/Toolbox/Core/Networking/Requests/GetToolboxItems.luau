local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetLoading);
local v6 = require(l_Actions_0.UpdateSearchTerm);
local v7 = require(l_Actions_0.SetAutocorrect);
local v8 = require(l_Parent_0.Core.Networking.Requests.GetItemDetails);
local v9 = require(l_Parent_0.Core.Networking.Requests.GetCreatorName);
local v10 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.GetToolboxItemsResponseTypes);
local v12 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local l_Util_0 = l_Parent_0.Core.Util;
local v14 = require(l_Util_0.getUserId);
local v15 = require(l_Util_0.PagedRequestCursor);
local v16 = require(l_Util_0.Constants);
local v17 = require(l_Util_0.CreatorInfoHelper);
local v18 = require(l_Util_0.PageInfoHelper);
local v19 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v20 = require(l_Parent_0.Core.Types.BackendTypes);
local _ = require(l_Parent_0.Core.Types.CreatorTypes);
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Dash_0 = require(l_Packages_0.Framework).Dash;
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v25 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
return function(v26, v27, v28, v29, _, _)
    return function(v32)
        v32:dispatch(v5(true));
        local l_creator_0 = v29.creator;
        local v34 = (not (l_creator_0 and l_creator_0.Id == -1) and l_creator_0) and l_creator_0.Id or nil;
        local v35 = v29.additionalAudioSearchInfo or {};
        local l_currentCursor_0 = v32:getState().assets.currentCursor;
        if l_creator_0 ~= nil then
            if (l_creator_0.Name ~= nil and l_creator_0.Name ~= "") and v34 == nil then
                v32:dispatch(v5(false));
                return ;
            elseif not (not (v34 ~= nil) or v17.isCached(v32, v34, l_creator_0.Type)) then
                v32:dispatch(v9(v26, v34, l_creator_0.Type));
            end;
        end;
        if not v15.isNextPageAvailable(l_currentCursor_0) then
            return ;
        else
            local l_nextPageCursor_0 = l_currentCursor_0.nextPageCursor;
            local v38 = v29.sorts[v29.sortIndex];
            local v39 = nil;
            v39 = v38 and v38.name;
            local v40 = nil;
            local v41 = v10.getCategoryByName(v27);
            if not v41 then
                error(string.format("Could not find categoryData for %s", v27));
            end;
            if not (v41.ownershipType ~= v10.OwnershipType.MY) or v41.ownershipType == v10.OwnershipType.RECENT then
                v40 = v14();
            elseif v41.ownershipType == v10.OwnershipType.GROUP then
                v40 = v18.getGroupIdForPageInfo(v29);
            end;
            local l_includeUnverifiedCreators_0 = v29.includeUnverifiedCreators;
            local v43 = {};
            if v35.categories then
                for _, v45 in ipairs(v35.categories) do
                    table.insert(v43, v45);
                end;
            end;
            if v35.genre then
                table.insert(v43, v35.genre);
            end;
            local v46 = nil;
            local v47 = nil;
            local v48 = nil;
            if v22() then
                v46 = {};
                local l_creatorTargetIds_0 = v29.creatorTargetIds;
                if l_creatorTargetIds_0 then
                    for v50, _ in l_creatorTargetIds_0, nil, nil do
                        table.insert(v46, v50);
                    end;
                end;
                v47 = {};
                local l_groupTargetIds_0 = v29.groupTargetIds;
                if l_groupTargetIds_0 then
                    for v53, _ in l_groupTargetIds_0, nil, nil do
                        table.insert(v47, v53);
                    end;
                end;
                v48 = if not not v29.uiSortIntent and v29.uiSortIntent ~= v2.None then v29.uiSortIntent else v20.UiSortIntent.Default;
            end;
            local v55 = nil;
            if v29.sortDirection and v29.sortDirection ~= v2.None then
                v55 = v29.sortDirection;
            end;
            local l_tutorialLimits_0 = v32:getState().tutorialLimits;
            if not l_tutorialLimits_0 or not l_tutorialLimits_0.assetIds then
                return v26:getToolboxItems({
                    categoryName = v27, 
                    sortType = v39, 
                    keyword = v29.searchTerm or "", 
                    cursor = l_nextPageCursor_0, 
                    limit = v16.TOOLBOX_ITEM_SEARCH_LIMIT, 
                    ownerId = v40, 
                    creatorType = v29.creatorType, 
                    creatorTargetId = v34, 
                    creatorTargetIds = if not v22() then nil else v46, 
                    excludeGroupCreations = if not v24() then nil else v29.excludeGroupCreations, 
                    groupTargetIds = if not v22() then nil else v47, 
                    minDuration = not not v28 and v28.minDuration or nil, 
                    maxDuration = not not v28 and v28.maxDuration or nil, 
                    artist = v35.artist, 
                    album = v35.album, 
                    tags = v43, 
                    uiSortIntent = if not v22() then nil else v48, 
                    sortDirection = v55, 
                    includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                    searchSource = v29.searchSource, 
                    queryParams = v29.queryParams, 
                    querySource = if not v19() then nil else v29.querySource or v12.QuerySource.OriginalUserQuery, 
                    originalUserQuery = if not v19() then nil else v29.originalUserQuery or "", 
                    originalCorrection = if not v19() then nil else v29.originalCorrection or "", 
                    qualityFilterData = if not v25() then nil else v29.qualityFilterData
                }):andThen(function(v57)
                    if not v18.isPageInfoStale(v29, v32) then
                        v32:dispatch(v5(false));
                        local l_responseBody_0 = v57.responseBody;
                        local v59 = {};
                        local l_data_0 = l_responseBody_0.data;
                        if l_data_0 then
                            for _, v62 in ipairs(l_data_0) do
                                v59[v62.id] = {
                                    searchResultSource = v62.searchResultSource
                                };
                            end;
                        end;
                        local v63 = v15.createCursor(l_responseBody_0);
                        if l_responseBody_0 and l_responseBody_0.totalResults > 0 then
                            v32:dispatch(v8(v26, l_responseBody_0.data, l_responseBody_0.totalResults, v28, v29.targetPage, v63, v29, v59));
                        end;
                        if not (not v19() or not l_responseBody_0) then
                            v32:dispatch(v7(l_responseBody_0.spellCheckerResult or {}));
                        end;
                        if not ((not (v29.searchTerm and v29.searchTerm ~= "") or not l_responseBody_0) or not l_responseBody_0.filteredKeyword) and #l_responseBody_0.filteredKeyword > 0 then
                            v32:dispatch(v6(l_responseBody_0.filteredKeyword));
                        end;
                        return ;
                    else
                        return ;
                    end;
                end, function(v64)
                    v32:dispatch(v5(false));
                    v32:dispatch(v4(v64));
                end);
            else
                v32:dispatch(v8(v26, l_Dash_0.map(l_tutorialLimits_0.assetIds, function(v65)
                    return {
                        id = v65
                    };
                end), 1, v28, v29.targetPage, {}, v29, l_Dash_0.collect(l_tutorialLimits_0.assetIds, function(_, v67)
                    return v67, {
                        searchResultSource = "Tutorial"
                    };
                end)));
                return ;
            end;
        end;
    end;
end;
