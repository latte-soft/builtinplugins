return require(script.Parent.Action)(script.Name, function(v0, v1)
    assert(type(v0) == "table", "Expected allPolicies to be a table");
    assert(type(v1) == "table", "Expected allPolicySortedKeys to be a table");
    return {
        allPolicies = v0, 
        allPolicySortedKeys = v1
    };
end);
