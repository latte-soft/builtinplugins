local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
return function(v3)
    return function(v4)
        local l_AnimationData_0 = v4:getState().AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Metadata then
            v4:dispatch(v2((v1.Dictionary.join(l_AnimationData_0, {
                Metadata = v1.Dictionary.join(l_AnimationData_0.Metadata, v3)
            }))));
            return ;
        else
            return ;
        end;
    end;
end;
