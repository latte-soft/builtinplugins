return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", ("Expected parameters to be a table, received %s"):format((type(v0))));
    return {
        parameters = v0
    };
end);
