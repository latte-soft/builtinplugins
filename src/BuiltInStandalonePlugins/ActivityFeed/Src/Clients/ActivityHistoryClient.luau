local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_Promise_0 = v0.Util.Promise;
local v2 = v0.RobloxAPI.Url.new();
local v3 = v0.Http.Networking.new({
    isInternal = true, 
    loggingLevel = 0
});
local l_game_FastInt_0 = game:GetFastInt("ActivityFeedEndpointFetchCount");
local l_HttpService_0 = game:GetService("HttpService");
local function _(v6)
    local v7 = {};
    for v8, v9 in pairs((l_HttpService_0:JSONDecode(v6))) do
        v7[v8] = v9;
    end;
    return v7;
end;
return {
    fetchActivityHistory = function(_, v12, v13, v14, v15)
        local v16 = {
            entryCount = l_game_FastInt_0, 
            universeId = v12
        };
        if v13 then
            v16.cursor = v13;
        end;
        if v14 then
            v16.startDate = DateTime.fromUnixTimestampMillis(v14):ToIsoDate();
        end;
        v3:handleRetry(v3:get((v2.composeUrl(v2.APIS_URL, "activity-feed-service/v1/history-paged", v16)))):catch(function(v17)
            return v17;
        end):andThen(function(v18)
            if v18.responseCode >= 200 and v18.responseCode < 300 then
                v18.responseBody = l_HttpService_0:JSONDecode(v18.responseBody);
            end;
            for _, v20 in pairs(v18.responseBody.events) do
                if type(v20.metaData) == "string" then
                    local v21 = {};
                    do
                        local l_v21_0 = v21;
                        local l_status_0, l_result_0 = pcall(function()
                            local l_metaData_0 = v20.metaData;
                            local v24 = {};
                            for v25, v26 in pairs((l_HttpService_0:JSONDecode(l_metaData_0))) do
                                v24[v25] = v26;
                            end;
                            l_v21_0 = v24;
                        end);
                        if not l_status_0 then
                            print("error decoding json " .. tostring(v20.metaData) .. ": " .. tostring(l_result_0));
                        end;
                        v20.metaData = l_v21_0;
                    end;
                end;
            end;
            v15(v18);
        end, function(v29)
            print("fetchActivityHistory error " .. tostring(v29.responseCode));
        end);
    end, 
    activityFeedRTEEffect = function(v30)
        return function()
            local v31 = nil;
            v31 = game:GetService("ActivityHistoryService").EventNotificationReceived:Connect(function(v32)
                v30(v32);
                print("ActivityHistoryService.EventNotificationReceived");
                print((tostring(v32)));
            end);
            return function()
                if v31 then
                    v31:Disconnect();
                end;
            end;
        end;
    end, 
    fetchUsernames = function(v33, v34)
        local v35 = {};
        local v36 = 0;
        for _, v38 in pairs(v33) do
            v36 = v36 + 1;
            table.insert(v35, (l_Promise_0.new(function(v39, v40)
                local v41 = "";
                local l_status_1, l_result_1 = pcall(function()
                    v41 = game.Players:GetNameFromUserIdAsync(v38);
                end);
                if not l_status_1 then
                    v40(l_result_1);
                else
                    v39(v38, v41);
                end;
            end)));
        end;
        local v44 = {};
        local v45 = 0;
        local function _()
            if v45 == v36 then
                v34(v44);
            end;
        end;
        for _, v48 in pairs(v35) do
            v48:andThen(function(v49, v50)
                v45 = v45 + 1;
                v44[v49] = v50;
                if v45 == v36 then
                    v34(v44);
                end;
            end):catch(function(_)
                v45 = v45 + 1;
                if v45 == v36 then
                    v34(v44);
                end;
            end);
        end;
    end
};
