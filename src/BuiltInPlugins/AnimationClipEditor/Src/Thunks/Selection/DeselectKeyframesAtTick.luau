local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframe);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
return function(v3, v4)
    return function(v5)
        local l_AnimationData_0 = v5:getState().AnimationData;
        if l_AnimationData_0 then
            if not v4 then
                v5:dispatch(v2({}));
            end;
            for v7, v8 in pairs(l_AnimationData_0.Instances) do
                for v9, _ in pairs(v8.Tracks) do
                    v5:dispatch(v1(v7, {
                        v9
                    }, v3));
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
