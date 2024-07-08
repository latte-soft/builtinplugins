local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    Playhead = 0, 
    SliderPlayhead = -1, 
    IsPlaying = false, 
    TrackLengh = 0
}, {
    SetPlayhead = function(v3, v4)
        return v2.Dictionary.join(v3, {
            Playhead = v4.playhead
        });
    end, 
    SetSliderPlayhead = function(v5, v6)
        return v2.Dictionary.join(v5, {
            SliderPlayhead = v6.sliderPlayhead
        });
    end, 
    SetIsPlaying = function(v7, v8)
        return v2.Dictionary.join(v7, {
            IsPlaying = v8.isPlaying
        });
    end, 
    SetTrackLength = function(v9, v10)
        return v2.Dictionary.join(v9, {
            TrackLength = v10.trackLength
        });
    end
});
