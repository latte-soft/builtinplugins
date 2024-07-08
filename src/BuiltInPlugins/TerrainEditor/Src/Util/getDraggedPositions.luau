return function(v0, v1, v2)
    local v3 = v1 - v0;
    local l_Magnitude_0 = v3.Magnitude;
    local v5 = v2 * 0.5;
    local v6 = {};
    if v5 < l_Magnitude_0 then
        local l_Unit_0 = v3.Unit;
        l_Magnitude_0 = math.min(l_Magnitude_0, v5 * 2 + 20);
        local v8 = math.ceil(l_Magnitude_0 / v5 - 0.1);
        for v9 = 1, v8 do
            v6[v9] = v0 + (l_Unit_0 * l_Magnitude_0) * (v9 / v8);
        end;
        return v6;
    else
        v6[1] = v1;
        return v6;
    end;
end;
