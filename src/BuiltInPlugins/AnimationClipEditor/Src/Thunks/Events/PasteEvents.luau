local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v3 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v6)
    return function(v7)
        local l_AnimationData_0 = v7:getState().AnimationData;
        local l_Clipboard_0 = v7:getState().Status.Clipboard;
        if l_AnimationData_0 and l_Clipboard_0 then
            local v10 = v3(l_AnimationData_0);
            local l_Events_0 = v10.Events;
            if l_Events_0 == nil then
                return ;
            else
                local v12 = v1.Dictionary.keys(l_Clipboard_0);
                table.sort(v12);
                local v13 = v12[1];
                if not v2(l_Clipboard_0) then
                    for v14, v15 in pairs(l_Clipboard_0) do
                        local v16 = v6 + (v14 - v13);
                        v4.deleteEvents(l_Events_0, v16);
                        for v17, v18 in pairs(v15) do
                            v4.addEvent(l_Events_0, v16, v17, v18);
                        end;
                    end;
                    v7:dispatch(v5(v10));
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
end;
