return function()
    if not require(script.Parent.DebugFlags).RunningUnderCLI() then
        if game:GetFastFlag("EnableTagEditorPlugin7") then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
