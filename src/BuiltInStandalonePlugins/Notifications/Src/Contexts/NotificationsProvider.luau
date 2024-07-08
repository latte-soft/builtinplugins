local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_HttpService_0 = game:GetService("HttpService");
local l_deepCopy_0 = v2.Util.deepCopy;
local v5 = require(l_Parent_0.Src.Contexts.TrayVisibleContext);
local v6 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v7 = require(l_Parent_0.Src.Clients.NotificationClient);
local v8 = require(script.Parent.NotificationsContext);
return function(v9)
    local v10 = v1.useContext(v5);
    local v11 = v6:use();
    local v12, v13 = v1.useState({});
    local v14, v15 = v1.useState(nil);
    local v16, v17 = v1.useState(false);
    local v18 = v1.useRef("");
    local v25 = v1.useCallback(function(v19, v20)
        local v21 = {};
        for _, v23 in pairs(v19) do
            if not v21[v23.notificationType] then
                v21[v23.notificationType] = {
                    v23.notificationId
                };
            else
                table.insert(v21[v23.notificationType], v23.notificationId);
            end;
        end;
        local v24 = l_HttpService_0:JSONEncode(v21);
        if not v20 or v10.trayVisible then
            v11.eventHandlers.logNotificationImpressions(v24);
            return ;
        else
            v18.current = v24;
            return ;
        end;
    end, {
        v11, 
        v10.trayVisible
    });
    v1.useEffect(function()
        if v10.trayVisible and v18.current ~= "" then
            v11.eventHandlers.logNotificationImpressions(v18.current);
            v18.current = "";
        end;
    end, {
        v10.trayVisible
    });
    local v32 = v1.useCallback(function(v26)
        v13(function(v27)
            local v28 = l_deepCopy_0(v27[v26]);
            v28.read = true;
            local v29 = {};
            for _, v31 in pairs(v27) do
                table.insert(v29, v31);
            end;
            v29[v26] = v28;
            return v29;
        end);
    end, {
        v12, 
        v13
    });
    local v39 = v1.useCallback(function(_)
        v13(function(v34)
            local v35 = {};
            for _, v37 in pairs(v34) do
                local v38 = l_deepCopy_0(v37);
                v38.read = true;
                table.insert(v35, v38);
            end;
            return v35;
        end);
    end, {
        v12, 
        v13
    });
    return v1.createElement(v8.Provider, {
        value = v1.useMemo(function()
            return {
                notifications = v12, 
                cursor = v14, 
                allLoaded = v16, 
                setNotifications = v13, 
                setCursor = v15, 
                setAllLoaded = v17, 
                markNotificationRead = v32, 
                markAllNotificationsRead = v39, 
                logNotificationImpressions = v25, 
                notificationClient = v9.notificationClient
            };
        end, {
            v12, 
            v14, 
            v16, 
            v13, 
            v15, 
            v17, 
            v32, 
            v39, 
            v25, 
            v7
        })
    }, v9.children);
end;
