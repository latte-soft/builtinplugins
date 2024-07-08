local l_game_FastInt_0 = game:GetFastInt("StudioAudioDiscoveryMaxAssetIdsPerRequest");
local l_game_FastInt_1 = game:GetFastInt("StudioAudioDiscoveryPerRequestCooldown");
local l_game_FastInt_2 = game:GetFastInt("StudioAudioDiscoveryCooldownAfterHttp429");
local l_game_FastInt_3 = game:GetFastInt("StudioAudioDiscoveryMaxRecentRequests");
local l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 = game:GetFastFlag("DEBUG_StudioAudioDiscoveryPermissionCheckErrors");
local l_AddNonPermCase_0 = game:GetFastFlag("AddNonPermCase");
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Packages.Framework);
local v8 = v7.RobloxAPI.Url.new();
local l_Signal_0 = v7.Util.Signal;
local _ = require(l_Parent_0.Src.Types);
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local v13 = require(l_Parent_0.Src.Util.Analytics);
local v14 = {};
v14.__index = v14;
v14.new = function(v15, v16)
    local v17 = {
        soundsFound = l_Signal_0.new(), 
        _soundAssets = {}, 
        _nonSoundAssetIds = {}, 
        _currentBatch = {}, 
        _pendingAssetIds = {}, 
        _batchesToSend = {}, 
        _batchRequestsInFlight = 0, 
        _maxAssetsPerRequest = not not v16 and v16.maxAssetsPerRequest or l_game_FastInt_0, 
        _perRequestCooldown = not not v16 and v16.perRequestCooldown or l_game_FastInt_1, 
        _cooldownAfterHttp429 = not not v16 and v16.cooldownAfterHttp429 or l_game_FastInt_2, 
        _maxRecentRequests = not not v16 and v16.maxRecentRequests or l_game_FastInt_3, 
        _lastSentRequests = {}, 
        _hit429 = 0, 
        _started = false, 
        _dead = false, 
        _httpTask = nil, 
        _renderSteppedConnection = nil, 
        _goodAssets = 0, 
        _badAssets = 0, 
        _resolvedAssets = {}, 
        _networking = v15
    };
    setmetatable(v17, v14);
    return v17;
end;
v14.start = function(v18)
    if not v18._started and not v18._dead then
        v18._started = true;
        v18._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(v19)
            v18:_renderStepped(v19);
        end);
        v18._httpTask = coroutine.create(function()
            while not v18._dead do
                v18:_stepHttpTask();
            end;
        end);
        v18:_wakeUpHttpTask();
        return ;
    else
        return ;
    end;
end;
v14.destroy = function(v20)
    v20._dead = true;
    if v20._renderSteppedConnection then
        v20._renderSteppedConnection:Disconnect();
        v20._renderSteppedConnection = nil;
    end;
    if v20._httpTask then
        coroutine.close(v20._httpTask);
        v20._httpTask = nil;
    end;
end;
v14._wakeUpHttpTask = function(v21)
    if (v21._dead or not v21._httpTask) or coroutine.status(v21._httpTask) ~= "suspended" then
        return ;
    else
        coroutine.resume(v21._httpTask);
        return ;
    end;
end;
v14.addAssetId = function(v22, v23)
    assert(type(v23) == "string");
    if not (v23 ~= "") or v23 == "0" then
        return ;
    elseif not (v22._soundAssets[v23] or v22._nonSoundAssetIds[v23]) and not v22._pendingAssetIds[v23] then
        table.insert(v22._currentBatch, v23);
        v22._pendingAssetIds[v23] = true;
        if v22._maxAssetsPerRequest <= #v22._currentBatch then
            v22:flush();
        end;
        return ;
    else
        return ;
    end;
end;
v14.flush = function(v24)
    local l__currentBatch_0 = v24._currentBatch;
    v24._currentBatch = {};
    if #l__currentBatch_0 > 0 then
        table.insert(v24._batchesToSend, l__currentBatch_0);
        v24:_wakeUpHttpTask();
    end;
end;
v14.resolved = function(v26, v27)
    if not v26._resolvedAssets[v27] then
        v26._resolvedAssets[v27] = true;
        v26._badAssets = v26._badAssets - 1;
    end;
end;
v14._hasBatchesToSend = function(v28)
    return #v28._batchesToSend > 0;
end;
v14._stepHttpTask = function(v29)
    if not v29._dead then
        if not v29:_hasBatchesToSend() then
            coroutine.yield();
        end;
        if not (v29._hit429 <= 0) or v29._maxRecentRequests <= #v29._lastSentRequests then
            coroutine.yield();
        end;
        v29:_sendBatch((table.remove(v29._batchesToSend, 1)));
        coroutine.yield();
        return ;
    else
        return ;
    end;
end;
v14._renderStepped = function(v30, v31)
    if not v30._dead then
        local v32 = 1;
        while v32 <= #v30._lastSentRequests do
            local l__lastSentRequests_0 = v30._lastSentRequests;
            l__lastSentRequests_0[v32] = l__lastSentRequests_0[v32] - v31;
            if v30._lastSentRequests[v32] <= 0 then
                table.remove(v30._lastSentRequests, v32);
            else
                v32 = v32 + 1;
            end;
        end;
        v30._hit429 = v30._hit429 - v31;
        if v30._hit429 <= 0 then
            v30._hit429 = 0;
        end;
        if (v30:_hasBatchesToSend() and v30._hit429 <= 0) and #v30._lastSentRequests < v30._maxRecentRequests then
            v30:_wakeUpHttpTask();
        end;
        return ;
    else
        return ;
    end;
end;
v14._sendBatch = function(v34, v35)
    local v36 = v8.composeUrl(v8.APIS_URL, "toolbox-service/v1/items/details", {
        assetIds = table.concat(v35, ",")
    });
    table.insert(v34._lastSentRequests, v34._perRequestCooldown);
    v34._batchRequestsInFlight = v34._batchRequestsInFlight + 1;
    local function v39(v37)
        local l_v34_0 = v34;
        l_v34_0._batchRequestsInFlight = l_v34_0._batchRequestsInFlight - 1;
        return v37;
    end;
    v34._networking:parseJson((v34._networking:get(v36):andThen(v39, v39))):andThen(function(v40)
        v34:_onBatchResponse(v35, v40.responseBody);
    end, function(v41)
        if v41.responseCode == 429 then
            v34._hit429 = v34._cooldownAfterHttp429;
            table.insert(v34._batchesToSend, v35);
            return ;
        elseif not (v41.responseCode >= 400) or v41.responseCode >= 500 then
            table.insert(v34._batchesToSend, v35);
            return ;
        else
            warn(("Fetching sound asset details failed: %d %s"):format(v41.responseCode, v41.responseBody.message));
            return ;
        end;
    end);
end;
local l_CreatorId_0 = game.CreatorId;
local l_CreatorType_0 = game.CreatorType;
v14._checkSound = function(_, v45, v46)
    local v47;
    if v46 == Enum.CreatorType.User then
        v47 = true;
        if v45 ~= 1 then
            v47 = true;
            if not (v45 ~= 1750384777) then
                goto label0;
            end;
        else
            goto label0;
        end;
    end;
    v47 = false;
    if l_CreatorId_0 == v45 then
        v47 = l_CreatorType_0 == v46;
    end;
    ::label0::;
    return v47;
end;
v14._onBatchCheckUniversePermissionResponse = function(v48, v49, v50, v51)
    v13:reportPermissionCheck(v49);
    local v52 = {};
    local l_results_0 = v49.responseBody.results;
    for v54, v55 in pairs(v51) do
        if not l_AddNonPermCase_0 then
            if l_results_0[v54].value.status == "HasPermission" then
                v50[v55].OK = "ok";
                v48._goodAssets = v48._goodAssets + 1;
            elseif l_results_0[v54].error.message ~= nil then
                if l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 then
                    warn(("Fetching sound asset universe permissions failed: %s"):format(l_results_0[v54].error.code));
                end;
                v48._badAssets = v48._badAssets + 1;
            else
                v48._badAssets = v48._badAssets + 1;
            end;
        elseif not l_results_0[v54].value then
            if not l_results_0[v54].error then
                v48._badAssets = v48._badAssets + 1;
            elseif l_results_0[v54].error.message then
                if l_DEBUG_StudioAudioDiscoveryPermissionCheckErrors_0 then
                    warn(("Fetching sound asset universe permissions failed: %s"):format(l_results_0[v54].error.code));
                end;
                v48._badAssets = v48._badAssets + 1;
            end;
        elseif l_results_0[v54].value.status == "HasPermission" then
            v50[v55].OK = "ok";
            v48._goodAssets = v48._goodAssets + 1;
        else
            v50[v55].OK = "error";
            v48._badAssets = v48._badAssets + 1;
        end;
        v48._soundAssets[v55] = v50[v55];
        table.insert(v52, v50[v55]);
    end;
    if #v52 > 0 then
        v48.soundsFound:Fire(v52);
    end;
    if not v48:_hasBatchesToSend() and v48._batchRequestsInFlight == 0 then
        v13:reportBreakdown(v48._goodAssets, v48._badAssets);
    end;
end;
v14._sendBatchCheckUniversePermission = function(v56, v57)
    local v58 = {
        ["Content-Type"] = "application/json"
    };
    local v59 = v8.composeUrl(v8.APIS_URL, "asset-permissions-api/v1/assets/check-permissions");
    local l_game_FastInt_4 = game:GetFastInt("AudioDiscoveryPermCheckMaxAssetIdsPerRequest");
    local v61 = 0;
    local v62 = {};
    local v63 = {};
    for v64, _ in pairs(v57) do
        if v61 == l_game_FastInt_4 then
            v56._networking:parseJson((v56._networking:post(v59, l_HttpService_0:JSONEncode({
                requests = v62
            }), v58))):andThen(function(v66)
                v56:_onBatchCheckUniversePermissionResponse(v66, v57, v63);
            end, function(v67)
                warn(("Fetching sound asset permissions failed: %d %s"):format(v67.responseCode, v67.responseBody.message));
            end);
            v62 = {};
            v63 = {};
            v61 = 0;
        else
            table.insert(v62, {
                subject = {
                    subjectType = "Universe", 
                    subjectId = tostring(game.GameId)
                }, 
                action = "use", 
                assetId = tostring(v64)
            });
            table.insert(v63, v64);
            v61 = v61 + 1;
        end;
    end;
    v56._networking:parseJson((v56._networking:post(v59, l_HttpService_0:JSONEncode({
        requests = v62
    }), v58))):andThen(function(v68)
        v56:_onBatchCheckUniversePermissionResponse(v68, v57, v63);
    end, function(v69)
        warn(("Fetching sound asset permissions failed: %d %s"):format(v69.responseCode, v69.responseBody.message));
    end);
end;
v14._onBatchResponse = function(v70, v71, v72)
    local v73 = {};
    for _, v75 in ipairs(v71) do
        v73[v75] = true;
    end;
    local v76 = {};
    local v77 = {};
    for _, v79 in ipairs(v72.data) do
        local l_id_0 = v79.asset.id;
        v70._pendingAssetIds[l_id_0] = nil;
        v73[l_id_0] = nil;
        if v79.asset.typeId ~= 3 then
            v70._nonSoundAssetIds[l_id_0] = true;
        else
            local v81 = v70:_checkSound(v79.creator.id, if v79.creator.type == 1 then Enum.CreatorType.User else Enum.CreatorType.Group);
            local v82 = {
                OK = not v81 and "error" or "ok", 
                Id = tostring(l_id_0), 
                Name = v79.asset.name, 
                CreatorId = v79.creator.id, 
                CreatorType = v79.creator.type == 1 and "User" or "Group", 
                Creator = v79.creator.name, 
                Time = v79.asset.duration
            };
            v77[l_id_0] = v82;
            if game.GameId == 0 then
                if not v81 then
                    v70._badAssets = v70._badAssets + 1;
                else
                    v70._goodAssets = v70._goodAssets + 1;
                end;
                v70._soundAssets[l_id_0] = v82;
                table.insert(v76, v82);
            end;
        end;
    end;
    for v83 in pairs(v73) do
        v70._pendingAssetIds[v83] = nil;
        v70._nonSoundAssetIds[v83] = true;
    end;
    if game.GameId ~= 0 then
        v70:_sendBatchCheckUniversePermission(v77);
        return ;
    else
        if #v76 > 0 then
            v70.soundsFound:Fire(v76);
        end;
        if not v70:_hasBatchesToSend() and v70._batchRequestsInFlight == 0 then
            v13:reportBreakdown(v70._goodAssets, v70._badAssets);
        end;
        return ;
    end;
end;
return v14;
