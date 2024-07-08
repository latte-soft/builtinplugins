return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "number", string.format("Expected selectedIndex to be a number, received %s", (type(v0))));
    return {
        selectedIndex = v0
    };
end);
