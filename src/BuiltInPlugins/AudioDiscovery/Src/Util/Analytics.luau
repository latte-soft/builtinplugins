local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = {};
local l_game_FastInt_0 = game:GetFastInt("StudioAudioDiscoveryOpenAnalyticThrottle");
local l_game_FastInt_1 = game:GetFastInt("StudioAudioDiscoverySelectAnalyticsThrottle");
local l_game_FastInt_2 = game:GetFastInt("StudioAudioDiscoveryBreakdownAnalyticsThrottle");
local v5 = game:getFastInt("StudioAudioDiscoveryPermissionCheckAnalyticsThrottle");
v1._sendToKibana = function(_, v7, v8, v9)
    task.spawn(l_RbxAnalyticsService_0.ReportInfluxSeries, l_RbxAnalyticsService_0, v7, v8, v9);
end;
ReportedOpen = false;
v1.reportOpen = function(v10)
    if not ReportedOpen then
        ReportedOpen = true;
        v10:_sendToKibana("StudioAudioDiscoveryOpen", {}, l_game_FastInt_0);
    end;
end;
ReportedSelect = false;
v1.reportSelect = function(v11)
    if not ReportedSelect then
        ReportedSelect = true;
        v11:_sendToKibana("StudioAudioDiscoverySelect", {}, l_game_FastInt_1);
    end;
end;
v1.reportBreakdown = function(v12, v13, v14)
    v12:_sendToKibana("StudioAudioDiscoveryBreakdown", {
        good = v13, 
        bad = v14
    }, l_game_FastInt_2);
end;
v1.reportPermissionCheck = function(v15, v16)
    v15:_sendToKibana("StudioAudioDiscoveryPermissionCheck", {
        responseCode = v16.responseCode, 
        responseBody = v16.responseBody, 
        responseTimeMs = v16.responseTimeMs
    }, v5);
end;
return v1;
