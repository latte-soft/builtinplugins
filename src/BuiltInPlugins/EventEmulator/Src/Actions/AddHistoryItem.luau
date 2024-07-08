return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1, v2)
    assert(type(v0) == "string", ("Expected view to be a string, received %s"):format((type(v0))));
    assert(type(v1) == "string", ("Expected name to be a string, received %s"):format((type(v1))));
    return {
        item = {
            Name = v1, 
            View = v0, 
            Data = v2
        }
    };
end);
