local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
return (v1.createContext({
    notifications = {}, 
    allLoaded = false, 
    setNotifications = function()
    end, 
    setCursor = function()
    end, 
    setAllLoaded = function()
    end, 
    markNotificationRead = function()
    end, 
    markAllNotificationsRead = function()
    end, 
    logNotificationImpressions = function()
    end, 
    notificationClient = nil
}));
