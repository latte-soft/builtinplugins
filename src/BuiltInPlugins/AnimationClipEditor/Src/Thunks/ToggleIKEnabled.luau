local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetIKEnabled);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetIKOpenedTimestamp);
return function(v3)
    return function(v4)
        local v5 = v4:getState();
        local l_AnimationData_0 = v5.AnimationData;
        if v5.Status.RootInstance then
            local v7 = not v5.Status.IKEnabled;
            v4:dispatch(v1(v7));
            local v8 = if not not l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil;
            if not v7 then
                v3:report("onIkDisabled", os.time() - v5.Status.IKOpenedTimestamp, v8);
                return ;
            else
                v3:report("onIkEnabled", v8);
                v4:dispatch(v2(os.time()));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
