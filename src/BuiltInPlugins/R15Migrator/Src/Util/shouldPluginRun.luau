return function()
    if not require(script.Parent.DebugFlags).RunningUnderCLI() then
        if game:GetFastFlag("DebugR15MigratorPlugin") then
            return true;
        else
            return ;
        end;
    else
        return false;
    end;
end;
