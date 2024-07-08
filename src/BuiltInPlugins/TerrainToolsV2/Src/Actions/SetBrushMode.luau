return require(script.Parent.Action)(script.Name, function(v0)
    assert(typeof(v0) == "string", ("Expected BrushMode to be a string, received %s"):format((typeof(v0))));
    return {
        brushMode = v0
    };
end);
