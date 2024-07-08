return require(script.Parent.Action)(script.Name, function(v0)
    assert(typeof(v0) == "EnumItem", ("Expected SourceMaterial to be a EnumItem, received %s"):format((typeof(v0))));
    return {
        SourceMaterial = v0
    };
end);
