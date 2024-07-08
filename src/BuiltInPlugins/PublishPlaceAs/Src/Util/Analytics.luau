local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(script.Parent.Parent.Parent.Packages.Cryo);
return {
    reportSaveCancel = function(v3)
        local v4 = not v3 and "FileSavePlaceAsCancel" or "FilePublishPlaceAsCancel";
        local v5 = {
            userId = l_StudioService_0:GetUserId(), 
            studioSid = l_RbxAnalyticsService_0:GetSessionId()
        };
        if l_StudioService_0:GetPlaceIsPersistedToCloud() then
            v5 = v2.Dictionary.join(v5, {
                placeId = game.PlaceId
            });
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "TeamCreate", v4, v5);
    end
};
