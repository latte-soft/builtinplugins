return require(script.Parent.Action)(script.Name, function(v0)
    local v1 = true;
    if tostring(v0) ~= "Cryo.None" then
        v1 = true;
        if typeof(v0) ~= "CFrame" then
            v1 = not v0;
        end;
    end;
    assert(v1);
    return {
        planeCFrame = v0
    };
end);
