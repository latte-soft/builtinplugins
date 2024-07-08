local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
local _ = game:GetService("StudioService");
return function(v2)
    local function v4(v3)
        v2:SendEventDeferred("studio", "ActivityHistory", "ActivityHistoryAction", (v0.Dictionary.join({
            studioSid = v2:GetSessionId(), 
            clientId = v2:GetClientId()
        }, v3 or {})));
    end;
    return {
        bubblesSeenOnSessionEnd = function(_, v6, v7, v8)
            v4({
                analyticsEventType = "bubblesSeenOnSessionEnd", 
                bubblesSeenOnSessionEndCount = v6, 
                placeId = v7, 
                universeId = v8
            });
        end, 
        deeplink = function(_, v10, v11)
            v4({
                analyticsEventType = "deeplink", 
                eventtype = v10, 
                deeplinktype = v11
            });
        end
    };
end;
