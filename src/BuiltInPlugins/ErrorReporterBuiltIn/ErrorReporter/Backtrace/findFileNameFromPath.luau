return function(v0)
    assert(type(v0) == "string", "pathStr must be a string");
    return string.match(v0, "([^.]*)$");
end;
