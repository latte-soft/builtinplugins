local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.optional);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
createAnalyticsHandler = function(v5)
    local function v8(v6, v7)
        v5:SendEventDeferred("studio", "NotificationTray", v6, (v2.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId
        }, v7 or {})));
    end;
    return {
        notificationClicked = function(v9, v10)
            v8("NotificationClicked", {
                id = v3(v9, "notificationId"), 
                type = v3(v9, "creatorStreamNotificationContent", "clickAction"), 
                clickAction = v3(v9, "notificationType"), 
                read = v3(v9, "read"), 
                trayIndex = v10
            });
        end, 
        markAllAsRead = function()
            v8("MarkAllAsRead");
        end, 
        settingsButtonClicked = function()
            v8("SettingsButtonClicked");
        end, 
        trayOpened = function(v11)
            v8("NotificationTrayOpened", {
                bellUnseen = v11
            });
        end, 
        logNotificationImpressions = function(v12)
            v8("NotificationImpressions", {
                notificationIds = v12
            });
        end
    };
end;
return (l_ContextServices_0.Analytics.new(createAnalyticsHandler));
