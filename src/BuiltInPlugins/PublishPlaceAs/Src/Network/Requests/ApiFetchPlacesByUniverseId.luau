local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_0.Src.Network.Models.PlaceToPublish);
local v4 = require(l_Parent_0.Src.Network.Http);
return function(v5, v6)
    local l_universeId_0 = v5.universeId;
    if l_universeId_0 then
        return v4.Request({
            Url = v4.BuildRobloxUrl("develop", "v1/universes/%d/places", l_universeId_0), 
            Method = "GET", 
            Params = {
                sortOrder = v6.sortOrder or "Asc", 
                limit = v6.limit or 10, 
                cursor = v6.cursor
            }
        }):andThen(function(v8)
            local v9 = l_HttpService_0:JSONDecode(v8);
            local v10 = {};
            if v9.previousPageCursor then
                v10.previousPageCursor = v9.previousPageCursor;
            end;
            if v9.nextPageCursor then
                v10.nextPageCursor = v9.nextPageCursor;
            end;
            v10.places = {};
            for _, v12 in pairs(v9.data) do
                local v13, v14 = v3.fromJsonData(v12);
                if not v13 then
                    error("Parsing error for ApiFetchPlacesByUniverseId: " .. v14);
                else
                    table.insert(v10.places, v14);
                end;
            end;
            return v10;
        end);
    else
        return l_Promise_0.reject("NO UNIVERSE ID - ApiFetchPlacesByGameId");
    end;
end;
