require(script.Parent.Parent.Common.defineLuaFlags);
if game:GetService("RunService"):IsEdit() then
    local l_PlaceId_0 = game.PlaceId;
    local l_GameId_0 = game.GameId;
    plugin:SetItem("placeid", l_PlaceId_0);
    plugin:SetItem("universeid", l_GameId_0);
    plugin:Invoke("idsupdated");
    game:GetPropertyChangedSignal("PlaceId"):Connect(function()
        plugin:SetItem("placeid", game.PlaceId);
        plugin:Invoke("idsupdated");
    end);
    game:GetPropertyChangedSignal("GameId"):Connect(function()
        plugin:SetItem("universeid", game.GameId);
        plugin:Invoke("idsupdated");
    end);
end;
if plugin then
    local l_Parent_0 = script.Parent.Parent.Parent;
    local v3 = require(l_Parent_0.Packages.TestLoader);
    v3.launch("ActivityFeed", l_Parent_0.Src);
    if not v3.isCli() then
        return ;
    else
        return ;
    end;
else
    return ;
end;
