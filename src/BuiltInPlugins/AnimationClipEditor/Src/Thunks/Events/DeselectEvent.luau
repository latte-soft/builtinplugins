local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
return function(v3)
    return function(v4)
        local l_AnimationData_0 = v4:getState().AnimationData;
        local l_SelectedEvents_0 = v4:getState().Status.SelectedEvents;
        if l_AnimationData_0 and l_SelectedEvents_0 then
            local l_Events_0 = l_AnimationData_0.Events;
            if l_Events_0 == nil then
                return ;
            else
                if not (not l_Events_0.Data or not l_Events_0.Data[v3]) then
                    v4:dispatch(v2(v1.Dictionary.join(l_SelectedEvents_0, {
                        [v3] = v1.None
                    })));
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
end;
