return function(v0)
    assert(typeof(v0) == "string", "string expected");
    return v0:gsub("(%W)", "%%%1");
end;
