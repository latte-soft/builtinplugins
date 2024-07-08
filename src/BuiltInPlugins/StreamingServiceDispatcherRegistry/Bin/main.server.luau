if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
    local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
    local v2 = pcall(function()
        game:GetService("StreamingService");
    end);
    local v3 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    if not require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixAssistantLuaTests)() then
        if not v2 then
            if not v1.RunningEval then
                v3.launch("StreamingServiceDispatcherRegistry", l_script_FirstAncestor_0.Src.Mocks);
                return ;
            end;
        else
            v3.launch("StreamingServiceDispatcherRegistry", l_script_FirstAncestor_0.Src);
        end;
    elseif not v1.RunningEval then
        v3.launch("StreamingServiceDispatcherRegistry", l_script_FirstAncestor_0.Src);
    end;
    if not v3.isCli() or v1.RunningEval then
        if require(l_script_FirstAncestor_0.Src.Flags.getFFlagAICOChatBot)() then
            local v4 = require(l_script_FirstAncestor_0.Src.MainPlugin);
            local v5 = nil;
            local function _()
                plugin.Name = l_script_FirstAncestor_0.Name;
                v5 = v4.new();
                v5:init();
            end;
            plugin.Unloading:Connect(function()
                if v5 then
                    v5:destroy();
                end;
            end);
            plugin.Name = l_script_FirstAncestor_0.Name;
            v5 = v4.new();
            v5:init();
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
