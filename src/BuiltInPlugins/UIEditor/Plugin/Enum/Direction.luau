local v0 = {
    NOT_SET = 0, 
    E = 1, 
    SE = 2, 
    S = 3, 
    SW = 4, 
    W = 5, 
    NW = 6, 
    N = 7, 
    NE = 8
};
v0.FIRST = v0.E;
v0.LAST = v0.NE;
local v1 = {
    [v0.E] = "E", 
    [v0.SE] = "SE", 
    [v0.S] = "S", 
    [v0.SW] = "SW", 
    [v0.W] = "W", 
    [v0.NW] = "NW", 
    [v0.N] = "N", 
    [v0.NE] = "NE"
};
v0.isValid = function(_, v3)
    local v4 = false;
    if v0.FIRST <= v3 then
        v4 = v3 <= v0.LAST;
    end;
    return v4;
end;
v0.toShortName = function(_, v6)
    if not v0:isValid(v6) then
        error(("Direction %s is not valid. Cannot convert to short name."):format((tostring(v6))));
    end;
    return v1[v6];
end;
normalizeAngle = function(v7)
    return v7 + math.ceil(-v7 * 0.002777777777777778) * 360;
end;
v0.angleToDirection = function(_, v9)
    return math.floor((normalizeAngle(v9) + 22.5) * 0.022222222222222223) % 8 + 1;
end;
v0.directionToAngle = function(_, v11)
    assert(v0.E == 1, "Direction.E was not the first direction.");
    assert(v0.NE == 8, "Direction.NE was not the last direction.");
    assert(v0:isValid(v11));
    return (v11 - 1) * 45;
end;
return v0;
