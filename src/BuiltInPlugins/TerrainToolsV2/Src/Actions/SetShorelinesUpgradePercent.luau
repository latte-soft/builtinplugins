return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "number", ("Expected material to be a number, received %s"):format((type(v0))));
    return {
        shorelinesUpgradePercent = v0
    };
end);
