local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
return function(v5)
    local v6 = l_Localization_0:use();
    local v7 = v1.useCallback(function()
        v5.OnRetry(true);
    end, {
        v5.OnRetry
    });
    return v1.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        [v1.Tag] = "Component-EmptyNotificationTray"
    }, (v1.useMemo(function()
        if not v5.Loading then
            if not v5.OnLoadError then
                return {
                    EmptyState = v1.createElement("Frame", {
                        [v1.Tag] = "Component-EmptyNotificationTray-Centering"
                    }, {
                        EmptyImage = v1.createElement("ImageLabel", {
                            LayoutOrder = 1
                        }), 
                        TextLabel = v1.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Text = v6:getText("EmptyNotificationTray", "NoNewNotifications"), 
                            [v1.Tag] = "Component-EmptyNotificationTray-SubText"
                        })
                    })
                };
            else
                return {
                    ErrorState = v1.createElement("Frame", {
                        [v1.Tag] = "Component-EmptyNotificationTray-Centering Component-EmptyNotificationTray-ErrorLayout"
                    }, {
                        ErrorImage = v1.createElement("ImageLabel", {
                            LayoutOrder = 1
                        }), 
                        TextContent = v1.createElement("Frame", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            [v1.Tag] = "X-Column"
                        }, {
                            Mainline = v1.createElement("TextLabel", {
                                LayoutOrder = 1, 
                                Text = v6:getText("EmptyNotificationTray", "LoadErrorMain"), 
                                [v1.Tag] = "Component-EmptyNotificationTray-MainText"
                            }), 
                            Subline = v1.createElement("TextLabel", {
                                LayoutOrder = 2, 
                                Text = v6:getText("EmptyNotificationTray", "LoadErrorSub"), 
                                [v1.Tag] = "Component-EmptyNotificationTray-SubText"
                            })
                        }), 
                        RefreshButton = v1.createElement("TextButton", {
                            LayoutOrder = 3, 
                            Text = v6:getText("EmptyNotificationTray", "RefreshAction"), 
                            [v1.Event.MouseButton1Click] = v7
                        })
                    })
                };
            end;
        else
            return {
                LoadingContent = v1.createElement(l_LoadingIndicator_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            };
        end;
    end, {
        v5.Loading, 
        v5.OnLoadError
    })));
end;
