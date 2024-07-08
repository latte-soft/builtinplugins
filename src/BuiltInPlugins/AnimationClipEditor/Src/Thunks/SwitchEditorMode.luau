local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetEditorMode);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4)
    return function(v5)
        local v6 = v5:getState();
        local l_AnimationData_0 = v6.AnimationData;
        local l_EditorMode_0 = v6.Status.EditorMode;
        if l_EditorMode_0 ~= v3 then
            local l_EditorModeSwitchTime_0 = v6.Status.EditorModeSwitchTime;
            if l_EditorModeSwitchTime_0 then
                v4:report("onEditorModeSwitch", l_EditorMode_0, v3, os.time() - l_EditorModeSwitchTime_0, if not not l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
            end;
        end;
        v5:dispatch(v1(v3));
    end;
end;
