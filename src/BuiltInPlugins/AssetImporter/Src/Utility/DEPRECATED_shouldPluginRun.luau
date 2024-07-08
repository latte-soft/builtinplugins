return function()
    if not require(script.Parent.Parent.Parent.Src.Utility.DebugFlags).RunningUnderCLI() then
        return true;
    else
        return false;
    end;
end;
