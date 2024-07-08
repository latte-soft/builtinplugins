return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0)
    assert(v0 ~= nil, "ClearChange setting key cannot be nil");
    return {
        setting = v0
    };
end);
