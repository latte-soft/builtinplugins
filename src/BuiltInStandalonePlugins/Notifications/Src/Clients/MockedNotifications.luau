local v0 = require(script.Parent.Parent.Parent.Src.Enums.NotificationTargetType);
return {
    function(v1)
        return {
            notificationId = tostring(v1), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 5000, 
            read = false, 
            notificationType = "Notification_Type_A", 
            parameters = {
                titleParam = ("Testing titleParameter with index %*."):format(v1)
            }, 
            creatorStreamNotificationContent = {
                title = "DevForum Product Announcement: <b>Studio Notifications</b>", 
                body = "Studio Notifications have been released. Click here to learn more.", 
                targetId = "CreateFilledEmphasis", 
                targetType = v0.Static.rawValue(), 
                clickAction = "https://create.roblox.com"
            }
        };
    end, 
    function(v2)
        return {
            notificationId = tostring(v2), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 120000, 
            read = false, 
            notificationType = "Notification_Type_B", 
            parameters = {
                titleParam = ("Parameter test with index: %*."):format(v2)
            }, 
            creatorStreamNotificationContent = {
                title = "<b>LinksGoat</b> sent you a new message.", 
                body = "ChatGPTum dialogus continuo generat contentum. Linguae machinales potentiam demonstrant in generatione textus. Conversatio artificialis", 
                targetId = "2067243959", 
                targetType = v0.User.rawValue(), 
                clickAction = "https://www.roblox.com/users/2067243959/profile"
            }
        };
    end, 
    function(v3)
        return {
            notificationId = tostring(v3), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis - 3700000, 
            read = false, 
            notificationType = "Notification_Type_C", 
            parameters = {
                titleParam = ("Parameter test with index: %*."):format(v3)
            }, 
            creatorStreamNotificationContent = {
                title = "You've received an invitation to collaborate on <b>Word Bomb</b>.", 
                body = "", 
                targetId = "2653064683", 
                targetType = v0.Universe.rawValue(), 
                clickAction = "https://www.roblox.com/games/2653064683/Word-Bomb"
            }
        };
    end, 
    function(v4)
        return {
            notificationId = tostring(v4), 
            createdUtcTimeInMs = DateTime.now().UnixTimestampMillis, 
            read = false, 
            notificationType = "Notification_Type_D", 
            parameters = {
                titleParam = ("Testing titleParameter with index %*."):format(v4)
            }, 
            creatorStreamNotificationContent = {
                title = "This is an example of a notification w/o an action. {titleParam}", 
                body = "This is the body of the notification", 
                targetId = "", 
                targetType = v0.Static.rawValue(), 
                clickAction = ""
            }
        };
    end
};
