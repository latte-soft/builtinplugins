return function(v0, v1)
    v0 = v0 or "";
    if v1.type == "SetSearch" then
        assert(typeof(v1.text) == "string");
        return v1.text;
    else
        return v0;
    end;
end;
