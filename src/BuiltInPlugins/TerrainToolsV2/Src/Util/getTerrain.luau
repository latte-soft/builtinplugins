local v0 = require(script.Parent.Parent.Parent.Src.Util.DebugFlags);
local l_Workspace_0 = game:GetService("Workspace");
local v2 = nil;
local function _()
    v2 = nil;
    local l_Terrain_0 = l_Workspace_0.Terrain;
    if not (l_Terrain_0 and l_Terrain_0:IsA("Terrain")) then
        l_Workspace_0:GetPropertyChangedSignal("Terrain"):Wait();
        l_Terrain_0 = l_Workspace_0.Terrain;
    end;
    v2 = l_Terrain_0;
end;
return function()
    assert(not v0.RunningUnderCLI(), "getTerrain() is disabled under CLI where Workspace.Terrain does not exist");
    if not v2 then
        v2 = nil;
        local l_Terrain_1 = l_Workspace_0.Terrain;
        if not (l_Terrain_1 and l_Terrain_1:IsA("Terrain")) then
            l_Workspace_0:GetPropertyChangedSignal("Terrain"):Wait();
            l_Terrain_1 = l_Workspace_0.Terrain;
        end;
        v2 = l_Terrain_1;
    end;
    return v2;
end;
