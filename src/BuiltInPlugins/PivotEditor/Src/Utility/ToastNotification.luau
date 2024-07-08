local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("ToastNotification");
v0.new = function(v1)
    if not v1 then
        v1 = game:GetService("ToastNotificationService");
    end;
    return (setmetatable({
        _notificationService = v1
    }, v0));
end;
v0.destroy = function(v2)
    v2._notificationService = nil;
end;
v0.showNotification = function(v3, v4, v5)
    if v3._notificationService then
        v3._notificationService:ShowNotification(v4, v5);
    end;
end;
v0.hideNotification = function(v6, v7)
    if v6._notificationService then
        v6._notificationService:HideNotification(v7);
    end;
end;
return v0;
