local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Dash);
local l_reduce_0 = v3.reduce;
local l_map_0 = v3.map;
local v6 = v2.RobloxAPI.Url.new();
local l_Localization_0 = v2.ContextServices.Localization;
local l_CaptureFocus_0 = v2.UI.CaptureFocus;
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local v11 = require(l_Parent_0.Src.Contexts.NotificationsContext);
local v12 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v13 = require(l_Parent_0.Src.Components.NotificationMenu.constants);
local v14 = v6.composeUrl(v6.CREATOR_HUB_URL, "settings/notifications");
return function(v15)
    local v16 = l_Localization_0:use();
    local v17 = v12:use();
    local v18 = v1.useContext(v11);
    local v22 = v1.useMemo(function()
        return l_reduce_0(v13.MENU_OPTIONS, function(v19, v20)
            return (math.max(v19, l_TextService_0:GetTextSize(v16:getText("Header", v20), v13.TEXT_SIZE, v13.TEXT_FONT, Vector2.new(math.huge, math.huge)).X + v13.TEXT_WIDTH_PADDING));
        end, 0);
    end, (v1.useMemo(function()
        return l_map_0(v13.MENU_OPTIONS, function(v21)
            return v16:getText("Header", v21);
        end);
    end, {
        v16
    })));
    local v23 = v1.useMemo(function()
        return v22 - v13.BORDER_SIZE * 2;
    end, {
        v22
    });
    local v27 = v1.useCallback(function(_, _, _)
        v15.OnDropdownMenuFocusLost();
    end, {
        v15.OnDropdownMenuFocusLost
    });
    local v28 = v1.useCallback(function()
        v18.markAllNotificationsRead();
        v15.OnDropdownMenuFocusLost();
        v18.notificationClient.markAllNotificationsRead();
        v17.eventHandlers.markAllAsRead();
    end, {
        v15.OnDropdownMenuFocusLost, 
        v17, 
        v18.notificationClient
    });
    local v29 = v1.useCallback(function()
        l_GuiService_0:OpenBrowserWindow(v14);
        v15.OnDropdownMenuFocusLost();
        v17.eventHandlers.settingsButtonClicked();
    end, {
        v15.OnDropdownMenuFocusLost, 
        v17
    });
    local v31 = v1.useCallback(function(v30)
        if v30 == "MarkAllAsRead" then
            return v28;
        elseif v30 == "Settings" then
            return v29;
        else
            return function()
                warn("Unknown notification menu option: ", v30);
            end;
        end;
    end, {
        v29, 
        v28
    });
    return v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = v27
    }, {
        v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -14, 0, 38), 
            Size = UDim2.new(0, v22, 0, v13.TOTAL_MENU_HEIGHT), 
            [v1.Tag] = "Component-NotificationMenu"
        }, {
            v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, v13.BORDER_SIZE, 0, v13.BORDER_SIZE), 
                Size = UDim2.new(0, v23, 0, v13.INNER_MENU_HEIGHT), 
                [v1.Tag] = "Component-NotificationMenuInner"
            }, l_map_0(v13.MENU_OPTIONS, function(v32, v33)
                return v1.createElement("TextButton", {
                    LayoutOrder = v33, 
                    AutoButtonColor = false, 
                    Size = UDim2.new(0, v23, 0, v13.BUTTON_HEIGHT), 
                    Text = v16:getText("Header", v32), 
                    [v1.Event.MouseButton1Click] = v31(v32), 
                    [v1.Tag] = "Component-NotificationMenuOptionButton"
                });
            end))
        })
    });
end;
