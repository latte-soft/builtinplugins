local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = v1.RobloxAPI.Url.new();
local v3 = v1.Http.Networking.new({
    isInternal = true, 
    loggingLevel = 0
});
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
local v6 = require(l_Parent_0.Src.Enums.NotificationChannel);
return {
    getNotifications = function(v7, v8)
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local v10 = nil;
        v10 = {
            count = tostring(10), 
            notificationChannel = tostring(v6.Studio.rawValue())
        };
        if v7 then
            v10["full-refresh"] = tostring(true);
        end;
        if v8 then
            v10.cursor = v8;
        end;
        local v12 = v3:handleRetry(v3:get((v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notifications"):format(l_l_StudioService_0_UserId_0), v10)))):catch(function(v11)
            return v11;
        end):await();
        if v12.responseCode >= 200 and v12.responseCode < 300 then
            v12.responseBody = l_HttpService_0:JSONDecode(v12.responseBody);
        end;
        return v12;
    end, 
    markNotificationRead = function(v13)
        return v3:handleRetry(v3:request({
            Url = v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notification/%*"):format(l_StudioService_0:GetUserId(), v13)), 
            Body = l_HttpService_0:JSONEncode({
                Status = true
            }), 
            Method = "PUT", 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })):catch(function(v14)
            return v14;
        end):await();
    end, 
    markAllNotificationsRead = function()
        return v3:handleRetry(v3:request({
            Url = v2.composeUrl(v2.APIS_URL, "creator-notifications/v1/creator-stream-notifications/" .. ("users/%*/notifications"):format((l_StudioService_0:GetUserId()))), 
            Body = l_HttpService_0:JSONEncode({
                ["notification-channel"] = v6.Studio.rawValue()
            }), 
            Method = "PUT", 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })):catch(function(v15)
            return v15;
        end):await();
    end
};
