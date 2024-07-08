return function(v0, v1)
    assert(v1 >= 0, "Expecting decimal places is a valid non-negative integer");
    local v2 = math.pow(10, v1);
    return math.round(v0 * v2) / v2;
end;
