local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetPlaceInfo);
local v2 = require(l_Parent_0.Src.Actions.SetChoosePlaceQueryState);
local v3 = require(l_Parent_0.Src.Actions.SetSelectedGame);
local v4 = require(l_Parent_0.Src.Network.Requests.ApiFetchPlacesByUniverseId);
local v5 = require(l_Parent_0.Src.Resources.Constants);
local _ = game:GetService("RbxAnalyticsService");
local v7 = nil;
local v8 = {};
return function(v9, v10)
    return function(v11)
        if not (v10 == v7 and v10) then
            v7 = v10;
            assert(type(v9.name) == "string", "LoadExistingPlaces.parentGame must have a string name");
            assert(type(v9.universeId) == "number", "LoadExistingPlaces.parentGame must have a number universeId");
            v11:dispatch(v3(v9));
            if not v10 then
                v11:dispatch(v2(v5.QUERY_STATE.QUERY_STATE_QUERYING));
            end;
            v4({
                universeId = v9.universeId
            }, {
                cursor = v10
            }):andThen(function(v12)
                v12.parentGame = v9;
                for v13 = 1, #v12.places do
                    v8[#v8 + 1] = v12.places[v13];
                end;
                v12.places = v8;
                v11:dispatch(v1(v12));
            end, function(_)
                v11:dispatch(v2(v5.QUERY_STATE.QUERY_STATE_FAILED));
            end);
        end;
    end;
end;
