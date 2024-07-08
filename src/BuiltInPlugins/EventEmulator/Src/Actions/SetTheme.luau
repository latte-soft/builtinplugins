return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "string", ("Expected themeName to be a string, received %s"):format((type(v0))));
    return {
        themeName = v0
    };
end);
