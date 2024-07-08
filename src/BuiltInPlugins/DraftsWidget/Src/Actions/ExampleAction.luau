return require(script.Parent.Action)(script.Name, function(v0)
    if v0 then
        assert(type(v0) == "string", string.format("Expected aString to be a string, received %s", (tostring(v0))));
    end;
    return {
        message = v0
    };
end);
