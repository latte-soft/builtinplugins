local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframe);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframeRange);
return function(v4, v5)
    return function(v6)
        local l_AnimationData_0 = v6:getState().AnimationData;
        if l_AnimationData_0 then
            if not v5 then
                v6:dispatch(v2({}));
            end;
            for v8, v9 in pairs(l_AnimationData_0.Instances) do
                for v10, _ in pairs(v9.Tracks) do
                    v6:dispatch(v3(v8, {
                        v10
                    }, v4, v4, true));
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
