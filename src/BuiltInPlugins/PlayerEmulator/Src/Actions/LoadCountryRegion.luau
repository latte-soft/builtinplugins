return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "table", "Expected data to be a table");
    return {
        data = v0
    };
end);
