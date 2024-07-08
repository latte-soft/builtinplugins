return require(script.Parent.Action)(script.Name, function(v0)
    assert(typeof(v0) == "string", ("Expected TransformMode to be a EnumItem, received %s"):format((typeof(v0))));
    return {
        TransformMode = v0
    };
end);
