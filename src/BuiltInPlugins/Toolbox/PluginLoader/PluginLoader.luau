local l_StudioService_0 = game:GetService("StudioService");
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        _signal = Instance.new("BindableEvent"), 
        _handlers = {}, 
        _eventsToFlush = {}, 
        _connections = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.Fire = function(v3, ...)
    if #v3._handlers > 0 then
        v3._signal:Fire(...);
        return ;
    else
        table.insert(v3._eventsToFlush, {
            ...
        });
        return ;
    end;
end;
v1.Connect = function(v4, v5)
    if #v4._handlers == 0 then
        for _, v7 in ipairs(v4._eventsToFlush) do
            task.spawn(function()
                v5(unpack(v7));
            end);
        end;
        v4._eventsToFlush = {};
    end;
    local v8 = v4._signal.Event:Connect(v5);
    table.insert(v4._handlers, v5);
    table.insert(v4._connections, v8);
    return v8;
end;
v1.Destroy = function(v9)
    v9._handlers = {};
    v9._eventsToFlush = {};
    for _, v11 in ipairs(v9._connections) do
        v11:Disconnect();
    end;
    v9._signal:Destroy();
end;
local v12 = {};
v12.__index = v12;
local function _(v13)
    if v13 ~= nil then
        return v13;
    else
        return l_StudioService_0.StudioLocaleId;
    end;
end;
v12.new = function(v15)
    local v16 = {
        _connectedSignals = {}, 
        _buttonConnections = {}, 
        _widgetConnections = {}, 
        _userHasInteracted = false, 
        _destroyed = false, 
        _userInteractionSignal = Instance.new("BindableEvent"), 
        _locale = nil, 
        _mainTranslator = nil, 
        _fallbackTranslator = nil, 
        _initArgs = v15
    };
    setmetatable(v16, v12);
    if v16._initArgs.localizationNamespace == nil then
        v16._initArgs.localizationNamespace = "Studio";
    end;
    local l_overrideLocaleId_0 = v15.overrideLocaleId;
    v16._locale = if l_overrideLocaleId_0 ~= nil then l_overrideLocaleId_0 else l_StudioService_0.StudioLocaleId;
    v16._mainTranslator = v15.translationResourceTable:GetTranslator(v16._locale);
    v16._fallbackTranslator = v15.fallbackResourceTable:GetTranslator("en-us");
    if not (not v15.shouldImmediatelyOpen or not v15.shouldImmediatelyOpen()) then
        v16:_onUserInteracted();
    end;
    return v16;
end;
v12.Destroy = function(v18)
    for _, v20 in pairs(v18._connectedSignals) do
        v20[1]:Disconnect();
    end;
    for _, v22 in pairs(v18._buttonConnections) do
        v22[1]:Disconnect();
    end;
    for _, v24 in pairs(v18._widgetConnections) do
        v24[1]:Disconnect();
    end;
    v18._destroyed = true;
    v18:_onUserInteracted();
    v18._userInteractionSignal:Destroy();
    v18._userInteractionSignal = nil;
end;
v12.getKeyNamespace = function(v25)
    return v25._initArgs.localizationNamespace;
end;
v12.getPluginName = function(v26)
    return v26._initArgs.pluginName;
end;
v12.getLocalizedText = function(v27, v28, v29, v30, v31)
    local v32 = string.format("%s.%s.%s.%s", v28, v29, v30, v31);
    local function _(v33)
        if v33 then
            local l_status_0, l_result_0 = pcall(function()
                return v33:FormatByKey(v32);
            end);
            return l_status_0, l_result_0;
        else
            return false, nil;
        end;
    end;
    local v37 = nil;
    local v38 = nil;
    if v27.locale == "en-us" then
        local l__fallbackTranslator_0 = v27._fallbackTranslator;
        local v40, v41;
        if l__fallbackTranslator_0 then
            local l_status_1, l_result_1 = pcall(function()
                return l__fallbackTranslator_0:FormatByKey(v32);
            end);
            v40 = l_status_1;
            v41 = l_result_1;
        else
            v40 = false;
            v41 = nil;
        end;
        v37 = v40;
        v38 = v41;
        if v37 then
            return v38;
        end;
    else
        local l__mainTranslator_0 = v27._mainTranslator;
        local v45, v46;
        if l__mainTranslator_0 then
            local l_l__mainTranslator_0_0 = l__mainTranslator_0 --[[ copy: 11 -> 14 ]];
            local l_status_2, l_result_2 = pcall(function()
                return l_l__mainTranslator_0_0:FormatByKey(v32);
            end);
            v45 = l_status_2;
            v46 = l_result_2;
        else
            v45 = false;
            v46 = nil;
        end;
        v37 = v45;
        v38 = v46;
        if not v37 then
            l__mainTranslator_0 = v27._fallbackTranslator;
            if l__mainTranslator_0 then
                local l_status_3, l_result_3 = pcall(function()
                    return l__mainTranslator_0:FormatByKey(v32);
                end);
                v45 = l_status_3;
                v46 = l_result_3;
            else
                v45 = false;
                v46 = nil;
            end;
            v37 = v45;
            v38 = v46;
            if v37 then
                return v38;
            end;
        else
            return v38;
        end;
    end;
    if not game:GetEngineFeature("RefactorTranslatorInstance") then
        if not (not v37 or string.find(v38, "LocalizationTable or parent tables do not contain a translation")) then
            warn(v38, debug.traceback());
        end;
    elseif not (not v37 or string.find(v38, "Key .* not found for locale")) then
        warn(v38, debug.traceback());
        return v32;
    end;
    return v32;
end;
v12._onUserInteracted = function(v52)
    v52._userHasInteracted = true;
    v52._userInteractionSignal:Fire();
end;
v12.registerButton = function(v53, v54)
    local v55 = v1.new();
    v53._buttonConnections[v54] = {
        v54.Click:Connect(function()
            v53:_onUserInteracted();
            v55:Fire();
        end), 
        v55
    };
    return v55;
end;
v12.registerWidget = function(v56, v57)
    local v58 = v1.new();
    v56._widgetConnections[v57] = {
        v57:GetPropertyChangedSignal("Enabled"):Connect(function()
            if v57.Enabled then
                v56:_onUserInteracted();
            end;
            v58:Fire();
        end), 
        v58
    };
    if v57.Enabled then
        v56:_onUserInteracted();
    end;
    return v58;
end;
v12.registerSignal = function(v59, v60)
    local v61 = v1.new();
    v59._connectedSignals[v60] = {
        v60:Connect(function(...)
            v59:_onUserInteracted();
            v61:Fire(...);
        end), 
        v61
    };
    return v61;
end;
v12.waitForUserInteraction = function(v62)
    if not v62._userHasInteracted then
        v62._userInteractionConnection = v62._userInteractionSignal.Event:Wait();
    end;
    return not v62._destroyed;
end;
return v12;
