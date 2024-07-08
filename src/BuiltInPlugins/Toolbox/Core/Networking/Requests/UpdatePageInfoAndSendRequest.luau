local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.GetAssetsRequest);
local v3 = require(l_Parent_0.Core.Networking.Requests.GetToolboxItems);
local v4 = require(l_Parent_0.Core.Types.Category);
local v5 = require(l_Parent_0.Core.Actions.ClearAssets);
local v6 = require(l_Parent_0.Core.Actions.UpdatePageInfo);
local v7 = require(l_Parent_0.Core.Util.Constants);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
return function(v9, v10, v11)
    return function(v12)
        if not v1.IsUpdate(v11.requestReason) then
            v12:dispatch(v5());
        end;
        v12:dispatch(v6(v11, v10));
        local l_pageInfo_0 = v12:getState().pageInfo;
        local l_audioSearchInfo_0 = l_pageInfo_0.audioSearchInfo;
        local l_categoryName_0 = l_pageInfo_0.categoryName;
        if l_showRobloxCreatedAssets_0() and l_audioSearchInfo_0 == nil then
            l_audioSearchInfo_0 = {
                minDuration = 0, 
                maxDuration = v7.MAX_AUDIO_SEARCH_DURATION
            };
        end;
        if not v4.API_NAMES[l_categoryName_0] then
            v12:dispatch(v2(v9, l_pageInfo_0));
            return ;
        else
            v12:dispatch(v3(v9, l_categoryName_0, l_audioSearchInfo_0, l_pageInfo_0, v10));
            return ;
        end;
    end;
end;
