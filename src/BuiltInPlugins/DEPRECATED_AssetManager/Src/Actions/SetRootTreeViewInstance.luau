return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "number", string.format("SetRootTreeViewInstance requires assetId to be a number, not %s", (type(v0))));
    assert(typeof(v1) == "Instance", string.format("SetRootTreeViewInstance requires rootTreeViewInstance a String, not %s", (type(v1))));
    return {
        assetId = v0, 
        rootTreeViewInstance = v1
    };
end);
