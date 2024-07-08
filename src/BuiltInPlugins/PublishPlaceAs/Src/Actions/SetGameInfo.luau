local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Resources.Constants);
local v3 = require(l_Parent_0.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v4)
    v3.assertNullableType(v4, "table", "SetGameInfo arg");
    local v5 = v4 or {};
    local l_minimumAge_0 = v5.minimumAge;
    local l_games_0 = v5.games;
    local l_nextPageCursor_0 = v5.nextPageCursor;
    local l_previousPageCursor_0 = v5.previousPageCursor;
    v3.assertType(l_games_0, "table", "SetGameInfo.games");
    v3.assertNullableType(l_nextPageCursor_0, "string", "SetGameInfo.nextPageCursor");
    v3.assertNullableType(l_previousPageCursor_0, "string", "SetGameInfo.previousPageCursor");
    return {
        gameInfo = {
            minimumAge = l_minimumAge_0, 
            games = l_games_0, 
            queryState = v2.QUERY_STATE.QUERY_STATE_SUCCESS, 
            nextPageCursor = l_nextPageCursor_0 or v1.None, 
            previousPageCursor = l_previousPageCursor_0 or v1.None
        }
    };
end);
