return require(script.Parent.Parent.Parent.Src.Actions.Action)(script.Name, function(v0, v1)
    assert(type(v1) == "string", string.format("networkErrorAction must be a string, received %s", (type(v1))));
    local v2 = "response must be a string, or table, received %s";
    local v3 = true;
    if type(v0) ~= "string" then
        v3 = type(v0) == "table";
    end;
    assert(v3, string.format(v2, (type(v0))));
    local l_v0_0 = v0;
    if typeof(v0) == "string" then
        l_v0_0 = {
            responseBody = v0
        };
    end;
    return {
        response = l_v0_0, 
        networkErrorAction = v1
    };
end);
