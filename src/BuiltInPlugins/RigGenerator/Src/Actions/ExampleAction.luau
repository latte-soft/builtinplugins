return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(typeof(v0) == "string", ("Expected something to be a string, received %s"):format((type(v0))));
    return {
        something = v0
    };
end);
