local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetHorizontalScrollZoom);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetEditingLength);
return function(v4)
    return function(v5)
        local l_AnimationData_0 = v5:getState().AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Metadata then
            v4 = math.max(v4, l_AnimationData_0.Metadata.EndTick, v1.TICK_FREQUENCY);
            v5:dispatch(v3(v4));
            v5:dispatch(v2(0, 0));
            return ;
        else
            return ;
        end;
    end;
end;
