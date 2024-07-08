local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Src.Clients.MockedNotifications);
return {
    getNotifications = function(_, v4)
        local v5 = tonumber(v4);
        local v6 = 1;
        if v5 ~= nil then
            v6 = v5;
        end;
        local v7 = {};
        for v8 = 1, 12 do
            local v9 = v8 + v6;
            table.insert(v7, (v2[v9 % #v2 + 1](v9)));
        end;
        l_Promise_0.new(function(v10, _)
            task.spawn(function()
                v10();
            end);
        end):await();
        return {
            responseBody = {
                creatorStreamNotifications = v7, 
                nextCursor = tostring(v6 + 12)
            }, 
            responseCode = 200
        };
    end, 
    markNotificationRead = function(_)
        return {
            responseBody = nil, 
            responseCode = 200
        };
    end, 
    markAllNotificationsRead = function()
        return {
            responseBody = nil, 
            responseCode = 200
        };
    end
};
