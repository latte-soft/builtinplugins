return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "boolean", "Expected policyListItemsModuleExpanded to be a bool");
    return {
        policyListItemsModuleExpanded = v0
    };
end);
