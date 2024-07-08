local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v3)
    return function(v4, v5)
        local v6 = v4:getState();
        local l_gameId_0 = v6.Metadata.gameId;
        local v8 = nil;
        if not v3 then
            v8 = v6.Settings.Current.badgesCursor;
            if v8 == nil then
                return ;
            end;
        end;
        local v9, v10 = v5.monetizationController:getBadges(l_gameId_0, v8);
        local l_Current_0 = v6.Settings.Current;
        if not v3 then
            v9 = v1.Dictionary.join(not not v6.Settings.Current.badges and v6.Settings.Current.badges or {}, v9);
        else
            v10 = nil;
        end;
        v4:dispatch(v2((v1.Dictionary.join(l_Current_0, {
            badgesCursor = v10, 
            badges = v9
        }))));
    end;
end;
