return require(script.Parent.Action)(script.Name, function(v0)
    assert(type(v0) == "table", "Expected policySettingStatus to be a table");
    return {
        policySettingStatus = v0
    };
end);
