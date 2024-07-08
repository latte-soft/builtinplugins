return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", "Expected isBusy to be a boolean");
    return {
        isBusy = v0
    };
end);
