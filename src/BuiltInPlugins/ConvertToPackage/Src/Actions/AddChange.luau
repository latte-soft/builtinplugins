return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0, v1)
    assert(v0 ~= nil, "AddChange setting key cannot be nil");
    assert(v1 ~= nil, "AddChange value cannot be nil. You probably meant Cryo.None");
    return {
        setting = v0, 
        value = v1
    };
end);
