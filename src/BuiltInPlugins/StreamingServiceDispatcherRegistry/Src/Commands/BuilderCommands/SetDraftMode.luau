local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v4)
    local l_arguments_0 = v4.arguments;
    local v6 = true;
    if l_arguments_0.enabled ~= 1 then
        v6 = l_arguments_0.enabled == true;
    end;
    if not v6 then
        v3.activeDraftGuids = nil;
        v1.disableDraftMode(v4.requestId);
        return ;
    else
        v3.activeDraftGuids = {};
        v1.enableDraftMode(v4.requestId);
        return ;
    end;
end;
