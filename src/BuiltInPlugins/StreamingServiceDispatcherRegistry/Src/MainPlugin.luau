local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = require(l_script_FirstAncestor_0.Src.Commands.CommandRegistry);
local v3 = require(l_script_FirstAncestor_0.Src.Listeners.StreamingServiceListener);
local v4 = require(l_script_FirstAncestor_0.Src.ContextCollectors.DefaultContextCollector);
local v5 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v6 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v7 = {};
v7.__index = v7;
v7.new = function()
    local v8 = {};
    setmetatable(v8, v7);
    return v8;
end;
v7.init = function(v9)
    local l_v2_0 = v2;
    local v11 = v1.GetService("StreamingService");
    if v11 then
        for v12, v13 in pairs(l_v2_0.parallel) do
            v11:RegisterCommand(v12, v13);
        end;
        for v14, v15 in pairs(l_v2_0.sequential) do
            v11:RegisterSequentialCommand(v14, v15);
        end;
        v9.streamingServiceListener = v3.new();
        v4.register();
    end;
    v1.GetService("ChatbotUIService"):DisplayContent("PluginConnected", {});
end;
v7.destroy = function(v16)
    local l_v2_1 = v2;
    local v18 = v1.GetService("StreamingService");
    for v19, _ in pairs(l_v2_1.parallel) do
        v18:UnregisterCommand(v19);
    end;
    for v21, _ in pairs(l_v2_1.sequential) do
        v18:UnregisterCommand(v21);
    end;
    if v16.streamingServiceListener then
        v16.streamingServiceListener:destroy();
        v16.streamingServiceListener = nil;
    end;
    v5.destroy();
    v6.destroy();
    v4.unregister();
end;
return v7;
