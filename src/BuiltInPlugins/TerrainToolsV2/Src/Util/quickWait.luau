local l_RenderStepped_0 = game:GetService("RunService").RenderStepped;
local l_Heartbeat_0 = game:GetService("RunService").Heartbeat;
local l_TerrainEditorFixQuickWait_0 = game:GetFastFlag("TerrainEditorFixQuickWait");
local function v3(v4)
    if not v4 or v4 == 0 then
        if not l_TerrainEditorFixQuickWait_0 then
            l_RenderStepped_0:wait();
            return ;
        else
            l_Heartbeat_0:wait();
            return ;
        end;
    else
        if v4 < 0.033333 then
            local v5 = tick();
            if not l_TerrainEditorFixQuickWait_0 then
                l_RenderStepped_0:wait();
            else
                l_Heartbeat_0:wait();
            end;
            local v6 = tick() - v5;
            if v6 <= v4 * 0.5 then
                v3(v4 - v6);
                return ;
            end;
        else
            wait(v4);
        end;
        return ;
    end;
end;
return v3;
