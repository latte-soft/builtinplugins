local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("StreamingService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIStreamableCommands);
return function(v6)
    if not v5() then
        v2:DisplayContent(unpack(v6.arguments));
        return ;
    else
        local v7, v8, v9 = unpack(v6.arguments);
        if v7 == "DisplayContent" then
            v2:DisplayContent(v8, v9);
            return ;
        else
            v3:ExecuteCommandAsync(v6.requestId, v7, v9);
            return ;
        end;
    end;
end;
