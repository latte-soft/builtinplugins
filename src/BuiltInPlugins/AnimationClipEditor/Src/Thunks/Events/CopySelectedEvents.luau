local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetClipboard);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v5)
    return function(v6)
        local l_AnimationData_0 = v6:getState().AnimationData;
        local l_SelectedEvents_0 = v6:getState().Status.SelectedEvents;
        if l_AnimationData_0 and l_SelectedEvents_0 then
            local l_Events_0 = l_AnimationData_0.Events;
            if l_Events_0 == nil then
                return ;
            else
                if not v1(l_SelectedEvents_0) then
                    local v10 = {};
                    for v11, _ in pairs(l_SelectedEvents_0) do
                        if not v5 or not next(v5) then
                            v10[v11] = v2(l_Events_0.Data[v11]);
                        else
                            v10[v11] = {};
                            for v13 in v5, nil, nil do
                                v10[v11][v13] = l_Events_0.Data[v11][v13];
                            end;
                        end;
                    end;
                    v6:dispatch(v3(v10, v4.CLIPBOARD_TYPE.Events));
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
end;
