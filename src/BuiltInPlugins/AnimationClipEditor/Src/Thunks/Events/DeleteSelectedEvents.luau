local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v5)
    return function(v6)
        local l_AnimationData_0 = v6:getState().AnimationData;
        local l_SelectedEvents_0 = v6:getState().Status.SelectedEvents;
        if l_AnimationData_0 then
            local v9 = v1(l_AnimationData_0);
            local l_Events_0 = v9.Events;
            if l_Events_0 == nil then
                return ;
            else
                for v11, _ in pairs(l_SelectedEvents_0) do
                    if not v5 or not next(v5) then
                        v2.deleteEvents(l_Events_0, v11);
                    else
                        for v13 in v5, nil, nil do
                            v2.removeEvent(l_Events_0, v11, v13);
                        end;
                    end;
                end;
                v6:dispatch(v3({}));
                v6:dispatch(v4(v9));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
