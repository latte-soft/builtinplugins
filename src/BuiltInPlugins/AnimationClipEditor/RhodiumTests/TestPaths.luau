local _ = script:FindFirstAncestor("AnimationClipEditor");
local v7 = {
    waitForDescendant = function(v1, v2)
        local l_v1_0 = v1;
        assert(l_v1_0, "waitForDescendant: instance cannot be nil.");
        for _, v5 in ipairs(v2) do
            local v6 = l_v1_0:WaitForChild(v5, 2);
            assert(v6, v5 .. " was not found under parent " .. l_v1_0:GetFullName() .. ".");
            l_v1_0 = v6;
        end;
        return l_v1_0;
    end
};
v7.getEditorController = function(v8)
    return v7.waitForDescendant(v8, {
        "AnimationClipEditor", 
        "EditorController"
    });
end;
v7.getDopeSheetController = function(v9)
    return v7.waitForDescendant(v7.getEditorController(v9), {
        "TrackEditor", 
        "DopeSheetController"
    });
end;
v7.getDopeSheet = function(v10)
    return v7.waitForDescendant(v7.getDopeSheetController(v10), {
        "DopeSheetContainer", 
        "DopeSheet"
    });
end;
v7.getTrack = function(v11, v12)
    return v7.waitForDescendant(v7.getDopeSheet(v11), {
        v12, 
        "KeyframeDisplayArea"
    });
end;
v7.getTrackList = function(v13)
    return v7.waitForDescendant(v7.getEditorController(v13), {
        "TrackListAndControlContainer", 
        "EventsAndTracks", 
        "TrackListAndScrollBar", 
        "TrackList", 
        "Canvas"
    });
end;
v7.getAnimationControlPanel = function(v14)
    return v7.waitForDescendant(v7.getEditorController(v14), {
        "TrackListAndControlContainer", 
        "AnimationControlPanel"
    });
end;
v7.getMediaControls = function(v15)
    return v7.waitForDescendant(v7.getAnimationControlPanel(v15), {
        "MediaControls"
    });
end;
v7.getMediaControlButton = function(v16, v17)
    return v7.waitForDescendant(v7.getMediaControls(v16), {
        v17, 
        "Button", 
        "Contents", 
        "TextButton"
    });
end;
v7.getTimeDisplay = function(v18)
    return v7.waitForDescendant(v7.getAnimationControlPanel(v18), {
        "TimeDisplay"
    });
end;
v7.getIKButton = function(v19)
    return v7.waitForDescendant(v7.getTrackList(v19), {
        "SummaryTrack", 
        "LeftButtonsListContainer", 
        "IKController", 
        "IKButton"
    });
end;
v7.getIKWindow = function(v20)
    return v7.waitForDescendant(v20, {
        "Container"
    });
end;
v7.getIKEnableButton = function(v21)
    return v7.waitForDescendant(v7.getIKWindow(v21), {
        "BottomFrame", 
        "EnableIKButton"
    });
end;
v7.getIKTreeView = function(v22)
    return v7.waitForDescendant(v7.getIKWindow(v22), {
        "TreeView", 
        "TreeView"
    });
end;
v7.getTreeViewJoint = function(v23, v24)
    return v7.waitForDescendant(v7.getIKTreeView(v23), {
        "Contents", 
        "List", 
        v24
    });
end;
v7.getTreeViewJointPin = function(v25, v26)
    return v7.waitForDescendant(v7.getTreeViewJoint(v25, v26), {
        "Pin"
    });
end;
v7.getEventsTitleTrack = function(v27)
    return v7.waitForDescendant(v7.getEditorController(v27), {
        "TrackListAndControlContainer", 
        "EventsAndTracks", 
        "EventsTitle"
    });
end;
v7.getEventsTrack = function(v28)
    return v7.waitForDescendant(v7.getDopeSheetController(v28), {
        "Events", 
        "Track", 
        "Markers", 
        "KeyframeDisplayArea"
    });
end;
v7.getEventsDialogContents = function(v29)
    return v7.waitForDescendant(v29, {
        "SolidBackground", 
        "Contents", 
        "Container"
    });
end;
v7.getEventEntry = function(v30, v31)
    return v7.waitForDescendant(v7.getEventsDialogContents(v30), {
        "Event_" .. v31
    });
end;
v7.getAddEventEntry = function(v32)
    return v7.waitForDescendant(v7.getEventsDialogContents(v32), {
        "AddNew", 
        "AddEventEntry"
    });
end;
v7.getStyledDialogContents = function(v33)
    return v7.waitForDescendant(v33, {
        "SolidBackground", 
        "Contents"
    });
end;
v7.getKFRKeyframesText = function(v34)
    return v7.waitForDescendant(v7.getStyledDialogContents(v34), {
        "KeyframePane", 
        "KeyframesText"
    });
end;
v7.getKFRSlider = function(v35)
    return v7.waitForDescendant(v7.getStyledDialogContents(v35), {
        "Slider"
    });
end;
v7.getKFRCancel = function(v36)
    return v7.waitForDescendant(v36, {
        "SolidBackground", 
        "ButtonContainer"
    })[1];
end;
v7.getKFROk = function(v37)
    return v7.waitForDescendant(v37, {
        "SolidBackground", 
        "ButtonContainer"
    })[2];
end;
v7.getCurveEditorController = function(v38)
    return v7.waitForDescendant(v7.getEditorController(v38), {
        "TrackEditor", 
        "CurveEditorController"
    });
end;
v7.getCurveCanvas = function(v39)
    return v7.waitForDescendant(v7.getCurveEditorController(v39), {
        "CanvasContainer", 
        "CurveCanvas"
    });
end;
return v7;
