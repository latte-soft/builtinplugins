local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = v1.forEach;
local l_join_0 = v1.join;
local l_joinDeep_0 = v1.joinDeep;
local _ = v1.keys;
local l_None_0 = v1.None;
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetOverrides);
return function(v8, v9, v10)
    return function(v11)
        local l_DebugData_0 = v11:getState().DebugData;
        local v13 = l_DebugData_0.FrameBuffer and l_DebugData_0.FrameBuffer[1];
        local v14 = v13 and v13.layerMap[v8];
        local l_Overrides_0 = l_DebugData_0.Overrides;
        local v16 = v9[1];
        if v10 == nil then
            l_Overrides_0 = l_join_0(l_Overrides_0, {
                [v8] = l_join_0(l_Overrides_0[v8], {
                    [v16] = l_None_0
                })
            });
            if not next(l_Overrides_0[v8]) then
                l_Overrides_0[v8] = nil;
            end;
        else
            l_Overrides_0 = l_join_0(l_Overrides_0, {});
            l_Overrides_0[v8] = l_Overrides_0[v8] or {};
            if not (l_Overrides_0[v8][v16] or not v14) and type(v14.props[v16]) == "table" then
                l_Overrides_0[v8][v16] = l_joinDeep_0({}, v14.props[v16]);
            end;
            local v17 = l_Overrides_0[v8];
            for v18, v19 in v9, nil, nil do
                if v18 < #v9 then
                    if not v17[v19] then
                        v17[v19] = {};
                    end;
                    v17 = v17[v19];
                end;
            end;
            v17[v9[#v9]] = v10;
        end;
        v11:dispatch(v7(l_Overrides_0));
        local l_PropertyOverrideEvent_0 = v11:getState().Status.PropertyOverrideEvent;
        if l_PropertyOverrideEvent_0 then
            l_PropertyOverrideEvent_0:fire(l_Overrides_0);
        end;
    end;
end;
