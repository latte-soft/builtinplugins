local l_RunningUnderCLI_0 = require(script.Parent.DebugFlags).RunningUnderCLI;
local v1 = nil;
local v2 = nil;
if not l_RunningUnderCLI_0 then
    v1 = settings().Studio["Show Core GUI in Explorer while Playing"];
    v2 = settings().Studio.PluginDebuggingEnabled;
else
    v1 = true;
    v2 = true;
end;
return function(v3)
    local v4 = nil;
    local v5 = 0;
    local v6 = string.split(v3, ":");
    v5 = tonumber(string.split(v6[2], " ")[1]);
    local v7 = string.split(v6[1], ".");
    local v8 = string.lower(v7[1]);
    if v8:find("builtin") then
        local v9 = v7[1] .. ".rbxm";
        if game:GetService("PluginDebugService"):FindFirstChild(v9) then
            table.insert(v7, 1, "PluginDebugService");
            v8 = string.lower(v7[1]);
        else
            warn(("Traceback unavailable: %s is not in PluginDebugService"):format(v9));
            return nil, nil;
        end;
    end;
    if v8:find("plugindebugservice") then
        if v7[3] == "rbxm" then
            v7[2] = v7[2] .. ".rbxm";
            table.remove(v7, 3);
        end;
        if not v2 then
            warn(("Traceback unavailable: %s is disabled."):format(v8));
        end;
    end;
    if not (not v8:find("coregui") or v1) then
        warn(("Traceback unavailable: %s is disabled."):format(v8));
    end;
    v4 = game:GetService(v7[1]);
    if v4 then
        for v10 = 2, #v7 do
            v4 = v4:FindFirstChild(v7[v10], true);
        end;
        return v4, v5;
    else
        warn(("Unable to find traceback. Does the path %s exist in the explorer?"):format(v3));
        return nil, nil;
    end;
end;
