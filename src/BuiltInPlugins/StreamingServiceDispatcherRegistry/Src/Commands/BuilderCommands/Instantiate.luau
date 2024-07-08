local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ConversationalAIAcceptanceService");
local v4 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v7)
    local l_arguments_0 = v7.arguments;
    v6.StartRecordingActions(v7.requestId);
    local v9 = Instance.new(l_arguments_0.className);
    if l_arguments_0.newInstanceId then
        v6.set(l_arguments_0.newInstanceId, v9);
    end;
    l_arguments_0.direct_instance = v9;
    v2:ExecuteCommandAsync(v7.requestId, "SetProperty", v7);
    v9.Parent = v4.getRequestParent(v9, v7.requestId);
    v6.EndRecordingActions(v7.requestId);
    v3:InstanceInserted(v7.requestId);
    v4.modifyChatWithInstanceLink(v7.requestId, v9, "created", l_arguments_0.chatGroup or l_arguments_0.newInstanceId);
end;
