local v4 = {
    plotToViewPosition = function(v0, v1)
        return Vector2.new((v0.X - v1.Min.X) / v1.Width, 1 - (v0.Y - v1.Min.Y) / v1.Height);
    end, 
    viewToPlotPosition = function(v2, v3)
        return Vector2.new(v3.Min.X + v3.Width * v2.X, v3.Min.Y + v3.Height * (1 - v2.Y));
    end
};
v4.plotToAbsolutePosition = function(v5, v6, v7)
    return v7 * v4.plotToViewPosition(v5, v6);
end;
v4.absoluteToPlotPosition = function(v8, v9, v10)
    return v4.viewToPlotPosition(v8 / v10, v9);
end;
v4.mouseCoordsToPlotPosition = function(v11, v12, v13)
    if v13 then
        return v4.absoluteToPlotPosition(v11 - v13.AbsolutePosition, v12, v13.AbsoluteSize);
    else
        return v12.Min;
    end;
end;
v4.rectContains = function(v14, v15, v16)
    v16 = v16 or 0.001;
    local v17 = false;
    if v15.Min.X - v16 <= v14.X then
        v17 = false;
        if v14.X <= v15.Max.X + v16 then
            v17 = false;
            if v15.Min.Y - v16 <= v14.Y then
                v17 = v14.Y <= v15.Max.Y + v16;
            end;
        end;
    end;
    return v17;
end;
v4.clampLineToRect = function(v18, v19, v20)
    local v21 = Vector2.new(math.min(v18.X, v19.X), (math.min(v18.Y, v19.Y)));
    local v22 = Vector2.new(math.max(v18.X, v19.X), (math.max(v18.Y, v19.Y)));
    if not v4.rectContains(v18, v20, 0.001) or not v4.rectContains(v19, v20, 0.001) then
        if not ((v22.X >= v20.Min.X and v22.Y >= v20.Min.Y) and v20.Max.X >= v21.X) or v20.Max.Y < v21.Y then
            return nil;
        else
            local v23 = v19 - v18;
            local v24 = Vector2.new(0, 0);
            local v25 = Vector2.new(1, 1);
            if v23.X ~= 0 then
                v24 = Vector2.new((v20.Min.X - v18.X) / v23.X, v24.Y);
                v25 = Vector2.new((v20.Max.X - v18.X) / v23.X, v25.Y);
            end;
            if v23.Y ~= 0 then
                v24 = Vector2.new(v24.X, (v20.Min.Y - v18.Y) / v23.Y);
                v25 = Vector2.new(v25.X, (v20.Max.Y - v18.Y) / v23.Y);
            end;
            local v26 = math.max(0, math.min(v24.X, v25.X), (math.min(v24.Y, v25.Y)));
            local v27 = math.min(1, math.max(v24.X, v25.X), (math.max(v24.Y, v25.Y)));
            if v27 <= v26 then
                return nil;
            else
                return {
                    v18:Lerp(v19, v26), 
                    v18:Lerp(v19, v27)
                };
            end;
        end;
    else
        return {
            v18, 
            v19
        };
    end;
end;
return v4;
