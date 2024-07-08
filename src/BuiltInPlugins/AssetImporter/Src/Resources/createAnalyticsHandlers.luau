local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v5)
    local function _(v6, v7)
        local v8 = v1.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v7 or {});
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("AssetImporter", tostring(v6), l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "AssetImporter", v6, v8);
    end;
    local function _(v10, v11)
        v11 = v11 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("AssetImporter", tostring(v10), (tostring(v11))));
        end;
        v5:ReportCounter(v10, v11);
    end;
    return {};
end;
