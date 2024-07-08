local v0 = require(script:FindFirstAncestor("VisualizationModes").Packages.React);
return function(v1, v2, v3)
    local v5 = v0.useCallback(function()
        if not (v1 ~= nil) or v2 == nil then
            return v3;
        else
            local v4 = v1[v2];
            if typeof(v4) == typeof(v3) then
                return v4;
            else
                return v3;
            end;
        end;
    end, {
        v1, 
        v2, 
        v3
    });
    local v6, v7 = v0.useState(v5);
    v0.useEffect(function()
        if not (v2 ~= nil) or v1 == nil then
            return ;
        else
            if v5() ~= v6 then
                v7(v6);
            end;
            return ;
        end;
    end, {
        v5
    });
    v0.useEffect(function()
        if not (v1 ~= nil) or v2 == nil then
            return nil;
        else
            local l_v1_0 = v1;
            local v9 = l_v1_0:GetPropertyChangedSignal(v2):Connect(function()
                v7(l_v1_0[v2]);
            end);
            return function()
                v9:Disconnect();
            end;
        end;
    end, {
        v1, 
        v2
    });
    v0.useEffect(function()
        if not (v2 ~= nil) or v1 == nil then
            return ;
        else
            v1[v2] = v6;
            return ;
        end;
    end, {
        v6, 
        v2
    });
    return v6, v7;
end;
