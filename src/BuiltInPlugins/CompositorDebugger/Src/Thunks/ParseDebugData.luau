local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetFrameBuffer);
local v3 = require(l_Actions_0.SetSendPayloadAnalytics);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.CircularBuffer);
local v6 = require(l_Util_0.traverse);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v8, v9)
    return function(v10)
        local v11 = v10:getState();
        if v11.Status.HistoryOffset ~= nil then
            return ;
        else
            local l_SendPayloadAnalytics_0 = v11.Status.SendPayloadAnalytics;
            local v13 = {};
            local v14 = 0;
            local v15 = {};
            if v8 then
                v6(v8, function(v16, v17)
                    if v16.children then
                        for _, v19 in v16.children, nil, nil do
                            v19.weight = (v19.weight or 1) * (v16.weight or 1);
                        end;
                    end;
                    if v16.id then
                        v13[v16.id] = v16;
                    end;
                    if l_SendPayloadAnalytics_0 then
                        v14 = math.max(v17, v14);
                        if v16.className then
                            local v20 = v15[v16.className] or {
                                count = 0, 
                                children = 0
                            };
                            v20.count = v20.count + 1;
                            v20.children = v20.children + (not v16.children and 0 or #v16.children);
                            v15[v16.className] = v20;
                        end;
                    end;
                end);
                local v21 = v10:getState().DebugData.FrameBuffer:clone();
                v21:push({
                    payload = v8, 
                    layerMap = v13, 
                    timestamp = v8.timestamp
                });
                if l_SendPayloadAnalytics_0 then
                    local v22 = {};
                    for v23, v24 in v15, nil, nil do
                        v24.name = v23;
                        table.insert(v22, v24);
                    end;
                    v9:report("onCompositorConnected", v14, v22);
                    v10:dispatch(v3(false));
                end;
                v10:dispatch(v2(v21));
            end;
            return ;
        end;
    end;
end;
