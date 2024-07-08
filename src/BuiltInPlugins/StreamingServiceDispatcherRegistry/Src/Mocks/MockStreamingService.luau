local l_Signal_0 = require(script:FindFirstAncestor("StreamingServiceDispatcherRegistry").Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {};
    setmetatable(v2, v1);
    v2.RequestEnded = l_Signal_0.new();
    v2.ConversationCleared = l_Signal_0.new();
    v2.SequentialCommandsFinished = l_Signal_0.new();
    v2.RequestError = l_Signal_0.new();
    v2.RequestStarted = l_Signal_0.new();
    v2.Stream = l_Signal_0.new();
    v2._requestId = "123";
    v2._instanceStore = {};
    v2._variableStore = {};
    v2._commandStore = {};
    v2._collectorStore = {};
    v2._boundCodeGuids = {};
    return v2;
end;
v1.UnregisterCommand = function(v3, v4)
    v3._commandStore[v4] = nil;
end;
v1.UnregisterContextCollector = function(v5, v6)
    v5._collectorStore[v6] = nil;
end;
v1.GetInstance = function(v7, v8, v9)
    return v7._instanceStore[v8 .. v9];
end;
v1.RegisterCommand = function(v10, v11, v12)
    v10._commandStore[v11] = v12;
end;
v1.RegisterSequentialCommand = function(v13, v14, v15)
    v13._commandStore[v14] = v15;
end;
v1.RegisterContextCollector = function(v16, v17, v18)
    v16._collectorStore[v17] = v18;
end;
v1.SetEphemeralVariable = function(v19, v20, v21, _)
    v19._variableStore[v20] = v21;
end;
v1.GetEphemeralVariable = function(v23, v24)
    return v23._variableStore[v24];
end;
v1.InvokeCommand = function(v25, v26, v27, v28)
    v28.requestId = v26;
    v25._commandStore[v27](v28);
end;
v1.ExecuteCommandAsync = function(v29, v30, v31, v32)
    v32.requestId = v30;
    v29._commandStore[v31](v32);
end;
v1.SetPluginInfoCallback = function(_, _)
end;
v1.BindCodeToGuid = function(v35, v36, v37)
    v35._boundCodeGuids[v36] = v37;
end;
v1.RunSandboxedCode = function(v38, v39, _)
    local v41 = v38._boundCodeGuids[v39];
    if v41 then
        local v42, v43 = loadstring(v41);
        if v42 then
            getfenv(v42).print = print;
            local l_status_0, l_result_0 = pcall(function()
                assert(v42, "Loaded code is nil");
                v42();
            end);
            if l_status_0 then
                return true, nil;
            else
                warn("RUNTIME ERROR", l_result_0);
                return false, l_result_0;
            end;
        else
            warn("COMPILATION ERROR", v43);
            return false, v43;
        end;
    else
        warn("Code was not bound to a guid");
        return false, "Code was not bound to a guid";
    end;
end;
v1._replaceInstances = function(v46, v47, v48)
    if type(v47) == "table" then
        for v49, v50 in v47, nil, nil do
            v47[v49] = v46:_replaceInstances(v50, v48);
        end;
        return v47;
    elseif typeof(v47) == "Instance" then
        local v51 = "Instance_" .. v47:GetDebugId();
        v46._instanceStore[v48 .. v51] = v47;
        return v51;
    else
        return v47;
    end;
end;
v1.CollectContexts = function(v52, v53, v54)
    v52:RegisterContextCollector("native_injector", function()
        return {
            ClientVersionContext = "1.0.0", 
            use_inventory_assets = false, 
            ClientFlagContext = {
                FFlagCAPFixMissingHREndTag = {
                    boolean = "true"
                }, 
                FFlagCAPAddStreamIdToRichTextContent = {
                    boolean = "true"
                }, 
                FFlagConvAICodeRunnerClientMarker = {
                    boolean = "true"
                }
            }, 
            MessageIdentifier = v53
        };
    end);
    for _, v56 in v52._collectorStore, nil, nil do
        for v57, v58 in (v56(v53)), nil, nil do
            if not v54[v57] then
                v54[v57] = v58;
            end;
        end;
    end;
    v52:_replaceInstances(v54, v53);
end;
return v1;
