local l_RunService_0 = game:GetService("RunService");
return function()
    if not require(script.Parent.DebugFlags).RunningUnderCLI() then
        if not l_RunService_0:IsRunning() then
            if game:GetEngineFeature("EnablePathEditor") then
                if game:GetFastFlag("Path2DControlPointAtomicClass4") then
                    return true;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
