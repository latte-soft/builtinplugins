return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected viewType to be a string, received %s"):format((type(v0))));
    return {
        ViewType = v0
    };
end);
