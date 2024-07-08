return function(v0, v1, v2)
    return function(v3, v4, v5, v6)
        local v7 = 0;
        local l_v3_0 = v3;
        local l_v4_0 = v4;
        local v10 = 1;
        for _ = 1, v0 do
            v7 = v7 + math.noise(l_v3_0 / v6, l_v4_0 / v6, v5) * v10;
            l_v4_0 = l_v4_0 * v1;
            l_v3_0 = l_v3_0 * v1;
            v10 = v10 * v2;
        end;
        return (math.clamp(v7, -1, 1));
    end;
end;
