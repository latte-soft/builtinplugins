local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
return v3.createReducer({
    currentSoundId = 0, 
    elapsedTime = 0, 
    isPlaying = false, 
    isLoading = false, 
    totalTime = 0
}, {
    [require(l_Parent_0.Core.Actions.PlayPreviewSound).name] = function(v5, v6)
        if not (not (v5.currentSoundId == v6.currentSoundId) or not v4.shouldDebugWarnings()) then
            warn("Trying to play the same sound instead of resuming it. Current SoundId : ", v6.currentSoundId);
        end;
        return v2.Dictionary.join(v5, {
            currentSoundId = v6.currentSoundId, 
            isPlaying = true
        });
    end, 
    [require(l_Parent_0.Core.Actions.PausePreviewSound).name] = function(v7, _)
        if not (v7.isPlaying or not v4.shouldDebugWarnings()) then
            warn(("Trying to pause a sound that is not playing %d"):format(v7.currentSoundId));
        end;
        return v2.Dictionary.join(v7, {
            isPlaying = false
        });
    end, 
    [require(l_Parent_0.Core.Actions.StopPreviewSound).name] = function(v9, _)
        if not (v9.isPlaying or not v4.shouldDebugWarnings()) then
            warn(("Trying to stop a sound that is not playing %d"):format(v9.currentSoundId));
        end;
        return v2.Dictionary.join(v9, {
            currentSoundId = 0, 
            elapsedTime = 0, 
            isPlaying = false
        });
    end, 
    [require(l_Parent_0.Core.Actions.ResumePreviewSound).name] = function(v11, _)
        if not (not v11.isPlaying or not v4.shouldDebugWarnings()) then
            warn(("Trying to resume a sound which is playing %d"):format(v11.currentSoundId));
        end;
        return v2.Dictionary.join(v11, {
            isPlaying = true
        });
    end, 
    [require(l_Parent_0.Core.Actions.StopAllSounds).name] = function(v13, _)
        return v2.Dictionary.join(v13, {
            currentSoundId = 0, 
            isPlaying = false
        });
    end, 
    [require(l_Parent_0.Core.Actions.SetSoundLoading).name] = function(v15, v16)
        return v2.Dictionary.join(v15, {
            isLoading = v16.isLoading
        });
    end, 
    [require(l_Parent_0.Core.Actions.SetSoundElapsedTime).name] = function(v17, v18)
        return v2.Dictionary.join(v17, {
            elapsedTime = v18.elapsedTime
        });
    end, 
    [require(l_Parent_0.Core.Actions.SetSoundTotalTime).name] = function(v19, v20)
        return v2.Dictionary.join(v19, {
            elapsedTime = 0, 
            totalTime = v20.totalTime
        });
    end
});
