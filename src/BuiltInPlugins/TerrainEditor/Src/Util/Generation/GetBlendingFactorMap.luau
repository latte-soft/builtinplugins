local function _(v0, v1)
    assert(v1 > 0, "w should be greater than 0");
    return 1 - math.exp(-(v0 * v0) / ((2 * v1) * v1));
end;
return function(v3, v4)
    local l_CurveWidth_0 = v4.CurveWidth;
    local l_Distance_0 = v4.Distance;
    local l_PreserveDistance_0 = v4.PreserveDistance;
    local l_PreserveRatio_0 = v4.PreserveRatio;
    local l_RoundCorner_0 = v4.RoundCorner;
    local v10 = if v3.Y <= v3.X then v3.X else v3.Y;
    local v11 = if v3.Y <= v3.X then v3.Y else v3.X;
    local v12 = Vector2.new(v10 / 2, v11 / 2);
    local v13 = (v10 - v11) * l_PreserveRatio_0;
    local v14 = table.create(v3.X * v3.Y, 0);
    for v15 = 1, v10 do
        for v16 = 1, v11 do
            local v17 = 0;
            local v18 = v12 - Vector2.new(v13 / 2, 0);
            local v19 = v12 + Vector2.new(v13 / 2, 0);
            local v20 = v18.Magnitude * l_PreserveDistance_0;
            local v21 = (v18.Magnitude - v20) * l_Distance_0;
            local v22 = 0;
            if not (v15 >= v18.X) or v19.X < v15 then
                local v23 = Vector2.new(v15, v16);
                local v24 = if v15 < v18.X then v23 - v18 else v23 - v19;
                v22 = v24.Magnitude * l_RoundCorner_0 + math.max(math.abs(v24.X), (math.abs(v24.Y))) * (1 - l_RoundCorner_0);
            else
                v22 = if v12.Y < v16 then v16 - v12.Y else v12.Y - v16;
            end;
            if v20 < v22 then
                v17 = math.clamp((v22 - v20) / v21, 0, 1);
                if v17 > 0 and v17 < 1 then
                    local l_v17_0 = v17;
                    assert(l_CurveWidth_0 > 0, "w should be greater than 0");
                    v17 = 1 - math.exp(-(l_v17_0 * l_v17_0) / ((2 * l_CurveWidth_0) * l_CurveWidth_0));
                end;
                v14[if v3.Y <= v3.X then (v15 - 1) * v3.Y + v16 else (v16 - 1) * v3.Y + v15] = v17;
            end;
        end;
    end;
    return v14;
end;
