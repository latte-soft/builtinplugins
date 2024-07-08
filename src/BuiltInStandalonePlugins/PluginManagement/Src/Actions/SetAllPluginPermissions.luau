return require(script.Parent.Parent.Parent.Packages.Action)(script.Name, function(v0)
    assert(type(v0) == "table", "Expected permissions to be a table");
    return {
        permissions = v0
    };
end);
