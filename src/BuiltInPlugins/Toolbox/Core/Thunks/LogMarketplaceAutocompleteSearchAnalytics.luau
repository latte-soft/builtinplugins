local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Types.AnalyticsTypes);
local v4 = require(l_Util_0.PageInfoHelper);
return function(v5, v6, v7, v8, v9, v10, _)
    return function(v12)
        local l_pageInfo_0 = v12:getState().pageInfo;
        local v14 = v4.getCurrentTab(l_pageInfo_0);
        local v15 = v4.getSortTypeForPageInfo(l_pageInfo_0);
        local l_creator_0 = l_pageInfo_0.creator;
        v2.marketplaceAutocompleteSearch(v5, v7, v8, v9, v10, {
            assetType = v6, 
            creatorID = not not l_creator_0 and l_creator_0.Id or nil, 
            searchId = l_pageInfo_0.searchId or "", 
            sort = v15, 
            toolboxTab = v14
        });
    end;
end;
