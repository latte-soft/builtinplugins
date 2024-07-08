local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React);
local l_useCallback_0 = v0.useCallback;
local l_useEffect_0 = v0.useEffect;
local l_useRef_0 = v0.useRef;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function(v5, v6, v7)
    local v8 = l_useRef_0(v5);
    local v9 = l_useRef_0({});
    local v10 = l_useRef_0({});
    l_useEffect_0(function()
        local v16 = l_ChangeHistoryService_0.OnUndo:Connect(function(v11)
            local l_current_0 = v9.current;
            local l_current_1 = v10.current;
            if not l_current_0[v11] or #l_current_0[v11] == 0 then
                return ;
            else
                if not l_current_1[v11] then
                    l_current_1[v11] = {};
                end;
                local v14 = #l_current_0[v11];
                local v15 = l_current_0[v11][v14];
                table.insert(l_current_1[v11], v8.current);
                table.remove(l_current_0[v11], v14);
                v8.current = v15;
                v6(v15);
                v9.current = l_current_0;
                v10.current = l_current_1;
                return ;
            end;
        end);
        local v22 = l_ChangeHistoryService_0.OnRedo:Connect(function(v17)
            local l_current_2 = v9.current;
            local l_current_3 = v10.current;
            if not l_current_3[v17] or #l_current_3[v17] == 0 then
                return ;
            else
                local v20 = #l_current_3[v17];
                local v21 = l_current_3[v17][v20];
                table.insert(l_current_2[v17], v8.current);
                table.remove(l_current_3[v17], v20);
                v8.current = v21;
                v6(v21);
                v9.current = l_current_2;
                v10.current = l_current_3;
                return ;
            end;
        end);
        return function()
            v16:Disconnect();
            v22:Disconnect();
        end;
    end, v7);
    l_useEffect_0(function()
        v9.current = {};
        v10.current = {};
    end, v7);
    return (l_useCallback_0(function(v23, v24)
        local l_current_4 = v9.current;
        if not l_current_4[v23] then
            l_current_4[v23] = {};
        end;
        v10.current = {};
        l_ChangeHistoryService_0:SetWaypoint(v23);
        table.insert(l_current_4[v23], table.clone(v8.current));
        v8.current = v24;
        v9.current = l_current_4;
    end, v7));
end;
