local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
return function(v3)
    return function(v4)
        v4:dispatch(v2(not not v3 and v1.PLAY_STATE.Record or v1.PLAY_STATE.Pause));
    end;
end;
