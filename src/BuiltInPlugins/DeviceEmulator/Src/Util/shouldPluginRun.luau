return function()
    if not require(script.Parent.DebugFlags).RunningUnderCLI() then
        if require(script.Parent.hasInternalPermission)() then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
