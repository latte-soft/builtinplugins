local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    game = nil, 
    gameId = nil
}, {
    ResetStore = function(_, _)
        return {};
    end, 
    SetGameId = function(v4, v5)
        return v1.Dictionary.join(v4, {
            gameId = v5.gameId
        });
    end, 
    SetGame = function(v6, v7)
        return v1.Dictionary.join(v6, {
            game = v7.game
        });
    end
});
