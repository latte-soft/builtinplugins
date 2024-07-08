local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Resources.Constants);
return v1.createReducer({
    placeInfo = {
        places = {}, 
        parentGame = {}, 
        queryState = v3.QUERY_STATE.QUERY_STATE_NONE
    }, 
    gameInfo = {
        games = {}, 
        queryState = v3.QUERY_STATE.QUERY_STATE_NONE
    }, 
    selectedGame = {}, 
    gameConfiguration = {
        optInRegions = {}
    }
}, {
    SetChooseGameQueryState = function(v4, v5)
        return v2.Dictionary.join(v4, {
            gameInfo = v2.Dictionary.join(v4.gameInfo, v5.gameInfo)
        });
    end, 
    SetSelectedGame = function(v6, v7)
        return v2.Dictionary.join(v6, {
            selectedGame = v7.selectedGame
        });
    end, 
    SetGameInfo = function(v8, v9)
        return v2.Dictionary.join(v8, {
            gameInfo = v2.Dictionary.join(v8.gameInfo, v9.gameInfo)
        });
    end, 
    SetPlaceInfo = function(v10, v11)
        return v2.Dictionary.join(v10, {
            placeInfo = v2.Dictionary.join(v10.placeInfo, v11.placeInfo)
        });
    end, 
    SetChoosePlaceQueryState = function(v12, v13)
        return v2.Dictionary.join(v12, {
            placeInfo = v2.Dictionary.join(v12.placeInfo, v13.placeInfo)
        });
    end, 
    ResetInfo = function(v14, v15)
        return v2.Dictionary.join(v14, {
            gameInfo = v2.Dictionary.join(v14.gameInfo, v15.gameInfo), 
            placeInfo = v2.Dictionary.join(v14.placeInfo, v15.placeInfo)
        });
    end, 
    SetGameConfiguration = function(v16, v17)
        return v2.Dictionary.join(v16, {
            gameConfiguration = v2.Dictionary.join(v16.gameConfiguration, v17.gameConfiguration)
        });
    end
});
