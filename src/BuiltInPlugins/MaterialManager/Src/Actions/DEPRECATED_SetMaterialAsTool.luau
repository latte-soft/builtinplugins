return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", ("Expected active to be boolean, received %s"):format((type(v0))));
    return {
        DEPRECATED_ActiveAsTool = v0
    };
end);
