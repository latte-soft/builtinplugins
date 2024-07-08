local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("StreamingService");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v5)
    local l_requestId_0 = v5.requestId;
    local l_arguments_0 = v5.arguments;
    local l_direct_instance_0 = l_arguments_0.direct_instance;
    local v9 = l_direct_instance_0 or v4.get(l_arguments_0.sourceInstanceId, l_requestId_0);
    if v9 then
        assert(v9, "Luau");
        if not l_direct_instance_0 then
            v4.StartRecordingActions(l_requestId_0);
        end;
        local v10 = v9:Clone();
        if v10 then
            if l_arguments_0.newInstanceId then
                v4.set(l_arguments_0.newInstanceId, v10);
            end;
            l_arguments_0.direct_instance = v10;
            v1:ExecuteCommandAsync(l_requestId_0, "SetProperty", v5);
            v10.Parent = v2.getRequestParent(v10, l_requestId_0);
            if not l_direct_instance_0 then
                v4.EndRecordingActions(l_requestId_0);
            end;
            v2.modifyChatWithInstanceLink(l_requestId_0, v10, "copied", l_arguments_0.chatGroup or l_arguments_0.newInstanceId);
            return ;
        else
            if not l_direct_instance_0 then
                v4.EndRecordingActions(l_requestId_0);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
