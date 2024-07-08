local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AssertType);
local v3 = require(l_Parent_0.Src.Resources.Constants);
return require(script.Parent.Action)(script.Name, function(v4)
    v2.assertNullableType(v4, "table", "SetPlaceInfo arg");
    local v5 = v4 or {};
    local l_places_0 = v5.places;
    local l_nextPageCursor_0 = v5.nextPageCursor;
    local l_previousPageCursor_0 = v5.previousPageCursor;
    local l_parentGame_0 = v5.parentGame;
    v2.assertType(l_places_0, "table", "SetPlaceInfo.places");
    v2.assertNullableType(l_nextPageCursor_0, "string", "SetPlaceInfo.nextPageCursor");
    v2.assertNullableType(l_previousPageCursor_0, "string", "SetPlaceInfo.previousPageCursor");
    v2.assertNullableType(l_parentGame_0, "table", "SetPlaceInfo.parentGame { name : String, universeId : Number }");
    if l_parentGame_0 ~= nil then
        v2.assertType(l_parentGame_0.name, "string", "SetPlaceInfo.parentGame.name");
        v2.assertType(l_parentGame_0.universeId, "number", "SetPlaceInfo.parentGame.universeId");
    end;
    return {
        placeInfo = {
            places = l_places_0, 
            queryState = v3.QUERY_STATE.QUERY_STATE_SUCCESS, 
            nextPageCursor = l_nextPageCursor_0 or v1.None, 
            previousPageCursor = l_previousPageCursor_0 or v1.None, 
            parentGame = l_parentGame_0 or v1.None
        }
    };
end);
