return function(v0, v1)
    assert(v0 ~= nil, "Expecting a valid function for argument 'func'");
    assert(typeof(v1) == "table", "Expecting a valid array for argument 'args'");
    return function(...)
        return v0(unpack(v1), ...);
    end;
end;
