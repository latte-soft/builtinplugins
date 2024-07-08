return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", ("Expected menuHover to be a boolean, received %s"):format((type(v0))));
    return {
        MenuHover = v0
    };
end);
