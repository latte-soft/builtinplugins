return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(type(v0) == "boolean", string.format("SetScreen requires a boolean, not %s", (type(v0))));
    return {
        bulkImporterRunning = v0
    };
end);
