return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0)
    assert(type(v0) == "string", string.format("screen arg must be a string, received %s", (tostring(v0))));
    return {
        currentScreen = v0
    };
end);
