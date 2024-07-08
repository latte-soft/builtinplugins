local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Core.Util.Constants);
local v3 = require(l_Parent_0.Core.Types.Sort);
local v4 = require(l_Parent_0.Core.Types.RequestReason);
local v5 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v6 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v7 = require(l_Parent_0.Core.Actions.StopAllSounds);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
return function(v9, v10, v11, v12, v13, v14, v15, v16)
    return function(v17)
        v17:dispatch(v7());
        local l_pageInfo_0 = v17:getState().pageInfo;
        v17:dispatch(v6(v9, v10, {
            searchTerm = v11, 
            sortIndex = not not v3.canSort(v11, v12 or l_pageInfo_0.categoryName) and l_pageInfo_0.sortIndex or 1, 
            sortDirection = v1.None, 
            uiSortIntent = v1.None, 
            categoryName = v12, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v4.StartSearch, 
            isTopKeyword = v13 or false, 
            searchSource = if not v11 then nil else v2.SEARCH_SOURCE.KEYWORD, 
            querySource = if not not v14 and v8() then v14 else v5.QuerySource.OriginalUserQuery, 
            originalUserQuery = if not not v15 and v8() then v15 else nil, 
            originalCorrection = if not not v16 and v8() then v16 else nil, 
            queryParams = v1.None
        }));
    end;
end;
