return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    local l_v0_0 = v0;
    if type(v0) == "string" then
        l_v0_0 = {
            responseBody = v0
        };
    end;
    return {
        response = l_v0_0, 
        networkErrorAction = v1
    };
end);
