local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("StreamingService");
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Cache.StreamCache);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIDropdownGenerationIndicator);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIStreamableCommands);
return function(v9)
    local l_requestId_0 = v9.requestId;
    local l_arguments_0 = v9.arguments;
    local l_streamId_0 = l_arguments_0.text.streamId;
    if not (not v1.RunningEval or l_streamId_0) and type(l_arguments_0.text) == "string" then
        print((("<< DisplayText got collapsed stream >> \n%*\n<< /DisplayText >>"):format(l_arguments_0.text)));
        return ;
    else
        v6.requestStreamSubscription(l_requestId_0, l_streamId_0, true, function(v13)
            if not v13.isFinal then
                local _ = nil;
                v3:InvokeCommand(l_requestId_0, "QueueRichText", if not v8() then {
                    requestId = l_requestId_0, 
                    arguments = {
                        "StreamText", 
                        v4.Dictionary.join({
                            requestId = l_requestId_0, 
                            streamId = l_streamId_0
                        }, v13)
                    }
                } else {
                    requestId = l_requestId_0, 
                    arguments = {
                        v13.command, 
                        v13.command == "DisplayContent" and "StreamText" or nil, 
                        v4.Dictionary.join({
                            requestId = l_requestId_0, 
                            streamId = l_streamId_0
                        }, v13)
                    }
                });
                return ;
            else
                return ;
            end;
        end, function(v15)
            v2:DisplayContent("MessageBubble", {
                requestId = v15, 
                streamId = l_streamId_0
            });
        end, function()
            if v7() then
                local _ = nil;
                v3:InvokeCommand(l_requestId_0, "QueueRichText", if not v8() then {
                    requestId = l_requestId_0, 
                    arguments = {
                        "StreamEnded", 
                        {
                            requestId = l_requestId_0, 
                            streamId = l_streamId_0
                        }
                    }
                } else {
                    requestId = l_requestId_0, 
                    arguments = {
                        "DisplayContent", 
                        "StreamEnded", 
                        {
                            requestId = l_requestId_0, 
                            streamId = l_streamId_0
                        }
                    }
                });
            end;
        end);
        return ;
    end;
end;
