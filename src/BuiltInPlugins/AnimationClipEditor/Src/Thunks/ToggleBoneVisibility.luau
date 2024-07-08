local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetBoneVisualization);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
return function()
    return function(v4)
        local v5 = v4:getState();
        local v6 = not v5.Status.VisualizeBones;
        local l_AnimationData_0 = v5.AnimationData;
        local l_RootInstance_0 = v5.Status.RootInstance;
        local l_Active_0 = v5.Status.Active;
        if not (not l_AnimationData_0 or not l_RootInstance_0) and l_Active_0 then
            v4:dispatch(v1(v6));
            v3.updateMicrobones(l_RootInstance_0, v6);
            return ;
        else
            return ;
        end;
    end;
end;
