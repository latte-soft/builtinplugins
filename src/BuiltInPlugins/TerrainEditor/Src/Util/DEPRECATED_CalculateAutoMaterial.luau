return function(v0, v1, v2, v3)
    local l_Air_0 = Enum.Material.Air;
    local v5 = {};
    for v6 = -1, 1 do
        for v7 = -1, 1 do
            for v8 = -1, 1 do
                local v9 = v1 + Vector3.new(v6, v7, v8);
                if ((((v9.X > 0 and v9.X <= v2.X) and v9.Y > 0) and v9.Y <= v2.Y) and v9.Z > 0) and v9.Z <= v2.Z then
                    local v10 = v0[v9.X][v9.Y][v9.Z];
                    if v10 ~= Enum.Material.Air and (not v3 or v10 ~= Enum.Material.Water) then
                        v5[v10] = (v5[v10] or 0) + 1;
                        if v5[v10] > 0 then
                            l_Air_0 = v10;
                        end;
                    end;
                end;
            end;
        end;
    end;
    if l_Air_0 ~= Enum.Material.Air and (not v3 or l_Air_0 ~= Enum.Material.Water) then
        return l_Air_0;
    else
        return nil;
    end;
end;
