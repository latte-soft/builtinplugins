return function()
    if not require(script.Parent.DebugFlags).RunningUnderCLI() then
        return true;
    else
        return false;
    end;
end;
