local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Packages.Framework).Dash.copy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetHistoryOffset);
local l_Reducers_0 = l_script_FirstAncestor_0.Src.Reducers;
local _ = require(l_Reducers_0.DebugData);
local _ = require(l_Reducers_0.Status);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v7)
    return function(v8)
        local v9 = v8:getState();
        local l_DebugData_0 = v9.DebugData;
        local l_Status_0 = v9.Status;
        local l_FrameBuffer_0 = l_DebugData_0.FrameBuffer;
        local l_DebugPoseEvent_0 = l_Status_0.DebugPoseEvent;
        local l_SelectedLayer_0 = l_Status_0.SelectedLayer;
        local v15 = l_FrameBuffer_0 and l_FrameBuffer_0.last;
        if not v7 or not v15 then
            if l_DebugPoseEvent_0 then
                l_DebugPoseEvent_0:Fire(nil, nil);
            end;
            v8:dispatch(v2(nil));
            return ;
        else
            if v7 ~= 0 then
                local v16 = v15.timestamp + v7;
                for v17 = 2, l_FrameBuffer_0:getSize() do
                    if l_FrameBuffer_0[v17] then
                        if v15.timestamp >= v16 then
                            v15 = l_FrameBuffer_0[v17];
                        else
                            break;
                        end;
                    end;
                end;
            end;
            local v18 = if not l_SelectedLayer_0 then v15.payload else v15.layerMap[l_SelectedLayer_0];
            local v19 = v18 and v18.animationPose;
            local l_hrpCFrame_0 = v15.payload.hrpCFrame;
            if l_DebugPoseEvent_0 then
                l_DebugPoseEvent_0:Fire(v19, l_hrpCFrame_0);
            end;
            v8:dispatch(v2(v7));
            return ;
        end;
    end;
end;
