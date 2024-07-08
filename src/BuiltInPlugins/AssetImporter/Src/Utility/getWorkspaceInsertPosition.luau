return function()
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
    local v3 = game.Workspace:Raycast(l_Position_0, l_LookVector_0 * 2048);
    if v3 == nil then
        return l_LookVector_0 * 2048;
    else
        return v3.Position;
    end;
end;
