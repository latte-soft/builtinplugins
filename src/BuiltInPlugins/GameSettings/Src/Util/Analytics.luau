local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.Parent.Parent.Packages.Cryo);
local v3 = game:DefineFastInt("MaxAccessPermissionsCollaborators", 200);
local function _()
    local v4 = nil;
    pcall(function()
        v4 = l_RbxAnalyticsService_0:GetSessionId();
    end);
    return v4;
end;
local function _()
    local v6 = nil;
    pcall(function()
        v6 = l_RbxAnalyticsService_0:GetClientId();
    end);
    return v6;
end;
local v14 = {
    print = function(_, _, _)
    end, 
    printTable = function(_, _, _)
    end
};
v14.reportCounter = function(v15, v16)
    v14.print("reportCounter", v15, v16 or 1);
    l_RbxAnalyticsService_0:ReportCounter(v15, v16 or 1);
end;
v14.reportStats = function(v17, v18)
    v14.print("reportStats", v17, v18);
    l_RbxAnalyticsService_0:ReportStats(v17, v18);
end;
v14.sendEventDeferred = function(v19, v20)
    v14.printTable("sendEventDeferred", v19, l_HttpService_0:JSONEncode(v20));
    local l_join_0 = v2.Dictionary.join;
    local l_v20_0 = v20;
    local v23 = {};
    local v24 = nil;
    local v25;
    do
        local l_v24_0 = v24;
        pcall(function()
            l_v24_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v25 = l_v24_0;
    end;
    v23.uid = v25;
    v24 = nil;
    do
        local l_v24_1 = v24;
        pcall(function()
            l_v24_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v25 = l_v24_1;
    end;
    v23.sid = v25;
    v23.pid = game.PlaceId;
    l_RbxAnalyticsService_0:SendEventDeferred("studio", "gameSettings", v19, (l_join_0(l_v20_0, v23)));
end;
v14.onSettingSaved = function(v28, v29)
    v14.reportCounter(string.format("GameSettings_SettingSaved_%s", v28));
    if typeof(v29) == "boolean" then
        v14.reportCounter(string.format("GameSettings_Setting%s_%s", not v29 and "Disabled" or "Enabled", v28));
        return ;
    else
        if typeof(v29) == "string" then
            v14.reportStats(string.format("GameSettings_StringSettingLength_%s", v28), v29:len());
        end;
        return ;
    end;
end;
v14.onPageLoadAttempt = function(v30)
    v14.reportCounter(string.format("GameSettings_PageLoadAttempt_%s", v30));
end;
v14.onPageLoadSuccess = function(v31, v32)
    v14.reportCounter(string.format("GameSettings_PageLoadSuccess_%s", v31));
    v14.reportStats(string.format("GameSettings_PageLoadTime_Success_%s", v31), v32);
end;
v14.onPageLoadError = function(v33, v34)
    v14.reportCounter(string.format("GameSettings_PageLoadError_%s", v33));
    v14.reportStats(string.format("GameSettings_PageLoadTime_Error_%s", v33), v34);
end;
v14.onSaveAttempt = function()
    v14.reportCounter("GameSettings_SaveAttempt");
end;
v14.onSaveSuccess = function(v35)
    v14.reportCounter("GameSettings_SaveSuccess");
    v14.reportStats("GameSettings_SaveTime_Success", v35);
end;
v14.onSaveError = function(v36)
    v14.reportCounter("GameSettings_SaveError");
    v14.reportStats("GameSettings_SaveTime_Error", v36);
end;
v14.onPageSaveError = function(v37)
    v14.reportCounter(string.format("GameSettings_PageSaveError_%s", v37));
end;
v14.onOpenEvent = function(v38, v39)
    v14.sendEventDeferred("gameSettingsOpen", {});
    v14.sendEventDeferred("toolOpened", {
        method = 1, 
        uid = v38, 
        gameId = v39
    });
end;
v14.onCloseEvent = function(v40, v41)
    v14.sendEventDeferred("gameSettingsClose", {
        buttonSelected = v40, 
        timeOpen = string.format("%f", v41)
    });
end;
v14.onTabChangeEvent = function(v42, v43)
    if not (not v42 or not v43) then
        v14.sendEventDeferred("gameSettingsTabChange", {
            oldTab = v42, 
            newTab = v43
        });
    end;
end;
v14.numberOfUsers = function(v44, v45)
    v14.sendEventDeferred(string.format("GameSettings_%s_UserCount", v45), {
        uid = v44, 
        gameId = game.GameId
    });
end;
v14.onPermissionGiven = function(v46, v47, v48)
    v14.sendEventDeferred(string.format("GameSettings_%s%sGiven", v47, v48), {
        uid = v46, 
        gameId = game.GameId
    });
end;
v14.onPermissionRemoved = function(v49, v50, v51)
    v14.sendEventDeferred(string.format("GameSettings_%s%sRemoved", v50, v51), {
        uid = v49, 
        gameId = game.GameId
    });
end;
v14.onUserAdded = function()
    v14.reportCounter("GameSettings_AccessPermissions_UserAdded");
end;
v14.onUserRemoved = function()
    v14.reportCounter("GameSettings_AccessPermissions_UserRemoved");
end;
v14.onGroupAdded = function()
    v14.reportCounter("GameSettings_AccessPermissions_GroupAdded");
end;
v14.onGroupRemoved = function()
    v14.reportCounter("GameSettings_AccessPermissions_GroupRemoved");
end;
v14.onPermissionFailed = function()
    v14.reportCounter("GameSettings_AccessPermissions_Failed");
end;
v14.onNumCollaboratorsChanged = function(v52)
    for _, v54 in pairs({
        1, 
        0.75, 
        0.5, 
        0.25
    }) do
        if v54 * v3 <= v52 then
            v14.reportCounter("GameSettings_AccessPermissions_NumCollaboratorThreshold_" .. math.floor(v54 * 100));
            break;
        end;
    end;
    v14.sendEventDeferred("GameSettings_AccessPermissions_NumCollaborators", {
        gameId = game.GameId, 
        numCollaborators = v52
    });
end;
v14.onSecuritySettingChange = function(v55, v56)
    v14.sendEventDeferred("GameSettings_SecuritySettingChange", {
        settingName = v55, 
        settingValue = v56
    });
end;
return v14;
