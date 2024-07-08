local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = {};
if not pcall(function()
    local _ = l_RbxAnalyticsService_0.Name;
end) then
    l_RbxAnalyticsService_0 = {
        SendEventDeferred = function(_)
        end, 
        ReportCounter = function(_)
        end, 
        GetSessionId = function(_)
        end, 
        GetClientId = function(_)
        end, 
        ReportStats = function(_)
        end
    };
end;
v2.sendEvent = function(_, v10, v11)
    local v12 = {
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        userId = l_StudioService_0:GetUserId()
    };
    for v13, v14 in pairs(v11) do
        v12[v13] = v14;
    end;
    l_RbxAnalyticsService_0:SendEventDeferred("studio", "Modeling", v10, v12);
end;
v2.reportCounter = function(_, v16, v17)
    l_RbxAnalyticsService_0:ReportCounter(v16, v17 or 1);
end;
v2.reportStats = function(_, v19, v20)
    l_RbxAnalyticsService_0:ReportStats(v19, v20);
end;
return v2;
