local l_Workspace_0 = game:GetService("Workspace");
return function()
    local l_LookVector_0 = l_Workspace_0.CurrentCamera.CFrame.LookVector;
    return Vector3.new(math.round(l_LookVector_0.X), math.round(l_LookVector_0.Y), (math.round(l_LookVector_0.Z))).Unit;
end;
