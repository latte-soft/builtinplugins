local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v3)
    local l_requestId_0 = v3.requestId;
    local l_arguments_0 = v3.arguments;
    local l_direct_instance_0 = l_arguments_0.direct_instance;
    local v7 = l_direct_instance_0 or v2.get(l_arguments_0.instanceId, l_requestId_0);
    if v7 then
        assert(v7, "Luau");
        if v7.Parent then
            if not l_direct_instance_0 then
                v2.StartRecordingActions(l_requestId_0);
            end;
            v7.Parent = nil;
            if not l_direct_instance_0 then
                v2.EndRecordingActions(l_requestId_0);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
