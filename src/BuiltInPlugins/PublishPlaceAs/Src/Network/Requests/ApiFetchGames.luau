local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Models.GameToPublish);
local v3 = require(l_Parent_0.Src.Network.Http);
local v4 = require(l_Parent_0.Src.Resources.Constants);
return function(v5)
    local _ = nil;
    return v3.Request({
        Url = v3.BuildRobloxUrl("apis", "universes/v1/search"), 
        Method = "GET", 
        Params = {
            creatorType = v5.type == v4.SUBJECT_TYPE.GROUP and "Group" or "User", 
            creatorTargetId = v5.id, 
            isArchived = "false", 
            pageIndex = v5.cursor, 
            pageSize = v5.limit or 10, 
            search = v5.search or "", 
            sortOrder = v5.sortOrder or "Desc", 
            sortParam = v5.sort or "LastUpdated"
        }
    }):andThen(function(v7)
        local v8 = l_HttpService_0:JSONDecode(v7);
        local v9 = v5.limit or 10;
        local v10 = {};
        if v8.nextResultIndex then
            v10.nextPageCursor = tostring((tonumber(v8.nextResultIndex / v9)));
        end;
        v10.games = {};
        for _, v12 in pairs(v8.data) do
            local v13, v14 = v2.fromJsonData(v12);
            if not v13 then
                error("Parsing error for ApiFetchGamesByUserId: " .. v14);
            else
                table.insert(v10.games, v14);
            end;
        end;
        return v10;
    end);
end;
