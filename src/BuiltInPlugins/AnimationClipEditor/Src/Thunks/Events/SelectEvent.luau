local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
return function(v3, v4)
    return function(v5)
        local l_AnimationData_0 = v5:getState().AnimationData;
        local l_SelectedEvents_0 = v5:getState().Status.SelectedEvents;
        if l_AnimationData_0 and l_SelectedEvents_0 then
            local l_Events_0 = l_AnimationData_0.Events;
            if l_Events_0 == nil then
                return ;
            else
                if not (not l_Events_0.Data or not l_Events_0.Data[v3]) then
                    if not v4 then
                        v5:dispatch(v2({
                            [v3] = true
                        }));
                    else
                        v5:dispatch(v2(v1.Dictionary.join(l_SelectedEvents_0, {
                            [v3] = true
                        })));
                        return ;
                    end;
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
end;
