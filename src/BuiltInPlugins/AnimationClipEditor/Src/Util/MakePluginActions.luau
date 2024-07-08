local _ = script:FindFirstAncestor("AnimationClipEditor");
local v1 = {
    "CopySelected", 
    "CutSelected", 
    "DeleteSelected", 
    "ResetSelected", 
    "AddKeyframeHere", 
    "AddResetKeyframe", 
    "AddKeyframeAtScrubber", 
    "PasteKeyframes", 
    "SelectAll", 
    "DeselectAll", 
    "RenameKeyframe", 
    "ChangeDuration", 
    "CopyEvents", 
    "CutEvents", 
    "EditEvents", 
    "AddEvent", 
    "DeleteEvents", 
    "PasteEvents", 
    "DeleteTrack", 
    "ClearTrack", 
    "AddKeyframe", 
    "ConvertToEulerAngles", 
    "Undo", 
    "Redo", 
    "DisableIK", 
    "TogglePlay", 
    "ToggleTool", 
    "ToggleBoneVis", 
    "ClearBothTangents", 
    "ZeroBothTangents", 
    "ClearTangent", 
    "ZeroTangent", 
    "ResizeCanvas"
};
table.insert(v1, "FocusCamera");
local _ = function(_, v3, v4)
    return {
        id = v4, 
        text = v3:getText("ContextMenu", v4), 
        allowBinding = false
    };
end;
return function(_, v7)
    local v8 = {};
    for _, v10 in ipairs(v1) do
        v8[v10] = {
            id = v10, 
            text = v7:getText("ContextMenu", v10), 
            allowBinding = false
        };
    end;
    v8.CopySelected.defaultShortcut = "Ctrl+C";
    v8.CutSelected.defaultShortcut = "Ctrl+X";
    v8.DeleteSelected.defaultShortcut = "Delete";
    v8.PasteKeyframes.defaultShortcut = "Ctrl+V";
    v8.AddKeyframeAtScrubber.defaultShortcut = "K";
    v8.CopyEvents.defaultShortcut = "Ctrl+C";
    v8.CutEvents.defaultShortcut = "Ctrl+X";
    v8.DeleteEvents.defaultShortcut = "Delete";
    v8.PasteEvents.defaultShortcut = "Ctrl+V";
    v8.Undo.defaultShortcut = "Ctrl+Z";
    v8.Redo.defaultShortcut = "Ctrl+Y";
    v8.SelectAll.defaultShortcut = "Ctrl+Shift+A";
    v8.DeselectAll.defaultShortcut = "Ctrl+Shift+A";
    v8.TogglePlay.defaultShortcut = " ";
    v8.ToggleTool.defaultShortcut = "R";
    v8.ToggleBoneVis.defaultShortcut = "V";
    v8.FocusCamera.defaultShortcut = "F";
    v8.ResizeCanvas.defaultShortcut = "H";
    return v8;
end;
