return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "number", string.format("SetSelectionIndex requires a number, not %s", (type(v0))));
    return {
        selectionIndex = v0
    };
end);
