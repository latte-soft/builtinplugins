local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetTopTrackIndex);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.AnimationData);
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.deepCopy);
local _ = require(l_Util_0.TrackUtils);
return function(v7)
    return function(v8)
        v7 = math.clamp(v7, 1, (math.max(1, #v8:getState().Status.Tracks)));
        v8:dispatch(v1(v7));
    end;
end;
