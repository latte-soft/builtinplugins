local v0 = require(script.Parent.Parent.Parent.Src.Util.IsTeamCreateEnabled);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
getCommonArgs = function()
    return {
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        placeId = game.PlaceId, 
        machineTimeStamp = os.time()
    };
end;
return {
    reportCollaborateButtonPressed = function()
        local v2 = getCommonArgs();
        v2.isTeamCreate = v0();
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "CollaborateButtonPressed", v2);
    end, 
    reportSaveToRobloxPressed = function()
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "SaveToRobloxPressed", (getCommonArgs()));
    end, 
    reportCancelPressed = function(v3)
        local v4 = getCommonArgs();
        v4.isTeamCreate = v0();
        v4.gameType = not v3 and "user" or "group";
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "CancelButtonPressed", v4);
    end, 
    reportSaveCollaboratorsPressed = function(v5, v6, v7)
        local v8 = "";
        local v9 = "";
        local v10 = "";
        local v11 = "";
        for _, v13 in v6, nil, nil do
            if string.len(v8) > 0 then
                v8 = v8 .. ",";
                v9 = v9 .. ",";
                v10 = v10 .. ",";
                v11 = v11 .. ",";
            end;
            v8 = v8 .. "add";
            v9 = v9 .. v13.subjectId;
            v10 = v10 .. v13.action;
            v11 = v11 .. v13.subjectType;
        end;
        for _, v15 in v7, nil, nil do
            if string.len(v8) > 0 then
                v8 = v8 .. ",";
                v9 = v9 .. ",";
                v10 = v10 .. ",";
                v11 = v11 .. ",";
            end;
            v8 = v8 .. "delete";
            v9 = v9 .. v15.subjectId;
            v10 = v10 .. v15.action;
            v11 = v11 .. v15.subjectType;
        end;
        local v16 = getCommonArgs();
        v16.isTeamCreate = v0();
        v16.gameType = not v5 and "user" or "group";
        v16.actions = v8;
        v16.ids = v9;
        v16.permissionLevels = v10;
        v16.types = v11;
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "SaveCollaboratorsButtonPressed", v16);
    end
};
