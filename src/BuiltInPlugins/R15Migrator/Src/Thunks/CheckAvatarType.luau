local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Actions.SetAvatarType);
return function(v1)
    return function(v2)
        task.spawn(function()
            while true do
                v2:dispatch(v0((v1:getAvatarType(game))));
                wait(5);
            end;
        end);
    end;
end;
