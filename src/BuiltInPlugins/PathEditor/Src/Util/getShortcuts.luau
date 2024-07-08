local v0 = game:DefineFastFlag("PathEditorSelectModeShortcutChangeToV", false);
return function()
    return {
        Move = not v0 and "s" or "v", 
        AddPoint = "p", 
        AddTangent = "t", 
        Done = "return", 
        DeletePoint = "delete", 
        DeletePoint2 = "backspace"
    };
end;
