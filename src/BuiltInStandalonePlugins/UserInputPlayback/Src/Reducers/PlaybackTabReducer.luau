local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetShouldSetEmulationDevice);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDurationSec);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingNumEvents);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingResolution);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDeviceId);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDeviceOrientation);
return v1.createReducer({
    selectedRecordingIndex = 1, 
    playbackFileNameOptions = {}, 
    currentPlaybackRecordingDataValid = false, 
    currentRecordingDurationSec = 0, 
    currentRecordingNumEvents = 0, 
    currentRecordingResolution = Vector2.new(), 
    currentRecordingDeviceId = "Unknown", 
    currentRecordingDeviceOrientation = "Unknown", 
    shouldSetEmulationDevice = true
}, {
    SetCurrentRecordingDurationSec = function(v9, v10)
        return l_join_0(v9, {
            currentRecordingDurationSec = v10.currentRecordingDurationSec
        });
    end, 
    SetCurrentRecordingNumEvents = function(v11, v12)
        return l_join_0(v11, {
            currentRecordingNumEvents = v12.currentRecordingNumEvents
        });
    end, 
    SetCurrentRecordingResolution = function(v13, v14)
        return l_join_0(v13, {
            currentRecordingResolution = v14.currentRecordingResolution
        });
    end, 
    SetCurrentRecordingDeviceId = function(v15, v16)
        return l_join_0(v15, {
            currentRecordingDeviceId = v16.currentRecordingDeviceId
        });
    end, 
    SetCurrentRecordingDeviceOrientation = function(v17, v18)
        return l_join_0(v17, {
            currentRecordingDeviceOrientation = v18.currentRecordingDeviceOrientation
        });
    end, 
    SetShouldSetEmulationDevice = function(v19, v20)
        return l_join_0(v19, {
            shouldSetEmulationDevice = v20.shouldSetEmulationDevice
        });
    end
});
