local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
return function(v4)
    return function(v5)
        local l_AnimationData_0 = v5:getState().AnimationData;
        if l_AnimationData_0 then
            local v7 = v1(l_AnimationData_0);
            v2.setLooping(v7, not v7.Metadata.Looping);
            v5:dispatch(v3(v7));
            v4:report("onControlPressed", "ToggleLooping");
            return ;
        else
            return ;
        end;
    end;
end;
