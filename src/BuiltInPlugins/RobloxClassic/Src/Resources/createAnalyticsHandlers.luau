local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
return function(v4)
    local function v8(v5, v6)
        local v7 = v1.Dictionary.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            placeId = game.PlaceId
        }, v6 or {});
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("RobloxClassic", tostring(v5), l_HttpService_0:JSONEncode(v7)));
        end;
        v4:SendEventDeferred("studio", "RobloxClassic", v5, v7);
    end;
    local function _(v9, v10)
        v10 = v10 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("RobloxClassic", tostring(v9), (tostring(v10))));
        end;
        v4:ReportCounter(v9, v10);
    end;
    local function _(v12, v13, v14)
        v13 = v13 or {};
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s throttlingPercent=%s"):format("RobloxClassic", tostring(v12), l_HttpService_0:JSONEncode(v13), (tostring(v14))));
        end;
        v4:ReportInfluxSeries(v12, v13, v14);
    end;
    return {
        classicPluginFlipped = function(_, v17)
            v8("RobloxClassicPluginFlipped", v17);
        end
    };
end;
