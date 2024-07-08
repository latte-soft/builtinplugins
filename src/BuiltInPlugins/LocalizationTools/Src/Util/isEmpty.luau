return function(v0)
    assert(v0 ~= nil, "object must not be nil");
    return next(v0) == nil;
end;
