local _ = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = {
    Y_EXPONENT = 3, 
    X_MIN = 200, 
    X_MAX = 20000, 
    Y_MIN = -80, 
    Y_MAX = 10, 
    log2 = function(v1)
        return math.log(v1) * 1.44269504089;
    end
};
v2.plotToView = function(v3)
    local v4 = v2.log2(v2.X_MIN);
    local v5 = (v2.log2(v3.X) - v4) / (v2.log2(v2.X_MAX) - v4);
    local _ = (v2.log2(v3.X) - v2.log2(v2.X_MIN)) / (v2.log2(v2.X_MAX) - v2.log2(v2.X_MIN));
    return Vector2.new(v5, 1 - ((math.clamp(v3.Y, v2.Y_MIN, v2.Y_MAX) - v2.Y_MIN) / (v2.Y_MAX - v2.Y_MIN)) ^ v2.Y_EXPONENT);
end;
v2.viewToPlot = function(v7)
    local _ = v2.log2(v2.X_MIN);
    local _ = v2.log2(v2.X_MAX);
    return Vector2.new(2 ^ (v7.X * v2.log2(v2.X_MAX) + (1 - v7.X) * v2.log2(v2.X_MIN)), math.clamp(1 - v7.Y, 0, 1) ^ (1 / v2.Y_EXPONENT) * (v2.Y_MAX - v2.Y_MIN) + v2.Y_MIN);
end;
v2.plotToAbs = function(v10, v11)
    return v2.plotToView(v10) * v11;
end;
v2.absToPlot = function(v12, v13)
    return v2.viewToPlot(v12 / v13);
end;
v2.mouseToPlot = function(v14, v15)
    if v15 then
        return v2.absToPlot(v14 - v15.AbsolutePosition, v15.AbsoluteSize);
    else
        return Vector2.new(v2.X_MIN, v2.Y_MIN);
    end;
end;
return v2;
