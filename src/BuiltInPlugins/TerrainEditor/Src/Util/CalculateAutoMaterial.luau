return function(v0, v1, v2, v3, v4)
    local l_Air_0 = Enum.Material.Air;
    local v6 = {};
    for v7 = -1, 1 do
        for v8 = -1, 1 do
            for v9 = -1, 1 do
                local v10 = v0 + v7;
                local v11 = v1 + v8;
                local v12 = v2 + v9;
                if ((((v10 > 0 and v10 <= v4.X) and v11 > 0) and v11 <= v4.Y) and v12 > 0) and v12 <= v4.Z then
                    local v13 = v3[v10][v11][v12];
                    if v13 ~= Enum.Material.Air then
                        v6[v13] = (v6[v13] or 0) + 1;
                        if v6[v13] > 0 then
                            l_Air_0 = v13;
                        end;
                    end;
                end;
            end;
        end;
    end;
    if l_Air_0 ~= Enum.Material.Air then
        return l_Air_0;
    else
        return nil;
    end;
end;
