return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "table", "Expected axes to be a table");
    assert(type(v0.X) == "boolean", "Expected X to be a boolean");
    assert(type(v0.Y) == "boolean", "Expected Y to be a boolean");
    assert(type(v0.Z) == "boolean", "Expected Z to be a boolean");
    return {
        enabledAxes = {
            X = v0.X, 
            Y = v0.Y, 
            Z = v0.Z
        }
    };
end);
