return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0)
    assert(type(v0) == "boolean", string.format("uploadSucceeded arg must be a boolean, received %s", (tostring(v0))));
    return {
        uploadSucceeded = v0
    };
end);
