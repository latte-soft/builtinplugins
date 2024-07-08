game:DefineFastString("ConvAICodeRunnerAutorunDisabledWarning", "Warning: the action was not executed: auto-run was disabled by user.\nPlease review the code and press the Play button to run it.");
return function()
    return game:GetFastString("ConvAICodeRunnerAutorunDisabledWarning");
end;
