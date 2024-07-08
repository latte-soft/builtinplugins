local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixAssistantLuaTests);
local v3 = {
    RunningEval = false
};
local l_LoadedCode_0 = game:FindFirstChild("LoadedCode");
if l_LoadedCode_0 then
    local l_lib_0 = l_LoadedCode_0:FindFirstChild("lib");
    if not (not l_lib_0 or not require(l_lib_0).thisIsEvalFramework) then
        v3.RunningEval = true;
        local l_ObjectValue_0 = Instance.new("ObjectValue");
        l_ObjectValue_0.Name = "CliAdapter";
        l_ObjectValue_0.Value = script;
        l_ObjectValue_0.Parent = l_LoadedCode_0;
    end;
end;
if not (v2() and not v1.isCli()) and (v2() or v3.RunningEval) then
    local v10 = {
        __call = function(v7, ...)
            for _, v9 in v7.listeners, nil, nil do
                v9(...);
            end;
        end
    };
    v10.__index = v10;
    local function v11()
        return {};
    end;
    v10.Connect = function(v12, v13)
        table.insert(v12.listeners, v13);
        local v14 = #v12.listeners;
        return {
            Disconnect = function()
                v12.listeners[v14] = v11;
            end
        };
    end;
    v10.new = function()
        return (setmetatable({
            listeners = {}
        }, v10));
    end;
    local v17 = {
        __index = function(_, _)
            return v11;
        end
    };
    local v18 = nil;
    if not v2() then
        v18 = setmetatable({
            FindVariationsSignal = v10.new(), 
            SetMaterialSettingsSignal = v10.new(), 
            ActionActivatedSignal = v10.new(), 
            ShiftVariationSignal = v10.new(), 
            ShiftToAssetIdSignal = v10.new()
        }, v17);
    end;
    local v19 = require(l_script_FirstAncestor_0.Src.Mocks.MockStreamingService);
    local v20 = require(l_script_FirstAncestor_0.Src.Mocks.MockChatbotUIService);
    local v21 = setmetatable({}, v17);
    local v22 = setmetatable({}, v17);
    local v23 = setmetatable({}, v17);
    local v24 = nil;
    if not v2() then
        v24 = {
            ConversationCleared = v10.new(), 
            RequestEnded = v10.new(), 
            RequestError = v10.new(), 
            RequestStarted = v10.new(), 
            SequentialCommandsFinished = v10.new(), 
            Stream = v10.new(), 
            _requestId = "123", 
            _instanceStore = {}, 
            _variableStore = {}, 
            _commandStore = {}, 
            _collectorStore = {}, 
            _boundCodeGuids = {}
        };
    end;
    local v28 = {
        StreamingService = if not v2() then v24 else v19.new(), 
        ChatbotUIService = if not v2() then v18 else v20.new(), 
        ConversationalAIAcceptanceService = v21, 
        MaterialGenerationService = v22, 
        StudioAssetService = v23, 
        ScriptEditorService = {
            UpdateSourceAsync = function(_, v26, v27)
                v26.Source = v27();
            end
        }
    };
    v3.GetService = function(v29)
        local v30 = nil;
        pcall(function()
            v30 = game:GetService(v29);
        end);
        if not v30 then
            v30 = v28[v29];
            if not v30 then
                print((("ERROR: Service %* is not available and not mocked"):format(v29)));
            else
                v30.Name = v29;
            end;
        end;
        return v30;
    end;
    if not v2() then
        v24.GetInstance = function(v31, v32, v33)
            return v31._instanceStore[v32 .. v33];
        end;
        v24.BindCodeToGuid = function(v34, v35, v36)
            v34._boundCodeGuids[v35] = v36;
        end;
        v24.RunSandboxedCode = function(v37, v38, _)
            local v40 = v37._boundCodeGuids[v38];
            if v40 then
                local v41, v42 = loadstring(v40);
                if v41 then
                    getfenv(v41).print = print;
                    local l_status_0, l_result_0 = pcall(function()
                        assert(v41, "Loaded code is nil");
                        v41();
                    end);
                    if l_status_0 then
                        return true, nil;
                    else
                        warn("RUNTIME ERROR", l_result_0);
                        return false, l_result_0;
                    end;
                else
                    warn("COMPILATION ERROR", v42);
                    return false, v42;
                end;
            else
                warn("Code was not bound to a guid");
                return false, "Code was not bound to a guid";
            end;
        end;
        v24.GetEphemeralVariable = function(v45, v46)
            return v45._variableStore[v46];
        end;
        v24.ExecuteCommandAsync = function(v47, v48, v49, v50)
            v50.requestId = v48;
            v47._commandStore[v49](v50);
        end;
        v24.InvokeCommand = function(v51, v52, v53, v54)
            v54.requestId = v52;
            v51._commandStore[v53](v54);
        end;
        v24.RegisterCommand = function(v55, v56, v57)
            v55._commandStore[v56] = v57;
        end;
        v24.RegisterContextCollector = function(v58, v59, v60)
            v58._collectorStore[v59] = v60;
        end;
        v24.RegisterSequentialCommand = function(v61, v62, v63)
            v61._commandStore[v62] = v63;
        end;
        v24.SetEphemeralVariable = function(v64, v65, v66, _)
            v64._variableStore[v65] = v66;
        end;
        v24.SetPluginInfoCallback = function(_, _)
        end;
        v24.UnregisterCommand = function(v70, v71)
            v70._commandStore[v71] = nil;
        end;
        v24.UnregisterContextCollector = function(v72, v73)
            v72._collectorStore[v73] = nil;
        end;
        replaceInstances = function(v74, v75)
            if type(v74) == "table" then
                for v76, v77 in v74, nil, nil do
                    v74[v76] = replaceInstances(v77, v75);
                end;
                return v74;
            elseif typeof(v74) == "Instance" then
                local v78 = "Instance_" .. v74:GetDebugId();
                v24._instanceStore[v75 .. v78] = v74;
                return v78;
            else
                return v74;
            end;
        end;
        v24.CollectContexts = function(v79, v80, v81)
            v79:RegisterContextCollector("native_injector", function()
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
                    MessageIdentifier = v80
                };
            end);
            for _, v83 in v79._collectorStore, nil, nil do
                for v84, v85 in (v83(v80)), nil, nil do
                    if not v81[v84] then
                        v81[v84] = v85;
                    end;
                end;
            end;
            replaceInstances(v81, v80);
        end;
    end;
    return v3;
else
    v3.GetService = function(v86)
        return game:GetService(v86);
    end;
    return v3;
end;
