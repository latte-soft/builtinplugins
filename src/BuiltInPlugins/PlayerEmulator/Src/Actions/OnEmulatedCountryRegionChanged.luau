return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "string", "Expected country region code to be a string");
    return {
        countryRegionCode = v0
    };
end);
