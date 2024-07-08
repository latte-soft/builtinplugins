local v3 = {
    fuzzyEq = function(_, v1, v2)
        return math.abs(v1 - v2) < 0.001;
    end
};
v3.fuzzyEq_CFrame = function(_, v5, v6)
    local v7, v8, v9 = v5:ToEulerAnglesXYZ();
    local v10, v11, v12 = v6:ToEulerAnglesXYZ();
    return ((v5.p:FuzzyEq(v6.p) and v3:fuzzyEq(v7, v10)) and v3:fuzzyEq(v8, v11)) and v3:fuzzyEq(v9, v12);
end;
v3.adornLocalSpace = function(_, v14, v15)
    return v14.CFrame:inverse() * CFrame.new(v15);
end;
v3.pointInRect = function(_, v17, v18, v19, v20, v21)
    if ((v18.X <= v17.X and v17.X <= v18.X + v20) and v19.Y <= v17.Y) and v17.Y <= v19.Y + v21 then
        return true;
    else
        return false;
    end;
end;
return v3;
