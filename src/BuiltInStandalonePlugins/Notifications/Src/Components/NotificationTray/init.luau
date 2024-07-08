local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.LuauPolyfill);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
local l_setInterval_0 = v3.setInterval;
local l_clearInterval_0 = v3.clearInterval;
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("RibbonNotificationService");
end);
local v10 = if not l_status_0 then nil else l_result_0;
local v11 = require(script.Parent.EmptyNotificationTray);
local v12 = require(script.Parent.NotificationCard);
local v13 = require(l_Parent_0.Src.Contexts.NotificationsContext);
local v14 = require(l_Parent_0.Src.Contexts.TrayVisibleContext);
local _ = require(l_Parent_0.Src.Clients.NotificationClient);
local v16 = require(script.Parent.NotificationHeader);
local v17 = require(l_Parent_0.Src.Util.TimeConstants);
return function()
    local v18, v19 = v1.useState(true);
    local v20, v21 = v1.useState(false);
    local v22, v23 = v1.useState({
        newNotificationAvailable = false, 
        syncBroadcastedNotifications = false
    });
    local v24 = v1.useContext(v13);
    local v25 = v1.useContext(v14);
    local v26 = v1.useRef(false);
    local v37 = v1.useCallback(function(v27, v28)
        if not v24.allLoaded then
            local v29 = true;
            if v24.cursor ~= "" then
                v29 = not v24.cursor;
            end;
            v29 = v29 or v28;
            if v29 then
                v23({
                    newNotificationAvailable = false, 
                    syncBroadcastedNotifications = false
                });
            end;
            v19(true);
            local v30 = nil;
            v30 = v24.notificationClient.getNotifications(v27, if not v28 then v24.cursor else nil);
            if v30.responseCode >= 200 and v30.responseCode < 300 then
                v21(false);
                if not (v30.responseBody.nextCursor ~= "") or v30.responseBody.nextCursor == nil then
                    v24.setCursor(nil);
                else
                    v24.setCursor(v30.responseBody.nextCursor);
                end;
                if #v30.responseBody.creatorStreamNotifications == 0 then
                    v24.setAllLoaded(true);
                end;
                local v31 = {};
                if not v28 then
                    for _, v33 in v24.notifications, nil, nil do
                        table.insert(v31, v33);
                    end;
                end;
                for _, v35 in pairs(v30.responseBody.creatorStreamNotifications) do
                    table.insert(v31, v35);
                end;
                if not (not (v29 and #v31 > 0) or not v10) then
                    local l_notificationId_0 = v31[1].notificationId;
                    v10:OnNotificationUpdateFromPlugin(l_notificationId_0, not v25.trayVisible and "" or l_notificationId_0);
                end;
                v24.logNotificationImpressions(v30.responseBody.creatorStreamNotifications, v29);
                v24.setNotifications(v31);
            else
                v21(true);
                v24.setCursor(nil);
            end;
            v19(false);
            return ;
        else
            return ;
        end;
    end, {
        v24.notifications, 
        v24.cursor, 
        v24.allLoaded, 
        v25.trayVisible
    });
    local v38 = nil;
    v38 = function(v39)
        v37(v39, true);
    end;
    v1.useEffect(function()
        local v40 = nil;
        if v10 then
            v40 = v10.NewNotificationFromRibbon:Connect(function(_)
                v26.current = false;
                v23(function(v42)
                    return {
                        newNotificationAvailable = true, 
                        syncBroadcastedNotifications = v42.syncBroadcastedNotifications
                    };
                end);
            end);
        end;
        v37(true, true);
        local v43 = l_setInterval_0(function()
            v23({
                newNotificationAvailable = true, 
                syncBroadcastedNotifications = true
            });
        end, v17.HOUR_IN_SECONDS * v17.SECONDS_IN_MS);
        return function()
            if v40 then
                v40:Disconnect();
            end;
            l_clearInterval_0(v43);
        end;
    end, {});
    v1.useEffect(function()
        if not (((not v22.newNotificationAvailable or v25.trayVisible) or v18) or v26.current) then
            v38(v22.syncBroadcastedNotifications, true);
            v26.current = true;
        end;
    end, {
        v22, 
        v25.trayVisible, 
        v18, 
        v38
    });
    v1.useEffect(function()
        if not ((not v25.trayVisible or not v24.notifications[1]) or not v10) then
            v10:OnNotificationUpdateFromPlugin("", v24.notifications[1].notificationId);
        end;
    end, {
        v25.trayVisible, 
        v24.notifications
    });
    local v45 = v1.useCallback(function(v44)
        if (not v18 and #v24.notifications < 75) and not v24.allLoaded then
            if v44.AbsoluteCanvasSize.y - (v44.CanvasPosition.y + v44.AbsoluteSize.y) < 10 then
                v37();
            end;
            return ;
        else
            return ;
        end;
    end, {
        #v24.notifications, 
        v24.allLoaded, 
        v37, 
        v18
    });
    local v49 = v1.useMemo(function()
        local v46 = {};
        for v47, v48 in ipairs(v24.notifications) do
            v46[v47] = v1.createElement(v12, {
                key = v48.notificationId, 
                Index = v47, 
                Notification = v48, 
                LayoutOrder = v47
            });
        end;
        return v46;
    end, {
        v24.notifications
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-NotificationTray"
    }, {
        Header = v1.createElement(v16, {
            LayoutOrder = 1
        }), 
        ScrollingTray = if #v49 > 0 then v1.createElement("ScrollingFrame", {
            LayoutOrder = 2, 
            [v1.Change.CanvasPosition] = v45, 
            [v1.Tag] = "Component-NotificationTrayScrollingFrame"
        }, v4.List.join(v49, {
            (v1.useMemo(function()
                if v18 then
                    return v1.createElement("Frame", {
                        LayoutOrder = 150, 
                        [v1.Tag] = "Component-NotificationTrayLoading"
                    }, {
                        v1.createElement(l_LoadingIndicator_0, {
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                else
                    return nil;
                end;
            end, {
                v18
            }))
        })) else v1.createElement(v11, {
            Loading = v18 and #v49 == 0, 
            OnLoadError = v20, 
            LayoutOrder = 2, 
            OnRetry = v38
        })
    });
end;
