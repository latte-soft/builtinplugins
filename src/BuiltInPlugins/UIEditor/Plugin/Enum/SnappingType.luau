local v0 = {
    MoveX = 0, 
    MoveY = 1, 
    MoveXY = 2, 
    ResizeXp = 3, 
    ResizeXn = 4, 
    ResizeYp = 5, 
    ResizeYn = 6, 
    ResizeXpYp = 7, 
    ResizeXnYp = 8, 
    ResizeXpYn = 9, 
    ResizeXnYn = 10
};
v0.containsType = function(_, v2, v3)
    if v2 == v3 then
        return true;
    elseif v2 == v0.MoveXY then
        local v4 = true;
        if v3 ~= v0.MoveX then
            v4 = v3 == v0.MoveY;
        end;
        return v4;
    elseif v2 == v0.ResizeXpYp then
        local v5 = true;
        if v3 ~= v0.ResizeXp then
            v5 = v3 == v0.ResizeYp;
        end;
        return v5;
    elseif v2 == v0.ResizeXnYp then
        local v6 = true;
        if v3 ~= v0.ResizeXn then
            v6 = v3 == v0.ResizeYp;
        end;
        return v6;
    elseif v2 == v0.ResizeXpYn then
        local v7 = true;
        if v3 ~= v0.ResizeXp then
            v7 = v3 == v0.ResizeYn;
        end;
        return v7;
    elseif v2 == v0.ResizeXnYn then
        local v8 = true;
        if v3 ~= v0.ResizeXn then
            v8 = v3 == v0.ResizeYn;
        end;
        return v8;
    else
        return false;
    end;
end;
return v0;
