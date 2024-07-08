local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Resources.Constants);
local v3 = require(l_Parent_0.Src.Actions.SetGameInfo);
local v4 = require(l_Parent_0.Src.Actions.SetChooseGameQueryState);
local v5 = require(l_Parent_0.Src.Network.Requests.ApiFetchGameAgeRecommendation);
local v6 = require(l_Parent_0.Src.Network.Requests.ApiFetchCreatorEligibility);
local v7 = require(l_Parent_0.Src.Network.Requests.ApiFetchGames);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v9 = require(l_Parent_0.Packages.Cryo);
local v10 = {};
local v11 = -1;
local v12 = nil;
local v13 = nil;
local function v22(v14)
    assert(v14.games);
    local v15 = {};
    for _, v17 in pairs(v14.games) do
        if v17.minimumAge >= 17 then
            table.insert(v15, v17.universeId);
        end;
    end;
    return (if #v15 > 0 then v6(v15, l_StudioService_0:getUserId()) else l_Promise_0.resolve({})):andThen(function(v18)
        for _, v20 in pairs(v14.games) do
            local v21 = v18[v20.universeId];
            v20.isUserEligible = not (v21 ~= nil) or v21;
        end;
        return v14;
    end);
end;
local function v30(v23)
    assert(v23.games);
    local v24 = {};
    for _, v26 in pairs(v23.games) do
        table.insert(v24, v26.universeId);
    end;
    return v5(v24):andThen(function(v27)
        for _, v29 in pairs(v23.games) do
            v29.minimumAge = v27[v29.universeId];
        end;
        return v23;
    end);
end;
return function(v31, v32, v33)
    return function(v34)
        local v35 = nil;
        if not v13 then
            if game.GameId == 0 then
                v13 = 0;
            else
                v35 = v5({
                    game.GameId
                }):andThen(function(v36)
                    v13 = v36[game.GameId];
                end);
            end;
        end;
        if not (v33 == v12 and v33) then
            if not v33 then
                v34:dispatch(v4(v2.QUERY_STATE.QUERY_STATE_QUERYING));
            end;
            v12 = v33;
            if v32 ~= v11 then
                v10 = {};
                v11 = v32;
            end;
            v7({
                type = v31, 
                id = v32, 
                cursor = v33, 
                limit = 25
            }):andThen(function(v37)
                return v30(v37);
            end):andThen(function(v38)
                return v22(v38);
            end):andThen(function(v39)
                assert(v39.games);
                v10 = v9.List.join(v10, v39.games);
                v39.games = v10;
                if v35 then
                    v35:await();
                end;
                assert(v13);
                v39.minimumAge = v13;
                v34:dispatch(v3(v39));
            end):catch(function(_)
                v34:dispatch(v4(v2.QUERY_STATE.QUERY_STATE_FAILED));
            end);
        end;
    end;
end;
