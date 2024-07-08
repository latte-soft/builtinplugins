local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v4, v5, v6)
    return function(v7)
        local l_AnimationData_0 = v7:getState().AnimationData;
        if l_AnimationData_0 then
            local v9 = v1(l_AnimationData_0);
            v2.setKeyframeName(v9, v4, v5);
            v7:dispatch(v3(v9));
            v6:report("onRenameKeyframe", v5, if not v9.Metadata then nil else v9.Metadata.Guid);
            return ;
        else
            return ;
        end;
    end;
end;
