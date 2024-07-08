local l_RunService_0 = game:GetService("RunService");
return function()
    return l_RunService_0:IsEdit() and not l_RunService_0:IsServer();
end;
