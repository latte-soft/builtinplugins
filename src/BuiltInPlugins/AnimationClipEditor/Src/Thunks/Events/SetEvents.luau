local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v3, v4)
    return function(v5)
        local v6 = v5:getState();
        local l_AnimationData_0 = v6.AnimationData;
        local l_EditorMode_0 = v6.Status.EditorMode;
        if l_AnimationData_0 then
            local v9 = v1(l_AnimationData_0);
            v9.Events = v3;
            v5:dispatch(v2(v9));
            local l_Data_0 = l_AnimationData_0.Events.Data;
            for v11, v12 in pairs(v3.Data) do
                for v13, v14 in pairs(v12) do
                    if not (l_Data_0[v11] ~= nil) or l_Data_0[v11][v13] == nil then
                        v4:report("onAddEvent", v13, v14, l_EditorMode_0, if not v9.Metadata then nil else v9.Metadata.Guid);
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
