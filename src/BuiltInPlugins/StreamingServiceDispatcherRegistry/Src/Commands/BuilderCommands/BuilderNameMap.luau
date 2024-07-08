local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChangeHistoryService");
local v3 = v1.GetService("StreamingService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIMenu_Attrib);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerTelemetry);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPInstanceTrackerForUndoTelemetry);
local v8 = {
    assetCacheMap = {}, 
    g2g = {}, 
    guid2instance = {}, 
    guidToInfo = {}, 
    chatBulletMap = {}, 
    altDataMap = {}, 
    requestRegionAdornments = {}, 
    requestMetadata = {}, 
    activeDraftGuids = nil, 
    draftModeModels = {}
};
if v5() then
    v8.cachedAssetAttributionInfo = {};
end;
if v7() then
    v8.recordingActionNumber = 1;
    v8.requestToRecordName = {};
end;
local v9 = {};
local v10 = {};
v8.get = function(v11, v12)
    if not v11 or #v11 == 0 then
        return ;
    else
        local v13 = nil;
        if v12 then
            v13 = v3:GetInstance(v12, v11);
        end;
        return v13 or v9[v11];
    end;
end;
v8.set = function(v14, v15)
    v9[v14] = v15;
end;
local v16 = nil;
local v17 = nil;
v8.StartRecordingActions = function(v18, v19)
    if not v17 then
        local v20 = nil;
        if not v7() then
            v20 = not v6() and "Assistant Actions" or (v19 or "Assistant Actions");
        else
            v20 = v19 or v8.requestToRecordName[v18];
            if not v20 then
                v20 = ("%* %*"):format("Assistant Actions", v8.recordingActionNumber);
                local l_v8_0 = v8;
                l_v8_0.recordingActionNumber = l_v8_0.recordingActionNumber + 1;
                v8.requestToRecordName[v18] = v20;
            end;
        end;
        local v22 = v2:TryBeginRecording(v20);
        if v22 then
            v17 = v22;
            return true, v22;
        else
            warn("StartRecordingActions failed: TryBeginRecording returned nil");
            return false;
        end;
    else
        if not v2:IsRecordingInProgress(v17) then
            warn("StartRecordingActions failed: currentRecording is set but not running");
        end;
        return false;
    end;
end;
v8.EndRecordingActions = function(v23, v24)
    if v17 then
        assert(v17, "Luau");
        local _, v26 = v2:GetCanUndo();
        local l_Append_0 = Enum.FinishRecordingOperation.Append;
        local v28 = nil;
        if not v7() then
            v28 = not v6() and "Assistant Actions" or (v24 or "Assistant Actions");
        else
            v28 = v24 or v8.requestToRecordName[v23];
            if not v28 then
                return false;
            end;
        end;
        if not (v16 == v23) or v26 ~= v28 then
            l_Append_0 = Enum.FinishRecordingOperation.Commit;
        end;
        v2:FinishRecording(v17, l_Append_0);
        if not (not v7() or v24) then
            v4:RecordingActionEnded(v23, v28);
        end;
        v16 = v23;
        v17 = nil;
        return true;
    else
        return false;
    end;
end;
local function _(v29)
    local v30 = v8.requestMetadata[v29];
    if not v30 then
        v30 = {
            RequestId = v29, 
            Time_Start = os.clock()
        };
        v8.requestMetadata[v29] = v30;
        return v30;
    else
        return v30;
    end;
end;
v8.GetRequestFolder = function(v32)
    if v32 then
        local v33 = v10[v32];
        if not v33 then
            v33 = Instance.new("Folder");
            v33.Parent = workspace;
            v10[v32] = v33;
            local function _(v34, v35)
                if typeof(v35) == "Instance" then
                    return ;
                else
                    v33:SetAttribute(v34, v35);
                    if v34 == "Query" then
                        v33.Name = "PROMPT: " .. v35:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                    end;
                    return ;
                end;
            end;
            local v37 = v8.requestMetadata[v32];
            local v38;
            if not v37 then
                v37 = {
                    RequestId = v32, 
                    Time_Start = os.clock()
                };
                v8.requestMetadata[v32] = v37;
                v38 = v37;
            else
                v38 = v37;
            end;
            for v39, v40 in v38, nil, nil do
                if not (typeof(v40) == "Instance") then
                    v33:SetAttribute(v39, v40);
                    if v39 == "Query" then
                        v33.Name = "PROMPT: " .. v40:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                    end;
                end;
            end;
            setmetatable(v38, {
                __newindex = function(_, v42, v43)
                    if typeof(v43) == "Instance" then
                        return ;
                    else
                        v33:SetAttribute(v42, v43);
                        if v42 == "Query" then
                            v33.Name = "PROMPT: " .. v43:gsub("^(" .. ("."):rep(30) .. ".-)( .*)$", "%1...");
                        end;
                        return ;
                    end;
                end
            });
        end;
        return v33;
    else
        return ;
    end;
end;
v8.GetRequestMetadata = function(v44, v45)
    local v46 = v8.requestMetadata[v44];
    local v47;
    if not v46 then
        v46 = {
            RequestId = v44, 
            Time_Start = os.clock()
        };
        v8.requestMetadata[v44] = v46;
        v47 = v46;
    else
        v47 = v46;
    end;
    return v47[v45];
end;
v8.SetRequestMetadata = function(v48, v49, v50)
    local v51 = v8.requestMetadata[v48];
    local v52;
    if not v51 then
        v51 = {
            RequestId = v48, 
            Time_Start = os.clock()
        };
        v8.requestMetadata[v48] = v51;
        v52 = v51;
    else
        v52 = v51;
    end;
    v52[v49] = v50;
end;
v8.destroy = function()
end;
return v8;
