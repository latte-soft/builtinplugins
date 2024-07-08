return function(v0, v1)
    assert(typeof(v0) == "number", "userId must be a number");
    assert(v0 % 1 == 0, "userId must be an integer");
    assert(typeof(v1) == "number", "rolloutPercentage must be a number");
    assert(v1 % 1 == 0, "rolloutPercentage must be an integer");
    assert(v1 >= 0, "rolloutPercentage must be >= 0");
    assert(v1 <= 100, "rolloutPercentage must be <= 100");
    return v0 % 100 < v1;
end;
