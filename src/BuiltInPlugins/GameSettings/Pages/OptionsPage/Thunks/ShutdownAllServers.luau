return function()
    return function(v0, v1)
        v1.gameOptionsController:shutdownAllServers(v0:getState().Metadata.gameId);
    end;
end;
